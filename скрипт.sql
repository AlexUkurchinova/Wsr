USE [master]
GO
/****** Object:  Database [alexukurchinova_tour1]    Script Date: 06.10.2020 13:20:13 ******/
CREATE DATABASE [alexukurchinova_tour1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'alexukurchinova_tour1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\alexukurchinova_tour1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'alexukurchinova_tour1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXP14\MSSQL\DATA\alexukurchinova_tour1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [alexukurchinova_tour1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [alexukurchinova_tour1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [alexukurchinova_tour1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET ARITHABORT OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [alexukurchinova_tour1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [alexukurchinova_tour1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [alexukurchinova_tour1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [alexukurchinova_tour1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [alexukurchinova_tour1] SET  MULTI_USER 
GO
ALTER DATABASE [alexukurchinova_tour1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [alexukurchinova_tour1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [alexukurchinova_tour1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [alexukurchinova_tour1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [alexukurchinova_tour1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [alexukurchinova_tour1]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[code] [nchar](2) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hotel]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[name] [nchar](100) NULL,
	[countofstars] [int] NULL,
	[countrycode] [nchar](2) NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hotelcomment]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotelcomment](
	[id] [int] NOT NULL,
	[hotelid] [int] NULL,
	[text] [nvarchar](max) NULL,
	[author] [nvarchar](100) NULL,
	[Creation] [datetime] NULL,
 CONSTRAINT [PK_hotelcomment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[hotelid] [int] NULL,
	[imagesource] [varbinary](max) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hoteloftour]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoteloftour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_hoteloftour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tour]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[ticketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Discription] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Pricee] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Dicription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeofTour]    Script Date: 06.10.2020 13:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeofTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeofTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[hotel]  WITH CHECK ADD  CONSTRAINT [FK_hotel_Country] FOREIGN KEY([countrycode])
REFERENCES [dbo].[Country] ([code])
GO
ALTER TABLE [dbo].[hotel] CHECK CONSTRAINT [FK_hotel_Country]
GO
ALTER TABLE [dbo].[hotelcomment]  WITH CHECK ADD  CONSTRAINT [FK_hotelcomment_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hotelcomment] CHECK CONSTRAINT [FK_hotelcomment_hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_hotel] FOREIGN KEY([hotelid])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_hotel]
GO
ALTER TABLE [dbo].[hoteloftour]  WITH CHECK ADD  CONSTRAINT [FK_hoteloftour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[hoteloftour] CHECK CONSTRAINT [FK_hoteloftour_Tour]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Tour]
GO
ALTER TABLE [dbo].[TypeofTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeofTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeofTour] CHECK CONSTRAINT [FK_TypeofTour_Type]
GO
USE [master]
GO
ALTER DATABASE [alexukurchinova_tour1] SET  READ_WRITE 
GO
