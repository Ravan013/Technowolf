USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 1/15/2020 12:26:36 PM ******/
CREATE DATABASE [Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\Shopping.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER1\MSSQL\DATA\Shopping_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopping] SET QUERY_STORE = OFF
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[cart_product]    Script Date: 1/15/2020 12:26:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_product](
	[o_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [varchar](100) NULL,
	[product_id] [varchar](1000) NULL,
	[Product_name] [varchar](1000) NULL,
	[brand] [varchar](100) NULL,
	[image] [varchar](1000) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_cart_product] PRIMARY KEY CLUSTERED 
(
	[o_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_data]    Script Date: 1/15/2020 12:26:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[password] [varchar](50) NULL,
	[role] [varchar](10) NULL,
	[address] [varchar](2000) NULL,
	[mobile_no] [varchar](10) NULL,
	[email] [varchar](30) NULL,
	[fname] [varchar](100) NULL,
	[answer] [nchar](10) NULL,
 CONSTRAINT [PK__login_da__72E12F1ABEF4101C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[main_order]    Script Date: 1/15/2020 12:26:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [varchar](100) NULL,
	[product_id] [varchar](100) NULL,
	[email_address] [varchar](50) NULL,
	[mobile_no] [varchar](10) NULL,
	[payment_type] [varchar](30) NULL,
	[address] [varchar](1500) NULL,
 CONSTRAINT [PK_main_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[main_product]    Script Date: 1/15/2020 12:26:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [varchar](500) NULL,
	[MRP] [int] NULL,
	[Our_Prize] [int] NULL,
	[Discount] [int] NULL,
	[Brand] [varchar](100) NULL,
	[Brand_image] [varchar](500) NULL,
	[Type_of_product] [varchar](100) NULL,
	[Imagepath1] [varchar](500) NULL,
	[Imagepath2] [varchar](500) NULL,
	[Imagepath3] [varchar](500) NULL,
	[Imagepath4] [varchar](500) NULL,
	[Detail] [varchar](1500) NULL,
	[stock] [int] NULL,
	[new_arrival] [int] NULL,
	[best_seller] [int] NULL,
	[best_offer] [int] NULL,
 CONSTRAINT [PK_main_product] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cart_product] ON 

INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (6, 6, N'Manish', N'3', N'Samsung Note-4', N'Samsung', N'~/Product/samsung-note-4-sm-n910gzweins-125x125-imaeyg83f5vgtybg.jpeg', 1, 54990)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (7, 6, N'Manish', N'2', N'Sony Xperia Z3', N'Sony', N'~/Product/sony-xperia-z3-125x125-imaey8gbpjpznxu3.jpeg', 1, 44000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (8, 6, N'Manish', N'8', N'Micromax Unite 2 A106 with 8 GB ROM', N'Micromax', N'~/Product/micromax-unite-2-a106-8-gb-rom-125x125-imadxvuvrswyymzj.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (9, 6, N'Manish', N'11', N'Dell Inspiron 15 3542 Notebook (4th Gen Ci3/ 4GB/ 500GB/ Win8.1)
', N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadzytzdxdtzyq7.jpeg', 1, 32125)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (42, 5, N'Vikas', N'8', N'Micromax Unite 2 A106 with 8 GB ROM', N'Micromax', N'~/Product/micromax-unite-2-a106-8-gb-rom-125x125-imadxvuvrswyymzj.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (43, 5, N'Vikas', N'8', N'Micromax Unite 2 A106 with 8 GB ROM', N'Micromax', N'~/Product/micromax-unite-2-a106-8-gb-rom-125x125-imadxvuvrswyymzj.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (44, 5, N'Vikas', N'13', N'Dell Inspiron 15 3521 Laptop(3rd Gen PDC/ 4GB/ 500GB/ Ubuntu)', N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadhz455huhguxg.jpeg', 1, 28999)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (47, 0, N'', N'4', N'Moto E', N'Motorola', N'~/Product/motorola-xt1022-125x125-imadvvfknshcywk5.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (53, 0, N'', N'13', N'Dell Inspiron 15 3521 Laptop(3rd Gen PDC/ 4GB/ 500GB/ Ubuntu)', N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadhz455huhguxg.jpeg', 1, 28999)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (59, 0, N'', N'8', N'Micromax Unite 2 A106 with 8 GB ROM', N'Micromax', N'~/Product/micromax-unite-2-a106-8-gb-rom-125x125-imadxvuvrswyymzj.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (64, 0, N'', N'16', N'Redmi 2(White)', N'Mi', N'~/Product/mi-redmi-2-mzb4283in-125x125-imae5f8w8rcvhfzh.jpeg', 1, 6999)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (69, 0, N'', N'39', N'Acer E1-522 (NX.M81SI.010) Laptop (APU Quad Core A6/ 4GB/ 500GB/ Linux)', N'Acer', N'~/Product/acer-aspire-e-notebook-125x125-imadsx3tevzn4ucn.jpeg', 1, 24590)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (72, 11, N'Divya', N'4', N'Moto E', N'Motorola', N'~/Product/motorola-xt1022-125x125-imadvvfknshcywk5.jpeg', 1, 7000)
INSERT [dbo].[cart_product] ([o_id], [user_id], [user_name], [product_id], [Product_name], [brand], [image], [quantity], [price]) VALUES (73, 11, N'Divya', N'10', N'Samsung NP300E5E-A03IN Laptop (3rd Gen Ci3/ 2GB/ 500GB/ Win8)', N'Samsung', N'~/Product/samsung-notebook-125x125-imadjbjvqzrwfbzd.jpeg', 1, 30449)
SET IDENTITY_INSERT [dbo].[cart_product] OFF
SET IDENTITY_INSERT [dbo].[login_data] ON 

INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (1, N'Sunil', N'123456', N'admin', N'KTM', N'8898825780', N'sunil2197@gmail.com', N'Sunil Vaskar', N'Black     ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (4, N'anil', N'123456', N'user', N'KTM', N'123456789', N'anil2197@gmail.com', N'Anil Kumar', N'Blue      ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (6, N'Manish', N'123456', N'user', N'KTM', N'1234567890', N'manish@gmail.com', N'Manish Kumar', N'Blue      ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (11, N'Ramesh', N'123456', N'admin', N'KTM', N'1234567890', N'divya123456@gmail.com', N'Ramesh Suwal', N'Black     ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (13, N'Prashil', N'123456', N'admin', N'KTM', N'9869223400', N'bisonprashil013@gmail.com', N'Prashil Khadka', N'Black     ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (18, N'prince', N'123456789', N'user', N'asdf', N'4536120396', N'asd@fgh.com', N'Prince Karki', N'Black     ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (19, N'nirgesh', N'4house123456', N'user', N'four houses', N'7485961230', N'asdf@gmail.com', N'Nirgesh Shrestha', N'Blue      ')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (20, N'kancha', N'123456789', N'user', N'asdqwe', N'7418529630', N'asd@gmail.com', N'Fullname Kancha', N'Blackheart')
INSERT [dbo].[login_data] ([id], [name], [password], [role], [address], [mobile_no], [email], [fname], [answer]) VALUES (23, N'Bikram', N'123456789', N'user', N'Asan', N'9803200400', N'iamwhoiam0100@gmail.com', N'Bikram Shrestha', N'Orange    ')
SET IDENTITY_INSERT [dbo].[login_data] OFF
SET IDENTITY_INSERT [dbo].[main_order] ON 

INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (1, 1, N'Sunil', N'8,9,1', N'sunil2197@gmail.com', N'8898825780', N'Cash', N'Mumbai')
INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (2, 5, N'Vikas', N'8,8,13', N'vikas@gmail.com', N'8898825780', N'Cash', N'Sion')
INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (3, 5, N'Vikas', N'8,8,13', N'vikas@gmail.com', N'8898825780', N'Cash', N'Sion')
INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (4, 1, N'Sunil', N'8,9,1', N'sunil2197@gmail.com', N'8898825780', N'Cash', N'Mumbai')
INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (5, 4, N'anil', N'2,11,8', N'anil@gmail.com', N'1234567890', N'Cash', N'Mumbai')
INSERT [dbo].[main_order] ([order_id], [user_id], [user_name], [product_id], [email_address], [mobile_no], [payment_type], [address]) VALUES (6, 1, N'Sunil', N'', N'sunil2197@gmail.com', N'8898825780', N'Cash', N'Mumbai')
SET IDENTITY_INSERT [dbo].[main_order] OFF
SET IDENTITY_INSERT [dbo].[main_product] ON 

INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (1, N'Redmi 1s', 6000, 5000, 20, N'Mi', N'~/Product/mi-mi-redmi-1s-2013029-125x125-imadz99z2hgshk3e.jpeg', N'Mobiles', N'~/Product_Img/mi-mi-redmi-1s-2013029-400x400-imadz99z2hgshk3e.jpeg', N'~/Product_Img/mi-mi-redmi-1s-2013029-400x400-imadz7skzqhq6qjz.jpeg', N'~/Product_Img/mi-mi-redmi-1s-2013029-400x400-imadz7sksmrgcsmz.jpeg', N'~/Product_Img/mi-mi-redmi-1s-2013029-400x400-imadz7skhzg83qsh.jpeg', N'    1.6 MP Secondary Camera    4.7-inch Touchscreen    8 MP Primary Camera    AGC Dragontrail Scratch Resistant Glass    1.6 GHz MSM8228 Quad Core Processor    Dual Sim (3G 2G)    Expandable Storage Capacity of 64 GB    Android v4.3 (Jelly Bean) OS', 20, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (2, N'Sony Xperia Z3', 44000, 40000, 5, N'Sony', N'~/Product/sony-xperia-z3-125x125-imaey8gbpjpznxu3.jpeg', N'Mobiles', N'~/Product_Img/sony-xperia-z3-compact-400x400-imaey8gdjkfetyqn.jpeg', N'~/Product_Img/sony-xperia-z3-compact-400x400-imaey8gdpdhwngva.jpeg', N'~/Product_Img/sony-xperia-z3-compact-400x400-imaey8gdtpqnghpd.jpeg', N'~/Product_Img/sony-xperia-z3-compact-400x400-imaey8gdtyhtxkmh.jpeg', N'The Xperia Z3 is the premium smartphone that does more and goes further – whether further is a run in the rain or a dive into the pool on a sunny summer holiday. With the highest waterproof rating*, you can find your way in a downpour, take pictures underwater or just wipe off your phone after an unexpected spill. Combining a super-slim body and aluminium frame, the Xperia Z3 is the Android smartphone that teams durability with beauty.', 10, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (3, N'Samsung Note-4', 54990, 50000, 5, N'Samsung', N'~/Product/samsung-note-4-sm-n910gzweins-125x125-imaeyg83f5vgtybg.jpeg', N'Mobiles', N'~/Product_Img/samsung-note-4-sm-n910gzweins-400x400-imaeyg83f5vgtybg.jpeg', N'~/Product_Img/samsung-note-4-sm-n910gzweins-400x400-imaeyg83yztt9mgc.jpeg', N'~/Product_Img/samsung-note-4-sm-n910gzweins-400x400-imaeyg83gwgzj8cn.jpeg', N'~/Product_Img/sony-xperia-z3-compact-400x400-imaey8gdatbpgsky.jpeg', N'
    5.7-inch Super AMOLED Touchscreen
    Android v4.4 (KitKat) OS
    3.7 MP Secondary Camera
    Expandable Storage Capacity of 128 GB
    2.7 GHz Quad Core Processor
    LTE Cat 6 (300 / 50 Mbps)
    16 MP Primary Camera
', 10, 0, 0, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (4, N'Moto E', 7000, 6000, 10, N'Motorola', N'~/Product/motorola-xt1022-125x125-imadvvfknshcywk5.jpeg', N'Mobiles', N'~/Product_Img/motorola-xt1022-400x400-imadvvfkg9f2ggrg.jpeg', N'~/Product_Img/motorola-xt1022-400x400-imadvvfknshcywk5.jpeg', N'~/Product_Img/motorola-xt1022-400x400-imadvvfkrczftqfs.jpeg', N'~/Product_Img/motorola-xt1022-400x400-imadvvfkshrfjcfj.jpeg', N'
    Android v4.4 (KitKat) OS
    Wi-Fi Enabled
    FM Radio
    1.2 GHz MSM8x10 Dual Core Processor
    Dual Standby SIM (GSM + GSM)
    5 MP Primary Camera
    4.3-inch Touchscreen
', 10, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (8, N'Micromax Unite 2 A106 with 8 GB ROM', 7000, 6000, 10, N'Micromax', N'~/Product/micromax-unite-2-a106-8-gb-rom-125x125-imadxvuvrswyymzj.jpeg', N'Mobiles', N'~/Product_Img/micromax-unite-2-a106-400x400-imadwf3qp5c5vjhc.jpeg', N'~/Product_Img/micromax-unite-2-a106-400x400-imadwf3qb5eb3whg.jpeg', N'~/Product_Img/micromax-unite-2-a106-400x400-imadwf3qsz2uzh3a.jpeg', N'~/Product_Img/micromax-unite-2-a106-400x400-imadwf3qczrzntmf.jpeg', N'Android v4.4.2 (KitKat) OS
FM Radio
HD Video Recording
Wi-Fi Enabled
1.3 GHz MT6582M Quad Core Processor
5 MP Primary Camera
Face Recognition
Expandable Storage Capacity of 32 GB
2 MP Secondary Camera
4.7-inch LCD Touchscreen
', 20, 0, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (9, N'HP Compaq 15-s009TU Notebook (4th Gen Ci3/ 4GB/ 500GB/ Win 8.1) (J8C08PA)', 29240, 28000, 5, N'HP', N'~/Product/hp-notebook-15-s003tu-125x125-imaeyf6e5cgmhn9r.jpeg', N'Laptops', N'~/Product_Img/hp-notebook-15-s003tu-400x400-imaeyf6e5cgmhn9r.jpeg', N'~/Product_Img/hp-notebook-15-s003tu-400x400-imaeyf6er8zajmmc.jpeg', N'~/Product_Img/hp-notebook-15-s003tu-400x400-imaeyf6pnwrwyyr8.jpeg', N'~/Product_Img/hp-compaq-notebook-400x400-imaeyf6egg58p3mh.jpeg', N'Intel Core i3
4 GB DDR3 RAM
500 GB HDD
Windows 8
', 20, 0, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (10, N'Samsung NP300E5E-A03IN Laptop (3rd Gen Ci3/ 2GB/ 500GB/ Win8)', 30449, 28000, 10, N'Samsung', N'~/Product/samsung-notebook-125x125-imadjbjvqzrwfbzd.jpeg', N'Laptops', N'~/Product_Img/samsung-notebook-400x400-imadjbjvqzrwfbzd.jpeg', N'~/Product_Img/samsung-notebook-400x400-imadjbjvkhsafykb.jpeg', N'~/Product_Img/samsung-notebook-400x400-imadjbjvj8swtzgh.jpeg', N'~/Product_Img/samsung-notebook-400x400-imadjbjvgshxfw4f.jpeg', N'Intel Core i3
2 GB DDR3 RAM
500 GB HDD
Windows 8
', 10, 1, 0, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (11, N'Dell Inspiron 15 3542 Notebook (4th Gen Ci3/ 4GB/ 500GB/ Win8.1)
', 32125, 30000, 10, N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadzytzdxdtzyq7.jpeg', N'Laptops', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzdxdtzyq7.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzdxdtzyq7.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzdxdtzyq7.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzdxdtzyq7.jpeg', N'Intel Core i3
4 GB DDR3 RAM
500 GB HDD
Windows 8
', 20, 0, 1, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (12, N'Dell Inspiron 5547 Notebook (4th Gen Ci5/ 8GB/ 1TB/ Win8.1/ 2GB Graph) (5547581TB2S)', 49080, 45000, 15, N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadzytzjqtmhgqr.jpeg', N'Laptops', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzjqtmhgqr.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzuur3j8x8.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzyvd4hjbj.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadzytzuur3j8x8.jpeg', N'Intel Core i5
8 GB DDR3 RAM
1 TB HDD
Windows 8
', 20, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (13, N'Dell Inspiron 15 3521 Laptop(3rd Gen PDC/ 4GB/ 500GB/ Ubuntu)', 28999, 25000, 10, N'Dell', N'~/Product/dell-inspiron-notebook-125x125-imadhz455huhguxg.jpeg', N'Laptops', N'~/Product_Img/dell-inspiron-notebook-400x400-imadhz455huhguxg.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadhz45zyuurzte.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadhz45zybvqkgb.jpeg', N'~/Product_Img/dell-inspiron-notebook-400x400-imadhz45udhbss8e.jpeg', N'Pentium Dual Core
4 GB DDR3 RAM
500 GB HDD
Linux/Ubuntu

', 15, 0, 0, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (14, N'Moto G (2nd Gen)', 12999, 10000, 20, N'Motorola', N'~/Product/motorola-xt1068-125x125-imadzmftdsmnqx3k.jpeg', N'Mobiles', N'~/Product_Img/motorola-xt1068-400x400-imadzmftdsmnqx3k.jpeg', N'~/Product_Img/motorola-xt1068-400x400-imadzm99npxgfqtv.jpeg', N'~/Product_Img/motorola-xt1068-400x400-imadzm99n3jfgfng.jpeg', N'~/Product_Img/motorola-xt1068-400x400-imadzhsfka9zakh3.jpeg', N'Exceptional Phone. Exceptional Price. The Moto G 2nd Generation is the successor to the highly successful Moto G. With a 5-inch HD screen and an incredibly fast Quad-Core processor, you can expect a smooth smartphone experience wherever you go', 10, 1, 5, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (15, N'Moto X (2nd Gen)', 31999, 30000, 10, N'Motorola', N'~/Product/motorola-xt1092-125x125-imadzv552hzkamyr.jpeg', N'Mobiles', N'~/Product_Img/motorola-xt1092-400x400-imadzv552hzkamyr.jpeg', N'~/Product_Img/motorola-xt1092-400x400-imadzu3yhkdcjcvc.jpeg', N'~/Product_Img/motorola-xt1092-400x400-imadzv84wgxnfhd2.jpeg', N'~/Product_Img/motorola-xt1092-400x400-imadzua6zy9ymwgt.jpeg', N'Pure Style. Pure Performance. Pure Voice. Pure Simplicity. The all-new Moto X is here to captivate you with its aesthetically pleasing design and high-end technical features.', 20, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (16, N'Redmi 2(White)', 6999, 6000, 5, N'Mi', N'~/Product/mi-redmi-2-mzb4283in-125x125-imae5f8w8rcvhfzh.jpeg', N'Mobiles', N'~/Product_Img/mi-redmi-2-mzb4283in-400x400-imae5f8w8rcvhfzh.jpeg', N'~/Product_Img/mi-redmi-2-mzb4283in-400x400-imae5f8wsz8czyht.jpeg', N'~/Product_Img/mi-redmi-2-mzb4283in-400x400-imae5f8wgyjqrjcj.jpeg', N'~/Product_Img/mi-redmi-2-mzb4283in-400x400-imae5f8w8rcvhfzh.jpeg', N'Key Features of Redmi 2
Android v4.4 (KitKat) OS
8 MP Primary Camera
Dual Sim (GSM + LTE)
Wi-Fi Enabled
2 MP Secondary Camera
4.7-inch Touchscreen
FM Radio
1.2 GHz Qualcomm Snapdragon 410 MSM8916 Quad Core Processor
Expandable Storage Capacity of 32 GB', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (17, N'Mi4 16 GB(White)', 19999, 18000, 7, N'Mi', N'~/Product/mi-mzb4239in-125x125-imae3z7uqh9gpypz.jpeg', N'Mobiles', N'~/Product_Img/mi-mzb4239in-400x400-imae3z7uqh9gpypz.jpeg', N'~/Product_Img/mi-mzb4239in-400x400-imae3z7umtju3mv2.jpeg', N'~/Product_Img/mi-mzb4239in-400x400-imae3z7uenhwjhz8.jpeg', N'~/Product_Img/mi-mzb4239in-400x400-imae3z7uaxhzvzzk.jpeg', N'Key Features of Mi4 16 GB
13 MP Primary Camera
Android v4.4 (KitKat) OS
2.5 GHz Qualcomm Snapdragon 801 MSM8274AC Quad Core Processor
5-inch Touchscreen
8 MP Secondary Camera', 20, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (18, N'Samsung Galaxy S6 Edge', 58900, 55000, 6, N'Samsung', N'~/Product/samsung-galaxy-s6-edge-sm-g925izweinu-125x125-imae5rwwwezajhmf.jpeg', N'Mobiles', N'~/Product_Img/samsung-galaxy-s6-edge-sm-g925izweinu-400x400-imae5rwwwezajhmf.jpeg', N'~/Product_Img/samsung-galaxy-s6-edge-sm-g925izwains-sm-g925izwainu-400x400-imae5rwwvd3ggwzy.jpeg', N'~/Product_Img/samsung-galaxy-s6-edge-sm-g925izweinu-400x400-imae5rww59pjc8xz.jpeg', N'~/Product_Img/samsung-galaxy-s6-edge-sm-g925izwains-sm-g925izwainu-400x400-imae5rwwvd3ggwzy (1).jpeg', N'Key Features of Samsung Galaxy S6 Edge
Wi-Fi Enabled
4G (LTE) - (Cat 6) 300 Mbps HSDPA
Android v5 (Lollipop) OS
50 Mbps HSUPA
2.1 GHz + 1.5 GHz Octa Core Processor
5 MP Secondary Camera
16 MP Primary Camera
5.1-inch Super AMOLED Touchscreen', 6, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (19, N'Samsung Galaxy Note 3 N9000', 31990, 30000, 2, N'Samsung', N'~/Product/samsung-galaxy-note-3-n9000-125x125-imadq4ypdrhrynxh.jpeg', N'Mobiles', N'~/Product_Img/samsung-galaxy-note-3-n9000-400x400-imadq4ypdrhrynxh.jpeg', N'~/Product_Img/samsung-galaxy-note-3-n9000-400x400-imadq4yppgvttkrz.jpeg', N'~/Product_Img/samsung-galaxy-note-3-n9000-400x400-imadq4ypqpcukbh6.jpeg', N'~/Product_Img/samsung-galaxy-note-3-n9000-400x400-imadq4ypvpbg4b2g.jpeg', N'Key Features of Samsung Galaxy Note 3 N9000
Android v4.3 (Jelly Bean) OS
Air Gesture and Air View
Full HD (1080p) Recording and Playback Support
Dual Camera: Dual Shot / Dual Recording / Dual Video Call
S Pen Optimized Features: Air Command; Action Memo; Scrapbook; S Finder; Pen Window; Multi Window; Direct Pen Input
Samsung Smart Scroll and Samsung Smart Pause
2 MP Secondary Camera with Smart Stabilization and BSI Sensor
13 MP Primary Camera with Auto Focus and BSI Sensor
NFC Support
5.7-inch Full HD Super AMOLED (1920 x 1080) Display
Octa Core Processor (1.9 GHz Quad + 1.3 GHz Quad) and 3 GB RAM', 30, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (20, N'Sony Xperia ZR(White)', 23999, 18000, 15, N'Sony', N'~/Product/sony-xperia-zr-125x125-imadwjhzyfjkgc4n.jpeg', N'Mobiles', N'~/Product_Img/sony-xperia-zr-400x400-imadwjhzyfjkgc4n.jpeg', N'~/Product_Img/sony-xperia-zr-400x400-imadwjmy4ehthjs8.jpeg', N'~/Product_Img/sony-xperia-zr-400x400-imadwjmyeuhxtvmr.jpeg', N'~/Product_Img/sony-xperia-zr-400x400-imadwjmykyzwc8rg.jpeg', N'Key Features of Sony Xperia ZR
4.6-inch TFT Capacitive Touchscreen
Full HD Recording
Android v4.1 (Jelly Bean) OS
FM Radio
Wi-Fi Enabled
Expandable Storage Capacity of 32 GB
13 MP Primary Camera
0.3 MP Secondary Camera
1.5 GHz Qualcomm Snapdragon S4 Pro Quad Core Processor', 10, 0, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (22, N'Sony Xperia T2 Ultra', 21400, 20000, 6, N'Sony', N'~/Product/sony-xperia-t2-ultra-125x125-imadwjmfsykwtgpa.jpeg', N'Mobiles', N'~/Product_Img/sony-xperia-t2-ultra-400x400-imadwjmfsykwtgpa.jpeg', N'~/Product_Img/sony-xperia-t2-ultra-400x400-imadwjmfzzezqx2f.jpeg', N'~/Product_Img/sony-xperia-t2-ultra-400x400-imadwjmfm53auhyf.jpeg', N'~/Product_Img/sony-xperia-t2-ultra-400x400-imadwjmfgngd9fxt.jpeg', N'Key Features of Sony Xperia T2 Ultra
13 MP Primary Camera
Full HD Recording
6-inch TFT Capacitive Touchscreen
1.1 MP Secondary Camera
Wi-Fi Enabled
Expandable Storage Capacity of 32 GB
Android v4.3 (Jelly Bean) OS
1.4 GHz Qualcomm Snapdragon MSM8228 Quad Core Processor', 5, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (23, N'Micromax Canvas Nitro A311', 9999, 8000, 20, N'Micromax', N'~/Product/micromax-canvas-nitro-a311-125x125-imae2k5vwtwd8k4q.jpeg', N'Mobiles', N'~/Product_Img/micromax-canvas-nitro-a311-400x400-imae2k5vwtwd8k4q.jpeg', N'~/Product_Img/micromax-canvas-nitro-a311-400x400-imae2k5vkehrmhzx.jpeg', N'~/Product_Img/micromax-canvas-nitro-a311-400x400-imae2k5vba5jyz9h.jpeg', N'~/Product_Img/micromax-canvas-nitro-a311-400x400-imae2k5veqt332uy.jpeg', N'Key Features of Micromax Canvas Nitro A311
5-inch Touchscreen
Expandable Storage Capacity of 32 GB
FM Radio
Android v4.4.2 (KitKat) OS
1.7 GHz MT6592 Octa Core Processor
13 MP Primary Camera and 5 MP Secondary Camera
Dual Sim (GSM + WCDMA)', 10, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (24, N'Micromax Canvas Selfie A255(Blue)', 15369, 13000, 15, N'Micromax', N'~/Product/micromax-micromax-selfie-a255-125x125-imae58tshuwzgzgr.jpeg', N'Mobiles', N'~/Product_Img/micromax-micromax-selfie-a255-400x400-imae58tshuwzgzgr.jpeg', N'~/Product_Img/micromax-micromax-selfie-a255-400x400-imae58tsnyucmf9g.jpeg', N'~/Product_Img/micromax-micromax-selfie-a255-400x400-imae58tsgeznsy2e.jpeg', N'~/Product_Img/micromax-micromax-selfie-a255-400x400-imae58tsggxzgxyg.jpeg', N'Key Features of Micromax Canvas Selfie A255
1.7 GHz MTK6592 Octa Core Processor
FM Radio
13 MP Secondary Camera
Dual Sim (GSM + WCDMA)
Expandable Storage Capacity of 32 GB
Android v4.4.2 (KitKat) OS
13 MP Primary Camera
4.7-inch Touchscreen
Wi-Fi Enabled', 10, 1, 0, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (25, N'Apple 16GB iPad Mini with Wi-Fi', 16679, 15000, 6, N'Apple', N'~/Product/apple-ipad-mini-wi-fi-cellular-32gb-125x125-imadfxacwtybdguz.jpeg', N'Tablet', N'~/Product_Img/apple-ipad-mini-wi-fi-cellular-32gb-400x400-imadfxacwtybdguz.jpeg', N'~/Product_Img/apple-ipad-mini-wi-fi-64-gb-400x400-imadfwh7gcq9ancv.jpeg', N'~/Product_Img/apple-ipad-mini-wi-fi-cellular-32gb-400x400-imadfxacwtybdguz.jpeg', N'~/Product_Img/apple-ipad-mini-wi-fi-64-gb-400x400-imadfwh7gcq9ancv.jpeg', N'Key Features of Apple 16GB iPad Mini with Wi-Fi
Upgradable to iOS 8
Face Time HD Camera and iSight Camera
iOS 6 and iCloud
Powerful A5 Chip
10 hrs Battery Life
Full HD Recording
LED Backlit Display', 9, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (26, N'Apple iPad Air 2 Wi-Fi 16 GB Tablet', 34675, 30000, 10, N'Apple', N'~/Product/apple-ipad-air-2-wi-fi-16-gb-125x125-imae2yv2gezb3gsx.jpeg', N'Tablet', N'~/Product_Img/apple-ipad-air-2-wi-fi-16-gb-400x400-imae2yv2gezb3gsx.jpeg', N'~/Product_Img/apple-ipad-air-2-wi-fi-16-gb-400x400-imae2yv2gezb3gsx.jpeg', N'~/Product_Img/apple-ipad-air-2-wi-fi-16-gb-400x400-imae2yv2gezb3gsx.jpeg', N'~/Product_Img/apple-ipad-air-2-wi-fi-16-gb-400x400-imae2yv2gezb3gsx.jpeg', N'Key Features of Apple iPad Air 2 Wi-Fi 16 GB Tablet
9.7-inch Touchscreen
1.2 MP Secondary Camera
A8X Chip with M8 Motion Co-processor
8 MP Primary Camera
Full HD Recording
Wi-Fi Enabled
', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (27, N'Apple 16 GB iPad Air with Wi-Fi', 35000, 25000, 35, N'Apple', N'~/Product/apple-64-gb-ipad-air-with-wi-fi-125x125-imadr69czshjbvmk.jpeg', N'Tablet', N'~/Product_Img/apple-64-gb-ipad-air-with-wi-fi-400x400-imadr69czshjbvmk.jpeg', N'~/Product_Img/apple-64-gb-ipad-air-with-wi-fi-400x400-imadr69czshjbvmk.jpeg', N'~/Product_Img/apple-64-gb-ipad-air-with-wi-fi-400x400-imadr69czshjbvmk.jpeg', N'~/Product_Img/apple-64-gb-ipad-air-with-wi-fi-400x400-imadr69czshjbvmk.jpeg', N'Key Features of Apple 16 GB iPad Air with Wi-Fi
5 MP Primary Camera
Upgradable to iOS 8
1.2 MP Secondary Camera
A7 Chip with M7 Co-processor
Full HD Recording
9.7-inch Touchscreen
Wi-Fi Enabled', 3, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (28, N'Lenovo Yoga 2 Tablet Android 10.1 inch', 27990, 25000, 6, N'Lenovo', N'~/Product/lenovo-yoga-tablet-2-1050l-125x125-imae2y4cnzfffqn9.jpeg', N'Tablet', N'~/Product_Img/lenovo-yoga-tablet-2-1050l-400x400-imae2y4cnzfffqn9.jpeg', N'~/Product_Img/lenovo-yoga-tablet-2-1050l-400x400-imaefgzvvrfsstew.jpeg', N'~/Product_Img/lenovo-yoga-tablet-2-1050l-400x400-imaeyv7hjp9sdzbz.jpeg', N'~/Product_Img/lenovo-yoga-tablet-2-1050l-400x400-imaefgzvy5avkhgg.jpeg', N'Key Features of Lenovo Yoga 2 Tablet Android 10.1 inch
1.6 MP Secondary Camera
Expandable Storage Capacity of 64 GB
Wi-Fi Enabled
1.86 GHz Intel Atom Z3745 Quad Core Processor
Android v4.4 (KitKat) OS
10.1-inch Capacitive Touchscreen
8 MP Primary Camera', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (29, N'Lenovo S8 Tablet', 18000, 15000, 6, N'Lenovo', N'~/Product/lenovo-s8-50lc-125x125-imae2k8gunfnhdqu.jpeg', N'Tablet', N'~/Product_Img/lenovo-s8-50lc-400x400-imae2k8gunfnhdqu.jpeg', N'~/Product_Img/lenovo-s8-50lc-400x400-imae2k8ju3y9jggd.jpeg', N'~/Product_Img/lenovo-s8-50-400x400-imae2hu2d9uhf9zy.jpeg', N'~/Product_Img/lenovo-s8-50lc-400x400-imae2jtwtbuq7jf2.jpeg', N'Key Features of Lenovo S8 Tablet
8-inch Capacitive Touchscreen
1.86 GHz Intel Atom Z3745 Quad Core Processor
Wi-Fi Enabled
8 MP Primary Camera
1.6 MP Secondary Camera
Expandable Storage Capacity of 64 GB
Android v4.4 (KitKat) OS', 5, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (30, N'Lenovo A8-50 Tablet', 15850, 10000, 45, N'Lenovo', N'~/Product/lenovo-a5500-hv-125x125-imae3kmtedg2cpy3.jpeg', N'Tablet', N'~/Product_Img/lenovo-a5500-hv-400x400-imae3kmtedg2cpy3.jpeg', N'~/Product_Img/lenovo-a5500-hv-400x400-imae3kmthcrzkxpk.jpeg', N'~/Product_Img/lenovo-a5500-hv-400x400-imae3hzgqdgpabkk.jpeg', N'~/Product_Img/lenovo-a5500-hv-400x400-imae3hzgq9mzwq6w.jpeg', N'Key Features of Lenovo A8-50 TabletAndroid v4.2 (Jelly Bean) OS2 MP Secondary CameraExpandable Storage Capacity of 32 GBWi-Fi Enabled8-inch Capacitive Touchscreen1.3 GHz MTK 8382 Quad Core Processor5 MP Primary Camera', 14, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (31, N'Asus FE380CG-1A071A Fonepad 8 Tablet', 14000, 10000, 15, N'Asus', N'~/Product/asus-fe380cg-1a071a-125x125-imae3mwzcxgdsrxg.jpeg', N'Tablet', N'~/Product_Img/asus-fe380cg-1a071a-400x400-imae3mwzcxgdsrxg.jpeg', N'~/Product_Img/asus-fe380cg-1a071a-400x400-imae3mwzpccqwysz.jpeg', N'~/Product_Img/asus-fe380cg-1a071a-400x400-imae3mwzuczcv5j2.jpeg', N'~/Product_Img/asus-fe380cg-1a071a-400x400-imae3mwzbpkh3bdy.jpeg', N'Key Features of Asus FE380CG-1A071A Fonepad 8 Tablet
2 MP Secondary Camera
5 MP Primary Camera
8-inch Touchscreen
Wi-Fi Enabled
Android v4.4 (KitKat) OS
1.33 GHz Intel Atom Z3530 Quad Core Processor
Expandable Storage Capacity of 64 GB', 10, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (32, N'AsusFE380CG-1G046A Fonepad 8 Tablet', 14000, 10000, 25, N'Asus', N'~/Product/asus-fe380cg-1g046a-125x125-imae3mxfq322zhz9.jpeg', N'Tablet', N'~/Product_Img/asus-fe380cg-1g046a-400x400-imae3mxfq322zhz9.jpeg', N'~/Product_Img/asus-fe380cg-1g046a-400x400-imae3mxfzmghfngs.jpeg', N'~/Product_Img/asus-fe380cg-1g046a-400x400-imae3mxf6wwthhf3.jpeg', N'~/Product_Img/asus-fe380cg-1g046a-400x400-imae3mxfnwz7hbkf.jpeg', N'Key Features of AsusFE380CG-1G046A Fonepad 8 Tablet
5 MP Primary Camera
Wi-Fi Enabled
Android v4.4 (KitKat) OS
Expandable Storage Capacity of 64 GB
2 MP Secondary Camera
8-inch Touchscreen
1.33 GHz Intel Atom Z3530 Quad Core Processor', 10, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (33, N'Asus Tablet ME581', 20000, 18000, 20, N'Asus', N'~/Product/asus-me581-125x125-imae56catej9p5wu.jpeg', N'Tablet', N'~/Product_Img/asus-me581-400x400-imae56catej9p5wu.jpeg', N'~/Product_Img/asus-me581-400x400-imae56carr6het8h.jpeg', N'~/Product_Img/asus-me581-400x400-imae56cag3rygpac.jpeg', N'~/Product_Img/asus-me581-400x400-imae56cazrgj62kb.jpeg', N'Key Features of Asus Tablet ME581
1.83 GHz Intel Atom Z3560 Quad Core Processor
Expandable Storage Capacity of 64 GB
Android v4.4 (KitKat) OS
5 MP Primary Camera
1.2 MP Secondary Camera
8-inch Touchscreen
Wi-Fi Enabled', 10, 1, 0, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (34, N'Logitech G300 Gaming Mouse', 1475, 1000, 30, N'Mouse', N'~/Product/logitech-g300-gaming-200x200-imaddgzgghubgahk.jpeg', N'Computer_Accessories', N'~/Product_Img/logitech-g300-gaming-400x400-imaddgzgbxtzhv2q.jpeg', N'~/Product_Img/logitech-logitech-gaming-mouse-g300-400x400-imad6aqyfyxu9ern.jpeg', N'~/Product_Img/logitech-g300-gaming-400x400-imaddgzgghubgahk.jpeg', N'~/Product_Img/logitech-g300-gaming-400x400-imaddm9rame97zbg.jpeg', N'The mouse has 9 programmable buttons, including right- & left-click buttons along with the scroll wheel. Just below the wheel are 2 buttons. 2 buttons are available on either side of the left- and right-click buttons. The buttons are smooth to press and elicit response. Reassign any command or macro to any programmable button with an optional Logitech Gaming Software (LGS)*. ', 10, 1, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (35, N'Dell WM123 Wireless Notebook Mouse', 800, 400, 50, N'Mouse', N'~/Product/dell-wm123-200x200-imadpv3cp9nvgajz.jpeg', N'Computer_Accessories', N'~/Product_Img/dell-wm123-400x400-imadpv3cp9nvgajz.jpeg', N'~/Product_Img/dell-wm123-400x400-imadpucjbyrgnkqt.jpeg', N'~/Product_Img/dell-wm123-400x400-imadpv3cp9nvgajz.jpeg', N'~/Product_Img/dell-wm123-400x400-imadpucjbyrgnkqt.jpeg', N'Wireless Optical Mouse, USB Wireless Receiver, Scrolling Wheel Feature, RF Interface, Plug and Play, Clutter-free Workspace, Comfortable and Contoured Shape, Easy Setup, 1 Year Battery Life', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (36, N'HP X3000 Wireless Optical Mouse', 850, 400, 55, N'Mouse', N'~/Product/hp-x3000-200x200-imadh9hvpsp3unje.jpeg', N'Computer_Accessories', N'~/Product_Img/hp-x3000-400x400-imadh9hvpsp3unje.jpeg', N'~/Product_Img/hp-x3000-400x400-imadh9hvpsp3unje.jpeg', N'~/Product_Img/hp-x3000-400x400-imadh9hvpsp3unje.jpeg', N'~/Product_Img/hp-x3000-400x400-imadh9hvpsp3unje.jpeg', N' Non-smooth Scrolling helps while playing games to scroll the weapons, and also while reading documents. 
Better grip and nice shape gives a cozy feel in your hands. 
 AA size battery (not AAA) should give more life (hoping so)though AA battery makes it heavy.
', 2, 0, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (37, N'Sony BRAVIA KLV-28R412B 69.9 cm (28) LED TV', 25900, 22000, 10, N'Sony', N'~/Product/sony-bravia-klv-28r412b-125x125-imaeyn5g5dnugxkb.jpeg', N'Televisions', N'~/Product_Img/sony-bravia-klv-28r412b-400x400-imaeyn5g5dnugxkb.jpeg', N'~/Product_Img/sony-klv-28r412b-400x400-imadvv73rfkn5fhd.jpeg', N'~/Product_Img/sony-bravia-klv-28r412b-400x400-imaeyn5g5dnugxkb.jpeg', N'~/Product_Img/sony-klv-28r412b-400x400-imadvv73rfkn5fhd.jpeg', N'This TV has a Clear Resolution Enhancer which boosts the clarity of the details and textures of various images and videos. Its 28-inch LED screen allows you to view more with its wide range of aspect ratios. It also has a Bass Reflex Speaker for increases the quality and clarity of the audio being played. This increases your viewing pleasure and enhances your overall entertainment experience', 20, 0, 1, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (38, N'LG 32LB515A 80 cm (32) LED TV', 25000, 22000, 15, N'LG', N'~/Product/lg-32lb515a-125x125-imadwknwhnebrtyx.jpeg', N'Televisions', N'~/Product_Img/lg-32lb515a-400x400-imadwknwhnebrtyx.jpeg', N'~/Product_Img/lg-32lb515a-400x400-imadwknwhnebrtyx.jpeg', N'~/Product_Img/lg-32lb515a-400x400-imadwknwhnebrtyx.jpeg', N'~/Product_Img/lg-32lb515a-400x400-imadwknwhnebrtyx.jpeg', N'Transform Stand This television has a unique design which converts your TV stand to a rack which saves more space. The stand can be used to hold books, remote controls and your DVD player.', 10, 0, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (39, N'Acer E1-522 (NX.M81SI.010) Laptop (APU Quad Core A6/ 4GB/ 500GB/ Linux)', 24590, 22000, 10, N'Acer', N'~/Product/acer-aspire-e-notebook-125x125-imadsx3tevzn4ucn.jpeg', N'Laptops', N'~/Product_Img/acer-aspire-e-notebook-400x400-imadsx3tevzn4ucn.jpeg', N'~/Product_Img/acer-aspire-e-notebook-400x400-imadsx3tevzn4ucn.jpeg', N'~/Product_Img/acer-aspire-e-notebook-400x400-imadsx3tevzn4ucn.jpeg', N'~/Product_Img/acer-aspire-e-notebook-400x400-imadsx3tevzn4ucn.jpeg', N'Key Features of Acer E1-522 (NX.M81SI.010) Laptop (APU Quad Core A6/ 4GB/ 500GB/ Linux)
APU Quad Core A6
4 GB DDR3 RAM
500 GB HDD
Linux', 10, 0, 1, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (40, N'Sandisk Ultra Dual USB Drive 32 GB Pendrive', 1500, 800, 45, N'Pendrives', N'~/Product/sandisk-ultra-dual-drive-200x200-imadu4r8fs9ud9hj.jpeg', N'Computer_Accessories', N'~/Product_Img/sandisk-ultra-dual-drive-400x400-imadu4r8fs9ud9hj.jpeg', N'~/Product_Img/sandisk-ultra-dual-drive-400x400-imadwkh5hg7dudhs.jpeg', N'~/Product_Img/sandisk-ultra-dual-drive-400x400-imadwkh5j4sgwukg.jpeg', N'~/Product_Img/sandisk-ultra-dual-drive-400x400-imadwkh5tvnntuda.jpeg', N'Features Requires Host Device with On-The-Go (OTG) Compatibility, Automatically Detected when Connected to a Compatible Smartphone or Tablet, Dual Micro USB and USB 2.0 Connectors, Sandisk Memory Zone App for Easily Manage and Back-up content( Available on Google Play), Easily Transfer Content between Android Smartphones, Tablets, PC and Mac Computers, Operating Temperature: 0 DegC to 60 DegC', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (41, N'Sony BRAVIA KDL-50W800B 126 cm (50) LED TV', 99900, 80000, 20, N'Sony', N'~/Product/sony-bravia-kdl-50w800b-125x125-imaeyn5gyufmkrmf.jpeg', N'Televisions', N'~/Product_Img/sony-bravia-kdl-50w800b-400x400-imaeyn5gyufmkrmf.jpeg', N'~/Product_Img/sony-bravia-kdl-50w800b-400x400-imadv3bzzkhyzaxz.jpeg', N'~/Product_Img/sony-bravia-kdl-50w800b-400x400-imadv3bzsw8hmcuh.jpeg', N'~/Product_Img/sony-bravia-kdl-50w800b-400x400-imadv3bzzkhyzaxz.jpeg', N'Key Features of Sony BRAVIA KDL-50W800B 126 cm (50) LED TV
LED Display
126 cm (50)
Full HD, 1920 x 1080
3D TV, Smart TV
4 x HDMI, 2 x USB
Built-in Wi-Fi, Ethernet', 5, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (42, N'Sony BRAVIA KDL-24W600A 59.8 cm (24) LED TV', 20490, 15000, 25, N'Sony', N'~/Product/sony-bravia-kdl-24w600a-125x125-imaeyn5gyaxhm5fw.jpeg', N'Televisions', N'~/Product_Img/sony-bravia-kdl-24w600a-400x400-imaeyn5gyaxhm5fw.jpeg', N'~/Product_Img/sony-bravia-kdl-24w600a-400x400-imadv3bzb4zr9h8y.jpeg', N'~/Product_Img/sony-bravia-kdl-24w600a-400x400-imadv3bzjgaqznyk.jpeg', N'~/Product_Img/sony-bravia-kdl-24w600a-400x400-imadv3bzb4zr9h8y.jpeg', N'Key Features of Sony BRAVIA KDL-24W600A 59.8 cm (24) LED TV
LED Display
59.8 cm (24)
WXGA, 1366 X 768
Smart TV
2 x HDMI, 1 x USB
Wi-Fi Ready, Ethernet', 10, 1, 1, 1)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (43, N'LG 22LB470A 55 cm (22) LED TV', 10000, 8000, 20, N'LG', N'~/Product/lg-22lb470a-125x125-imaey6jkpyukdxvn.jpeg', N'Televisions', N'~/Product_Img/lg-22lb470a-400x400-imaey6jkpyukdxvn.jpeg', N'~/Product_Img/lg-22lb470a-400x400-imaey6jkpyukdxvn.jpeg', N'~/Product_Img/lg-22lb470a-400x400-imaey6jkpyukdxvn.jpeg', N'~/Product_Img/lg-22lb470a-400x400-imaey6jkpyukdxvn.jpeg', N'Key Features of LG 22LB470A 55 cm (22) LED TV
LED Display
55 cm (22)
HD Ready, 1366 x 768
1 x HDMI, 1 x USB', 10, 5, 0, 0)
INSERT [dbo].[main_product] ([P_ID], [Product_name], [MRP], [Our_Prize], [Discount], [Brand], [Brand_image], [Type_of_product], [Imagepath1], [Imagepath2], [Imagepath3], [Imagepath4], [Detail], [stock], [new_arrival], [best_seller], [best_offer]) VALUES (44, N'LG 20LB452A 50 cm (20) LED TV', 10000, 9000, 10, N'LG', N'~/Product/lg-20lb452a-125x125-imadwkkvvsf7dafd.jpeg', N'Televisions', N'~/Product_Img/lg-20lb452a-400x400-imadwkkvvsf7dafd.jpeg', N'~/Product_Img/lg-20lb452a-400x400-imae6a6a34gnjne6.jpeg', N'~/Product_Img/lg-20lb452a-400x400-imadygfnxmuzybwb.jpeg', N'~/Product_Img/lg-20lb452a-400x400-imadygfmvr3kqczb.jpeg', N'Key Features of LG 20LB452A 50 cm (20) LED TV
LED Display
50 cm (20)
HD Ready, 1366 x 768
1 x HDMI, 1 x USB', 10, 1, 1, 5)
SET IDENTITY_INSERT [dbo].[main_product] OFF
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
