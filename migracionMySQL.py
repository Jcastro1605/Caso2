import pandas as pd
from sqlalchemy import create_engine, inspect
import json

configuracionMysql = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': '', # no voy a leakear mi contraseña
    'database': 'appassistant'
}

configuracionSqlServer = {
    'host': 'ELIPOLIMSI', # mi nombre de compu
    'database': 'SolturaAssistant'  # nombre de nueva db
}

def migrarTabla(motorMysql, motorSqlServer, nombreTabla, columnaIdMysql=None, columnaIdSqlServer=None, mapeoIds=None):
    try:
        dataframeMysql = pd.read_sql_table(nombreTabla, motorMysql)
        print(f"Leída tabla '{nombreTabla}' desde MySQL. Filas: {len(dataframeMysql)}")

        # Serializar a JSON la columna 'configuracionDetalles' si existe
        if 'configuracionDetalles' in dataframeMysql.columns:
            dataframeMysql['configuracionDetalles'] = dataframeMysql['configuracionDetalles'].apply(
                lambda x: json.dumps(x) if isinstance(x, dict) else x
            )

        if columnaIdMysql and columnaIdSqlServer and mapeoIds is None:
            dataframeSqlServer = pd.read_sql_query(f"SELECT TOP 0 * FROM {nombreTabla}", motorSqlServer)
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            dataframeNuevosIds = pd.read_sql_query(f"SELECT {columnaIdMysql}, {columnaIdSqlServer} FROM {nombreTabla}", motorSqlServer)
            return dataframeNuevosIds.set_index(columnaIdMysql).to_dict()[columnaIdSqlServer]
        elif columnaIdMysql and mapeoIds:
            if columnaIdMysql in dataframeMysql.columns:
                dataframeMysql[columnaIdMysql] = dataframeMysql[columnaIdMysql].map(mapeoIds)
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            return None
        else:
            dataframeMysql.to_sql(nombreTabla, motorSqlServer, if_exists='replace', index=False)
            return None
    except Exception as e:
        print(f"Error al migrar la tabla '{nombreTabla}': {e}")
        return None

def migrarTodoConManejoIds(configuracionMysql, configuracionSqlServer):
    motorMysql = create_engine(f"mysql+mysqlconnector://{configuracionMysql['user']}:{configuracionMysql['password']}@{configuracionMysql['host']}:{configuracionMysql['port']}/{configuracionMysql['database']}")
    motorSqlServer = create_engine(f"mssql+pyodbc://{configuracionSqlServer['host']}/{configuracionSqlServer['database']}?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes")
    inspectorMysql = inspect(motorMysql)
    nombresTablas = sorted(inspectorMysql.get_table_names()) 

    mapeoIdUsuarios = None

    print(f"Tablas encontradas en MySQL: {nombresTablas}")

    for nombreTabla in nombresTablas:
        print(f"\n--- Migrando tabla: {nombreTabla} ---")
        if nombreTabla == 'users':
            print("Generando mapeo de IDs para la tabla 'users'.")
            mapeoIdUsuarios = migrarTabla(motorMysql, motorSqlServer, nombreTabla, 'id', 'id') 
            if mapeoIdUsuarios:
                print(f"Mapeo de IDs de usuario generado. Ejemplo: {list(mapeoIdUsuarios.items())[:5]}")
        elif nombreTabla == 'usersAddresses':
            if mapeoIdUsuarios:
                print("Actualizando 'userID' en 'usersAddresses' con los nuevos IDs de usuario.")
                migrarTabla(motorMysql, motorSqlServer, nombreTabla, 'userID', mapeoIds=mapeoIdUsuarios) 
            else:
                print("No se encontró el mapeo de IDs de usuario. Migrando 'usersAddresses' sin actualizar IDs.")
                migrarTabla(motorMysql, motorSqlServer, nombreTabla)
        else:
            migrarTabla(motorMysql, motorSqlServer, nombreTabla)

    motorMysql.dispose()
    motorSqlServer.dispose()

if __name__ == "__main__":
    migrarTodoConManejoIds(configuracionMysql, configuracionSqlServer)
    print("\nMigración de todas las tablas completada")