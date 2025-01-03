USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 04.09.2024 16:43:25 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[City]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Index]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Index](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PickIndex] [int] NOT NULL,
 CONSTRAINT [PK_Index] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[IDPickupPoint] [int] NOT NULL,
	[IDClient] [int] NULL,
	[Code] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF29A4E393] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IndexID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[StreetID] [int] NOT NULL,
	[house] [int] NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticle] [nchar](10) NULL,
	[ProductNameID] [int] NULL,
	[ProductCost] [decimal](19, 4) NULL,
	[ProductDiscountAvailable] [int] NULL,
	[ProductManufactureID] [int] NULL,
	[ProductTraderID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[ProductDiscount] [int] NULL,
	[ProductQuantityInStock] [int] NULL,
	[UnitID] [int] NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[PhotoName] [nvarchar](50) NULL,
	[ProductImage] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategoryID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductManufacturer]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductManufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductManufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductName]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductName](
	[iD] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductName] PRIMARY KEY CLUSTERED 
(
	[iD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTrader]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTrader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Trader] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductTrader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[streets]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[streets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](50) NOT NULL,
 CONSTRAINT [PK_streets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.09.2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__User__1788CCAC99520AA0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [City]) VALUES (1, N'г.Нефтеюганск')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Index] ON 

INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (1, 125061)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (2, 125703)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (3, 125837)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (4, 190949)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (5, 344288)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (6, 394060)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (7, 394242)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (8, 394782)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (9, 400562)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (10, 410172)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (11, 410542)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (12, 410661)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (13, 420151)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (14, 426030)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (15, 443890)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (16, 450375)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (17, 450558)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (18, 450983)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (19, 454311)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (20, 603002)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (21, 603036)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (22, 603379)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (23, 603721)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (24, 614164)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (25, 614510)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (26, 614611)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (27, 614753)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (28, 620839)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (29, 625283)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (30, 625560)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (31, 625590)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (32, 625683)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (33, 630201)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (34, 630370)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (35, 660007)
INSERT [dbo].[Index] ([ID], [PickIndex]) VALUES (36, 660540)
SET IDENTITY_INSERT [dbo].[Index] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, NULL, 601, 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, NULL, 602, 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 9, 603, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, NULL, 604, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (5, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, NULL, 605, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 7, 606, 1)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (7, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, NULL, 607, 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (8, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, NULL, 608, 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (9, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 1, 609, 2)
INSERT [dbo].[Order] ([ID], [OrderDate], [OrderDeliveryDate], [IDPickupPoint], [IDClient], [Code], [IDStatus]) VALUES (10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 8, 610, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderProduct] ON 

INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (1, 1, 30, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (2, 2, 10, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (3, 3, 9, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (4, 4, 11, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (5, 5, 23, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (6, 6, 16, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (7, 7, 14, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (8, 8, 19, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (9, 9, 27, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (10, 10, 21, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (11, 1, 12, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (12, 2, 29, 15)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (13, 3, 25, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (14, 4, 5, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (15, 5, 6, 10)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (16, 6, 4, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (17, 7, 22, 2)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (18, 8, 27, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (19, 9, 20, 1)
INSERT [dbo].[OrderProduct] ([ID], [OrderID], [IDProduct], [Quantity]) VALUES (20, 10, 28, 1)
SET IDENTITY_INSERT [dbo].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([ID], [Status]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (1, 5, 1, 28, 1)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (2, 24, 1, 1, 30)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (3, 7, 1, 8, 43)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (4, 36, 1, 24, 25)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (5, 3, 1, 30, 40)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (6, 2, 1, 17, 49)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (7, 29, 1, 18, 46)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (8, 26, 1, 12, 50)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (9, 19, 1, 15, 19)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (10, 35, 1, 16, 19)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (11, 21, 1, 21, 4)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (12, 18, 1, 9, 26)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (13, 8, 1, 28, 3)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (14, 20, 1, 5, 28)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (15, 17, 1, 13, 30)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (16, 6, 1, 26, 43)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (17, 12, 1, 29, 50)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (18, 31, 1, 8, 20)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (19, 32, 1, 2, NULL)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (20, 9, 1, 6, 32)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (21, 25, 1, 10, 47)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (22, 11, 1, 22, 46)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (23, 28, 1, 27, 8)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (24, 15, 1, 8, 1)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (25, 22, 1, 25, 46)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (26, 23, 1, 4, 41)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (27, 10, 1, 23, 13)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (28, 13, 1, 3, 32)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (29, 1, 1, 19, 8)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (30, 34, 1, 30, 24)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (31, 27, 1, 20, 35)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (32, 14, 1, 10, 44)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (33, 16, 1, 7, 44)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (34, 30, 1, 14, 12)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (35, 33, 1, 9, 17)
INSERT [dbo].[PickupPoint] ([ID], [IndexID], [CityID], [StreetID], [house]) VALUES (36, 4, 1, 11, 26)
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (1, N'B427R5    ', 5, CAST(400.0000 AS Decimal(19, 4)), 15, 10, 2, 1, 4, 5, 1, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (2, N'D356R4    ', 6, CAST(600.0000 AS Decimal(19, 4)), 15, 11, 1, 3, 2, 16, 1, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (3, N'D563F4    ', 1, CAST(600.0000 AS Decimal(19, 4)), 10, 10, 1, 3, 5, 5, 1, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (4, N'D643B5    ', 7, CAST(4100.0000 AS Decimal(19, 4)), 30, 1, 1, 2, 4, 9, 1, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (5, N'E345R4    ', 1, CAST(199.0000 AS Decimal(19, 4)), 5, 5, 2, 2, 5, 7, 1, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (6, N'E431R5    ', 3, CAST(170.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 5, 5, 1, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'E431R5.png', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (7, N'E434U6    ', 3, CAST(140.0000 AS Decimal(19, 4)), 20, 9, 2, 3, 3, 19, 1, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (8, N'E466T6    ', 2, CAST(3500.0000 AS Decimal(19, 4)), 30, 10, 2, 3, 5, 3, 1, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (9, N'E532Q5    ', 3, CAST(166.0000 AS Decimal(19, 4)), 15, 9, 1, 3, 5, 18, 1, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (10, N'F432F4    ', 7, CAST(1200.0000 AS Decimal(19, 4)), 10, 8, 2, 2, 3, 15, 1, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (11, N'G345E4    ', 6, CAST(300.0000 AS Decimal(19, 4)), 5, 6, 2, 3, 3, 19, 1, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (12, N'G453T5    ', 8, CAST(149.0000 AS Decimal(19, 4)), 15, 12, 2, 1, 2, 7, 1, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (13, N'G542F5    ', 7, CAST(2190.0000 AS Decimal(19, 4)), 30, 8, 1, 3, 4, 7, 1, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (14, N'H342F5    ', 1, CAST(510.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 2, 17, 1, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (15, N'H432F4    ', 5, CAST(385.0000 AS Decimal(19, 4)), 10, 10, 2, 1, 2, 17, 1, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (16, N'H436R4    ', 1, CAST(300.0000 AS Decimal(19, 4)), 15, 10, 1, 3, 2, 15, 1, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (17, N'H542R6    ', 3, CAST(177.0000 AS Decimal(19, 4)), 15, 10, 2, 3, 3, 15, 1, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (18, N'H643W2    ', 5, CAST(292.0000 AS Decimal(19, 4)), 25, 10, 1, 1, 3, 13, 1, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (19, N'K436T5    ', 6, CAST(100.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 4, 21, 1, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (20, N'K452T5    ', 4, CAST(800.0000 AS Decimal(19, 4)), 25, 13, 2, 3, 2, 17, 1, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (21, N'M356R4    ', 3, CAST(50.0000 AS Decimal(19, 4)), 5, 9, 2, 3, 4, 6, 1, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (22, N'Q245F5    ', 1, CAST(510.0000 AS Decimal(19, 4)), 5, 10, 2, 3, 2, 17, 1, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (23, N'R356F4    ', 5, CAST(234.0000 AS Decimal(19, 4)), 10, 7, 1, 3, 3, 17, 1, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (24, N'S245R4    ', 7, CAST(280.0000 AS Decimal(19, 4)), 15, 1, 2, 2, 3, 8, 1, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (25, N'T432F4    ', 7, CAST(1700.0000 AS Decimal(19, 4)), 25, 2, 2, 3, 2, 5, 1, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (26, N'V352R4    ', 7, CAST(1700.0000 AS Decimal(19, 4)), 25, 2, 1, 3, 4, 9, 1, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (27, N'V527T5    ', 1, CAST(640.0000 AS Decimal(19, 4)), 5, 10, 1, 3, 5, 4, 1, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (28, N'W548O7    ', 7, CAST(600.0000 AS Decimal(19, 4)), 15, 3, 1, 3, 5, 15, 1, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (29, N'Y324F4    ', 3, CAST(86.0000 AS Decimal(19, 4)), 5, 9, 1, 3, 4, 17, 1, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([ID], [ProductArticle], [ProductNameID], [ProductCost], [ProductDiscountAvailable], [ProductManufactureID], [ProductTraderID], [ProductCategoryID], [ProductDiscount], [ProductQuantityInStock], [UnitID], [ProductDescription], [PhotoName], [ProductImage]) VALUES (30, N'А112Т4    ', 3, CAST(123.0000 AS Decimal(19, 4)), 30, 4, 1, 2, 3, 6, 1, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'А112Т4.png', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Category]) VALUES (1, N'Для животных')
INSERT [dbo].[ProductCategory] ([ID], [Category]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[ProductCategory] ([ID], [Category]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductManufacturer] ON 

INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (1, N'Cat Chow')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (2, N'Chappy')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (3, N'Dog Chow')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (4, N'Dreames')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (6, N'LIKER')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (7, N'Nobby')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (8, N'Pro Plan')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (9, N'TitBit')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (10, N'Triol')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (11, N'trixie')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (12, N'True Touch')
INSERT [dbo].[ProductManufacturer] ([ID], [Manufacturer]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[ProductManufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductName] ON 

INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[ProductName] ([iD], [Name]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[ProductName] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTrader] ON 

INSERT [dbo].[ProductTrader] ([ID], [Trader]) VALUES (1, N'PetShop')
INSERT [dbo].[ProductTrader] ([ID], [Trader]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[ProductTrader] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[streets] ON 

INSERT [dbo].[streets] ([ID], [street]) VALUES (1, N' ул.Степная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (2, N'ул.8 Марта')
INSERT [dbo].[streets] ([ID], [street]) VALUES (3, N'ул.Вишневая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (4, N'ул.Гоголя')
INSERT [dbo].[streets] ([ID], [street]) VALUES (5, N'ул.Дзержинского')
INSERT [dbo].[streets] ([ID], [street]) VALUES (6, N'ул.Зеленая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (7, N'ул.Клубная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (8, N'ул.Коммунистическая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (9, N'ул.Комсомольская')
INSERT [dbo].[streets] ([ID], [street]) VALUES (10, N'ул.Маяковского')
INSERT [dbo].[streets] ([ID], [street]) VALUES (11, N'ул.Мичурина')
INSERT [dbo].[streets] ([ID], [street]) VALUES (12, N'ул.Молодежная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (13, N'ул.Набережная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (14, N'ул.Некрасова')
INSERT [dbo].[streets] ([ID], [street]) VALUES (15, N'ул.Новая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (16, N'ул.Октябрьская')
INSERT [dbo].[streets] ([ID], [street]) VALUES (17, N'ул.Партизанская')
INSERT [dbo].[streets] ([ID], [street]) VALUES (18, N'ул.Победы')
INSERT [dbo].[streets] ([ID], [street]) VALUES (19, N'ул.Подгорная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (20, N'ул.Полевая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (21, N'ул.Садовая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (22, N'ул.Светлая')
INSERT [dbo].[streets] ([ID], [street]) VALUES (23, N'ул.Северная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (24, N'ул.Солнечная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (25, N'ул.Спортивная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (26, N'ул.Фрунзе')
INSERT [dbo].[streets] ([ID], [street]) VALUES (27, N'ул.Цветочная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (28, N'ул.Чехова')
INSERT [dbo].[streets] ([ID], [street]) VALUES (29, N'ул.Школьная')
INSERT [dbo].[streets] ([ID], [street]) VALUES (30, N'ул.Шоссейная')
SET IDENTITY_INSERT [dbo].[streets] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([ID], [UnitName]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[Users] ([ID], [IDRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 1, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([IDPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickupPoint_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[PickupPoint] CHECK CONSTRAINT [FK_PickupPoint_City]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickupPoint_Index] FOREIGN KEY([IndexID])
REFERENCES [dbo].[Index] ([ID])
GO
ALTER TABLE [dbo].[PickupPoint] CHECK CONSTRAINT [FK_PickupPoint_Index]
GO
ALTER TABLE [dbo].[PickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_PickupPoint_streets] FOREIGN KEY([StreetID])
REFERENCES [dbo].[streets] ([ID])
GO
ALTER TABLE [dbo].[PickupPoint] CHECK CONSTRAINT [FK_PickupPoint_streets]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductManufacturer] FOREIGN KEY([ProductManufactureID])
REFERENCES [dbo].[ProductManufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductManufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductName] FOREIGN KEY([ProductNameID])
REFERENCES [dbo].[ProductName] ([iD])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductTrader] FOREIGN KEY([ProductTraderID])
REFERENCES [dbo].[ProductTrader] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductTrader]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Units]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
