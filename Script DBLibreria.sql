USE [master]
GO
/****** Object:  Database [DBLibreria]    Script Date: 5/25/2018 9:05:36 PM ******/
CREATE DATABASE [DBLibreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBLibreria', FILENAME = N'/var/opt/mssql/data/DBLibreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBLibreria_log', FILENAME = N'/var/opt/mssql/data/DBLibreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBLibreria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBLibreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBLibreria] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [DBLibreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBLibreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBLibreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBLibreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBLibreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBLibreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBLibreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBLibreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBLibreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBLibreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBLibreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBLibreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBLibreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBLibreria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBLibreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBLibreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBLibreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBLibreria] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [DBLibreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBLibreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBLibreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBLibreria] SET RECOVERY FULL 
GO
ALTER DATABASE [DBLibreria] SET  MULTI_USER 
GO
ALTER DATABASE [DBLibreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBLibreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBLibreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBLibreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBLibreria] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBLibreria', N'ON'
GO
ALTER DATABASE [DBLibreria] SET QUERY_STORE = OFF
GO
USE [DBLibreria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBLibreria]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 5/25/2018 9:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] NOT NULL,
	[NombreCompleto] [varchar](200) NULL,
	[Nacionalidad] [varchar](50) NULL,
	[Sexo] [char](1) NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutorEditorial]    Script Date: 5/25/2018 9:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorEditorial](
	[IdAutor] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
 CONSTRAINT [PK_AutorEditorial] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC,
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 5/25/2018 9:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Direccion] [varchar](200) NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 5/25/2018 9:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[Titulo] [varchar](200) NOT NULL,
	[ISBN] [varchar](50) NOT NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibroAutor]    Script Date: 5/25/2018 9:05:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibroAutor](
	[IdAutor] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
 CONSTRAINT [PK_LibroAutor] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC,
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (1, N'Miguel de Cervantes', N'Español', N'M')
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (2, N'Homero', N'Peruano', N'M')
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (3, N'William Shakespeare', N'Britanico', N'M')
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (4, N'Emily Dickinson', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (5, N'Gabriel García Márquez', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (6, N'Pablo Neruda', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (7, N'Mario Vargas Llosa', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (8, N'Pío Baroja', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (9, N'Karl Marx', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (10, N'Herman Hesse', NULL, NULL)
INSERT [dbo].[Autor] ([IdAutor], [NombreCompleto], [Nacionalidad], [Sexo]) VALUES (11, N'Patricia Espinal', NULL, N'F')
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (1, 1)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (1, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (2, 1)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (2, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (3, 1)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (3, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (4, 1)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (4, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (5, 1)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (6, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (7, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (8, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (9, 2)
INSERT [dbo].[AutorEditorial] ([IdAutor], [IdEditorial]) VALUES (10, 2)
INSERT [dbo].[Editorial] ([IdEditorial], [Descripcion], [Direccion]) VALUES (1, N'Ediciones Zorrilla, SRL', NULL)
INSERT [dbo].[Editorial] ([IdEditorial], [Descripcion], [Direccion]) VALUES (2, N'Susaeta Ediciones Dominicanas, C por A', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (1, 1, N' DON QUIJOTE DE LA MANCHA', N'ABC', 100)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (2, 1, N'ODISEA', N'A', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (3, 2, N'CUENTOS', N'D', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (4, 2, N'POETA EN NUEVA YORK', N'B', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (5, 2, N'EL RUIDO Y LA FURIA', N'V', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (6, 2, N'RIMAS Y LEYENDAS', N'V', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (7, 1, N'LA CIUDAD Y LOS PERROS', N'H', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (8, 1, N'HAMLET', N'S', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (9, 1, N'MIENTRAS AGONIZO', N'B', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (10, 2, N'CONVERSACIÓN EN LA CATEDRAL,', N'V', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (11, 1, N'OBRAS COMPLETAS', N'F', NULL)
INSERT [dbo].[Libro] ([IdLibro], [IdEditorial], [Titulo], [ISBN], [Precio]) VALUES (12, 1, N'LOS INCONSOLABLES', N'l', NULL)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (1, 1)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (2, 1)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (2, 2)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (3, 3)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (4, 3)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (5, 2)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (6, 6)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (7, 5)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (8, 8)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (9, 9)
INSERT [dbo].[LibroAutor] ([IdAutor], [IdLibro]) VALUES (10, 10)
ALTER TABLE [dbo].[AutorEditorial]  WITH CHECK ADD  CONSTRAINT [FK_AutorEditorial_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[AutorEditorial] CHECK CONSTRAINT [FK_AutorEditorial_Autor]
GO
ALTER TABLE [dbo].[AutorEditorial]  WITH CHECK ADD  CONSTRAINT [FK_AutorEditorial_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[AutorEditorial] CHECK CONSTRAINT [FK_AutorEditorial_Editorial]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
ALTER TABLE [dbo].[LibroAutor]  WITH CHECK ADD  CONSTRAINT [FK_LibroAutor_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[LibroAutor] CHECK CONSTRAINT [FK_LibroAutor_Autor]
GO
ALTER TABLE [dbo].[LibroAutor]  WITH CHECK ADD  CONSTRAINT [FK_LibroAutor_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[LibroAutor] CHECK CONSTRAINT [FK_LibroAutor_Libro]
GO
USE [master]
GO
ALTER DATABASE [DBLibreria] SET  READ_WRITE 
GO
