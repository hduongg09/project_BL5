USE [master]
GO
/****** Object:  Database [PRJ_BL5]    Script Date: 12/10/2021 1:22:06 AM ******/
CREATE DATABASE [PRJ_BL5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ_BL5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ_BL5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ_BL5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ_BL5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ_BL5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_BL5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_BL5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_BL5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_BL5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_BL5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_BL5] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_BL5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ_BL5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_BL5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_BL5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_BL5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_BL5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_BL5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_BL5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_BL5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_BL5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ_BL5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_BL5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_BL5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_BL5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_BL5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_BL5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_BL5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_BL5] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ_BL5] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_BL5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_BL5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_BL5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_BL5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ_BL5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ_BL5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ_BL5', N'ON'
GO
ALTER DATABASE [PRJ_BL5] SET QUERY_STORE = OFF
GO
USE [PRJ_BL5]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 12/10/2021 1:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[atd] [date] NOT NULL,
	[ttd] [time](7) NOT NULL,
	[takeat] [bit] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 12/10/2021 1:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/10/2021 1:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[sroll] [varchar](150) NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([cid])
REFERENCES [dbo].[Class] ([cid])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
USE [master]
GO
ALTER DATABASE [PRJ_BL5] SET  READ_WRITE 
GO
