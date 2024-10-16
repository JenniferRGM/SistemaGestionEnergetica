USE [master]
GO
/****** Object:  Database [SistemaGestionEnergetica]    Script Date: 16/10/2024 01:11:48 ******/
CREATE DATABASE [SistemaGestionEnergetica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaGestionEnergetica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaGestionEnergetica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaGestionEnergetica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaGestionEnergetica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaGestionEnergetica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaGestionEnergetica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaGestionEnergetica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaGestionEnergetica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaGestionEnergetica] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaGestionEnergetica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaGestionEnergetica]
GO
/****** Object:  User [UsuarioSQLServer]    Script Date: 16/10/2024 01:11:49 ******/
CREATE USER [UsuarioSQLServer] FOR LOGIN [UsuarioSQLServer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jenny]    Script Date: 16/10/2024 01:11:49 ******/
CREATE USER [jenny] FOR LOGIN [jenny] WITH DEFAULT_SCHEMA=[jenny]
GO
/****** Object:  User [Gestor]    Script Date: 16/10/2024 01:11:49 ******/
CREATE USER [Gestor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UsuarioSQLServer]
GO
ALTER ROLE [db_owner] ADD MEMBER [jenny]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jenny]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jenny]
GO
ALTER ROLE [db_owner] ADD MEMBER [Gestor]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Gestor]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Gestor]
GO
/****** Object:  Schema [jenny]    Script Date: 16/10/2024 01:11:49 ******/
CREATE SCHEMA [jenny]
GO
/****** Object:  Table [dbo].[ConfiguracionDispositivos]    Script Date: 16/10/2024 01:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionDispositivos](
	[ID_Configuracion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Dispositivo] [int] NULL,
	[HoraEncendido] [time](7) NOT NULL,
	[HoraApagado] [time](7) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Configuracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumoEnergetico]    Script Date: 16/10/2024 01:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumoEnergetico](
	[ID_Consumo] [int] IDENTITY(1,1) NOT NULL,
	[ID_Dispositivo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[ConsumoKWh] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__ConsumoE__F95F4E958675F853] PRIMARY KEY CLUSTERED 
(
	[ID_Consumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dispositivos]    Script Date: 16/10/2024 01:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispositivos](
	[Nombre] [nvarchar](100) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](50) NULL,
	[ConsumoKWh] [decimal](10, 2) NOT NULL,
	[Activo] [bit] NULL,
	[ID_Dispositivo] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Dispositivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeEnergetico]    Script Date: 16/10/2024 01:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeEnergetico](
	[ID_Informe] [int] IDENTITY(1,1) NOT NULL,
	[ID_Dispositivo] [int] NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[ConsumoTotal] [decimal](10, 2) NOT NULL,
	[SugerenciasAhorro] [nvarchar](max) NULL,
	[CostoTotal]  AS ([ConsumoTotal]*(112)) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[ID_Informe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConfiguracionDispositivos]  WITH CHECK ADD  CONSTRAINT [FK_Configura_ID_Dispositivo] FOREIGN KEY([ID_Dispositivo])
REFERENCES [dbo].[Dispositivos] ([ID_Dispositivo])
GO
ALTER TABLE [dbo].[ConfiguracionDispositivos] CHECK CONSTRAINT [FK_Configura_ID_Dispositivo]
GO
ALTER TABLE [dbo].[InformeEnergetico]  WITH CHECK ADD  CONSTRAINT [FK_InformeEn_ID_Dispositivo] FOREIGN KEY([ID_Dispositivo])
REFERENCES [dbo].[Dispositivos] ([ID_Dispositivo])
GO
ALTER TABLE [dbo].[InformeEnergetico] CHECK CONSTRAINT [FK_InformeEn_ID_Dispositivo]
GO
USE [master]
GO
ALTER DATABASE [SistemaGestionEnergetica] SET  READ_WRITE 
GO
