USE [master]
GO
/****** Object:  Database [dbInfoMusic]    Script Date: 19/02/2021 04:59:36 a. m. ******/
CREATE DATABASE [dbInfoMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbInfoMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbInfoMusic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbInfoMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbInfoMusic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbInfoMusic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbInfoMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbInfoMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbInfoMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbInfoMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbInfoMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbInfoMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbInfoMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbInfoMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbInfoMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbInfoMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbInfoMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbInfoMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbInfoMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbInfoMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbInfoMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbInfoMusic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbInfoMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbInfoMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbInfoMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbInfoMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbInfoMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbInfoMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbInfoMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbInfoMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [dbInfoMusic] SET  MULTI_USER 
GO
ALTER DATABASE [dbInfoMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbInfoMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbInfoMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbInfoMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbInfoMusic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbInfoMusic', N'ON'
GO
ALTER DATABASE [dbInfoMusic] SET QUERY_STORE = OFF
GO
USE [dbInfoMusic]
GO
/****** Object:  Table [dbo].[AlbumMusical]    Script Date: 19/02/2021 04:59:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumMusical](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[NombreAlbum] [varchar](150) NOT NULL,
	[NombreArtista] [varchar](150) NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_AlbumMusical] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 19/02/2021 04:59:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artista](
	[IdArtista] [int] IDENTITY(1,1) NOT NULL,
	[NombreArtista] [varchar](100) NOT NULL,
	[GeneroMusical] [varchar](100) NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_Artista] PRIMARY KEY CLUSTERED 
(
	[IdArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneroMusical]    Script Date: 19/02/2021 04:59:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneroMusical](
	[IdGeneroMusical] [int] IDENTITY(1,1) NOT NULL,
	[NombreGeneroMusical] [varchar](150) NOT NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_GeneroMusical] PRIMARY KEY CLUSTERED 
(
	[IdGeneroMusical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Songs]    Script Date: 19/02/2021 04:59:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[IdSong] [int] IDENTITY(1,1) NOT NULL,
	[NombreSong] [varchar](150) NOT NULL,
	[NombreAlbum] [varchar](150) NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[IdSong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoundtrackArtist]    Script Date: 19/02/2021 04:59:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoundtrackArtist](
	[IdSoundtrackArtist] [int] IDENTITY(1,1) NOT NULL,
	[NameArtist] [varchar](150) NULL,
	[Soundtrack] [varchar](150) NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_SoundtrackArtist] PRIMARY KEY CLUSTERED 
(
	[IdSoundtrackArtist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubGeneroMusical]    Script Date: 19/02/2021 04:59:37 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubGeneroMusical](
	[IdSubGeneroMusical] [int] IDENTITY(1,1) NOT NULL,
	[NombreSubGeneroMusical] [varchar](150) NOT NULL,
	[IdGeneroMusical] [int] NOT NULL,
	[FechaInsert] [date] NULL,
 CONSTRAINT [PK_SubGeneroMusical] PRIMARY KEY CLUSTERED 
(
	[IdSubGeneroMusical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlbumMusical] ON 

INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (1, N'  Madonna', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (2, N'  Like A Virgin', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (3, N'  True Blue', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (4, N'  Celebration (double disc version)', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (5, N'  Like A Prayer', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (6, N'  Something To Remember', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (7, N'  Celebration', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (8, N'  Blue Madonna', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (9, N'  Ray Of Light', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (10, N'  The Immaculate Collection', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (11, N'  Music', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (12, N'  Bedtime Stories', N'Madonna', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (13, N'  Metallica', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (14, N'  Ride The Lightning (Remastered)', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (15, N'  Garage Inc.', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (16, N'  Reload', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (17, N'  Load', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (18, N'  Master of Puppets (Remastered)', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (19, N'  S&amp;M', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (20, N'  S&amp;M2', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (21, N'  Metallica Through The Never (Music from the...', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (22, N'  Kill &#39;Em All (Remastered)', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (23, N'  Hardwired…To Self-Destruct', N'Metallica', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[AlbumMusical] ([IdAlbum], [NombreAlbum], [NombreArtista], [FechaInsert]) VALUES (24, N'  ...And Justice for All (Remastered Deluxe Box Set)', N'Metallica', CAST(N'2021-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[AlbumMusical] OFF
SET IDENTITY_INSERT [dbo].[Artista] ON 

INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (1, N'Popcaan', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (2, N'Pop Smoke', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (3, N'Pollie Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (4, N'Pop Evil', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (5, N'Ron Pope', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (6, N'Icona Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (7, N'Iggy Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (8, N'Popa Chubby', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (9, N'90s Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (10, N'Instrumental Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (11, N'Nacha Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (12, N'POP ETC', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (13, N'Michael Henderson (Pop)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (14, N'Instrumental Pop Players', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (15, N'80s Pop Stars', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (16, N'Cinematic Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (17, N'Chateau Pop', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (18, N'Polaris (pop)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (19, N'Pop Feast', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (20, N'Rupert Pope', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (21, N'JONES (POP)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (22, N'Pop 40 Charts', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (23, N'Kids Pop Hitz', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (24, N'TMC Pop Starz', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (25, N'Passenger (Pop)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (26, N'Pop Lullaby Ensemble', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (27, N'Génération Pop-Rock', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (28, N'Melissa (Pop)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (29, N'Pop Royals', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (30, N'Steel Magnolia (Country Pop)', N'Pop', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (31, N'Rockabye Baby!', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (32, N'Rockabye Lullaby', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (33, N'Kid Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (34, N'Rock Dog', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (35, N'PnB Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (36, N'Rockabye', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (37, N'Aesop Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (38, N'Nova Rockafeller', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (39, N'Jay Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (40, N'Chubb Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (41, N'Pete Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (42, N'Chris Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (43, N'90s Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (44, N'Rock&#39;n Crow', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (45, N'T-Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (46, N'Rock Crusade', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (47, N'Rock Candy Funk Party', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (48, N'Rock Mafia', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (49, N'Classic Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (50, N'Rock Feast', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (51, N'Rich Rocka', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (52, N'Detroit Rock Hitters', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (53, N'TRM The Rock Movement', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (54, N'Rock Classic Hits AllStars', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (55, N'One Ok Rock', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (56, N'Keith (Rock)', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (57, N'Classic Rock Masters', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (58, N'The Rock Heroes', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (59, N'Pete Rock and C.L. Smooth', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (60, N'Yacht Rock Revue', N'Rock', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (61, N'Jazzanova', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (62, N'Jazz Christmas', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (63, N'Jazz Lounge', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (64, N'Christmas Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (65, N'Jazzamba', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (66, N'Jazzamor', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (67, N'Nils (Jazz)', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (68, N'Dinner Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (69, N'Soft Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (70, N'Smooth Jazz Allstars', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (71, N'Jazz At Lincoln Center Orchestra', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (72, N'Jazz 2016', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (73, N'Jazz Cartier', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (74, N'Jazz Funk Soul', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (75, N'Chillaxing Jazz Kollektion', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (76, N'Def Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (77, N'Jazz Holdouts', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (78, N'Brooklyn Jazz Quartet', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (79, N'Bossa Nova Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (80, N'Jazz At The Movies Band', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (81, N'Slow Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (82, N'Relaxing Instrumental Jazz Ensemble', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (83, N'Modern Jazz Quartet', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (84, N'Jazz Guitar', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (85, N'Smooth Jazz Spa', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (86, N'Christmas Jazz Trio', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (87, N'Johnny Hates Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (88, N'Relaxing Jazz Music', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (89, N'Relaxing Morning Jazz', N'Jazz', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Artista] ([IdArtista], [NombreArtista], [GeneroMusical], [FechaInsert]) VALUES (90, N'Prince Jazzbo', N'Jazz', CAST(N'2021-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[Artista] OFF
SET IDENTITY_INSERT [dbo].[GeneroMusical] ON 

INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (1, N'Pop', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (2, N'Rock', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (3, N'Alternative', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (4, N'Rap/Hip-Hop', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (5, N'Soul/R&B', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (6, N'Country', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (7, N'Jazz', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (8, N'Electronic', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (9, N'Latin', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (10, N'World', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (11, N'Reggae', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (12, N'Classical', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (13, N'Oldies', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (14, N'New Age', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (15, N'Christian/Gospel', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (16, N'Blues', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (17, N'Folk', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (18, N'Vocal/Easy Listening', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (19, N'Soundtracks', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (20, N'Children', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (21, N'Metal', CAST(N'2021-02-12' AS Date))
INSERT [dbo].[GeneroMusical] ([IdGeneroMusical], [NombreGeneroMusical], [FechaInsert]) VALUES (22, N'Comedy/Spoken Word', CAST(N'2021-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[GeneroMusical] OFF
SET IDENTITY_INSERT [dbo].[Songs] ON 

INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (1, N'99 Problems', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (2, N'December 4th', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (3, N'99 Problems', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (4, N'Encore (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (5, N'Change Clothes (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (6, N'Lucifer (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (7, N'My 1st Song (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (8, N'Encore', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (9, N'Moment Of Clarity (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (10, N'Allure (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (11, N'Interlude (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (12, N'Dirt Off Your Shoulder (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (13, N'Threat (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (14, N'Justify My Thug (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (15, N'What More Can I Say (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (16, N'Dirt Off Your Shoulder', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (17, N'Sky Blue and Black (Album)', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (18, N'Interlude (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (19, N'Young, Gifted and Black (Album Version (Explicit))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (20, N'Lucifer (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (21, N'Change Clothes (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (22, N'Allure (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (23, N'Moment Of Clarity (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (24, N'December 4th (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (25, N'Public Service Announcement (Interlude)', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (26, N'My 1st Song (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (27, N'Threat (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (28, N'Justify My Thug (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (29, N'Interlude (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Songs] ([IdSong], [NombreSong], [NombreAlbum], [FechaInsert]) VALUES (30, N'What More Can I Say (Album Version (Edited))', N'Black Album', CAST(N'2021-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[Songs] OFF
SET IDENTITY_INSERT [dbo].[SoundtrackArtist] ON 

INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (1, N'', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (2, N'  Andrea Santamaria', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (3, N'', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (4, N'  Another Sentiment', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (5, N'', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (6, N'  Winter Sandmen', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (7, N'  Liliac', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (8, N'  Jazzystics', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (9, N'  Goddesses of Bagpipes', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (10, N'  The North 41', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (11, N'  John 5', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (12, N'  Goddesses of Bagpipe', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (13, N'  Apocalyptica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (14, N'  Troy Millette', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (15, N'  Bill Madison', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (16, N'  Sonia Bartoletti', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (17, N'  Boris Björn Bagger', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (18, N'  The Creaky Coffins', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (19, N'  Metallica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (20, N'  Apocalyptica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (21, N'  Richard Cheese', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (22, N'  Rockabye Baby!', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (23, N'  Metallica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (24, N'  Metallica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (25, N'  Iron Horse (Bluegrass)', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (26, N'  Metallica', N'enter sandman', CAST(N'2021-02-18' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (27, N'', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (28, N'  Andrea Santamaria', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (29, N'', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (30, N'  Another Sentiment', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (31, N'', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (32, N'  Winter Sandmen', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (33, N'  Liliac', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (34, N'  Jazzystics', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (35, N'  Goddesses of Bagpipes', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (36, N'  The North 41', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (37, N'  John 5', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (38, N'  Goddesses of Bagpipe', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (39, N'  Apocalyptica', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (40, N'  Troy Millette', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (41, N'  Bill Madison', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (42, N'  Sonia Bartoletti', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (43, N'  Boris Björn Bagger', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (44, N'  The Creaky Coffins', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (45, N'  Metallica', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (46, N'  Apocalyptica', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (47, N'  Richard Cheese', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (48, N'  Rockabye Baby!', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (49, N'  Metallica', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (50, N'  Metallica', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (51, N'  Iron Horse (Bluegrass)', N'enter sandman', CAST(N'2021-02-19' AS Date))
INSERT [dbo].[SoundtrackArtist] ([IdSoundtrackArtist], [NameArtist], [Soundtrack], [FechaInsert]) VALUES (52, N'  Metallica', N'enter sandman', CAST(N'2021-02-19' AS Date))
SET IDENTITY_INSERT [dbo].[SoundtrackArtist] OFF
SET IDENTITY_INSERT [dbo].[SubGeneroMusical] ON 

INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (1, N'Adult Contemporary', 1, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (2, N'Dance Pop', 1, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (3, N'Teen Beat', 1, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (4, N'Roots', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (5, N'Lite Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (6, N'Modern Folk', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (7, N'Classic Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (8, N'Art &amp; Progressive Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (9, N'Blues &amp; Boogie Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (10, N'Glam', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (11, N'Hard Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (12, N'Instrumental Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (13, N'Jam Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (14, N'Funk Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (15, N'Folk-Rock', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (16, N'Adult Alternative', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (17, N'Singer-Songwriter', 2, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (18, N'Alt Country', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (19, N'Country Humor', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (20, N'Western Swing', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (21, N'Instrumental Country', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (22, N'Country Gospel', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (23, N'Country Pop/Cosmopolitan', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (24, N'Traditional Country', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (25, N'Country-Folk/Bluegrass', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (26, N'Texas Country', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (27, N'Honky-Tonk', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (28, N'Country Rock', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (29, N'Nashville Sound', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (30, N'Outlaw Country', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (31, N'Truckin Songs', 6, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (32, N'Cool/West Coast Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (33, N'Vocal Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (34, N'Latin & World Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (35, N'Soul Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (36, N'Avant Garde Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (37, N'Blues Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (38, N'Jazz Piano', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (39, N'Bop', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (40, N'Big Band', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (41, N'Swing', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (42, N'Jazz-Funk', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (43, N'Fusion', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (44, N'Pop-Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (45, N'Acid Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (46, N'New Orleans & Early Jazz', 7, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (47, N'Brazilian', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (48, N'Cuban', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (49, N'Latin Pop', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (50, N'Latin Rap/Hip-Hop', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (51, N'Cumbia', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (52, N'Mariachi', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (53, N'Tango', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (54, N'Latin Rock', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (55, N'Merengue', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (56, N'Salsa', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (57, N'Tex Mex', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (58, N'Bachata', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (59, N'Banda', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (60, N'Norteno', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (61, N'Cantautor', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (62, N'Ranchera', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (63, N'Reggaeton', 9, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (64, N'World Pop', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (65, N'Caribbean', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (66, N'Europe', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (67, N'Africa', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (68, N'Asia', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (69, N'South Asia', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (70, N'Australia/South Pacific', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (71, N'Celtic', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (72, N'Middle East', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (73, N'North America', 10, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (74, N'DJ Toasting', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (75, N'Dancehall', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (76, N'Pop-Reggae', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (77, N'Roots Reggae', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (78, N'Ska', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (79, N'Lovers Rock', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (80, N'Ragga', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (81, N'Rock Steady', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (82, N'Dub', 11, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (83, N'Baroque', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (84, N'Classical Period', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (85, N'20th/21st Century', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (86, N'Crossover Classical', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (87, N'Performer', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (88, N'Early', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (89, N'Romantic', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (90, N'Opera', 12, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (91, N'British Invasion', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (92, N'Teen Idols', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (93, N'&#39;50s Rock &#39;n&#39; Roll', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (94, N'&#39;60s Oldies', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (95, N'Garage Rock Pioneers', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (96, N'Psychedelic', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (97, N'Bubblegum', 13, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (98, N'Folk-Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (99, N'Jazz Blues', 16, CAST(N'2021-02-12' AS Date))
GO
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (100, N'Harmonica Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (101, N'Jump Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (102, N'Country Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (103, N'Memphis Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (104, N'New Orleans Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (105, N'New York Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (106, N'Piano Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (107, N'Soul Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (108, N'Swamp Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (109, N'Delta Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (110, N'Early American Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (111, N'Texas Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (112, N'Urban Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (113, N'Vaudeville Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (114, N'Electric Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (115, N'Modern Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (116, N'Acoustic Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (117, N'Chicago Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (118, N'Classic Female Blues', 16, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (119, N'Celtic Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (120, N'Field Recordings', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (121, N'Folk Revival', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (122, N'Political Folk &amp; Protest Songs', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (123, N'New Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (124, N'Scottish Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (125, N'Traditional Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (126, N'Medieval', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (127, N'Renaissance', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (128, N'String Bands', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (129, N'Americana', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (130, N'Square Dancing', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (131, N'Old-Time Revival', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (132, N'Urban Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (133, N'Folk Pop', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (134, N'British Folk', 17, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (135, N'Children´s Religious', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (136, N'Lullabies', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (137, N'Rhymes/Fairy Tales', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (138, N'Folk/Sing-Along', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (139, N'Children´s TV/Movies', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (140, N'Read-Along Stories', 20, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (141, N'Progressive Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (142, N'Thrash/Speed Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (143, N'New Wave of British Heavy Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (144, N'Black Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (145, N'Death Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (146, N'Funk Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (147, N'Rapcore', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (148, N'Pop Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (149, N'Doom Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (150, N'Grindcore', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (151, N'Stoner Rock', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (152, N'Alt Metal', 21, CAST(N'2021-02-12' AS Date))
INSERT [dbo].[SubGeneroMusical] ([IdSubGeneroMusical], [NombreSubGeneroMusical], [IdGeneroMusical], [FechaInsert]) VALUES (153, N'Industrial Metal', 21, CAST(N'2021-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[SubGeneroMusical] OFF
USE [master]
GO
ALTER DATABASE [dbInfoMusic] SET  READ_WRITE 
GO
