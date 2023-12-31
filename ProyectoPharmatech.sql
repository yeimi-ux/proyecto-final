/****** Nombre. Yeimi Castillo   Matricula. 22-MIIT-1-016     Seccion. 0541 ******/

/****** Object:  Database [Pharmatech]    Script Date: 12/17/2023 3:53:38 PM ******/
CREATE DATABASE [Pharmatech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pharmatech', FILENAME = N'C:\Users\pc\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\Pharmatech.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pharmatech_log', FILENAME = N'C:\Users\pc\Desktop\MSSQL16.SQLEXPRESS\MSSQL\DATA\Pharmatech_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Pharmatech] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pharmatech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pharmatech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pharmatech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pharmatech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pharmatech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pharmatech] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pharmatech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pharmatech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pharmatech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pharmatech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pharmatech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pharmatech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pharmatech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pharmatech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pharmatech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pharmatech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pharmatech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pharmatech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pharmatech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pharmatech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pharmatech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pharmatech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pharmatech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pharmatech] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pharmatech] SET  MULTI_USER 
GO
ALTER DATABASE [Pharmatech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pharmatech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pharmatech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pharmatech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pharmatech] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pharmatech] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pharmatech] SET QUERY_STORE = ON
GO
ALTER DATABASE [Pharmatech] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Pharmatech]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Clienteid] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[CorreoElectronico] [varchar](100) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[Compraid] [int] NOT NULL,
	[Proveedorid] [int] NULL,
	[FechaCompra] [smalldatetime] NULL,
	[TotalCompra] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[Compraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles de Compra]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles de Compra](
	[DetalleCompraid] [int] NOT NULL,
	[Compraid] [int] NULL,
	[Productoid] [int] NULL,
	[CantidadComprada] [int] NULL,
	[PrecioUnitario] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Detalles de Compra] PRIMARY KEY CLUSTERED 
(
	[DetalleCompraid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles de Venta]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles de Venta](
	[Detalleint] [int] NOT NULL,
	[Ventaid] [int] NULL,
	[Productoid] [int] NULL,
	[CantidadVendida] [int] NULL,
 CONSTRAINT [PK_Detalles de Venta] PRIMARY KEY CLUSTERED 
(
	[Detalleint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Productoid] [int] NOT NULL,
	[NombreProducto] [varchar](50) NULL,
	[Descripcion] [text] NULL,
	[Precio] [decimal](18, 0) NULL,
	[FechaCaducidad] [smalldatetime] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Productoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Proveedorid] [int] NULL,
	[NombreProveedor] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[CorreoElectronico] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 12/17/2023 3:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Ventaid] [int] NOT NULL,
	[Clienteid] [int] NULL,
	[FechaVenta] [smalldatetime] NULL,
	[TotalVenta] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Ventaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (1, N'Felipe', N'Castro', N'8099322385', N'Roca Mar, 3ra 4', N'felipecastro@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (2, N'Arturo', N'Perez', N'8099037743', N'Calle Antonio Guzman', N'arturoperez@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (3, N'Armando', N'Diaz', N'82097221921', N'Calle Proyecto, 5', N'armandodiaz@hotmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (4, N'Jorge', N'Encarnacion', N'8295688499', N'Calle el conde', N'Jorgeenc@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (5, N'Ismael', N'Pujols', N'8099842324', N'Villa Mella', N'ismaelpujols@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (6, N'Manuela', N'Soto', N'8098765670', N'Av. independencia, miramar, 5', N'manuelasoto@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (7, N'Juan Carlos', N'Castillo', N'8298142356', N'Los Guaricanos, Villa Mella', N'juancarlos castillo@hotmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (8, N'Pedro', N'Tejeda', N'8498906710', N'Herrera, 56', N'pedrotejeda@gmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (9, N'Luisa', N'Tejeda', N'8298906710', N'Roca Mar, 1ra, 3', N'luisatejeda@hotmail.com')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Telefono], [Direccion], [CorreoElectronico]) VALUES (10, N'Maria', N'Mejia', N'8099142134', N'Cayetano Germosen', N'mariamejia@gmail.com')
GO
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (1, 1, CAST(N'2022-12-12T00:00:00' AS SmallDateTime), CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (2, 2, CAST(N'2023-12-23T00:00:00' AS SmallDateTime), CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (3, 3, CAST(N'2023-09-15T00:00:00' AS SmallDateTime), CAST(150 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (4, 4, CAST(N'2023-09-15T00:00:00' AS SmallDateTime), CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (5, 5, CAST(N'2023-08-28T00:00:00' AS SmallDateTime), CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (6, 6, CAST(N'2023-02-01T00:00:00' AS SmallDateTime), CAST(350 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (7, 7, CAST(N'2022-02-14T00:00:00' AS SmallDateTime), CAST(350 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (8, 8, CAST(N'2022-03-12T00:00:00' AS SmallDateTime), CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (9, 9, CAST(N'2023-05-23T00:00:00' AS SmallDateTime), CAST(250 AS Decimal(18, 0)))
INSERT [dbo].[Compras] ([Compraid], [Proveedorid], [FechaCompra], [TotalCompra]) VALUES (10, 10, CAST(N'2022-05-05T00:00:00' AS SmallDateTime), CAST(250 AS Decimal(18, 0)))
GO
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (1, 1, 1, 400, CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (2, 2, 2, 100, CAST(9 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (3, 3, 3, 50, CAST(29 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (4, 4, 4, 450, CAST(23 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (5, 5, 5, 800, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (6, 6, 6, 250, CAST(17 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (7, 7, 7, 250, CAST(45 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (8, 8, 8, 300, CAST(27 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (9, 9, 9, 150, CAST(9 AS Decimal(18, 0)))
INSERT [dbo].[Detalles de Compra] ([DetalleCompraid], [Compraid], [Productoid], [CantidadComprada], [PrecioUnitario]) VALUES (10, 10, 10, 350, NULL)
GO
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (1, 1, 1, 600)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (2, 2, 2, 250)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (3, 3, 3, 120)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (4, 4, 4, 200)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (5, 5, 5, 150)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (6, 6, 6, 350)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (7, 7, 7, 400)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (8, 8, 8, 600)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (9, 9, 9, 200)
INSERT [dbo].[Detalles de Venta] ([Detalleint], [Ventaid], [Productoid], [CantidadVendida]) VALUES (10, 10, 10, 50)
GO
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (1, N'Ibuprofeno 400mg', N'Alivia el dolor y reduce la inflamacion', CAST(6 AS Decimal(18, 0)), CAST(N'2024-01-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (2, N'Amoxicilina 500 mg', N'Trata infecciones bacterianas', CAST(12 AS Decimal(18, 0)), CAST(N'2025-01-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (3, N'Omeprazol 20 mg', N'Controla la acidez estomacal y ulcras', CAST(9 AS Decimal(18, 0)), CAST(N'2024-09-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (4, N'Paracetamo 500 mg', N'Alivia el dolor y reduce la fiebre', CAST(6 AS Decimal(18, 0)), CAST(N'2024-12-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (5, N'Loratadina 10 mg', N'Trata alergias y sintomas de picazon y estornudos', CAST(16 AS Decimal(18, 0)), CAST(N'2025-09-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (6, N'Salbutamol', N'Alivia la dificultad respiratoria en enfermedades pulmonares', CAST(24 AS Decimal(18, 0)), CAST(N'2025-11-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (7, N'Aspirina 81 mg', N'Ayuda a prevenir problemas cardiovasculares', CAST(45 AS Decimal(18, 0)), CAST(N'2023-03-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (8, N'Metformina 500 mg', N'Controla el nivel de azuczr en la sangre en la diabetes tipo 2', CAST(9 AS Decimal(18, 0)), CAST(N'2023-06-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (9, N'Simvastatina 20 mg', N'Reduce los niveles de colesterol', CAST(7 AS Decimal(18, 0)), CAST(N'2024-09-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[Productos] ([Productoid], [NombreProducto], [Descripcion], [Precio], [FechaCaducidad]) VALUES (10, N'Hidroclorotiazida 25 mg', N'Ayuda a eliminar los excsos de agua y sal del cuerpo', CAST(10 AS Decimal(18, 0)), CAST(N'2024-09-30T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1, N'Acromax Domicana', N'C. Olmo, Los Prados', N'8099321523', N'acromaxdominicana@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (2, N'Laboratorios Feltrex, S.A', N'Av. john F. Kennedy, no. 12', N'8097213345', N'laboratoriosfeltrex@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (3, N'Laboratorios Alfa', N'Calle Respaldo Proyrcto, 5', N'8496702147', N'laboratoriaalfa@mail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (4, N'Ethical', N'Av. Gustavo Mejia Ricart, no. 54', N'8499007654', N'ethical@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (5, N'Ibero Farmacos, SRL', N'Av. independencia, c. San Juan', N'8097654543', N'iberofarmacos@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (6, N'Laboratorios Sued', N'Cayetano Germosen, no.246', N'8098907654', N'laboratoriossued@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (7, N'Laboratorios Rowe', N'Av. Lope de Vega no. 33', N'8293451524', N'laboratoriosrowe@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (8, N'Laboratorios Orbis', N'Calle las Trinitarias', N'8298906710', N'laboratoiosorbis@hotmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (9, N'Laboratorios Roldan CxA', N'Calle Primera no. 5', N'849765433', N'laboratoriosroldan@gmail.com')
INSERT [dbo].[Proveedores] ([Proveedorid], [NombreProveedor], [Direccion], [Telefono], [CorreoElectronico]) VALUES (10, N'Laboratorios Lam', N'Av. 27 de Febrero, Res.  Doña Elsa', N'8092345123', N'lamlaboratorios@gmail.com')
GO
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (1, 1, CAST(N'2023-12-18T00:00:00' AS SmallDateTime), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (2, 2, CAST(N'2023-12-18T00:00:00' AS SmallDateTime), CAST(825 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (3, 3, CAST(N'2023-12-18T00:00:00' AS SmallDateTime), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (4, 4, CAST(N'2024-09-15T00:00:00' AS SmallDateTime), CAST(56 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (5, 5, CAST(N'2023-08-23T00:00:00' AS SmallDateTime), CAST(48 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (6, 6, CAST(N'2023-02-07T00:00:00' AS SmallDateTime), CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (7, 7, CAST(N'2023-02-27T00:00:00' AS SmallDateTime), CAST(525 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (8, 8, CAST(N'2022-06-16T00:00:00' AS SmallDateTime), CAST(150 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (9, 9, CAST(N'2022-04-18T00:00:00' AS SmallDateTime), CAST(151 AS Decimal(18, 0)))
INSERT [dbo].[Ventas] ([Ventaid], [Clienteid], [FechaVenta], [TotalVenta]) VALUES (10, 10, CAST(N'2022-04-18T00:00:00' AS SmallDateTime), CAST(100 AS Decimal(18, 0)))
GO
USE [master]
GO
ALTER DATABASE [Pharmatech] SET  READ_WRITE 
GO
