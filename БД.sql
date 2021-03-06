USE [master]
GO
/****** Object:  Database [Учёт расходов]    Script Date: 10.06.2020 22:08:51 ******/
CREATE DATABASE [Учёт расходов]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Учёт расходов', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Учёт расходов.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Учёт расходов_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Учёт расходов_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Учёт расходов] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Учёт расходов].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Учёт расходов] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Учёт расходов] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Учёт расходов] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Учёт расходов] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Учёт расходов] SET ARITHABORT OFF 
GO
ALTER DATABASE [Учёт расходов] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Учёт расходов] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Учёт расходов] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Учёт расходов] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Учёт расходов] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Учёт расходов] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Учёт расходов] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Учёт расходов] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Учёт расходов] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Учёт расходов] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Учёт расходов] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Учёт расходов] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Учёт расходов] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Учёт расходов] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Учёт расходов] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Учёт расходов] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Учёт расходов] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Учёт расходов] SET RECOVERY FULL 
GO
ALTER DATABASE [Учёт расходов] SET  MULTI_USER 
GO
ALTER DATABASE [Учёт расходов] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Учёт расходов] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Учёт расходов] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Учёт расходов] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Учёт расходов] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Учёт расходов', N'ON'
GO
ALTER DATABASE [Учёт расходов] SET QUERY_STORE = OFF
GO
USE [Учёт расходов]
GO
/****** Object:  Table [dbo].[Зарплата]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зарплата](
	[id_выплаты] [int] NOT NULL,
	[ФИО] [varchar](70) NOT NULL,
	[Оклад] [real] NOT NULL,
	[Номер_банк_Карты] [varchar](20) NULL,
	[ДатаЗП] [date] NOT NULL,
 CONSTRAINT [PK_Зарплата] PRIMARY KEY CLUSTERED 
(
	[id_выплаты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[СводкаЗарп]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[СводкаЗарп]
AS
SELECT        id_выплаты, ФИО, Оклад, Номер_банк_Карты, ДатаЗП
FROM            dbo.Зарплата
GO
/****** Object:  Table [dbo].[Комплектующие]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Комплектующие](
	[id_Комплект] [int] NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Дата_закупки] [date] NOT NULL,
	[Количество] [int] NOT NULL,
	[Стоимость_за_Шт] [real] NOT NULL,
 CONSTRAINT [PK_Комплектующие] PRIMARY KEY CLUSTERED 
(
	[id_Комплект] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[СводкаКом]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[СводкаКом]
AS
SELECT        dbo.Комплектующие.*
FROM            dbo.Комплектующие
GO
/****** Object:  Table [dbo].[Налоги]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Налоги](
	[id_записиН] [int] NOT NULL,
	[НДС] [money] NOT NULL,
	[НДФЛ] [money] NOT NULL,
	[ПФР] [money] NOT NULL,
	[ФМС] [money] NOT NULL,
	[ФСС] [money] NOT NULL,
	[Дата] [date] NOT NULL,
 CONSTRAINT [PK_Налоги] PRIMARY KEY CLUSTERED 
(
	[id_записиН] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[СводкаНал]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[СводкаНал]
AS
SELECT        dbo.Налоги.*
FROM            dbo.Налоги
GO
/****** Object:  Table [dbo].[Электроэнергия]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Электроэнергия](
	[id_счётаЭ] [int] NOT NULL,
	[Количество_КВ] [real] NOT NULL,
	[Сумма_Э] [real] NOT NULL,
	[ДатаЭ] [date] NOT NULL,
 CONSTRAINT [PK_Электроэнергия] PRIMARY KEY CLUSTERED 
(
	[id_счётаЭ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Вода]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вода](
	[id_счётаВ] [int] NOT NULL,
	[Вода_кол_м3] [real] NOT NULL,
	[Сумма_В] [real] NOT NULL,
	[ДатаВ] [date] NOT NULL,
 CONSTRAINT [PK_Вода] PRIMARY KEY CLUSTERED 
(
	[id_счётаВ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Газ]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Газ](
	[id_счётаГ] [int] NOT NULL,
	[Газ_кол_м3] [real] NOT NULL,
	[Сумма_Г] [real] NOT NULL,
	[Дата] [date] NOT NULL,
 CONSTRAINT [PK_Газ] PRIMARY KEY CLUSTERED 
(
	[id_счётаГ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Комуналка]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Комуналка]
AS
SELECT        dbo.Вода.Вода_кол_м3, dbo.Газ.Газ_кол_м3, dbo.Электроэнергия.Количество_КВ, dbo.Вода.Сумма_В, dbo.Газ.Сумма_Г, dbo.Электроэнергия.Сумма_Э, dbo.Газ.Дата
FROM            dbo.Вода INNER JOIN
                         dbo.Газ ON dbo.Вода.ДатаВ = dbo.Газ.Дата INNER JOIN
                         dbo.Электроэнергия ON dbo.Газ.Дата = dbo.Электроэнергия.ДатаЭ
GO
/****** Object:  Table [dbo].[Pincode]    Script Date: 10.06.2020 22:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pincode](
	[ID] [int] NOT NULL,
	[Pin] [varchar](4) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Pincode] ([ID], [Pin]) VALUES (1, N'2222')
GO
INSERT [dbo].[Вода] ([id_счётаВ], [Вода_кол_м3], [Сумма_В], [ДатаВ]) VALUES (1, 21, 882, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Вода] ([id_счётаВ], [Вода_кол_м3], [Сумма_В], [ДатаВ]) VALUES (2, 24, 1008, CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Вода] ([id_счётаВ], [Вода_кол_м3], [Сумма_В], [ДатаВ]) VALUES (3, 19, 798, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[Вода] ([id_счётаВ], [Вода_кол_м3], [Сумма_В], [ДатаВ]) VALUES (4, 20, 840, CAST(N'2020-04-29' AS Date))
GO
INSERT [dbo].[Газ] ([id_счётаГ], [Газ_кол_м3], [Сумма_Г], [Дата]) VALUES (1, 10, 73, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Газ] ([id_счётаГ], [Газ_кол_м3], [Сумма_Г], [Дата]) VALUES (2, 9, 65.7, CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Газ] ([id_счётаГ], [Газ_кол_м3], [Сумма_Г], [Дата]) VALUES (3, 11, 80.3, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[Газ] ([id_счётаГ], [Газ_кол_м3], [Сумма_Г], [Дата]) VALUES (4, 9, 65.7, CAST(N'2020-04-29' AS Date))
GO
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (1, N'Сидоров Евгений ', 45000, N'1425 5256 3555 7887', CAST(N'2020-01-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (2, N'Петров Владимир', 48000, N'7894 5961 2536 1728', CAST(N'2020-01-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (3, N'Новиков Богдан', 44000, N'1422 8947 5234 8562', CAST(N'2020-01-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (4, N'Сидоров Евгений', 45000, N'1425 5256 3555 7887', CAST(N'2020-02-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (5, N'Петров Владимир', 43000, N'7894 5961 2536 1728', CAST(N'2020-02-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (6, N'Новиков Богдан', 42000, N'1422 8947 5234 8562', CAST(N'2020-02-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (7, N'Сидоров Евгений', 46000, N'1425 5256 3555 7887', CAST(N'2020-03-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (8, N'Петров Владимир', 47000, N'7894 5961 2536 1728', CAST(N'2020-03-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (9, N'Новиков Богдан', 43000, N'1422 8947 5234 8562', CAST(N'2020-03-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (10, N'Сидоров Евгений ', 49000, N'1425 5256 3555 7887', CAST(N'2020-04-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (11, N'Петров Владимир', 51000, N'7894 5961 2536 1728', CAST(N'2020-04-24' AS Date))
INSERT [dbo].[Зарплата] ([id_выплаты], [ФИО], [Оклад], [Номер_банк_Карты], [ДатаЗП]) VALUES (12, N'Новиков Богдан', 52000, N'1422 8947 5234 8562', CAST(N'2020-04-24' AS Date))
GO
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (1, N'Видеокарты', CAST(N'2020-01-12' AS Date), 3, 10000)
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (2, N'Блок питания', CAST(N'2020-01-28' AS Date), 5, 3000)
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (3, N'Материнские платы', CAST(N'2020-02-20' AS Date), 2, 7000)
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (4, N'Жёсткие диски', CAST(N'2020-03-07' AS Date), 4, 3500)
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (5, N'Паяльники', CAST(N'2020-03-25' AS Date), 2, 1500)
INSERT [dbo].[Комплектующие] ([id_Комплект], [Наименование], [Дата_закупки], [Количество], [Стоимость_за_Шт]) VALUES (6, N'Мультитул', CAST(N'2020-04-15' AS Date), 3, 1200)
GO
INSERT [dbo].[Налоги] ([id_записиН], [НДС], [НДФЛ], [ПФР], [ФМС], [ФСС], [Дата]) VALUES (1, 20000.0000, 10000.0000, 30000.0000, 15000.0000, 32000.0000, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Налоги] ([id_записиН], [НДС], [НДФЛ], [ПФР], [ФМС], [ФСС], [Дата]) VALUES (2, 21000.0000, 9000.0000, 27000.0000, 14000.0000, 30000.0000, CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Налоги] ([id_записиН], [НДС], [НДФЛ], [ПФР], [ФМС], [ФСС], [Дата]) VALUES (3, 19000.0000, 7900.0000, 25000.0000, 13000.0000, 28000.0000, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[Налоги] ([id_записиН], [НДС], [НДФЛ], [ПФР], [ФМС], [ФСС], [Дата]) VALUES (4, 20500.0000, 8400.0000, 29000.0000, 13700.0000, 26000.0000, CAST(N'2020-04-29' AS Date))
GO
INSERT [dbo].[Электроэнергия] ([id_счётаЭ], [Количество_КВ], [Сумма_Э], [ДатаЭ]) VALUES (1, 750, 3075, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Электроэнергия] ([id_счётаЭ], [Количество_КВ], [Сумма_Э], [ДатаЭ]) VALUES (2, 810, 3321, CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Электроэнергия] ([id_счётаЭ], [Количество_КВ], [Сумма_Э], [ДатаЭ]) VALUES (3, 805, 3300.5, CAST(N'2020-03-30' AS Date))
INSERT [dbo].[Электроэнергия] ([id_счётаЭ], [Количество_КВ], [Сумма_Э], [ДатаЭ]) VALUES (4, 790, 3239, CAST(N'2020-04-29' AS Date))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Вода"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Газ"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Электроэнергия"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Комуналка'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Комуналка'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Зарплата"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаЗарп'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаЗарп'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Комплектующие"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаКом'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаКом'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Налоги"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаНал'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'СводкаНал'
GO
USE [master]
GO
ALTER DATABASE [Учёт расходов] SET  READ_WRITE 
GO
