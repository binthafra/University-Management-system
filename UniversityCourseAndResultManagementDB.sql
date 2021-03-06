USE [master]
GO
/****** Object:  Database [UniversityCourseAndResultManagementSystemDB]    Script Date: 2/6/2018 5:40:47 PM ******/
CREATE DATABASE [UniversityCourseAndResultManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseAndResultManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCourseAndResultManagementSystemDB]
GO
/****** Object:  Table [dbo].[AllocateClassroom]    Script Date: 2/6/2018 5:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[FromTime] [varchar](10) NOT NULL,
	[ToTime] [varchar](10) NOT NULL,
	[Allocate] [bit] NULL,
	[Day] [varchar](10) NULL,
 CONSTRAINT [PK_AllocateClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](100) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignToTeacher]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Assign] [bit] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Grade] [varchar](10) NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[Address] [varchar](60) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[RegNo] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentsResult]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentsResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [varchar](5) NOT NULL,
 CONSTRAINT [PK_StudentsResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](60) NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[CreditToBeTaken] [decimal](18, 2) NOT NULL,
	[RemainingCredit] [decimal](18, 2) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[rooms]    Script Date: 2/6/2018 5:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[rooms] as
SELECT r.RoomNo,a.Day,a.FromTime,a.ToTime FROM AllocateClassroom a JOIN Room r ON r.Id = a.RoomId WHERE a.CourseId = 1
GO
SET IDENTITY_INSERT [dbo].[AllocateClassroom] ON 

INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1, 1, 3, 2, N'540', N'720', 0, N'Tue')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (2, 1, 3, 5, N'600', N'780', 0, N'Thu')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (3, 2, 5, 1, N'570', N'810', 0, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1002, 6, 1007, 2, N'125', N'260', 0, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1003, 6, 1007, 1, N'140', N'192', 0, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1004, 2, 5, 4, N'65', N'135', 0, N'Mon')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1005, 1, 3, 1, N'600', N'720', 0, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1006, 1, 3, 1, N'600', N'720', 0, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (2005, 6, 1008, 5, N'600', N'720', 0, N'Fri')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (2006, 6, 1008, 5, N'600', N'720', 0, N'Fri')
SET IDENTITY_INSERT [dbo].[AllocateClassroom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'CSE-001', N'Computer fundamental', CAST(1.00 AS Decimal(18, 2)), N'Basic computer knowledge', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'CSE-002', N'C Prog.', CAST(2.00 AS Decimal(18, 2)), N'Basic prog.', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (4, N'CSE-003', N'C++ Prog.', CAST(2.00 AS Decimal(18, 2)), N'C++ programming knowledge', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (5, N'EEE-001', N'Electronics basic', CAST(1.00 AS Decimal(18, 2)), N'Basic electronics', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (6, N'CSE-004', N'java', CAST(2.00 AS Decimal(18, 2)), N'basic', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1006, N'CSE-4878', N'Data mining', CAST(2.00 AS Decimal(18, 2)), N'Data analysis and machine learning based courese', 1, 8)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1007, N'URBS-3701', N'Bangladesh studies', CAST(2.00 AS Decimal(18, 2)), N'To let the student know about bangladesh and its early history', 6, 8)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1008, N'CSE-101', N'Data mining sessional', CAST(3.00 AS Decimal(18, 2)), N'saasfas', 6, 8)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] ON 

INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (2, 6, 1008, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (3, 6, 1008, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (4, 6, 1008, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (27, 6, 1008, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (28, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (29, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (30, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (31, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (32, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1005, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1006, 6, 1008, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1007, 6, 1007, 1, 0)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1008, 6, 1007, 1, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1009, 6, 1008, 1, 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[CourseEnrollment] ON 

INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (1, 2, 1, CAST(0x1E3C0B00 AS Date), NULL)
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (4, 2, 3, CAST(0x1F3C0B00 AS Date), NULL)
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (5, 2, 4, CAST(0x213C0B00 AS Date), NULL)
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (7, 2, 6, CAST(0x2A3C0B00 AS Date), NULL)
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (1002, 4, 5, CAST(0x2B3C0B00 AS Date), NULL)
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (2002, 5003, 1007, CAST(0x4C3C0B00 AS Date), N'A+')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (2003, 5003, 1008, CAST(0xC73D0B00 AS Date), N'A+')
SET IDENTITY_INSERT [dbo].[CourseEnrollment] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE-01', N'CSE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE-02', N'EEE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'ETE-03', N'ETE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (4, N'BBA-04', N'BBA')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (5, N'ELL-05', N'ELL')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (6, N'CSE-101', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (7, N'EEE', N'Electrical and Electronics Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (8, N'ETE', N'Electrical & Telecommunication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (9, N'BBA', N'Bachelor of Business Administration')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (2, N'Assistant Lecturer')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (3, N'Associate Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (4, N'Assistant Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (1, N'A-201')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (2, N'A-202')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (3, N'A-203')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (4, N'B-201')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (5, N'B-202')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (6, N'B-203')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (1, N'Arfiz', N'arfiz@gmail.com', N'017150222222', N'asfasgasgaah', 1, CAST(0x1C3C0B00 AS Date), N'EEE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2, N'dgsdg', N'sdg@hdf.ghdf', N'04564564564', N'bhhdj', 1, CAST(0x1C3C0B00 AS Date), N'CSE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (4, N'sdfs', N'sdfsd@sdfsd.ghgfj', N'563435323536', N'ssdfsdf', 2, CAST(0x1C3C0B00 AS Date), N'EEE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (5, N'sdfs', N'sdfsd@sdfs.ghgfj', N'563435323536', N'ssdfsdf', 1, CAST(0x1C3C0B00 AS Date), N'CSE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (1002, N'Asad', N'asad@gmail.com', N'01452022355', N'asgsgadh', 2, CAST(0x1C3C0B00 AS Date), N'EEE-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (1003, N'Atif', N'atif@sdas.fsdf', N'4545455454554', N'dasgash', 1, CAST(0x1C3C0B00 AS Date), N'CSE-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2003, N'dsfds', N'sdfsd@sdgs.dfg', N'2342552323355', N'ghdfhdf', 1, CAST(0x1E3C0B00 AS Date), N'CSE-2016-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2005, N'dfgdfg', N'dfgdd@fgdfh.h', N'65656565656', N'xcvxn', 4, CAST(0x1E3C0B00 AS Date), N'BBA-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2006, N'dfgdfg', N'dfgddv@fgdfh.h', N'65656565656', N'xcvxn', 4, CAST(0x1E3C0B00 AS Date), N'BBA-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2007, N'fdgs', N'sgg@fdg.hfgh', N'24235223526', N'wtwy', 3, CAST(0x1E3C0B00 AS Date), N'ETE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2009, N'sdfs', N'dfsf@fsdf.hfgh', N'24453312312312', N'xcbn', 5, CAST(0x1E3C0B00 AS Date), N'ELL-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2010, N'ddf', N'sf@df.fh', N'242424345343', N'sfdgh', 3, CAST(0x1E3C0B00 AS Date), N'ETE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2011, N'sffsd', N'sfs@dfdf.jr', N'474244646464', N'xcvfhh', 2, CAST(0x1E3C0B00 AS Date), N'EEE-2016-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (3002, N'sakib', N'sakib@gmail.com', N'24534534534535', N'asdsg', 4, CAST(0x0D3C0B00 AS Date), N'BBA-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (4002, N'rashid', N'rashid@gmail.com', N'017150556265', N'jgjkhfg', 5, CAST(0x203C0B00 AS Date), N'ELL-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (5002, N'Ashfakur rahman', N'ashafk@gmail.com', N'02454541512', N'Dhaka', 1, CAST(0xC83D0B00 AS Date), N'CSE-01-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (5003, N'Nahid', N'nahid@gmail.com', N'02154210121', N'Ctg', 6, CAST(0xC83D0B00 AS Date), N'CSE-101-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (6002, N'Farez', N'farez@gamil.com', N'017152225454', N'Chawkbazar', 1, CAST(0xCA3D0B00 AS Date), N'CSE-01-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (6003, N'Rahul', N'rahul@gamil.com', N'01722254545', N'Chawkbazar', 8, CAST(0xCA3D0B00 AS Date), N'ETE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (6004, N'nihar', N'nihar@gamil.com', N'01822254545', N'Chawkbazar', 9, CAST(0xCA3D0B00 AS Date), N'BBA-2018-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentsResult] ON 

INSERT [dbo].[StudentsResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (1, 2, 3, N'A+')
INSERT [dbo].[StudentsResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (2, 4, 5, N'A')
INSERT [dbo].[StudentsResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (1002, 2, 1, N'C')
INSERT [dbo].[StudentsResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (1003, 2, 4, N'A')
SET IDENTITY_INSERT [dbo].[StudentsResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (1, N'Anisur Rahman', N'anis@gmail.com', N'Dhaka', N'01717555555', CAST(30.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), 1, 6)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 2/6/2018 5:40:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 2/6/2018 5:40:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_1] ON [dbo].[Department]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Course]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Department]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course1] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course1]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Course]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Department]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Teacher]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Course]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentsResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentsResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentsResult] CHECK CONSTRAINT [FK_StudentsResult_Course]
GO
ALTER TABLE [dbo].[StudentsResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentsResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentsResult] CHECK CONSTRAINT [FK_StudentsResult_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
USE [master]
GO
ALTER DATABASE [UniversityCourseAndResultManagementSystemDB] SET  READ_WRITE 
GO
