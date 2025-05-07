USE [master]
GO
/****** Object:  Database [Soltura]    Script Date: 5/6/2025 5:13:41 PM ******/
CREATE DATABASE [Soltura]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Soltura', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Soltura.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Soltura_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Soltura_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Soltura] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Soltura].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Soltura] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Soltura] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Soltura] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Soltura] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Soltura] SET ARITHABORT OFF 
GO
ALTER DATABASE [Soltura] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Soltura] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Soltura] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Soltura] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Soltura] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Soltura] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Soltura] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Soltura] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Soltura] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Soltura] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Soltura] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Soltura] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Soltura] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Soltura] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Soltura] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Soltura] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Soltura] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Soltura] SET RECOVERY FULL 
GO
ALTER DATABASE [Soltura] SET  MULTI_USER 
GO
ALTER DATABASE [Soltura] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Soltura] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Soltura] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Soltura] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Soltura] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Soltura] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Soltura', N'ON'
GO
ALTER DATABASE [Soltura] SET QUERY_STORE = ON
GO
ALTER DATABASE [Soltura] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Soltura]
GO
/****** Object:  Table [dbo].[Solt_Adresses]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Adresses](
	[adressid] [int] IDENTITY(1,1) NOT NULL,
	[line1] [varchar](200) NOT NULL,
	[line2] [varchar](200) NULL,
	[zipcode] [varchar](9) NOT NULL,
	[geoposition] [geometry] NULL,
	[cityid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Adresses] PRIMARY KEY CLUSTERED 
(
	[adressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_AuthPlatforms]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_AuthPlatforms](
	[authPlatformId] [tinyint] NOT NULL,
	[name] [varchar](30) NULL,
	[secretKey] [varbinary](128) NULL,
	[key] [varbinary](128) NULL,
 CONSTRAINT [PK_Solt_AuthPlatforms] PRIMARY KEY CLUSTERED 
(
	[authPlatformId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_AuthSessions]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_AuthSessions](
	[authSessionId] [int] NOT NULL,
	[sessionId] [varchar](36) NULL,
	[externalUser] [varchar](36) NULL,
	[token] [varbinary](128) NULL,
	[refreshToken] [varbinary](128) NULL,
	[lastUpdate] [datetime] NULL,
	[userid] [int] NOT NULL,
	[authPlatformId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Solt_AuthSessions] PRIMARY KEY CLUSTERED 
(
	[authSessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_AvailableMethods]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_AvailableMethods](
	[availableMethodId] [int] NOT NULL,
	[name] [varchar](55) NULL,
	[token] [varchar](255) NULL,
	[expTokenDate] [datetime] NULL,
	[maskAccount] [varchar](30) NULL,
	[paymentMethodId] [int] NULL,
	[callbackURLGET] [varchar](1000) NULL,
	[callbackPOST] [varchar](1000) NULL,
	[configurationJSON] [varchar](600) NULL,
 CONSTRAINT [PK_Solt_AvailableMethods] PRIMARY KEY CLUSTERED 
(
	[availableMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Cities]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Cities](
	[cityid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[stateid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Cities] PRIMARY KEY CLUSTERED 
(
	[cityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_ContactInfoPerson]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_ContactInfoPerson](
	[contactInfoPersonid] [int] IDENTITY(1,1) NOT NULL,
	[value] [varchar](100) NOT NULL,
	[enabled] [bit] NOT NULL,
	[lastUpdate] [datetime] NULL,
	[contactInfoTypeid] [int] NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_ContactInfoPerson] PRIMARY KEY CLUSTERED 
(
	[contactInfoPersonid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_ContactInfoTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_ContactInfoTypes](
	[contactInfoTypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Solt_ContactInfoTypes] PRIMARY KEY CLUSTERED 
(
	[contactInfoTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Countries]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Countries](
	[countryid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[currencyid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Countries] PRIMARY KEY CLUSTERED 
(
	[countryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Currencies]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Currencies](
	[currencyid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[acronym] [varchar](5) NULL,
	[symbol] [varchar](5) NULL,
 CONSTRAINT [PK_Solt_Currencies] PRIMARY KEY CLUSTERED 
(
	[currencyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_CurrencyConversions]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_CurrencyConversions](
	[conversionid] [int] IDENTITY(1,1) NOT NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
	[exchangeRate] [decimal](15, 6) NOT NULL,
	[enabled] [bit] NOT NULL,
	[isCurrent] [bit] NOT NULL,
	[source_currencyid] [int] NOT NULL,
	[destination_currencyid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_CurrencyConversions] PRIMARY KEY CLUSTERED 
(
	[conversionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_DealMedia]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_DealMedia](
	[dealMediaid] [int] IDENTITY(1,1) NOT NULL,
	[partnerDealid] [int] NOT NULL,
	[mediaFileid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_DealMedia] PRIMARY KEY CLUSTERED 
(
	[dealMediaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_DealType]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_DealType](
	[dealTypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[typeDesc] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Solt_DealType] PRIMARY KEY CLUSTERED 
(
	[dealTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_FeaturePerDeal]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_FeaturePerDeal](
	[featurePerDealid] [int] IDENTITY(1,1) NOT NULL,
	[partnerDealid] [int] NOT NULL,
	[planFeatureid] [int] NOT NULL,
	[solturaShare] [decimal](5, 2) NOT NULL,
	[partnerShare] [decimal](5, 2) NOT NULL,
	[totalCost] [float] NOT NULL,
 CONSTRAINT [PK_Solt_FeaturePerDeal] PRIMARY KEY CLUSTERED 
(
	[featurePerDealid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_FeaturesPerPlan]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_FeaturesPerPlan](
	[featurePerPlanid] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[value] [varchar](50) NULL,
	[inclusionDate] [date] NOT NULL,
	[removalDate] [date] NULL,
	[planFeatureid] [int] NOT NULL,
	[subscriptionid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_FeaturesPerPlan] PRIMARY KEY CLUSTERED 
(
	[featurePerPlanid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_GroupType]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_GroupType](
	[groupTypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[maxSize] [int] NOT NULL,
 CONSTRAINT [PK_Solt_GroupType] PRIMARY KEY CLUSTERED 
(
	[groupTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_LimitBalance]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_LimitBalance](
	[limitBalanceid] [int] IDENTITY(1,1) NOT NULL,
	[balance] [float] NOT NULL,
	[lastBalance] [float] NULL,
	[lastUpdate] [datetime] NOT NULL,
	[checksum] [varbinary](200) NOT NULL,
	[frozenAmount] [float] NULL,
	[limitBalanceTypeid] [int] NOT NULL,
	[currencyid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_LimitBalance] PRIMARY KEY CLUSTERED 
(
	[limitBalanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_LimitBalanceTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_LimitBalanceTypes](
	[limitBalanceTypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_Solt_LimitBalanceTypes] PRIMARY KEY CLUSTERED 
(
	[limitBalanceTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Log]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Log](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[postTime] [datetime] NOT NULL,
	[computer] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[trace] [text] NULL,
	[referenceid1] [bigint] NULL,
	[referenceid2] [bigint] NOT NULL,
	[value1] [varchar](100) NULL,
	[value2] [varchar](100) NULL,
	[checksum] [varbinary](128) NOT NULL,
	[logtypeid] [int] NOT NULL,
	[logsourceid] [int] NOT NULL,
	[logseverityid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Log] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_LogSeverity]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_LogSeverity](
	[logseverityid] [int] NOT NULL,
	[name] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Solt_LogSeverity] PRIMARY KEY CLUSTERED 
(
	[logseverityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_LogSources]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_LogSources](
	[logsourceid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Solt_LogSources] PRIMARY KEY CLUSTERED 
(
	[logsourceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_LogTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_LogTypes](
	[logtypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
	[ref1Desc] [varchar](60) NULL,
	[ref2Desc] [varchar](60) NULL,
	[val1Desc] [varchar](100) NULL,
	[val2Desc] [varchar](100) NULL,
 CONSTRAINT [PK_Solt_LogTypes] PRIMARY KEY CLUSTERED 
(
	[logtypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_MediaFile]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_MediaFile](
	[mediaFileid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](30) NOT NULL,
	[url] [varchar](200) NOT NULL,
	[deleted] [bit] NOT NULL,
	[lastUpdate] [datetime] NULL,
	[uploadDate] [datetime] NOT NULL,
	[mediaTypeid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_MediaFile] PRIMARY KEY CLUSTERED 
(
	[mediaFileid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_MediaTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_MediaTypes](
	[mediaTypeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[impPlayer] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Solt_MediaTypes] PRIMARY KEY CLUSTERED 
(
	[mediaTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_MethodPerUser]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_MethodPerUser](
	[methodPerUserid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[availableMethodId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[registrationTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Solt_MethodPerUser] PRIMARY KEY CLUSTERED 
(
	[methodPerUserid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Modules]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Modules](
	[moduleId] [smallint] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK_Solt_modules] PRIMARY KEY CLUSTERED 
(
	[moduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PartnerDeals]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PartnerDeals](
	[partnerDealid] [int] IDENTITY(1,1) NOT NULL,
	[partnerid] [int] NOT NULL,
	[sealDate] [date] NOT NULL,
	[expirationDate] [date] NULL,
	[enabled] [bit] NOT NULL,
	[dealDescription] [text] NOT NULL,
	[dealTypeid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_PartnerDeals] PRIMARY KEY CLUSTERED 
(
	[partnerDealid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PartnerPaymentMethods]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PartnerPaymentMethods](
	[partnerPaymentMethodid] [int] IDENTITY(1,1) NOT NULL,
	[partnerObligationid] [int] NOT NULL,
	[availableMethodId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[establishmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Solt_PartnerPaymentMethods] PRIMARY KEY CLUSTERED 
(
	[partnerPaymentMethodid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Partners]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Partners](
	[partnerid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[partnerAdressid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_Partners] PRIMARY KEY CLUSTERED 
(
	[partnerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PayErrorTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PayErrorTypes](
	[payErrorTypeId] [tinyint] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK_Solt_PayErrorTypes] PRIMARY KEY CLUSTERED 
(
	[payErrorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PaymentAttempts]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PaymentAttempts](
	[paymentAttemptId] [bigint] NOT NULL,
	[amount] [decimal](10, 4) NOT NULL,
	[currentAmount] [decimal](10, 4) NOT NULL,
	[userId] [int] NOT NULL,
	[moduleId] [smallint] NULL,
	[chargeToken] [varbinary](128) NULL,
	[description] [varchar](200) NULL,
	[result] [varchar](80) NULL,
	[statusTypeId] [tinyint] NULL,
	[creationDate] [datetime] NULL,
	[currencyId] [int] NOT NULL,
	[availableMethodId] [int] NULL,
	[checksum] [varbinary](500) NULL,
	[payErrorTypeId] [tinyint] NULL,
 CONSTRAINT [PK_Solt_PaymentAttempts] PRIMARY KEY CLUSTERED 
(
	[paymentAttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PaymentMethods]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PaymentMethods](
	[paymentMethodId] [int] NOT NULL,
	[name] [varchar](30) NULL,
	[APIurl] [varchar](255) NULL,
	[secretKey] [varbinary](500) NOT NULL,
	[key] [varbinary](128) NOT NULL,
	[logoIconURL] [varchar](255) NULL,
	[enabled] [bit] NOT NULL,
	[contactInfoPersonId] [int] NULL,
	[templateJSON] [varchar](600) NULL,
 CONSTRAINT [PK_Solt_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[paymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PlanFeatures]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PlanFeatures](
	[planFeatureid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](100) NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Solt_PlanFeatures] PRIMARY KEY CLUSTERED 
(
	[planFeatureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PlanLimits]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PlanLimits](
	[planLimitid] [int] IDENTITY(1,1) NOT NULL,
	[numericLimit] [int] NULL,
	[numericLimitDesc] [varchar](80) NULL,
	[restricted_scheduleid] [int] NULL,
	[renewal_scheduleid] [int] NULL,
	[planFeatureid] [int] NOT NULL,
	[limitBalanceid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_PlanLimits] PRIMARY KEY CLUSTERED 
(
	[planLimitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_PlansPerGroup]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_PlansPerGroup](
	[planPerGroupid] [int] IDENTITY(1,1) NOT NULL,
	[acquisitionDate] [datetime] NOT NULL,
	[subscriptionid] [int] NOT NULL,
	[userGroupid] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[scheduleid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_PlansPerGroup] PRIMARY KEY CLUSTERED 
(
	[planPerGroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_RedemptionCodes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_RedemptionCodes](
	[redemptionCodeid] [int] NOT NULL,
	[code] [varchar](255) NOT NULL,
	[redemptionStatusid] [tinyint] NOT NULL,
	[creationTime] [datetime] NOT NULL,
	[expirationTime] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[methodid] [int] NOT NULL,
	[metadataJson] [varchar](500) NULL,
 CONSTRAINT [PK_Solt_RedemptionItems] PRIMARY KEY CLUSTERED 
(
	[redemptionCodeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_RedemptionDetails]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_RedemptionDetails](
	[redemptionId] [int] IDENTITY(1,1) NOT NULL,
	[addressid] [int] NULL,
	[planFeatureid] [int] NULL,
	[transactionid] [bigint] NULL,
	[partnerid] [int] NULL,
	[methodid] [int] NULL,
 CONSTRAINT [PK_Solt_RedemptionDetails] PRIMARY KEY CLUSTERED 
(
	[redemptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_RedemptionMethod]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_RedemptionMethod](
	[methodid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Solt_ReedemMethod] PRIMARY KEY CLUSTERED 
(
	[methodid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_ScheduleDetails]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_ScheduleDetails](
	[scheduleDetailid] [int] IDENTITY(1,1) NOT NULL,
	[scheduleid] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[baseDate] [datetime] NOT NULL,
	[datePart] [varchar](2) NOT NULL,
	[lastExecution] [datetime] NULL,
	[nextExecution] [datetime] NULL,
 CONSTRAINT [PK_Solt_ScheduleDetails] PRIMARY KEY CLUSTERED 
(
	[scheduleDetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Schedules]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Schedules](
	[scheduleid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[recurrencyType] [tinyint] NOT NULL,
	[repeat] [bit] NOT NULL,
	[endType] [tinyint] NOT NULL,
	[repetitions] [tinyint] NULL,
	[endDate] [datetime] NULL,
	[startDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Solt_Schedules] PRIMARY KEY CLUSTERED 
(
	[scheduleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_States]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_States](
	[stateid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
	[countryid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_States] PRIMARY KEY CLUSTERED 
(
	[stateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_StatusTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_StatusTypes](
	[statusTypeId] [tinyint] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK_Solt_StatusTypes_1] PRIMARY KEY CLUSTERED 
(
	[statusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_SubscriptionPrices]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_SubscriptionPrices](
	[subpriceid] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[postDate] [datetime] NOT NULL,
	[isCurrent] [bit] NOT NULL,
	[subscriptionid] [int] NOT NULL,
	[recurrencyType] [tinyint] NOT NULL,
 CONSTRAINT [PK_Solt_SubscriptionPrices] PRIMARY KEY CLUSTERED 
(
	[subpriceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Subscriptions]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Subscriptions](
	[subscriptionid] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[logoURL] [varchar](200) NULL,
	[temporary] [bit] NOT NULL,
	[tempPeriodStart] [date] NULL,
	[tempPeriodEnd] [date] NULL,
	[name] [varchar](50) NOT NULL,
	[isCustom] [bit] NOT NULL,
 CONSTRAINT [PK_Solt_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[subscriptionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Transactions]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Transactions](
	[transactionId] [bigint] NOT NULL,
	[amount] [money] NOT NULL,
	[userId] [int] NOT NULL,
	[personId] [int] NULL,
	[description] [varchar](200) NOT NULL,
	[transDateTime] [datetime] NOT NULL,
	[postTime] [datetime] NOT NULL,
	[transactionTypeId] [tinyint] NULL,
	[transactionSubTypeId] [tinyint] NULL,
	[currencyid] [int] NULL,
	[paymentAttemptId] [bigint] NULL,
	[refNumber] [varchar](80) NULL,
	[checksum] [varbinary](500) NULL,
 CONSTRAINT [PK_Solt_Transactions] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_TransactionSubTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_TransactionSubTypes](
	[transactionSubTypeId] [tinyint] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK_Solt_TransactionSubTypes] PRIMARY KEY CLUSTERED 
(
	[transactionSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_TransactionTypes]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_TransactionTypes](
	[transactionTypeId] [tinyint] NOT NULL,
	[name] [varchar](30) NULL,
 CONSTRAINT [PK_Solt_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[transactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_UserAdresses]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_UserAdresses](
	[userAdressid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[adressid] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Solt_UserAdresses] PRIMARY KEY CLUSTERED 
(
	[userAdressid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_UserGroups]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_UserGroups](
	[userGroupid] [int] IDENTITY(1,1) NOT NULL,
	[groupOwner] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[creationDate] [datetime] NOT NULL,
	[modification] [datetime] NULL,
	[modificationDesc] [varchar](300) NULL,
	[name] [varchar](50) NOT NULL,
	[groupTypeid] [int] NOT NULL,
 CONSTRAINT [PK_Solt_UserGroups_1] PRIMARY KEY CLUSTERED 
(
	[userGroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_UserPerGroup]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_UserPerGroup](
	[userPerGroupid] [int] IDENTITY(1,1) NOT NULL,
	[userGroupid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[joinDate] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[exitDate] [datetime] NULL,
 CONSTRAINT [PK_Solt_UserPerGroup] PRIMARY KEY CLUSTERED 
(
	[userPerGroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_UserPersons]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_UserPersons](
	[userPersonid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[name] [varchar](30) NOT NULL,
	[firstLastname] [varchar](30) NOT NULL,
	[secondLastname] [varchar](30) NULL,
	[birthdate] [date] NOT NULL,
 CONSTRAINT [PK_Solt_UserPersons] PRIMARY KEY CLUSTERED 
(
	[userPersonid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solt_Users]    Script Date: 5/6/2025 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solt_Users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varbinary](250) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Solt_Users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson] ADD  CONSTRAINT [DF_Solt_ContactInfoPerson_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson] ADD  CONSTRAINT [DF_Solt_ContactInfoPerson_lastUpdate]  DEFAULT (getdate()) FOR [lastUpdate]
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions] ADD  CONSTRAINT [DF_Solt_CurrencyConversions_startdate]  DEFAULT (getdate()) FOR [startdate]
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions] ADD  CONSTRAINT [DF_Solt_CurrencyConversions_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions] ADD  CONSTRAINT [DF_Solt_CurrencyConversions_isCurrent]  DEFAULT ((0)) FOR [isCurrent]
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal] ADD  CONSTRAINT [DF_Solt_FeaturePerDeal_solturaShare]  DEFAULT ((0)) FOR [solturaShare]
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal] ADD  CONSTRAINT [DF_Solt_FeaturePerDeal_partnerShare]  DEFAULT ((0)) FOR [partnerShare]
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal] ADD  CONSTRAINT [DF_Solt_FeaturePerDeal_totalCost]  DEFAULT ((0)) FOR [totalCost]
GO
ALTER TABLE [dbo].[Solt_FeaturesPerPlan] ADD  CONSTRAINT [DF_Solt_FeaturesPerPlan_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_LimitBalance] ADD  CONSTRAINT [DF_Solt_LimitBalance_lastUpdate]  DEFAULT (getdate()) FOR [lastUpdate]
GO
ALTER TABLE [dbo].[Solt_Log] ADD  CONSTRAINT [DF_Solt_Log_postTime]  DEFAULT (getdate()) FOR [postTime]
GO
ALTER TABLE [dbo].[Solt_MediaFile] ADD  CONSTRAINT [DF_Solt_MediaFile_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[Solt_PartnerDeals] ADD  CONSTRAINT [DF_Solt_PartnerDeals_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_Partners] ADD  CONSTRAINT [DF_Solt_Partners_isActive]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] ADD  CONSTRAINT [DF_Solt_PaymentAttempts_creationDate]  DEFAULT (getdate()) FOR [creationDate]
GO
ALTER TABLE [dbo].[Solt_PaymentMethods] ADD  CONSTRAINT [DF_Solt_PaymentMethods_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_RedemptionCodes] ADD  CONSTRAINT [DF_Solt_RedemptionCodes_creationTime]  DEFAULT (getdate()) FOR [creationTime]
GO
ALTER TABLE [dbo].[Solt_ScheduleDetails] ADD  CONSTRAINT [DF_Solt_ScheduleDetails_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_Schedules] ADD  CONSTRAINT [DF_Solt_Schedules_startDate]  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[Solt_SubscriptionPrices] ADD  CONSTRAINT [DF_Solt_SubscriptionPrices_postDate]  DEFAULT (getdate()) FOR [postDate]
GO
ALTER TABLE [dbo].[Solt_Transactions] ADD  CONSTRAINT [DF_Solt_Transactions_postTime]  DEFAULT (getdate()) FOR [postTime]
GO
ALTER TABLE [dbo].[Solt_UserGroups] ADD  CONSTRAINT [DF_Solt_UserGroups_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_UserGroups] ADD  CONSTRAINT [DF_Solt_UserGroups_creationDate]  DEFAULT (getdate()) FOR [creationDate]
GO
ALTER TABLE [dbo].[Solt_UserPerGroup] ADD  CONSTRAINT [DF_Solt_UserPerGroup_isActive]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_Users] ADD  CONSTRAINT [DF_Solt_Users_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Solt_Adresses]  WITH CHECK ADD  CONSTRAINT [FK_Adresses_Cities_cityid] FOREIGN KEY([cityid])
REFERENCES [dbo].[Solt_Cities] ([cityid])
GO
ALTER TABLE [dbo].[Solt_Adresses] CHECK CONSTRAINT [FK_Adresses_Cities_cityid]
GO
ALTER TABLE [dbo].[Solt_AuthSessions]  WITH NOCHECK ADD  CONSTRAINT [FK_Solt_AuthSessions_Solt_AuthPlatforms] FOREIGN KEY([authPlatformId])
REFERENCES [dbo].[Solt_AuthPlatforms] ([authPlatformId])
GO
ALTER TABLE [dbo].[Solt_AuthSessions] CHECK CONSTRAINT [FK_Solt_AuthSessions_Solt_AuthPlatforms]
GO
ALTER TABLE [dbo].[Solt_AuthSessions]  WITH CHECK ADD  CONSTRAINT [FK_Solt_AuthSessions_Solt_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_AuthSessions] CHECK CONSTRAINT [FK_Solt_AuthSessions_Solt_Users]
GO
ALTER TABLE [dbo].[Solt_AvailableMethods]  WITH CHECK ADD  CONSTRAINT [FK_Solt_AvailableMethods_Solt_PaymentMethods] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[Solt_PaymentMethods] ([paymentMethodId])
GO
ALTER TABLE [dbo].[Solt_AvailableMethods] CHECK CONSTRAINT [FK_Solt_AvailableMethods_Solt_PaymentMethods]
GO
ALTER TABLE [dbo].[Solt_Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States_stateid] FOREIGN KEY([stateid])
REFERENCES [dbo].[Solt_States] ([stateid])
GO
ALTER TABLE [dbo].[Solt_Cities] CHECK CONSTRAINT [FK_Cities_States_stateid]
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfoPerson_ContactInfoTypes_contactInfoTypeid] FOREIGN KEY([contactInfoTypeid])
REFERENCES [dbo].[Solt_ContactInfoTypes] ([contactInfoTypeid])
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson] CHECK CONSTRAINT [FK_ContactInfoPerson_ContactInfoTypes_contactInfoTypeid]
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfoPerson_Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_ContactInfoPerson] CHECK CONSTRAINT [FK_ContactInfoPerson_Users_userid]
GO
ALTER TABLE [dbo].[Solt_Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Currencies_currencyid] FOREIGN KEY([currencyid])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_Countries] CHECK CONSTRAINT [FK_Countries_Currencies_currencyid]
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions]  WITH CHECK ADD  CONSTRAINT [FK_CurrencyConversions_Currencies_destination_currencyid] FOREIGN KEY([destination_currencyid])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions] CHECK CONSTRAINT [FK_CurrencyConversions_Currencies_destination_currencyid]
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions]  WITH CHECK ADD  CONSTRAINT [FK_CurrencyConversions_Currencies_source_currencyid] FOREIGN KEY([source_currencyid])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_CurrencyConversions] CHECK CONSTRAINT [FK_CurrencyConversions_Currencies_source_currencyid]
GO
ALTER TABLE [dbo].[Solt_DealMedia]  WITH CHECK ADD  CONSTRAINT [FK_DealMedia_MediaFile_mediaFileid] FOREIGN KEY([mediaFileid])
REFERENCES [dbo].[Solt_MediaFile] ([mediaFileid])
GO
ALTER TABLE [dbo].[Solt_DealMedia] CHECK CONSTRAINT [FK_DealMedia_MediaFile_mediaFileid]
GO
ALTER TABLE [dbo].[Solt_DealMedia]  WITH CHECK ADD  CONSTRAINT [FK_DealMedia_PartnerDeals_partnerDealid] FOREIGN KEY([partnerDealid])
REFERENCES [dbo].[Solt_PartnerDeals] ([partnerDealid])
GO
ALTER TABLE [dbo].[Solt_DealMedia] CHECK CONSTRAINT [FK_DealMedia_PartnerDeals_partnerDealid]
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal]  WITH CHECK ADD  CONSTRAINT [FK_Solt_FeaturePerDeal_Solt_PartnerDeals] FOREIGN KEY([partnerDealid])
REFERENCES [dbo].[Solt_PartnerDeals] ([partnerDealid])
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal] CHECK CONSTRAINT [FK_Solt_FeaturePerDeal_Solt_PartnerDeals]
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal]  WITH CHECK ADD  CONSTRAINT [FK_Solt_FeaturePerDeal_Solt_PlanFeatures] FOREIGN KEY([planFeatureid])
REFERENCES [dbo].[Solt_PlanFeatures] ([planFeatureid])
GO
ALTER TABLE [dbo].[Solt_FeaturePerDeal] CHECK CONSTRAINT [FK_Solt_FeaturePerDeal_Solt_PlanFeatures]
GO
ALTER TABLE [dbo].[Solt_FeaturesPerPlan]  WITH CHECK ADD  CONSTRAINT [FK_FeaturesPerPlan_PlanFeatures_planFeatureid] FOREIGN KEY([planFeatureid])
REFERENCES [dbo].[Solt_PlanFeatures] ([planFeatureid])
GO
ALTER TABLE [dbo].[Solt_FeaturesPerPlan] CHECK CONSTRAINT [FK_FeaturesPerPlan_PlanFeatures_planFeatureid]
GO
ALTER TABLE [dbo].[Solt_FeaturesPerPlan]  WITH CHECK ADD  CONSTRAINT [FK_FeaturesPerPlan_Subscriptions_subscriptionid] FOREIGN KEY([subscriptionid])
REFERENCES [dbo].[Solt_Subscriptions] ([subscriptionid])
GO
ALTER TABLE [dbo].[Solt_FeaturesPerPlan] CHECK CONSTRAINT [FK_FeaturesPerPlan_Subscriptions_subscriptionid]
GO
ALTER TABLE [dbo].[Solt_LimitBalance]  WITH CHECK ADD  CONSTRAINT [FK_LimitBalance_Currencies_currency] FOREIGN KEY([currencyid])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_LimitBalance] CHECK CONSTRAINT [FK_LimitBalance_Currencies_currency]
GO
ALTER TABLE [dbo].[Solt_LimitBalance]  WITH CHECK ADD  CONSTRAINT [FK_LimitBalance_LimitBalanceTypes_limitBalanceTypeid] FOREIGN KEY([limitBalanceTypeid])
REFERENCES [dbo].[Solt_LimitBalanceTypes] ([limitBalanceTypeid])
GO
ALTER TABLE [dbo].[Solt_LimitBalance] CHECK CONSTRAINT [FK_LimitBalance_LimitBalanceTypes_limitBalanceTypeid]
GO
ALTER TABLE [dbo].[Solt_Log]  WITH NOCHECK ADD  CONSTRAINT [FK_Log_LogSeverity_logseverityid] FOREIGN KEY([logseverityid])
REFERENCES [dbo].[Solt_LogSeverity] ([logseverityid])
GO
ALTER TABLE [dbo].[Solt_Log] CHECK CONSTRAINT [FK_Log_LogSeverity_logseverityid]
GO
ALTER TABLE [dbo].[Solt_Log]  WITH NOCHECK ADD  CONSTRAINT [FK_Log_LogSources_logsourceid] FOREIGN KEY([logsourceid])
REFERENCES [dbo].[Solt_LogSources] ([logsourceid])
GO
ALTER TABLE [dbo].[Solt_Log] CHECK CONSTRAINT [FK_Log_LogSources_logsourceid]
GO
ALTER TABLE [dbo].[Solt_Log]  WITH NOCHECK ADD  CONSTRAINT [FK_Log_LogTypes_logtypeid] FOREIGN KEY([logtypeid])
REFERENCES [dbo].[Solt_LogTypes] ([logtypeid])
GO
ALTER TABLE [dbo].[Solt_Log] CHECK CONSTRAINT [FK_Log_LogTypes_logtypeid]
GO
ALTER TABLE [dbo].[Solt_MediaFile]  WITH CHECK ADD  CONSTRAINT [FK_MediaFile_MediaTypes_mediaTypeid] FOREIGN KEY([mediaTypeid])
REFERENCES [dbo].[Solt_MediaTypes] ([mediaTypeid])
GO
ALTER TABLE [dbo].[Solt_MediaFile] CHECK CONSTRAINT [FK_MediaFile_MediaTypes_mediaTypeid]
GO
ALTER TABLE [dbo].[Solt_MethodPerUser]  WITH CHECK ADD  CONSTRAINT [FK_MethodPerUser_AvailableMethods_availableMethodId] FOREIGN KEY([availableMethodId])
REFERENCES [dbo].[Solt_AvailableMethods] ([availableMethodId])
GO
ALTER TABLE [dbo].[Solt_MethodPerUser] CHECK CONSTRAINT [FK_MethodPerUser_AvailableMethods_availableMethodId]
GO
ALTER TABLE [dbo].[Solt_MethodPerUser]  WITH CHECK ADD  CONSTRAINT [FK_MethodPerUser_Users_userid] FOREIGN KEY([methodPerUserid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_MethodPerUser] CHECK CONSTRAINT [FK_MethodPerUser_Users_userid]
GO
ALTER TABLE [dbo].[Solt_PartnerDeals]  WITH CHECK ADD  CONSTRAINT [FK_PartnerDeals_DealType_dealTypeid] FOREIGN KEY([dealTypeid])
REFERENCES [dbo].[Solt_DealType] ([dealTypeid])
GO
ALTER TABLE [dbo].[Solt_PartnerDeals] CHECK CONSTRAINT [FK_PartnerDeals_DealType_dealTypeid]
GO
ALTER TABLE [dbo].[Solt_PartnerDeals]  WITH CHECK ADD  CONSTRAINT [FK_PartnerDeals_Partners_partnerid] FOREIGN KEY([partnerid])
REFERENCES [dbo].[Solt_Partners] ([partnerid])
GO
ALTER TABLE [dbo].[Solt_PartnerDeals] CHECK CONSTRAINT [FK_PartnerDeals_Partners_partnerid]
GO
ALTER TABLE [dbo].[Solt_PartnerPaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_PartnerPaymentMethods_AvailableMethods_availableMethodId] FOREIGN KEY([availableMethodId])
REFERENCES [dbo].[Solt_AvailableMethods] ([availableMethodId])
GO
ALTER TABLE [dbo].[Solt_PartnerPaymentMethods] CHECK CONSTRAINT [FK_PartnerPaymentMethods_AvailableMethods_availableMethodId]
GO
ALTER TABLE [dbo].[Solt_Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Adresses_partnerAdressid] FOREIGN KEY([partnerAdressid])
REFERENCES [dbo].[Solt_Adresses] ([adressid])
GO
ALTER TABLE [dbo].[Solt_Partners] CHECK CONSTRAINT [FK_Partners_Adresses_partnerAdressid]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_AvailableMethods] FOREIGN KEY([availableMethodId])
REFERENCES [dbo].[Solt_AvailableMethods] ([availableMethodId])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_AvailableMethods]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_Currencies] FOREIGN KEY([currencyId])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_Currencies]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_modules] FOREIGN KEY([moduleId])
REFERENCES [dbo].[Solt_Modules] ([moduleId])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_modules]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_PayErrorTypes] FOREIGN KEY([payErrorTypeId])
REFERENCES [dbo].[Solt_PayErrorTypes] ([payErrorTypeId])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_PayErrorTypes]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_StatusTypes1] FOREIGN KEY([statusTypeId])
REFERENCES [dbo].[Solt_StatusTypes] ([statusTypeId])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_StatusTypes1]
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentAttempts_Solt_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_PaymentAttempts] CHECK CONSTRAINT [FK_Solt_PaymentAttempts_Solt_Users]
GO
ALTER TABLE [dbo].[Solt_PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_Solt_PaymentMethods_Solt_ContactInfoPerson] FOREIGN KEY([contactInfoPersonId])
REFERENCES [dbo].[Solt_ContactInfoPerson] ([contactInfoPersonid])
GO
ALTER TABLE [dbo].[Solt_PaymentMethods] CHECK CONSTRAINT [FK_Solt_PaymentMethods_Solt_ContactInfoPerson]
GO
ALTER TABLE [dbo].[Solt_PlanLimits]  WITH CHECK ADD  CONSTRAINT [FK_PlanLimits_LimitBalance_limitBalanceid] FOREIGN KEY([limitBalanceid])
REFERENCES [dbo].[Solt_LimitBalance] ([limitBalanceid])
GO
ALTER TABLE [dbo].[Solt_PlanLimits] CHECK CONSTRAINT [FK_PlanLimits_LimitBalance_limitBalanceid]
GO
ALTER TABLE [dbo].[Solt_PlanLimits]  WITH CHECK ADD  CONSTRAINT [FK_PlanLimits_PlanFeatures_planFeatureid] FOREIGN KEY([planFeatureid])
REFERENCES [dbo].[Solt_PlanFeatures] ([planFeatureid])
GO
ALTER TABLE [dbo].[Solt_PlanLimits] CHECK CONSTRAINT [FK_PlanLimits_PlanFeatures_planFeatureid]
GO
ALTER TABLE [dbo].[Solt_PlanLimits]  WITH CHECK ADD  CONSTRAINT [FK_PlanLimits_Schedules_renewal_scheduleid] FOREIGN KEY([renewal_scheduleid])
REFERENCES [dbo].[Solt_Schedules] ([scheduleid])
GO
ALTER TABLE [dbo].[Solt_PlanLimits] CHECK CONSTRAINT [FK_PlanLimits_Schedules_renewal_scheduleid]
GO
ALTER TABLE [dbo].[Solt_PlanLimits]  WITH CHECK ADD  CONSTRAINT [FK_PlanLimits_Schedules_restricted_scheduleid] FOREIGN KEY([restricted_scheduleid])
REFERENCES [dbo].[Solt_Schedules] ([scheduleid])
GO
ALTER TABLE [dbo].[Solt_PlanLimits] CHECK CONSTRAINT [FK_PlanLimits_Schedules_restricted_scheduleid]
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup]  WITH CHECK ADD  CONSTRAINT [FK_PlansPerGroup_Schedules_scheduleid] FOREIGN KEY([scheduleid])
REFERENCES [dbo].[Solt_Schedules] ([scheduleid])
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup] CHECK CONSTRAINT [FK_PlansPerGroup_Schedules_scheduleid]
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup]  WITH CHECK ADD  CONSTRAINT [FK_PlansPerGroup_Subscriptions_subscriptionid] FOREIGN KEY([subscriptionid])
REFERENCES [dbo].[Solt_Subscriptions] ([subscriptionid])
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup] CHECK CONSTRAINT [FK_PlansPerGroup_Subscriptions_subscriptionid]
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup]  WITH CHECK ADD  CONSTRAINT [FK_PlansPerGroup_UserGroups_userGroupid] FOREIGN KEY([userGroupid])
REFERENCES [dbo].[Solt_UserGroups] ([userGroupid])
GO
ALTER TABLE [dbo].[Solt_PlansPerGroup] CHECK CONSTRAINT [FK_PlansPerGroup_UserGroups_userGroupid]
GO
ALTER TABLE [dbo].[Solt_RedemptionCodes]  WITH CHECK ADD  CONSTRAINT [FK_RedemptionItems_ReedemMethod_methodid] FOREIGN KEY([methodid])
REFERENCES [dbo].[Solt_RedemptionMethod] ([methodid])
GO
ALTER TABLE [dbo].[Solt_RedemptionCodes] CHECK CONSTRAINT [FK_RedemptionItems_ReedemMethod_methodid]
GO
ALTER TABLE [dbo].[Solt_RedemptionCodes]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionCodes_Solt_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_RedemptionCodes] CHECK CONSTRAINT [FK_Solt_RedemptionCodes_Solt_Users]
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Adresses] FOREIGN KEY([addressid])
REFERENCES [dbo].[Solt_Adresses] ([adressid])
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails] CHECK CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Adresses]
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Partners] FOREIGN KEY([partnerid])
REFERENCES [dbo].[Solt_Partners] ([partnerid])
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails] CHECK CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Partners]
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionDetails_Solt_PlanFeatures] FOREIGN KEY([planFeatureid])
REFERENCES [dbo].[Solt_PlanFeatures] ([planFeatureid])
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails] CHECK CONSTRAINT [FK_Solt_RedemptionDetails_Solt_PlanFeatures]
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionDetails_Solt_RedemptionMethod] FOREIGN KEY([methodid])
REFERENCES [dbo].[Solt_RedemptionMethod] ([methodid])
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails] CHECK CONSTRAINT [FK_Solt_RedemptionDetails_Solt_RedemptionMethod]
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Transactions] FOREIGN KEY([transactionid])
REFERENCES [dbo].[Solt_Transactions] ([transactionId])
GO
ALTER TABLE [dbo].[Solt_RedemptionDetails] CHECK CONSTRAINT [FK_Solt_RedemptionDetails_Solt_Transactions]
GO
ALTER TABLE [dbo].[Solt_ScheduleDetails]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleDetails_Schedules_scheduleid] FOREIGN KEY([scheduleid])
REFERENCES [dbo].[Solt_Schedules] ([scheduleid])
GO
ALTER TABLE [dbo].[Solt_ScheduleDetails] CHECK CONSTRAINT [FK_ScheduleDetails_Schedules_scheduleid]
GO
ALTER TABLE [dbo].[Solt_States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries_countryid] FOREIGN KEY([countryid])
REFERENCES [dbo].[Solt_Countries] ([countryid])
GO
ALTER TABLE [dbo].[Solt_States] CHECK CONSTRAINT [FK_States_Countries_countryid]
GO
ALTER TABLE [dbo].[Solt_SubscriptionPrices]  WITH CHECK ADD  CONSTRAINT [FK_SubscriptionPrices_Subscriptions_subscriptioid] FOREIGN KEY([subscriptionid])
REFERENCES [dbo].[Solt_Subscriptions] ([subscriptionid])
GO
ALTER TABLE [dbo].[Solt_SubscriptionPrices] CHECK CONSTRAINT [FK_SubscriptionPrices_Subscriptions_subscriptioid]
GO
ALTER TABLE [dbo].[Solt_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Solt_Transactions_Solt_PaymentAttempts] FOREIGN KEY([paymentAttemptId])
REFERENCES [dbo].[Solt_PaymentAttempts] ([paymentAttemptId])
GO
ALTER TABLE [dbo].[Solt_Transactions] CHECK CONSTRAINT [FK_Solt_Transactions_Solt_PaymentAttempts]
GO
ALTER TABLE [dbo].[Solt_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Solt_Transactions_Solt_TransactionSubTypes] FOREIGN KEY([transactionSubTypeId])
REFERENCES [dbo].[Solt_TransactionSubTypes] ([transactionSubTypeId])
GO
ALTER TABLE [dbo].[Solt_Transactions] CHECK CONSTRAINT [FK_Solt_Transactions_Solt_TransactionSubTypes]
GO
ALTER TABLE [dbo].[Solt_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Solt_Transactions_Solt_TransactionTypes] FOREIGN KEY([transactionTypeId])
REFERENCES [dbo].[Solt_TransactionTypes] ([transactionTypeId])
GO
ALTER TABLE [dbo].[Solt_Transactions] CHECK CONSTRAINT [FK_Solt_Transactions_Solt_TransactionTypes]
GO
ALTER TABLE [dbo].[Solt_Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Currencies_currencyid] FOREIGN KEY([currencyid])
REFERENCES [dbo].[Solt_Currencies] ([currencyid])
GO
ALTER TABLE [dbo].[Solt_Transactions] CHECK CONSTRAINT [FK_Transactions_Currencies_currencyid]
GO
ALTER TABLE [dbo].[Solt_UserAdresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAdresses_Adresses_adressid] FOREIGN KEY([adressid])
REFERENCES [dbo].[Solt_Adresses] ([adressid])
GO
ALTER TABLE [dbo].[Solt_UserAdresses] CHECK CONSTRAINT [FK_UserAdresses_Adresses_adressid]
GO
ALTER TABLE [dbo].[Solt_UserAdresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAdresses_Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_UserAdresses] CHECK CONSTRAINT [FK_UserAdresses_Users_userid]
GO
ALTER TABLE [dbo].[Solt_UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_GroupType_groupTypeid] FOREIGN KEY([groupTypeid])
REFERENCES [dbo].[Solt_GroupType] ([groupTypeid])
GO
ALTER TABLE [dbo].[Solt_UserGroups] CHECK CONSTRAINT [FK_UserGroups_GroupType_groupTypeid]
GO
ALTER TABLE [dbo].[Solt_UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_Users_groupOwner] FOREIGN KEY([groupOwner])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_UserGroups] CHECK CONSTRAINT [FK_UserGroups_Users_groupOwner]
GO
ALTER TABLE [dbo].[Solt_UserPerGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserPerGroup_UserGroups_userGroupid] FOREIGN KEY([userGroupid])
REFERENCES [dbo].[Solt_UserGroups] ([userGroupid])
GO
ALTER TABLE [dbo].[Solt_UserPerGroup] CHECK CONSTRAINT [FK_UserPerGroup_UserGroups_userGroupid]
GO
ALTER TABLE [dbo].[Solt_UserPerGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserPerGroup_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_UserPerGroup] CHECK CONSTRAINT [FK_UserPerGroup_Users]
GO
ALTER TABLE [dbo].[Solt_UserPersons]  WITH CHECK ADD  CONSTRAINT [FK_UserPersons_Users_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[Solt_Users] ([userid])
GO
ALTER TABLE [dbo].[Solt_UserPersons] CHECK CONSTRAINT [FK_UserPersons_Users_userid]
GO
USE [master]
GO
ALTER DATABASE [Soltura] SET  READ_WRITE 
GO
