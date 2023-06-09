USE [master]
GO
/****** Object:  Database [DW_STAGING]    Script Date: 6/7/2023 11:05:44 PM ******/
CREATE DATABASE [DW_STAGING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_STAGING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LEKIET\MSSQL\DATA\DW_STAGING.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DW_STAGING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LEKIET\MSSQL\DATA\DW_STAGING_log.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DW_STAGING] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_STAGING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_STAGING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_STAGING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_STAGING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_STAGING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_STAGING] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_STAGING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_STAGING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_STAGING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_STAGING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_STAGING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_STAGING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_STAGING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_STAGING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_STAGING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_STAGING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_STAGING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_STAGING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_STAGING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_STAGING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_STAGING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_STAGING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_STAGING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_STAGING] SET RECOVERY FULL 
GO
ALTER DATABASE [DW_STAGING] SET  MULTI_USER 
GO
ALTER DATABASE [DW_STAGING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_STAGING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_STAGING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_STAGING] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DW_STAGING] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DW_STAGING] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DW_STAGING', N'ON'
GO
ALTER DATABASE [DW_STAGING] SET QUERY_STORE = OFF
GO
USE [DW_STAGING]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [nvarchar](8) NOT NULL,
	[MonthKey] [nvarchar](6) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Month]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Month](
	[MonthKey] [nvarchar](6) NOT NULL,
	[YearKey] [nvarchar](4) NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Month] PRIMARY KEY CLUSTERED 
(
	[MonthKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Weight] [decimal](8, 2) NULL,
	[ProductSubcategoryId] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_ProductCategory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ProductCategory](
	[ProductCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_ProductSubCategory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ProductSubCategory](
	[ProductSubcategoryId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_SalesPerson]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_SalesPerson](
	[SalesPersonId] [int] NOT NULL,
	[FullName] [nvarchar](500) NOT NULL,
	[NationalIdNumber] [nvarchar](15) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[MartialStatus] [nchar](1) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Territory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Territory](
	[TerritoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryRegionCode] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Dim_Territory] PRIMARY KEY CLUSTERED 
(
	[TerritoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Year]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Year](
	[YearKey] [nvarchar](4) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Year] PRIMARY KEY CLUSTERED 
(
	[YearKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_OrderSales]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_OrderSales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[TerritoryKey] [int] NOT NULL,
	[SalesPersonKey] [int] NOT NULL,
	[Revenue] [money] NOT NULL,
	[NumberOrder] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Fact_OrderSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Product]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[TerritoryKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Date]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Date](
	[OrderDate] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Dim_Date]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Dim_Date](
	[OrderDate] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Day] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Dim_SalesOrderHeader]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Dim_SalesOrderHeader](
	[OrderDate] [datetime] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[SalesOrderID] [int] NULL,
	[TotalDue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Dim_SalesPerson]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Dim_SalesPerson](
	[SalesPersonID] [int] NULL,
	[FullName] [nvarchar](308) NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Dim_Territory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Dim_Territory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Employee]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Employee](
	[BusinessEntityID] [int] NOT NULL,
	[Gender] [nvarchar](1) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[HireDate] [date] NULL,
	[NationalIDNumber] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Person]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Person](
	[BusinessEntityID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PersonType] [nchar](2) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Product]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_ProductCategory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_ProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_ProductSubcategory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_ProductSubcategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_SalesOrderDetail]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_SalesOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_SalesOrderHeader]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_SalesOrderHeader](
	[SalesOrderID] [int] NULL,
	[DueDate] [datetime] NULL,
	[OrderDate] [datetime] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[TotalDue] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stag_Territory]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stag_Territory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TmpDate]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpDate](
	[DateKey] [nvarchar](8) NULL,
	[MonthKey] [nvarchar](6) NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TmpSalesOrder]    Script Date: 6/7/2023 11:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpSalesOrder](
	[SalesPersonId] [int] NULL,
	[TerritoryID] [int] NULL,
	[OrderDate] [date] NULL,
	[TotalDue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Date]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Date_Month] FOREIGN KEY([MonthKey])
REFERENCES [dbo].[Dim_Month] ([MonthKey])
GO
ALTER TABLE [dbo].[Dim_Date] CHECK CONSTRAINT [FK_Dim_Date_Month]
GO
ALTER TABLE [dbo].[Dim_Month]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Month_Year] FOREIGN KEY([YearKey])
REFERENCES [dbo].[Dim_Year] ([YearKey])
GO
ALTER TABLE [dbo].[Dim_Month] CHECK CONSTRAINT [FK_Dim_Month_Year]
GO
ALTER TABLE [dbo].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_ProductSubCategory] FOREIGN KEY([ProductSubcategoryId])
REFERENCES [dbo].[Dim_ProductSubCategory] ([ProductSubcategoryId])
GO
ALTER TABLE [dbo].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_ProductSubCategory]
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_Dim_ProductSubCategory_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[Dim_ProductCategory] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory] CHECK CONSTRAINT [FK_Dim_ProductSubCategory_ProductCategory]
GO
ALTER TABLE [dbo].[Fact_OrderSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOrderSales_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_OrderSales] CHECK CONSTRAINT [FK_FactOrderSales_Date]
GO
ALTER TABLE [dbo].[Fact_OrderSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOrderSales_SalesPerson] FOREIGN KEY([SalesPersonKey])
REFERENCES [dbo].[Dim_SalesPerson] ([SalesPersonId])
GO
ALTER TABLE [dbo].[Fact_OrderSales] CHECK CONSTRAINT [FK_FactOrderSales_SalesPerson]
GO
ALTER TABLE [dbo].[Fact_OrderSales]  WITH CHECK ADD  CONSTRAINT [FK_FactOrderSales_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [dbo].[Dim_Territory] ([TerritoryId])
GO
ALTER TABLE [dbo].[Fact_OrderSales] CHECK CONSTRAINT [FK_FactOrderSales_Territory]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_FactProduct_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_FactProduct_Date]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_FactProduct_DimProduct] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Dim_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_FactProduct_DimProduct]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_FactProduct_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [dbo].[Dim_Territory] ([TerritoryId])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_FactProduct_Territory]
GO
USE [master]
GO
ALTER DATABASE [DW_STAGING] SET  READ_WRITE 
GO
