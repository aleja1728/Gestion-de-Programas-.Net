USE [master]
GO
/****** Object:  Database [SCH_Programas]    Script Date: 13/12/2021 3:38:29 p. m. ******/
CREATE DATABASE [SCH_Programas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SCH_Programas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SCH_Programas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SCH_Programas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SCH_Programas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SCH_Programas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SCH_Programas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SCH_Programas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SCH_Programas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SCH_Programas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SCH_Programas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SCH_Programas] SET ARITHABORT OFF 
GO
ALTER DATABASE [SCH_Programas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SCH_Programas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SCH_Programas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SCH_Programas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SCH_Programas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SCH_Programas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SCH_Programas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SCH_Programas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SCH_Programas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SCH_Programas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SCH_Programas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SCH_Programas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SCH_Programas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SCH_Programas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SCH_Programas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SCH_Programas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SCH_Programas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SCH_Programas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SCH_Programas] SET  MULTI_USER 
GO
ALTER DATABASE [SCH_Programas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SCH_Programas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SCH_Programas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SCH_Programas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SCH_Programas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SCH_Programas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SCH_Programas] SET QUERY_STORE = OFF
GO
USE [SCH_Programas]
GO
/****** Object:  Table [dbo].[TBL_Alumno]    Script Date: 13/12/2021 3:38:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Alumno](
	[PK_ALU_IdAlumno] [int] NOT NULL,
	[ALU_Nombres] [nchar](100) NULL,
	[ALU_Apellidos] [nchar](100) NULL,
	[ALU_Creditos] [int] NULL,
 CONSTRAINT [PK_Tbl_Alumno] PRIMARY KEY CLUSTERED 
(
	[PK_ALU_IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Materia]    Script Date: 13/12/2021 3:38:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Materia](
	[MAT_IdMateria] [int] NOT NULL,
	[MAT_Nombre] [nchar](50) NULL,
	[MAT_Modulo] [nchar](50) NULL,
	[MAT_Curso] [nchar](50) NULL,
	[FK_PMG_IdPrograma] [int] NULL,
 CONSTRAINT [PK_Tbl_Materia] PRIMARY KEY CLUSTERED 
(
	[MAT_IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Materia_Has_Alumno]    Script Date: 13/12/2021 3:38:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Materia_Has_Alumno](
	[FK_MAT_IdMateria] [int] NULL,
	[FK_ALU_IdAlumno] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Profesor]    Script Date: 13/12/2021 3:38:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Profesor](
	[PK_PRO_IdProfesor] [nchar](10) NULL,
	[PRO_Nombres] [nchar](100) NULL,
	[PRO_Apellidos] [nchar](100) NULL,
	[PRO_Especialidad] [nchar](50) NULL,
	[PRO_Cargo] [nchar](50) NULL,
	[FK_PMG_IdPrograma] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Programa]    Script Date: 13/12/2021 3:38:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Programa](
	[PK_PMG_IdPrograma] [int] NOT NULL,
	[PMG_Nombre] [nchar](50) NULL,
	[PMG_Duracion] [nchar](50) NULL,
	[PMG_Costo] [int] NULL,
	[PMG_Aula] [nchar](50) NULL,
 CONSTRAINT [PK_Tbl_Programa] PRIMARY KEY CLUSTERED 
(
	[PK_PMG_IdPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (1, N'Maria Camila                                                                                        ', N'Pinzón Lozano                                                                                       ', 134)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (2, N'Maria Julia                                                                                         ', N'de Lourdes Saavedra                                                                                 ', 100)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (3, N'Andrea Natalia                                                                                      ', N'Arevalo Agredo                                                                                      ', 190)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (4, N'Claudia Johana                                                                                      ', N'Alvarado Sarmiento                                                                                  ', 200)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (5, N'Gabriel Andrés                                                                                      ', N'Molina Rodríguez                                                                                    ', 250)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (6, N'Isabel Cristina                                                                                     ', N'Boscan Rincón                                                                                       ', 200)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (7, N'Jhohan Didier                                                                                       ', N'Alarco Aguirre                                                                                      ', 180)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (8, N'Luz Adriana                                                                                         ', N'Calle García                                                                                        ', 130)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (9, N'Mateo Armando                                                                                       ', N'Castro Quinchoa                                                                                     ', 100)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (10, N'Sebastián                                                                                           ', N'Campo Fernandez                                                                                     ', 148)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (11, N'Donaldo                                                                                             ', N'Choles Durango                                                                                      ', 230)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (12, N'Luis Carlos                                                                                         ', N'Barreto Gutierrez                                                                                   ', 290)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (13, N'Daniel Santiago                                                                                     ', N'Castillo Peña                                                                                       ', 200)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (14, N'Johana                                                                                              ', N'Blanco Pulido                                                                                       ', 90)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (15, N'Sandra Milena                                                                                       ', N'Ortíz Guevara                                                                                       ', 140)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (16, N'Fredfy Adrian                                                                                       ', N'Forero Fernandez                                                                                    ', 90)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (17, N'Marlon Stiven                                                                                       ', N'López Durango                                                                                       ', 280)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (18, N'Derlin                                                                                              ', N'Mosquera Perea                                                                                      ', 75)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (19, N'Daniel Alberto                                                                                      ', N'Miranda Pérez                                                                                       ', 39)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (20, N'Jesús Rene                                                                                          ', N'Diaz Flores                                                                                         ', 68)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (21, N'Daniela                                                                                             ', N'Guevara Munera                                                                                      ', 89)
INSERT [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno], [ALU_Nombres], [ALU_Apellidos], [ALU_Creditos]) VALUES (22, N'Carlos Andrés                                                                                       ', N'Daza Gamez                                                                                          ', 78)
GO
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (1, N'Principios SOLID                                  ', N'Programacion                                      ', N'Desarrollo de software                            ', 1)
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (2, N'POO                                               ', N'Programación                                      ', N'Desarrollo de software                            ', 1)
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (3, N'Testing Agile                                     ', N'Calidad                                           ', N'Automatización de pruebas                         ', 6)
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (4, N'Estadística                                       ', N'Ciencia de datos                                  ', N'Ciencia de datos                                  ', 4)
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (5, N'Norma ISO 9000                                    ', N'Calidad                                           ', N'Calidad de software                               ', 3)
INSERT [dbo].[TBL_Materia] ([MAT_IdMateria], [MAT_Nombre], [MAT_Modulo], [MAT_Curso], [FK_PMG_IdPrograma]) VALUES (6, N'SQL Básico                                        ', N'BD                                                ', N'Base de datos                                     ', 5)
GO
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (1, 1)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (2, 2)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (3, 3)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (4, 4)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (5, 5)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (6, 6)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (1, 7)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (2, 8)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (3, 9)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (4, 10)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (5, 11)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (6, 12)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (1, 13)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (2, 14)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (3, 15)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (4, 16)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (5, 17)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (6, 18)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (1, 19)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (2, 20)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (3, 21)
INSERT [dbo].[TBL_Materia_Has_Alumno] ([FK_MAT_IdMateria], [FK_ALU_IdAlumno]) VALUES (4, 22)
GO
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'1         ', N'Henry Alfonso                                                                                       ', N'Garzón Herrera                                                                                      ', N'Desarrollo de software                            ', N'Instructor/Ingeniero de sistemas                  ', 1)
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'2         ', N'Victor Andrés                                                                                       ', N'Torres Miranda                                                                                      ', N'Arquitectura de software                          ', N'Instructor/Ingeniero de software                  ', 2)
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'3         ', N'Alexander                                                                                           ', N'Fiscal Torres                                                                                       ', N'Calidad  de software                              ', N'Instructor/Ingeniero de sistemas                  ', 3)
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'4         ', N'Juan Diego                                                                                          ', N'Pulido López                                                                                        ', N'Ciencia de datos                                  ', N'Instructor/Ingeniero de sistemas                  ', 4)
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'5         ', N'David Mateo                                                                                         ', N'Pulido López                                                                                        ', N'Base de datos                                     ', N'Instructor/Ingeniero de software                  ', 5)
INSERT [dbo].[TBL_Profesor] ([PK_PRO_IdProfesor], [PRO_Nombres], [PRO_Apellidos], [PRO_Especialidad], [PRO_Cargo], [FK_PMG_IdPrograma]) VALUES (N'6         ', N'Gustavo Adolfo                                                                                      ', N'López Munevar                                                                                       ', N'Automatización de pruebas                         ', N'Instructor/Ingeniero de software                  ', 6)
GO
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (1, N'Desarrollo de software                            ', N'12 meses                                          ', 1500000, N'2A                                                ')
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (2, N'Arquitectura de software                          ', N'24 meses                                          ', 2000000, N'1C                                                ')
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (3, N'Calidad de software                               ', N'9 meses                                           ', 2000000, N'2A                                                ')
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (4, N'Ciencia de datos                                  ', N'6 meses                                           ', 1900000, N'3A                                                ')
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (5, N'Base de datos                                     ', N'6 meses                                           ', 1800000, N'4A                                                ')
INSERT [dbo].[TBL_Programa] ([PK_PMG_IdPrograma], [PMG_Nombre], [PMG_Duracion], [PMG_Costo], [PMG_Aula]) VALUES (6, N'Automatización de pruebas                         ', N'10 meses                                          ', 2000000, N'1C                                                ')
GO
/****** Object:  Index [IX_Tbl_Programa]    Script Date: 13/12/2021 3:38:30 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Tbl_Programa] ON [dbo].[TBL_Programa]
(
	[PK_PMG_IdPrograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Materia_Tbl_Materia] FOREIGN KEY([FK_PMG_IdPrograma])
REFERENCES [dbo].[TBL_Programa] ([PK_PMG_IdPrograma])
GO
ALTER TABLE [dbo].[TBL_Materia] CHECK CONSTRAINT [FK_Tbl_Materia_Tbl_Materia]
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Materia_Has_Alumno_Tbl_Materia] FOREIGN KEY([FK_ALU_IdAlumno])
REFERENCES [dbo].[TBL_Alumno] ([PK_ALU_IdAlumno])
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno] CHECK CONSTRAINT [FK_Tbl_Materia_Has_Alumno_Tbl_Materia]
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Materia_Has_Alumno_Tbl_Materia1] FOREIGN KEY([FK_MAT_IdMateria])
REFERENCES [dbo].[TBL_Materia] ([MAT_IdMateria])
GO
ALTER TABLE [dbo].[TBL_Materia_Has_Alumno] CHECK CONSTRAINT [FK_Tbl_Materia_Has_Alumno_Tbl_Materia1]
GO
ALTER TABLE [dbo].[TBL_Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Profesor_Tbl_Programa] FOREIGN KEY([FK_PMG_IdPrograma])
REFERENCES [dbo].[TBL_Programa] ([PK_PMG_IdPrograma])
GO
ALTER TABLE [dbo].[TBL_Profesor] CHECK CONSTRAINT [FK_Tbl_Profesor_Tbl_Programa]
GO
USE [master]
GO
ALTER DATABASE [SCH_Programas] SET  READ_WRITE 
GO
