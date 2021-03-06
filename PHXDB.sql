USE [master]
GO
/****** Object:  Database [PHX]    Script Date: 9/22/2015 1:47:09 PM ******/
CREATE DATABASE [PHX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ_PHX', FILENAME = N'C:\Program Files\' , SIZE = 483328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PHX_log', FILENAME = N'C:\Program Files\' , SIZE = 470144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Phoenix] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Phoenix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Phoenix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Phoenix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Phoenix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Phoenix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Phoenix] SET ARITHABORT OFF 
GO
ALTER DATABASE [Phoenix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Phoenix] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Phoenix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Phoenix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Phoenix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Phoenix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Phoenix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Phoenix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Phoenix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Phoenix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Phoenix] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Phoenix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Phoenix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Phoenix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Phoenix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Phoenix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Phoenix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Phoenix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Phoenix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Phoenix] SET  MULTI_USER 
GO
ALTER DATABASE [Phoenix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Phoenix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Phoenix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Phoenix] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Phoenix]
GO
/****** Object:  User [NT Service\MSSQLSERVER]    Script Date: 9/22/2015 1:47:09 PM ******/
CREATE USER [NT Service\MSSQLSERVER] FOR LOGIN [NT Service\MSSQLSERVER] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [YRM]    Script Date: 9/22/2015 1:47:09 PM ******/
CREATE USER [YRM] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [YRM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [YRM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [YRM]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [YRM]
GO
/****** Object:  Table [dbo].[BuildInfo]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildInfo](
	[BuildID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[BuildFileName] [nchar](200) NULL,
	[MaxLayers] [smallint] NULL,
	[StartLayer] [smallint] NULL,
	[EndLayer] [smallint] NULL,
	[PartOffsetX] [float] NULL,
	[PartOffsetY] [float] NULL,
	[ExtentsMinX] [float] NULL,
	[ExtentsMaxX] [float] NULL,
	[ExtentsMinY] [float] NULL,
	[ExtentsMaxY] [float] NULL,
	[ExtentsMinZ] [float] NULL,
	[ExtentsMaxZ] [float] NULL,
	[ElvStartPosition] [float] NULL,
	[TimeEstimateSecs] [float] NULL,
	[ResinName] [nchar](50) NULL,
	[Ec] [float] NULL,
	[Dp] [float] NULL,
	[PreferredBladeGap] [float] NULL,
	[ScaleFactorX] [float] NULL,
	[ScaleFactorY] [float] NULL,
	[LineWidth] [float] NULL,
	[LaserPower] [float] NULL,
	[ProfilerPositionX] [float] NULL,
	[ProfilerPositionY] [float] NULL,
	[MaxBorderSpeed] [float] NULL,
	[MaxHatchSpeed] [float] NULL,
 CONSTRAINT [PK_BuildData] PRIMARY KEY CLUSTERED 
(
	[BuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BuildStatus]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[BuildID] [int] NOT NULL,
	[LayerID] [smallint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[BuildState] [tinyint] NULL,
	[TaskProcess] [bit] NULL,
	[TaskMove] [bit] NULL,
	[TaskRecoat] [bit] NULL,
	[TaskLevel] [bit] NULL,
	[TaskDelay] [bit] NULL,
	[TaskScan] [bit] NULL,
	[TaskProfile] [bit] NULL,
	[BlockID] [smallint] NULL,
	[DrawSpeed] [float] NULL,
	[CureDepth] [float] NULL,
 CONSTRAINT [PK_BuildStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BuildVariables]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildVariables](
	[BldVarsID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AutoDrain] [bit] NULL,
	[PlatformInit] [bit] NULL,
	[Delay] [bit] NULL,
	[PlatformMove] [bit] NULL,
	[Sweep] [bit] NULL,
	[LevelResin] [bit] NULL,
	[Draw] [bit] NULL,
	[Profile] [bit] NULL,
	[Hatch] [bit] NULL,
	[SweepAddition] [bit] NULL,
	[AutoVacuum] [bit] NULL,
	[Interrupt] [tinyint] NULL,
	[Rescan] [bit] NULL,
 CONSTRAINT [PK_BuildVariables_1] PRIMARY KEY CLUSTERED 
(
	[BldVarsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceFltWarn]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceFltWarn](
	[FltIdx] [int] IDENTITY(1,1) NOT NULL,
	[FltWarnID] [smallint] NULL,
	[FltWarnDescription] [nvarchar](50) NULL,
	[FltWarnState] [bit] NULL,
	[TimeStamp] [datetime] NOT NULL,
 CONSTRAINT [PK_DeviceFltWarn] PRIMARY KEY CLUSTERED 
(
	[FltIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ElevatorState]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElevatorState](
	[ElvStatID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[HomeState] [bit] NULL,
	[Moving] [bit] NULL,
	[WarningCount] [smallint] NULL,
	[FaultCount] [smallint] NULL,
	[Position] [float] NULL,
	[Target] [float] NULL,
	[Velocity] [float] NULL,
	[Acceleration] [float] NULL,
	[Units] [tinyint] NULL,
 CONSTRAINT [PK_ElevatorState] PRIMARY KEY CLUSTERED 
(
	[ElvStatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LayerInfo]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayerInfo](
	[BuildID] [int] NOT NULL,
	[LayerID] [smallint] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[Zvalue] [float] NULL,
	[LayerThickness] [float] NULL,
	[LaserPower] [float] NULL,
	[BeamWidth] [float] NULL,
	[BeamSizeX] [float] NULL,
	[BeamSizeY] [float] NULL,
	[ProfilerPositionX] [float] NULL,
	[ProfilerPositionY] [float] NULL,
	[TimeEstimateSecs] [float] NULL,
	[RemainingBuildTimeSecs] [float] NULL,
 CONSTRAINT [PK_LayerData] PRIMARY KEY CLUSTERED 
(
	[BuildID] ASC,
	[LayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MachineState]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ResinChamberTemp] [float] NULL,
	[LaserEnclosureTemp] [float] NULL,
 CONSTRAINT [PK_MachineState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecoaterState]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecoaterState](
	[RecStatID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[HomeState] [bit] NULL,
	[Moving] [bit] NULL,
	[WarningCount] [tinyint] NULL,
	[FaultCount] [tinyint] NULL,
	[Position] [float] NULL,
	[Target] [float] NULL,
	[Velocity] [float] NULL,
	[Acceleration] [float] NULL,
	[Units] [tinyint] NULL,
 CONSTRAINT [PK_RecoaterState] PRIMARY KEY CLUSTERED 
(
	[RecStatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResinLevelerState]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResinLevelerState](
	[ResinLvlID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Position] [float] NULL,
	[Target] [float] NULL,
	[Moving] [bit] NULL,
 CONSTRAINT [PK_ResinLevelerState] PRIMARY KEY CLUSTERED 
(
	[ResinLvlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VatState]    Script Date: 9/22/2015 1:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VatState](
	[VatStateID] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[HomeState] [bit] NULL,
	[Moving] [bit] NULL,
	[WarningCount] [tinyint] NULL,
	[FaultCount] [tinyint] NULL,
	[Position] [float] NULL,
	[Target] [float] NULL,
	[Velocity] [float] NULL,
	[Acceleration] [float] NULL,
	[Units] [tinyint] NULL,
 CONSTRAINT [PK_VatState] PRIMARY KEY CLUSTERED 
(
	[VatStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BuildStatus]  WITH CHECK ADD  CONSTRAINT [FK_BuildStatus_LayerData] FOREIGN KEY([BuildID], [LayerID])
REFERENCES [dbo].[LayerInfo] ([BuildID], [LayerID])
GO
ALTER TABLE [dbo].[BuildStatus] CHECK CONSTRAINT [FK_BuildStatus_LayerData]
GO
ALTER TABLE [dbo].[LayerInfo]  WITH CHECK ADD  CONSTRAINT [FK_LayerData_BuildData] FOREIGN KEY([BuildID])
REFERENCES [dbo].[BuildInfo] ([BuildID])
GO
ALTER TABLE [dbo].[LayerInfo] CHECK CONSTRAINT [FK_LayerData_BuildData]
GO
USE [master]
GO
ALTER DATABASE [Phoenix] SET  READ_WRITE 
GO
