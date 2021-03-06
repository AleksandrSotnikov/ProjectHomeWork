USE [master]
GO
/****** Object:  Database [DbHomeWork]    Script Date: 24.04.2021 18:41:47 ******/
CREATE DATABASE [DbHomeWork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbHomeWork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbHomeWork.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbHomeWork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbHomeWork_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbHomeWork] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbHomeWork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbHomeWork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbHomeWork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbHomeWork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbHomeWork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbHomeWork] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbHomeWork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbHomeWork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbHomeWork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbHomeWork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbHomeWork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbHomeWork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbHomeWork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbHomeWork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbHomeWork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbHomeWork] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbHomeWork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbHomeWork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbHomeWork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbHomeWork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbHomeWork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbHomeWork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbHomeWork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbHomeWork] SET RECOVERY FULL 
GO
ALTER DATABASE [DbHomeWork] SET  MULTI_USER 
GO
ALTER DATABASE [DbHomeWork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbHomeWork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbHomeWork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbHomeWork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbHomeWork] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbHomeWork] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbHomeWork', N'ON'
GO
ALTER DATABASE [DbHomeWork] SET QUERY_STORE = OFF
GO
USE [DbHomeWork]
GO
/****** Object:  Table [dbo].[DealSet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Demand_Id] [int] NOT NULL,
	[Supply_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DemandSet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DemandSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address_City] [nvarchar](max) NULL,
	[Address_Street] [nvarchar](max) NULL,
	[Address_House] [nvarchar](max) NULL,
	[Address_Number] [nvarchar](max) NULL,
	[MinPrice] [bigint] NULL,
	[MaxPrice] [bigint] NULL,
	[AgentId] [int] NULL,
	[ClientId] [int] NOT NULL,
	[RealEstateFilter_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonSet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonSet](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[DealShare] [int] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateFilterSet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateFilterSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateFilterSet_ApartmentFilter]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateFilterSet_ApartmentFilter](
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[MinRooms] [int] NULL,
	[MaxRooms] [int] NULL,
	[MinFloor] [int] NULL,
	[MaxFloor] [int] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateFilterSet_HouseFilter]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateFilterSet_HouseFilter](
	[MinFloors] [int] NULL,
	[MaxFloors] [int] NULL,
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[MinRooms] [int] NULL,
	[MaxRooms] [int] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateFilterSet_LandFilter]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateFilterSet_LandFilter](
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateSet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address_City] [nvarchar](max) NULL,
	[Address_Street] [nvarchar](max) NULL,
	[Address_House] [nvarchar](max) NULL,
	[Address_Number] [nvarchar](max) NULL,
	[Coordinate_latitude] [float] NULL,
	[Coordinate_longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateSet_Apartment]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateSet_Apartment](
	[TotalArea] [float] NULL,
	[Rooms] [int] NULL,
	[Floor] [int] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateSet_House]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateSet_House](
	[TotalFloors] [int] NULL,
	[TotalArea] [float] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealEstateSet_Land]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealEstateSet_Land](
	[TotalArea] [float] NULL,
	[Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplySet]    Script Date: 24.04.2021 18:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplySet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [bigint] NOT NULL,
	[AgentId] [int] NULL,
	[ClientId] [int] NOT NULL,
	[RealEstateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DemandSet] ON 

INSERT [dbo].[DemandSet] ([Id], [Address_City], [Address_Street], [Address_House], [Address_Number], [MinPrice], [MaxPrice], [AgentId], [ClientId], [RealEstateFilter_Id]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, 4, 23, 1)
INSERT [dbo].[DemandSet] ([Id], [Address_City], [Address_Street], [Address_House], [Address_Number], [MinPrice], [MaxPrice], [AgentId], [ClientId], [RealEstateFilter_Id]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 2)
INSERT [dbo].[DemandSet] ([Id], [Address_City], [Address_Street], [Address_House], [Address_Number], [MinPrice], [MaxPrice], [AgentId], [ClientId], [RealEstateFilter_Id]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, 19, 10, 3)
INSERT [dbo].[DemandSet] ([Id], [Address_City], [Address_Street], [Address_House], [Address_Number], [MinPrice], [MaxPrice], [AgentId], [ClientId], [RealEstateFilter_Id]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 4)
INSERT [dbo].[DemandSet] ([Id], [Address_City], [Address_Street], [Address_House], [Address_Number], [MinPrice], [MaxPrice], [AgentId], [ClientId], [RealEstateFilter_Id]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 5)
SET IDENTITY_INSERT [dbo].[DemandSet] OFF
GO
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (1, N'Фахрутдинов', N'Роман', N'Рубинович', N'Риэлтор', 20, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (2, N'Семенов', N'Евгений ', N'Николаевич', N'Клиент', 0, N'32-25-55', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (3, N'Денисова', N'Олеся', N'Леонидовна', N'Клиент', 0, NULL, N'dummy@email.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (4, N'Устинов', N'Максим', N'Алексеевич', N'Риэлтор', 40, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (5, N'Сафронов', N'Алексей', N'Вячеславович', N'Клиент', 0, NULL, N'client@esoft.tech')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (6, N'Кудряшов', N'Александр', N'Витальевич', N'Клиент', 0, N'551988', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (7, N'Сысоева', N'Людмила', N'Валентиновна', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (8, N'Фёдоров', N'Алексей', N'Николаевич', N'Клиент', 0, NULL, N'fedorov@mail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (9, N'Додонов', N'Илья', N'Геннадьевич', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (10, N'Пелымская', N'Светлана', N'Александровна', N'Клиент', 0, N'83452112233', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (11, N'Мухтаруллин', N'Руслан', N'Расыхович', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (12, N'Коновальчик', N'Татьяна', N'Геннадьевна', N'Клиент', 0, NULL, N'dummy@email.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (13, N'Мосеева', N'Любовь', N'Александровна', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (14, N'Молоковская', N'Светлана', N'Михайловна', N'Клиент', 0, N'898489848', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (15, N'Киселев', N'Алексей', N'Геннадьевич', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (16, N'Моторина', N'Анастасия', N'Сергеевна', N'Клиент', 0, N'895159848', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (17, N'Поспелова', N'Ольга', N'Александровна', N'Клиент', 0, NULL, N'angel@mail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (18, N'Жиляков', N'Владимир', N'Владимирович', N'Клиент', 0, N'445588', N'445588@email.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (19, N'Клюйков', N'Евгений', N'Николаевич', N'Риэлтор', 50, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (20, N'Ефремов', N'Владислав', N'Николаевич', N'Клиент', 0, NULL, N'parampampam@mail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (21, N'Баль', N'Валентина', N'Сергеевна', N'Клиент', 0, N'7998888444', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (22, N'Стрелков', N'Артем', N'Николаевич', N'Клиент', 0, NULL, N'test@test.test')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (23, N'Луканин', N'Павел', N'Валерьевич', N'Клиент', 0, NULL, N'foo@bar.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (24, N'Жданова', N'Галина', N'Николаевна', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (25, N'Шарипова', N'Эльвира', N'Закирчановна', N'Клиент', 0, N'12345678910', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (26, N'Фомина', N'Маргарита', N'Николаевна', N'Клиент', 0, NULL, N'fomina@email.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (27, N'Кремлев', N'Владислав', N'Юрьевич', N'Клиент', 0, N'777', N'kremlevvu@gmail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (28, N'Пономарева', N'Елена', N'Сергеевна', N'Клиент', 0, NULL, N'ponomareva@gmail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (29, N'Шелест', N'Тамара', N'Васильевна', N'Клиент', 0, N'112', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (30, N'Шарипов', N'Рустам', N'Владимирович', N'Клиент', 0, NULL, N'sharipov@yandex.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (31, N'Романов', N'Сергей', N'Федорович', N'Клиент', 0, N'2', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (32, N'Кручинин', N'Иван', N'Андреевич', N'Клиент', 0, NULL, N'kruch@list.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (33, N'Алферов', N'Алексей', N'Николаевич', N'Клиент', 0, N'688899444', NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (34, N'Басырова', N'Елена', N'Азатовна', N'Риэлтор', 45, NULL, NULL)
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (35, N'Попов ', N'Алексей', N'Николаевич', N'Клиент', 0, N'489848565', N'popovan@bik.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (36, N'Неезжала', N'Наталья', N'Леонидовна', N'Клиент', 0, NULL, N'neez@mail.ru')
INSERT [dbo].[PersonSet] ([Id], [FirstName], [MiddleName], [LastName], [Type], [DealShare], [Phone], [Email]) VALUES (37, N'Швецов', N'Виталий', N'Олегович', N'Риэлтор', 45, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SupplySet] ON 

INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (1, 2500000, 1, 2, 1)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (2, 5000000, 7, 8, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (3, 1300000, 11, 12, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (4, 5000000, 15, 16, 4)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (5, 4700000, 1, 3, 2)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (6, 3750000, 4, 5, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (7, 1900000, 4, 6, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (8, 4300000, 9, 10, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (9, 1750000, 13, 14, 3)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (10, 5850000, 15, 17, 5)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (11, 6800000, 15, 18, 6)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (12, 950000, 19, 20, 7)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (13, 700000, 19, 21, 8)
INSERT [dbo].[SupplySet] ([Id], [Price], [AgentId], [ClientId], [RealEstateId]) VALUES (14, 600000, 19, 22, 9)
SET IDENTITY_INSERT [dbo].[SupplySet] OFF
GO
ALTER TABLE [dbo].[DealSet]  WITH CHECK ADD  CONSTRAINT [DealDemand] FOREIGN KEY([Demand_Id])
REFERENCES [dbo].[DemandSet] ([Id])
GO
ALTER TABLE [dbo].[DealSet] CHECK CONSTRAINT [DealDemand]
GO
ALTER TABLE [dbo].[DealSet]  WITH CHECK ADD  CONSTRAINT [DealSupply] FOREIGN KEY([Supply_Id])
REFERENCES [dbo].[SupplySet] ([Id])
GO
ALTER TABLE [dbo].[DealSet] CHECK CONSTRAINT [DealSupply]
GO
ALTER TABLE [dbo].[DemandSet]  WITH NOCHECK ADD  CONSTRAINT [DemandAgent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[PersonSet] ([Id])
GO
ALTER TABLE [dbo].[DemandSet] CHECK CONSTRAINT [DemandAgent]
GO
ALTER TABLE [dbo].[DemandSet]  WITH NOCHECK ADD  CONSTRAINT [DemandClient] FOREIGN KEY([ClientId])
REFERENCES [dbo].[PersonSet] ([Id])
GO
ALTER TABLE [dbo].[DemandSet] CHECK CONSTRAINT [DemandClient]
GO
ALTER TABLE [dbo].[DemandSet]  WITH NOCHECK ADD  CONSTRAINT [DemandRealEstateFilter] FOREIGN KEY([RealEstateFilter_Id])
REFERENCES [dbo].[RealEstateFilterSet] ([Id])
GO
ALTER TABLE [dbo].[DemandSet] CHECK CONSTRAINT [DemandRealEstateFilter]
GO
ALTER TABLE [dbo].[RealEstateFilterSet_ApartmentFilter]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentFilter_inherits_RealEstateFilter] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateFilterSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateFilterSet_ApartmentFilter] CHECK CONSTRAINT [FK_ApartmentFilter_inherits_RealEstateFilter]
GO
ALTER TABLE [dbo].[RealEstateFilterSet_HouseFilter]  WITH CHECK ADD  CONSTRAINT [FK_HouseFilter_inherits_RealEstateFilter] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateFilterSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateFilterSet_HouseFilter] CHECK CONSTRAINT [FK_HouseFilter_inherits_RealEstateFilter]
GO
ALTER TABLE [dbo].[RealEstateFilterSet_LandFilter]  WITH CHECK ADD  CONSTRAINT [FK_LandFilter_inherits_RealEstateFilter] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateFilterSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateFilterSet_LandFilter] CHECK CONSTRAINT [FK_LandFilter_inherits_RealEstateFilter]
GO
ALTER TABLE [dbo].[RealEstateSet_Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_inherits_RealEstate] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateSet_Apartment] CHECK CONSTRAINT [FK_Apartment_inherits_RealEstate]
GO
ALTER TABLE [dbo].[RealEstateSet_House]  WITH CHECK ADD  CONSTRAINT [FK_House_inherits_RealEstate] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateSet_House] CHECK CONSTRAINT [FK_House_inherits_RealEstate]
GO
ALTER TABLE [dbo].[RealEstateSet_Land]  WITH CHECK ADD  CONSTRAINT [FK_Land_inherits_RealEstate] FOREIGN KEY([Id])
REFERENCES [dbo].[RealEstateSet] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RealEstateSet_Land] CHECK CONSTRAINT [FK_Land_inherits_RealEstate]
GO
ALTER TABLE [dbo].[SupplySet]  WITH NOCHECK ADD  CONSTRAINT [SupplyAgent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[PersonSet] ([Id])
GO
ALTER TABLE [dbo].[SupplySet] CHECK CONSTRAINT [SupplyAgent]
GO
ALTER TABLE [dbo].[SupplySet]  WITH NOCHECK ADD  CONSTRAINT [SupplyClient] FOREIGN KEY([ClientId])
REFERENCES [dbo].[PersonSet] ([Id])
GO
ALTER TABLE [dbo].[SupplySet] CHECK CONSTRAINT [SupplyClient]
GO
ALTER TABLE [dbo].[SupplySet]  WITH NOCHECK ADD  CONSTRAINT [SupplyRealEstate] FOREIGN KEY([RealEstateId])
REFERENCES [dbo].[RealEstateSet] ([Id])
GO
ALTER TABLE [dbo].[SupplySet] CHECK CONSTRAINT [SupplyRealEstate]
GO
USE [master]
GO
ALTER DATABASE [DbHomeWork] SET  READ_WRITE 
GO
