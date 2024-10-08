USE [ChimoDemo]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCatalogs]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCatalogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CoursesCatalogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCategories]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_CourseCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseChapters]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseChapters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatalogId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[VideoURL] [nvarchar](max) NOT NULL,
	[VideoLength] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CourseChapters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseComments]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseComments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[ChapterId] [int] NOT NULL,
	[Comments] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CourseComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Thumbnail] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCollections]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCollections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberCollections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Point] [int] NOT NULL,
	[ProfileImage] [nvarchar](500) NULL,
	[Intro] [nvarchar](max) NULL,
	[Address] [nvarchar](500) NULL,
	[Gender] [int] NULL,
	[Phone] [varchar](20) NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointHistories]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Cash] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Point] [int] NOT NULL,
	[GetPointType] [int] NOT NULL,
	[GetPointDate] [datetime] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_PointHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProfileImage] [nvarchar](500) NULL,
	[Intro] [nvarchar](max) NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[ProfileImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (3, 4, 2, 500, CAST(N'2024-09-11T02:00:38.297' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (4, 5, 3, 4200, CAST(N'2024-09-11T02:31:50.927' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (5, 5, 9, 1600, CAST(N'2024-09-11T02:32:06.903' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (6, 6, 3, 4200, CAST(N'2024-09-11T02:34:25.107' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (7, 6, 9, 1600, CAST(N'2024-09-11T02:34:32.870' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (8, 6, 10, 3200, CAST(N'2024-09-11T02:34:47.270' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (10, 3, 1, 300, CAST(N'2024-09-30T10:30:50.343' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (20, 7, 1, 300, CAST(N'2024-09-30T16:00:30.750' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (23, 7, 11, 2800, CAST(N'2024-09-30T16:04:22.983' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (48, 8, 10, 3200, CAST(N'2024-10-01T15:53:37.077' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (49, 9, 1, 300, CAST(N'2024-10-01T16:48:40.873' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (50, 10, 10, 3200, CAST(N'2024-10-04T10:27:50.287' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (51, 10, 1, 300, CAST(N'2024-10-04T10:27:55.500' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (52, 11, 1, 300, CAST(N'2024-10-04T10:51:48.360' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (53, 11, 2, 500, CAST(N'2024-10-04T10:51:53.177' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (54, 14, 10, 3200, CAST(N'2024-10-05T09:08:32.707' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (55, 15, 10, 2800, CAST(N'2024-10-05T11:29:20.997' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (56, 15, 1, 800, CAST(N'2024-10-05T11:29:33.377' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (57, 16, 20, 5000, CAST(N'2024-10-05T11:30:15.833' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (58, 16, 19, 2800, CAST(N'2024-10-05T11:30:21.977' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (59, 16, 25, 4000, CAST(N'2024-10-05T11:30:28.420' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (60, 17, 33, 2100, CAST(N'2024-10-05T11:35:59.890' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (61, 17, 11, 1800, CAST(N'2024-10-05T11:36:06.197' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (62, 17, 14, 2000, CAST(N'2024-10-05T11:36:12.800' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (63, 17, 15, 720, CAST(N'2024-10-05T11:36:17.037' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (64, 17, 16, 3200, CAST(N'2024-10-05T11:36:24.463' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (65, 18, 19, 2800, CAST(N'2024-10-05T11:36:53.933' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (66, 18, 27, 4200, CAST(N'2024-10-05T11:37:00.997' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (67, 18, 21, 3000, CAST(N'2024-10-05T11:37:06.730' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (68, 18, 24, 3300, CAST(N'2024-10-05T11:37:13.380' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (69, 18, 32, 3200, CAST(N'2024-10-05T11:37:48.877' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (70, 19, 7, 1600, CAST(N'2024-10-05T11:41:08.407' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (71, 19, 9, 2400, CAST(N'2024-10-05T11:41:15.290' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (72, 19, 15, 720, CAST(N'2024-10-05T11:41:22.157' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (73, 19, 14, 2000, CAST(N'2024-10-05T11:41:27.943' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (74, 19, 11, 1800, CAST(N'2024-10-05T11:41:33.007' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (75, 19, 13, 1200, CAST(N'2024-10-05T11:41:39.163' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (76, 19, 35, 1400, CAST(N'2024-10-05T11:41:47.320' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (77, 19, 25, 4000, CAST(N'2024-10-05T11:41:53.063' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (78, 20, 23, 1200, CAST(N'2024-10-05T11:46:17.477' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (79, 20, 16, 3200, CAST(N'2024-10-05T11:46:23.167' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (80, 20, 26, 2800, CAST(N'2024-10-05T11:46:34.887' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (81, 20, 27, 4200, CAST(N'2024-10-05T11:46:42.377' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (82, 21, 3, 4200, CAST(N'2024-10-05T11:49:24.783' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (83, 21, 20, 5000, CAST(N'2024-10-05T11:49:33.413' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (84, 21, 21, 3000, CAST(N'2024-10-05T11:49:39.817' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (85, 21, 30, 2600, CAST(N'2024-10-05T11:49:50.777' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (86, 21, 10, 2800, CAST(N'2024-10-05T11:49:56.570' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (87, 22, 3, 4200, CAST(N'2024-10-05T11:52:25.263' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (88, 22, 14, 2000, CAST(N'2024-10-05T11:52:31.730' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (89, 22, 19, 2800, CAST(N'2024-10-05T11:52:37.717' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (90, 22, 30, 2600, CAST(N'2024-10-05T11:52:44.097' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (91, 22, 16, 3200, CAST(N'2024-10-05T11:52:49.170' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (92, 22, 27, 4200, CAST(N'2024-10-05T11:52:54.347' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (93, 22, 12, 1000, CAST(N'2024-10-05T11:52:59.750' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (95, 23, 14, 2000, CAST(N'2024-10-05T11:55:17.093' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (96, 23, 11, 1800, CAST(N'2024-10-05T11:55:23.083' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (97, 23, 15, 720, CAST(N'2024-10-05T11:55:28.027' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (98, 23, 33, 2100, CAST(N'2024-10-05T11:55:33.940' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (99, 23, 20, 5000, CAST(N'2024-10-05T11:55:40.890' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (100, 23, 27, 4200, CAST(N'2024-10-05T11:55:48.683' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (101, 23, 3, 4200, CAST(N'2024-10-05T11:56:59.240' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (102, 24, 31, 3200, CAST(N'2024-10-05T12:03:41.590' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (103, 24, 32, 3200, CAST(N'2024-10-05T12:03:46.433' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (104, 24, 28, 2000, CAST(N'2024-10-05T12:04:16.493' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (105, 25, 35, 1400, CAST(N'2024-10-05T13:10:00.367' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (106, 25, 10, 2800, CAST(N'2024-10-05T13:10:17.267' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (107, 25, 31, 3200, CAST(N'2024-10-05T13:10:31.293' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (108, 25, 28, 2000, CAST(N'2024-10-05T13:10:44.867' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (109, 25, 26, 2800, CAST(N'2024-10-05T13:10:55.133' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (110, 25, 25, 4000, CAST(N'2024-10-05T13:11:00.063' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (111, 25, 23, 1200, CAST(N'2024-10-05T13:11:08.270' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (112, 25, 22, 4200, CAST(N'2024-10-05T13:11:15.527' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (113, 25, 36, 1200, CAST(N'2024-10-05T13:11:50.613' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (114, 25, 7, 1600, CAST(N'2024-10-05T13:12:10.450' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (115, 26, 3, 4200, CAST(N'2024-10-05T13:19:33.643' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (116, 26, 14, 2000, CAST(N'2024-10-05T13:19:38.030' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (117, 26, 7, 1600, CAST(N'2024-10-05T13:19:46.613' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (118, 26, 10, 2800, CAST(N'2024-10-05T13:20:03.863' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (119, 26, 26, 2800, CAST(N'2024-10-05T13:20:18.993' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (120, 26, 34, 1600, CAST(N'2024-10-05T13:20:27.950' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (121, 26, 13, 1200, CAST(N'2024-10-05T13:20:35.110' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (122, 27, 7, 1600, CAST(N'2024-10-05T16:13:26.287' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (123, 27, 37, 1300, CAST(N'2024-10-05T16:13:31.517' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (124, 27, 36, 1200, CAST(N'2024-10-05T16:13:36.003' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (125, 27, 38, 3000, CAST(N'2024-10-05T16:13:43.780' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (126, 27, 52, 2600, CAST(N'2024-10-05T16:14:47.623' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (127, 27, 53, 3800, CAST(N'2024-10-05T16:14:58.033' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (128, 28, 30, 2600, CAST(N'2024-10-05T16:15:11.843' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (129, 28, 28, 2000, CAST(N'2024-10-05T16:15:16.460' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (130, 28, 42, 2600, CAST(N'2024-10-05T16:15:21.997' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (131, 28, 51, 3200, CAST(N'2024-10-05T16:15:29.637' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (132, 29, 47, 5800, CAST(N'2024-10-05T16:16:18.693' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (133, 29, 50, 4500, CAST(N'2024-10-05T16:16:25.767' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (134, 29, 46, 3800, CAST(N'2024-10-05T16:16:39.940' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (135, 29, 49, 7200, CAST(N'2024-10-05T16:16:47.317' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (137, 31, 45, 4500, CAST(N'2024-10-05T16:18:53.463' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (138, 31, 46, 3800, CAST(N'2024-10-05T16:18:58.267' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (139, 31, 47, 5800, CAST(N'2024-10-05T16:19:01.667' AS DateTime))
GO
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (140, 31, 35, 1400, CAST(N'2024-10-05T16:19:34.557' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (141, 31, 50, 4500, CAST(N'2024-10-05T16:19:42.773' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (142, 31, 49, 7200, CAST(N'2024-10-05T16:19:46.593' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (143, 32, 39, 6000, CAST(N'2024-10-05T16:20:17.527' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (144, 32, 16, 3200, CAST(N'2024-10-05T16:20:29.723' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (145, 32, 19, 2800, CAST(N'2024-10-05T16:20:33.850' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (146, 32, 20, 5000, CAST(N'2024-10-05T16:20:37.027' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (147, 32, 43, 1800, CAST(N'2024-10-05T16:20:45.677' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (148, 32, 53, 3800, CAST(N'2024-10-05T16:20:56.717' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (149, 33, 1, 800, CAST(N'2024-10-05T16:23:13.063' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (150, 33, 3, 4200, CAST(N'2024-10-05T16:23:18.283' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (151, 33, 9, 2400, CAST(N'2024-10-05T16:23:26.083' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (152, 33, 11, 1800, CAST(N'2024-10-05T16:23:30.843' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (153, 33, 14, 2000, CAST(N'2024-10-05T16:23:34.557' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (154, 33, 15, 720, CAST(N'2024-10-05T16:23:37.933' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (155, 33, 33, 2100, CAST(N'2024-10-05T16:23:41.707' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (156, 33, 36, 1200, CAST(N'2024-10-05T16:23:45.723' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (157, 33, 37, 1300, CAST(N'2024-10-05T16:23:49.123' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (158, 34, 45, 4500, CAST(N'2024-10-05T16:24:00.827' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (159, 34, 46, 3800, CAST(N'2024-10-05T16:24:04.140' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (160, 34, 47, 5800, CAST(N'2024-10-05T16:24:07.507' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (161, 34, 49, 7200, CAST(N'2024-10-05T16:24:10.753' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (162, 34, 50, 4500, CAST(N'2024-10-05T16:24:14.083' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (163, 35, 39, 6000, CAST(N'2024-10-05T16:24:27.203' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (164, 35, 40, 4800, CAST(N'2024-10-05T16:24:36.710' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (165, 36, 43, 1800, CAST(N'2024-10-05T16:24:53.950' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (166, 36, 52, 2600, CAST(N'2024-10-05T16:24:57.723' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (167, 36, 53, 3800, CAST(N'2024-10-05T16:25:19.350' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (168, 36, 41, 3200, CAST(N'2024-10-05T16:25:25.540' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (169, 37, 28, 2000, CAST(N'2024-10-05T16:26:26.553' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (170, 37, 27, 4200, CAST(N'2024-10-05T16:26:29.830' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (171, 37, 26, 2800, CAST(N'2024-10-05T16:26:37.990' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (172, 38, 46, 3800, CAST(N'2024-10-05T16:28:00.797' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (173, 38, 47, 5800, CAST(N'2024-10-05T16:28:04.030' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (174, 38, 49, 7200, CAST(N'2024-10-05T16:28:07.203' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (175, 38, 50, 4500, CAST(N'2024-10-05T16:28:11.210' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (176, 38, 45, 4500, CAST(N'2024-10-05T16:28:22.150' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (177, 39, 3, 4200, CAST(N'2024-10-05T16:28:32.743' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (178, 39, 9, 2400, CAST(N'2024-10-05T16:28:39.397' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (179, 39, 37, 1300, CAST(N'2024-10-05T16:28:49.043' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (180, 39, 25, 4000, CAST(N'2024-10-05T16:28:56.047' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (181, 39, 28, 2000, CAST(N'2024-10-05T16:29:07.930' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (182, 40, 40, 4800, CAST(N'2024-10-05T16:29:57.870' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (183, 40, 39, 6000, CAST(N'2024-10-05T16:30:03.663' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (184, 41, 3, 4200, CAST(N'2024-10-05T16:32:18.457' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (185, 41, 1, 800, CAST(N'2024-10-05T16:32:24.037' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (186, 41, 7, 1600, CAST(N'2024-10-05T16:32:29.003' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (187, 41, 11, 1800, CAST(N'2024-10-05T16:32:43.183' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (188, 41, 37, 1300, CAST(N'2024-10-05T16:32:51.207' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (189, 41, 24, 3300, CAST(N'2024-10-05T16:32:56.260' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (190, 41, 45, 4500, CAST(N'2024-10-05T16:33:01.173' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (191, 41, 46, 3800, CAST(N'2024-10-05T16:33:04.330' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (192, 41, 49, 7200, CAST(N'2024-10-05T16:33:11.420' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (193, 41, 50, 4500, CAST(N'2024-10-05T16:33:15.020' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (194, 42, 28, 2000, CAST(N'2024-10-05T16:33:45.673' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (195, 42, 40, 4800, CAST(N'2024-10-05T16:33:51.820' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (196, 42, 39, 6000, CAST(N'2024-10-05T16:33:55.370' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (197, 42, 32, 3200, CAST(N'2024-10-05T16:34:12.557' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (198, 43, 1, 800, CAST(N'2024-10-05T16:36:06.493' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (199, 43, 3, 4200, CAST(N'2024-10-05T16:36:09.923' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (200, 43, 9, 2400, CAST(N'2024-10-05T16:36:20.293' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (201, 43, 37, 1300, CAST(N'2024-10-05T16:36:32.117' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (202, 44, 45, 4500, CAST(N'2024-10-05T16:36:43.607' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (203, 44, 46, 3800, CAST(N'2024-10-05T16:36:49.077' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (204, 44, 47, 5800, CAST(N'2024-10-05T16:36:52.340' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (205, 44, 49, 7200, CAST(N'2024-10-05T16:36:55.593' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (206, 44, 43, 1800, CAST(N'2024-10-05T16:37:12.093' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (207, 44, 41, 3200, CAST(N'2024-10-05T16:37:16.620' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (208, 45, 20, 5000, CAST(N'2024-10-05T16:37:27.677' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (209, 45, 18, 4000, CAST(N'2024-10-05T16:37:37.917' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (210, 45, 35, 1400, CAST(N'2024-10-05T16:37:42.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 6, 300, 0, CAST(N'2024-09-11T02:00:02.057' AS DateTime), CAST(N'2024-09-30T10:30:50.360' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (4, 7, 500, 0, CAST(N'2024-09-11T02:00:02.057' AS DateTime), CAST(N'2024-09-11T02:00:02.057' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (5, 9, 5800, 1, CAST(N'2024-09-11T02:30:42.530' AS DateTime), CAST(N'2024-09-11T02:30:42.530' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, 10, 9000, 0, CAST(N'2024-09-11T02:33:44.987' AS DateTime), CAST(N'2024-09-30T10:28:28.673' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, 11, 3100, 1, CAST(N'2024-09-30T12:02:08.347' AS DateTime), CAST(N'2024-10-01T15:10:23.690' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (8, 11, 3200, 1, CAST(N'2024-10-01T15:53:37.077' AS DateTime), CAST(N'2024-10-01T15:53:37.113' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, 12, 300, 0, CAST(N'2024-10-01T16:48:40.873' AS DateTime), CAST(N'2024-10-01T16:48:40.930' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, 11, 3500, 1, CAST(N'2024-10-04T10:27:50.270' AS DateTime), CAST(N'2024-10-04T10:27:55.533' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (11, 11, 800, 1, CAST(N'2024-10-04T10:51:48.360' AS DateTime), CAST(N'2024-10-04T10:51:53.183' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (14, 11, 3200, 0, CAST(N'2024-10-05T09:08:32.700' AS DateTime), CAST(N'2024-10-05T09:08:32.773' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (15, 40, 3600, 1, CAST(N'2024-10-05T11:29:20.980' AS DateTime), CAST(N'2024-10-05T11:29:33.387' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (16, 40, 11800, 1, CAST(N'2024-10-05T11:30:15.833' AS DateTime), CAST(N'2024-10-05T11:30:28.427' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (17, 42, 9820, 1, CAST(N'2024-10-05T11:35:59.890' AS DateTime), CAST(N'2024-10-05T11:36:24.470' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (18, 42, 16500, 1, CAST(N'2024-10-05T11:36:53.927' AS DateTime), CAST(N'2024-10-05T11:37:48.937' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (19, 43, 15120, 1, CAST(N'2024-10-05T11:41:08.407' AS DateTime), CAST(N'2024-10-05T11:41:53.063' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (20, 44, 11400, 1, CAST(N'2024-10-05T11:46:17.470' AS DateTime), CAST(N'2024-10-05T11:46:42.383' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (21, 45, 17600, 1, CAST(N'2024-10-05T11:49:24.783' AS DateTime), CAST(N'2024-10-05T11:49:56.573' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (22, 46, 20000, 1, CAST(N'2024-10-05T11:52:25.260' AS DateTime), CAST(N'2024-10-05T11:52:59.757' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (23, 47, 20020, 1, CAST(N'2024-10-05T11:55:12.000' AS DateTime), CAST(N'2024-10-05T11:56:59.283' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (24, 47, 8400, 1, CAST(N'2024-10-05T12:03:41.590' AS DateTime), CAST(N'2024-10-05T12:04:16.543' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (25, 48, 24400, 1, CAST(N'2024-10-05T13:10:00.360' AS DateTime), CAST(N'2024-10-05T13:12:10.453' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (26, 49, 16200, 1, CAST(N'2024-10-05T13:19:33.640' AS DateTime), CAST(N'2024-10-05T13:20:35.113' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (27, 50, 13500, 1, CAST(N'2024-10-05T16:13:26.283' AS DateTime), CAST(N'2024-10-05T16:14:58.037' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (28, 50, 10400, 1, CAST(N'2024-10-05T16:15:11.843' AS DateTime), CAST(N'2024-10-05T16:15:29.640' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (29, 50, 21300, 1, CAST(N'2024-10-05T16:16:18.690' AS DateTime), CAST(N'2024-10-05T16:16:47.357' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (30, 50, 0, 0, CAST(N'2024-10-05T16:17:06.137' AS DateTime), CAST(N'2024-10-05T16:17:11.887' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (31, 51, 27200, 1, CAST(N'2024-10-05T16:18:53.463' AS DateTime), CAST(N'2024-10-05T16:19:46.597' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (32, 51, 22600, 1, CAST(N'2024-10-05T16:20:17.527' AS DateTime), CAST(N'2024-10-05T16:20:56.720' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (33, 52, 16520, 1, CAST(N'2024-10-05T16:23:13.063' AS DateTime), CAST(N'2024-10-05T16:23:49.123' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (34, 52, 25800, 1, CAST(N'2024-10-05T16:24:00.827' AS DateTime), CAST(N'2024-10-05T16:24:14.087' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (35, 52, 10800, 1, CAST(N'2024-10-05T16:24:27.203' AS DateTime), CAST(N'2024-10-05T16:24:36.710' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (36, 52, 11400, 1, CAST(N'2024-10-05T16:24:53.947' AS DateTime), CAST(N'2024-10-05T16:25:30.593' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (37, 52, 9000, 1, CAST(N'2024-10-05T16:26:26.553' AS DateTime), CAST(N'2024-10-05T16:26:38.033' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (38, 53, 25800, 1, CAST(N'2024-10-05T16:28:00.797' AS DateTime), CAST(N'2024-10-05T16:28:22.153' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (39, 53, 13900, 1, CAST(N'2024-10-05T16:28:32.743' AS DateTime), CAST(N'2024-10-05T16:29:07.933' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (40, 53, 10800, 1, CAST(N'2024-10-05T16:29:57.870' AS DateTime), CAST(N'2024-10-05T16:30:03.663' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (41, 54, 33000, 1, CAST(N'2024-10-05T16:32:18.457' AS DateTime), CAST(N'2024-10-05T16:33:15.020' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (42, 54, 16000, 1, CAST(N'2024-10-05T16:33:45.673' AS DateTime), CAST(N'2024-10-05T16:34:18.727' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (43, 55, 8700, 1, CAST(N'2024-10-05T16:36:06.493' AS DateTime), CAST(N'2024-10-05T16:36:32.167' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (44, 55, 26300, 1, CAST(N'2024-10-05T16:36:43.607' AS DateTime), CAST(N'2024-10-05T16:37:16.627' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (45, 55, 10400, 1, CAST(N'2024-10-05T16:37:27.673' AS DateTime), CAST(N'2024-10-05T16:37:42.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCatalogs] ON 

INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Python基礎', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:09:01.457' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'進階 Python', 2, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:09:09.457' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (3, 2, N'設計原則', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:09:16.880' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (4, 3, N'C#裡的變數', 1, CAST(N'2024-09-11T02:36:57.043' AS DateTime), CAST(N'2024-09-26T09:09:26.483' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (5, 3, N'if及else', 2, CAST(N'2024-09-11T02:37:21.317' AS DateTime), CAST(N'2024-09-26T09:09:29.490' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (6, 3, N'迴圈', 3, CAST(N'2024-09-11T02:37:30.767' AS DateTime), CAST(N'2024-09-26T09:09:34.903' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (7, 3, N'函式', 4, CAST(N'2024-09-11T02:37:59.040' AS DateTime), CAST(N'2024-09-26T09:09:39.887' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (8, 3, N'類別', 5, CAST(N'2024-09-11T02:38:13.000' AS DateTime), CAST(N'2024-10-05T16:10:12.510' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (9, 7, N'ADO介紹', 1, CAST(N'2024-09-11T02:38:55.443' AS DateTime), CAST(N'2024-09-26T09:09:45.043' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (10, 9, N'Dapper介紹', 1, CAST(N'2024-09-11T02:39:13.070' AS DateTime), CAST(N'2024-09-26T09:09:48.470' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (11, 9, N'Dapper應用', 2, CAST(N'2024-09-11T02:39:22.503' AS DateTime), CAST(N'2024-09-26T09:09:51.327' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (12, 10, N'SSMS介紹', 1, CAST(N'2024-09-11T02:39:34.973' AS DateTime), CAST(N'2024-09-26T09:09:54.253' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (14, 10, N'T-SQL語法', 2, CAST(N'2024-09-11T02:39:56.997' AS DateTime), CAST(N'2024-09-26T09:10:08.363' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (15, 10, N'建資料表', 3, CAST(N'2024-09-11T02:40:30.343' AS DateTime), CAST(N'2024-09-26T09:10:12.563' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (16, 10, N'SSMS綜合應用', 3, CAST(N'2024-09-11T02:40:54.453' AS DateTime), CAST(N'2024-09-26T09:10:15.987' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (17, 11, N'JavaScript語法介紹', 1, CAST(N'2024-10-05T10:50:24.830' AS DateTime), CAST(N'2024-10-05T11:01:17.590' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (18, 12, N'MySql查詢語法介紹', 1, CAST(N'2024-10-05T10:50:49.477' AS DateTime), CAST(N'2024-10-05T11:01:52.593' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (19, 12, N'建立資料表', 2, CAST(N'2024-10-05T10:51:06.687' AS DateTime), CAST(N'2024-10-05T11:05:14.630' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (20, 13, N'爬蟲簡介', 1, CAST(N'2024-10-05T10:51:25.690' AS DateTime), CAST(N'2024-10-05T11:03:40.190' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (21, 13, N'爬蟲實例介紹', 2, CAST(N'2024-10-05T10:51:53.430' AS DateTime), CAST(N'2024-10-05T11:05:16.180' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (22, 14, N'CSS基本語法介紹', 1, CAST(N'2024-10-05T10:52:13.530' AS DateTime), CAST(N'2024-10-05T11:05:00.940' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (23, 14, N'BootStrap5介紹與應用', 2, CAST(N'2024-10-05T10:52:28.420' AS DateTime), CAST(N'2024-10-05T11:05:50.327' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (24, 15, N'網頁裡的各式html元素介紹與使用', 1, CAST(N'2024-10-05T10:52:53.437' AS DateTime), CAST(N'2024-10-05T11:06:19.317' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (25, 16, N'英檢中級課程', 1, CAST(N'2024-10-05T10:53:16.543' AS DateTime), CAST(N'2024-10-05T11:06:53.397' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (26, 18, N'英檢高級課程', 1, CAST(N'2024-10-05T10:53:32.277' AS DateTime), CAST(N'2024-10-05T11:07:13.877' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (27, 19, N'JLPT N2課程', 1, CAST(N'2024-10-05T10:53:53.583' AS DateTime), CAST(N'2024-10-05T11:07:59.953' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (28, 20, N'JLPT N1課程', 1, CAST(N'2024-10-05T10:54:08.477' AS DateTime), CAST(N'2024-10-05T11:08:38.087' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (29, 21, N'法文初級課程', 1, CAST(N'2024-10-05T10:54:26.057' AS DateTime), CAST(N'2024-10-05T11:08:57.913' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (30, 22, N'法文中級課程', 1, CAST(N'2024-10-05T10:54:34.950' AS DateTime), CAST(N'2024-10-05T11:09:25.217' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (31, 23, N'羽球初級課程', 1, CAST(N'2024-10-05T10:55:04.857' AS DateTime), CAST(N'2024-10-05T11:09:52.770' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (32, 24, N'重訓初級課程', 1, CAST(N'2024-10-05T10:55:14.820' AS DateTime), CAST(N'2024-10-05T11:10:09.623' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (33, 25, N'微積分上', 1, CAST(N'2024-10-05T10:55:30.570' AS DateTime), CAST(N'2024-10-05T11:11:23.380' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (34, 25, N'微積分下', 2, CAST(N'2024-10-05T10:55:38.823' AS DateTime), CAST(N'2024-10-05T11:12:35.207' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (35, 26, N'離散數學課程', 1, CAST(N'2024-10-05T10:55:56.487' AS DateTime), CAST(N'2024-10-05T11:12:55.600' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (36, 27, N'機率論課程', 1, CAST(N'2024-10-05T10:56:14.207' AS DateTime), CAST(N'2024-10-05T11:13:17.090' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (37, 28, N'線性代數初級課程', 1, CAST(N'2024-10-05T10:56:21.660' AS DateTime), CAST(N'2024-10-05T11:13:34.943' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (38, 30, N'工程數學課程', 1, CAST(N'2024-10-05T10:57:06.840' AS DateTime), CAST(N'2024-10-05T11:13:58.173' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (39, 31, N'高中物理課程', 1, CAST(N'2024-10-05T10:57:17.770' AS DateTime), CAST(N'2024-10-05T11:14:27.710' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (40, 32, N'高中化學課程', 1, CAST(N'2024-10-05T10:57:24.320' AS DateTime), CAST(N'2024-10-05T11:14:55.880' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (41, 33, N'Java入門課程', 1, CAST(N'2024-10-05T10:58:00.320' AS DateTime), CAST(N'2024-10-05T11:15:38.507' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (42, 34, N'Orcale課程', 1, CAST(N'2024-10-05T10:58:14.960' AS DateTime), CAST(N'2024-10-05T11:16:02.783' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (44, 35, N'日語會話上', 1, CAST(N'2024-10-05T10:58:37.847' AS DateTime), CAST(N'2024-10-05T11:16:50.270' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (45, 35, N'日語會話下', 2, CAST(N'2024-10-05T10:58:47.117' AS DateTime), CAST(N'2024-10-05T11:17:05.610' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (46, 36, N'PHP入門課程', 1, CAST(N'2024-10-05T10:59:06.057' AS DateTime), CAST(N'2024-10-05T11:18:18.473' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (47, 37, N'物件導向程式設計上', 1, CAST(N'2024-10-05T14:38:09.127' AS DateTime), CAST(N'2024-10-05T14:41:00.547' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (48, 37, N'物件導向程式設計中', 2, CAST(N'2024-10-05T14:38:22.803' AS DateTime), CAST(N'2024-10-05T14:41:31.973' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (49, 37, N'物件導向程式設計下', 3, CAST(N'2024-10-05T14:38:33.327' AS DateTime), CAST(N'2024-10-05T14:41:57.657' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (50, 38, N'室內設計簡介', 1, CAST(N'2024-10-05T14:44:52.883' AS DateTime), CAST(N'2024-10-05T14:45:21.350' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (51, 39, N'機器學習介紹', 1, CAST(N'2024-10-05T14:52:34.373' AS DateTime), CAST(N'2024-10-05T14:53:52.133' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (52, 39, N'機器學習實例演練', 2, CAST(N'2024-10-05T14:52:47.180' AS DateTime), CAST(N'2024-10-05T14:55:18.417' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (53, 40, N'資料視覺化介紹', 1, CAST(N'2024-10-05T14:52:59.710' AS DateTime), CAST(N'2024-10-05T14:55:39.910' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (54, 41, N'德文初級', 1, CAST(N'2024-10-05T15:02:11.380' AS DateTime), CAST(N'2024-10-05T15:02:32.637' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (55, 42, N'瑜珈入門', 1, CAST(N'2024-10-05T15:12:14.817' AS DateTime), CAST(N'2024-10-05T15:12:43.433' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (56, 43, N'越語初級', 1, CAST(N'2024-10-05T15:16:00.180' AS DateTime), CAST(N'2024-10-05T15:16:19.667' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (57, 45, N'DAQ演算法', 1, CAST(N'2024-10-05T15:24:22.927' AS DateTime), CAST(N'2024-10-05T15:26:11.140' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (58, 46, N'貪婪演算法', 1, CAST(N'2024-10-05T15:27:34.670' AS DateTime), CAST(N'2024-10-05T15:28:02.920' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (59, 47, N'DP演算法介紹', 1, CAST(N'2024-10-05T15:30:03.880' AS DateTime), CAST(N'2024-10-05T15:31:24.853' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (60, 47, N'DP演算法實例', 2, CAST(N'2024-10-05T15:30:17.587' AS DateTime), CAST(N'2024-10-05T15:33:39.020' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (61, 47, N'DP演算法綜合應用', 3, CAST(N'2024-10-05T15:30:35.560' AS DateTime), CAST(N'2024-10-05T15:34:26.660' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (62, 49, N'Graph演算法課程', 1, CAST(N'2024-10-05T15:41:51.183' AS DateTime), CAST(N'2024-10-05T15:44:45.080' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (63, 50, N'排序演算法1', 1, CAST(N'2024-10-05T15:49:26.327' AS DateTime), CAST(N'2024-10-05T15:52:56.537' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (64, 50, N'排序演算法2', 2, CAST(N'2024-10-05T15:49:35.783' AS DateTime), CAST(N'2024-10-05T15:52:57.790' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (65, 50, N'排序演算法3', 3, CAST(N'2024-10-05T15:49:48.530' AS DateTime), CAST(N'2024-10-05T15:53:02.190' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (66, 51, N'高中生物', 1, CAST(N'2024-10-05T15:56:50.610' AS DateTime), CAST(N'2024-10-05T15:57:13.050' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (67, 52, N'韓文初級', 1, CAST(N'2024-10-05T16:01:11.717' AS DateTime), CAST(N'2024-10-05T16:01:40.073' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (68, 53, N'韓文中級', 1, CAST(N'2024-10-05T16:01:18.613' AS DateTime), CAST(N'2024-10-05T16:01:51.970' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (69, 3, N'介面', 6, CAST(N'2024-10-05T16:05:24.000' AS DateTime), CAST(N'2024-10-05T16:12:59.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseCatalogs] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCategories] ON 

INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (1, N'程式語言', 1)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (2, N'美術設計', 2)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (3, N'數據科學', 3)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (4, N'語文學習', 4)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (5, N'體育相關', 5)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (6, N'數學', 6)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (7, N'自然科學', 7)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (8, N'資料庫設計與操作', 8)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (10, N'演算法', 9)
SET IDENTITY_INSERT [dbo].[CourseCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseChapters] ON 

INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Python 介紹', 1, N'介紹 Python 語言的特點', N'testVideo1.mp4', 670, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:08:43.603' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'變數和類型', 2, N'學習 Python 的變數和數據類型', N'testVideo1.mp4', 600, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:09:01.457' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (3, 2, N'進階Python應用', 1, N'使用更深入技術撰寫Python', N'testVideo1.mp4', 600, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-26T09:09:09.453' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (4, 3, N'基本設計原則介紹', 1, N'介紹一些基本的設計原則', N'testVideo1.mp4', 720, CAST(N'2024-09-11T02:44:35.083' AS DateTime), CAST(N'2024-09-26T09:09:16.880' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (5, 4, N'宣告變數', 1, N'示範如何使用C#宣告變數', N'Csharp01.mp4', 224, CAST(N'2024-09-11T02:45:27.910' AS DateTime), CAST(N'2024-09-26T09:09:26.483' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (6, 5, N'使用if&else', 1, N'示範如何使用if else', N'Csharp02.mp4', 427, CAST(N'2024-09-11T02:46:19.097' AS DateTime), CAST(N'2024-09-26T09:09:29.490' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (7, 6, N'使用迴圈while', 1, N'示範如何使用while', N'Csharp03.mp4', 212, CAST(N'2024-09-11T02:47:08.270' AS DateTime), CAST(N'2024-09-26T09:09:30.917' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (8, 6, N'使用迴圈for', 2, N'示範如何使用for', N'testVideo1.mp4', 174, CAST(N'2024-09-11T02:47:33.767' AS DateTime), CAST(N'2024-09-26T09:09:32.087' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (9, 6, N'使用迴圈foreach', 3, N'示範如何使用foreach', N'testVideo1.mp4', 328, CAST(N'2024-09-11T02:47:56.197' AS DateTime), CAST(N'2024-09-26T09:09:34.903' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (10, 7, N'函式介紹', 1, N'介紹什麼是函式', N'testVideo2.mp4', 1323, CAST(N'2024-09-11T02:48:54.850' AS DateTime), CAST(N'2024-09-26T09:09:39.887' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (12, 8, N'類別介紹', 1, N'介紹什麼是class', N'testVideo1.mp4', 742, CAST(N'2024-09-11T02:49:40.987' AS DateTime), CAST(N'2024-10-05T16:10:12.510' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (14, 9, N'介紹ADO.NET', 1, N'介紹ADO.NET如何運作', N'testVideo1.mp4', 2343, CAST(N'2024-09-11T02:50:23.550' AS DateTime), CAST(N'2024-09-26T09:09:45.043' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (15, 10, N'Dapper基礎', 1, N'介紹一些Dapper基礎', N'Dapper01.mp4', 1742, CAST(N'2024-09-11T02:51:13.333' AS DateTime), CAST(N'2024-09-26T09:09:48.470' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (16, 11, N'Dapper應用', 1, N'示範更深入的Dapper應用', N'Dapper02.mp4', 2224, CAST(N'2024-09-11T02:52:12.030' AS DateTime), CAST(N'2024-09-26T09:09:51.327' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (17, 12, N'SSMS介紹', 1, N'初探SSMS', N'testVideo1.mp4', 1485, CAST(N'2024-09-11T02:52:42.710' AS DateTime), CAST(N'2024-09-26T09:09:54.253' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (18, 14, N'T-SQL語法介紹', 1, N'介紹T-SQL語法並大致比較與其他SQL語法的差異', N'testVideo2.mp4', 1414, CAST(N'2024-09-11T02:53:29.257' AS DateTime), CAST(N'2024-09-26T09:10:08.363' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (19, 15, N'建資料表UI', 1, N'介紹如何使用SSMS的UI界面建資料表', N'testVideo1.mp4', 1963, CAST(N'2024-09-11T02:54:29.717' AS DateTime), CAST(N'2024-09-26T09:10:10.620' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (20, 15, N'建資料表TSQL', 2, N'介紹如何使用SQL語法在SSMS建立資料表', N'testVideo1.mp4', 2030, CAST(N'2024-09-11T02:55:08.287' AS DateTime), CAST(N'2024-09-26T09:10:12.563' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (21, 16, N'SSMS綜合應用', 1, N'給予多個實際例子示範SSMS在各個專案上的應用', N'testVideo2.mp4', 2332, CAST(N'2024-09-11T02:56:26.000' AS DateTime), CAST(N'2024-09-26T09:10:15.987' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (22, 17, N'介紹JS基本語法', 1, N'介紹JS基本語法', N'testVideo1.mp4', 2, CAST(N'2024-10-05T11:00:43.260' AS DateTime), CAST(N'2024-10-05T11:00:43.260' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (23, 17, N'介紹前端常用JS應用', 2, N'介紹前端JS常用應用', N'testVideo2.mp4', 3, CAST(N'2024-10-05T11:01:17.587' AS DateTime), CAST(N'2024-10-05T11:01:17.587' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (24, 18, N'介紹MySql', 1, N'介紹MySQL常用查詢語法', N'testVideo1.mp4', 45, CAST(N'2024-10-05T11:01:52.547' AS DateTime), CAST(N'2024-10-05T11:01:52.547' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (25, 19, N'利用MySql建立資料表', 1, N'示範使用MySQL建立資料表', N'testVideo1.mp4', 33, CAST(N'2024-10-05T11:03:08.243' AS DateTime), CAST(N'2024-10-05T11:05:14.627' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (26, 20, N'簡介爬蟲', 1, N'介紹何謂網路爬蟲', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:03:40.187' AS DateTime), CAST(N'2024-10-05T11:03:40.187' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (27, 21, N'介紹實例', 1, N'介紹並展示一些實際爬蟲例子', N'testVideo1.mp4', 5, CAST(N'2024-10-05T11:04:12.350' AS DateTime), CAST(N'2024-10-05T11:05:16.180' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (28, 22, N'CSS基本語法', 1, N'介紹一些CSS基本語法', N'testVideo1.mp4', 6, CAST(N'2024-10-05T11:05:00.893' AS DateTime), CAST(N'2024-10-05T11:05:00.893' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (29, 23, N'BootStrap5介紹', 1, N'介紹BootStrap5及應用', N'testVideo1.mp4', 9, CAST(N'2024-10-05T11:05:50.327' AS DateTime), CAST(N'2024-10-05T11:05:50.327' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (30, 24, N'html裡的元素', 1, N'介紹html各式元素', N'testVideo1.mp4', 6, CAST(N'2024-10-05T11:06:19.270' AS DateTime), CAST(N'2024-10-05T11:06:19.270' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (31, 25, N'英檢中級單字與文法', 1, N'介紹英檢中級單字與文法', N'testVideo1.mp4', 1, CAST(N'2024-10-05T11:06:53.390' AS DateTime), CAST(N'2024-10-05T11:06:53.390' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (32, 26, N'英檢高級單字與文法', 1, N'介紹英檢高級單字與文法', N'testVideo1.mp4', 2, CAST(N'2024-10-05T11:07:13.830' AS DateTime), CAST(N'2024-10-05T11:07:13.830' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (33, 27, N'JLPT N2課程', 1, N'JLPT N2的課程影片', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:07:59.950' AS DateTime), CAST(N'2024-10-05T11:07:59.950' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (34, 28, N'JLPT N1課程', 1, N'JLPT N1的課程影片', N'testVideo2.mp4', 1, CAST(N'2024-10-05T11:08:38.040' AS DateTime), CAST(N'2024-10-05T11:08:38.040' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (35, 29, N'法文初級課程', 1, N'法文初級的課程影片', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:08:57.910' AS DateTime), CAST(N'2024-10-05T11:08:57.910' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (36, 30, N'法文中級課程', 1, N'法文中級的課程影片', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:09:25.163' AS DateTime), CAST(N'2024-10-05T11:09:25.163' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (37, 31, N'羽球初級課程', 1, N'羽球初級', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:09:52.767' AS DateTime), CAST(N'2024-10-05T11:09:52.767' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (38, 32, N'重訓初級', 1, N'重訓初級', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:10:09.623' AS DateTime), CAST(N'2024-10-05T11:10:09.623' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (39, 33, N'微積分上-1', 1, N'微積分上-1', N'testVideo2.mp4', 5, CAST(N'2024-10-05T11:10:46.670' AS DateTime), CAST(N'2024-10-05T11:11:23.380' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (40, 33, N'微積分上-2', 2, N'微積分上-2', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:11:13.930' AS DateTime), CAST(N'2024-10-05T11:11:13.930' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (41, 34, N'微積分下-1', 1, N'微積分下-1', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:11:46.793' AS DateTime), CAST(N'2024-10-05T11:11:46.793' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (42, 34, N'微積分下-2', 2, N'微積分下-2', N'testVideo1.mp4', 6, CAST(N'2024-10-05T11:12:10.600' AS DateTime), CAST(N'2024-10-05T11:12:10.600' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (43, 34, N'微積分下-3', 3, N'微積分下-3', N'testVideo2.mp4', 8, CAST(N'2024-10-05T11:12:35.160' AS DateTime), CAST(N'2024-10-05T11:12:35.160' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (44, 35, N'離散數學', 1, N'離散數學課程', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:12:55.600' AS DateTime), CAST(N'2024-10-05T11:12:55.600' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (45, 36, N'機率論', 1, N'機率論', N'testVideo1.mp4', 9, CAST(N'2024-10-05T11:13:17.087' AS DateTime), CAST(N'2024-10-05T11:13:17.087' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (46, 37, N'線性代數初級', 1, N'線性代數初級', N'testVideo2.mp4', 6, CAST(N'2024-10-05T11:13:34.937' AS DateTime), CAST(N'2024-10-05T11:13:34.937' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (47, 38, N'工程數學', 1, N'工程數學影片', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:13:58.120' AS DateTime), CAST(N'2024-10-05T11:13:58.120' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (48, 39, N'高中物理', 1, N'高中物理課程', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:14:27.703' AS DateTime), CAST(N'2024-10-05T11:14:27.703' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (49, 40, N'高中化學', 1, N'高中化學課程', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:14:55.833' AS DateTime), CAST(N'2024-10-05T11:14:55.833' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (50, 41, N'Java入門', 1, N'Java入門影片', N'testVideo1.mp4', 3, CAST(N'2024-10-05T11:15:38.500' AS DateTime), CAST(N'2024-10-05T11:15:38.500' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (51, 42, N'Orcale入門', 1, N'Orcale入門影片', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:16:02.727' AS DateTime), CAST(N'2024-10-05T11:16:02.727' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (52, 44, N'日語會話上-1', 1, N'日語會話上-1', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:16:29.040' AS DateTime), CAST(N'2024-10-05T11:16:29.040' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (53, 44, N'日語會話上-2', 2, N'日語會話上-2', N'testVideo1.mp4', 2, CAST(N'2024-10-05T11:16:50.270' AS DateTime), CAST(N'2024-10-05T11:16:50.270' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (54, 45, N'日語會話下', 1, N'日語會話下', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:17:05.560' AS DateTime), CAST(N'2024-10-05T11:17:05.560' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (55, 46, N'PHP入門-1', 1, N'PHP入門-1', N'testVideo1.mp4', 2, CAST(N'2024-10-05T11:17:42.787' AS DateTime), CAST(N'2024-10-05T11:17:42.787' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (56, 46, N'PHP入門-2', 2, N'PHP入門-2', N'testVideo1.mp4', 2, CAST(N'2024-10-05T11:17:57.913' AS DateTime), CAST(N'2024-10-05T11:17:57.913' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (57, 46, N'PHP入門-3', 3, N'PHP入門-3', N'testVideo2.mp4', 2, CAST(N'2024-10-05T11:18:18.423' AS DateTime), CAST(N'2024-10-05T11:18:18.423' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (58, 47, N'物件導向程式設計上-1', 1, N'OOP上-1', N'testVideo1.mp4', 6, CAST(N'2024-10-05T14:40:28.817' AS DateTime), CAST(N'2024-10-05T14:40:28.817' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (59, 47, N'物件導向程式設計上-2', 2, N'OOP上-2', N'testVideo1.mp4', 6, CAST(N'2024-10-05T14:41:00.547' AS DateTime), CAST(N'2024-10-05T14:41:00.547' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (60, 48, N'物件導向程式設計中', 1, N'OOP中', N'testVideo1.mp4', 6, CAST(N'2024-10-05T14:41:31.920' AS DateTime), CAST(N'2024-10-05T14:41:31.920' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (62, 49, N'物件導向程式設計下', 1, N'OOP下', N'testVideo2.mp4', 6, CAST(N'2024-10-05T14:41:57.653' AS DateTime), CAST(N'2024-10-05T14:41:57.653' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (63, 50, N'室內設計基礎', 1, N'介紹室內設計', N'testVideo1.mp4', 4, CAST(N'2024-10-05T14:45:21.317' AS DateTime), CAST(N'2024-10-05T14:45:21.317' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (64, 51, N'機器學習簡介', 1, N'簡介何謂機器學習', N'testVideo2.mp4', 8, CAST(N'2024-10-05T14:53:52.090' AS DateTime), CAST(N'2024-10-05T14:53:52.090' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (65, 52, N'機器學習實例1', 1, N'機器學習範例1', N'testVideo2.mp4', 6, CAST(N'2024-10-05T14:54:18.237' AS DateTime), CAST(N'2024-10-05T14:54:18.237' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (67, 52, N'機器學習實例2', 2, N'機器學習範例2', N'testVideo2.mp4', 5, CAST(N'2024-10-05T14:54:55.297' AS DateTime), CAST(N'2024-10-05T14:54:55.297' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (68, 52, N'機器學習實例3', 3, N'機器學習範例3', N'testVideo1.mp4', 6, CAST(N'2024-10-05T14:55:18.413' AS DateTime), CAST(N'2024-10-05T14:55:18.413' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (69, 53, N'資料視覺化課程', 1, N'資料視覺化課程', N'testVideo2.mp4', 4, CAST(N'2024-10-05T14:55:39.907' AS DateTime), CAST(N'2024-10-05T14:55:39.907' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (70, 54, N'德文初級課程', 1, N'德文初級', N'testVideo2.mp4', 2, CAST(N'2024-10-05T15:02:32.590' AS DateTime), CAST(N'2024-10-05T15:02:32.590' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (71, 55, N'瑜珈入門課程', 1, N'瑜珈入門', N'testVideo1.mp4', 3, CAST(N'2024-10-05T15:12:43.410' AS DateTime), CAST(N'2024-10-05T15:12:43.410' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (72, 56, N'越語初級課程', 1, N'越語初級', N'testVideo2.mp4', 5, CAST(N'2024-10-05T15:16:19.637' AS DateTime), CAST(N'2024-10-05T15:16:19.637' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (73, 57, N'介紹何謂各個擊破演算法', 1, N'DAQ', N'testVideo2.mp4', 6, CAST(N'2024-10-05T15:25:30.197' AS DateTime), CAST(N'2024-10-05T15:25:30.197' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (74, 57, N'DAQ演算法實例', 2, N'DAQ實例', N'testVideo2.mp4', 9, CAST(N'2024-10-05T15:26:11.140' AS DateTime), CAST(N'2024-10-05T15:26:11.140' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (75, 58, N'介紹貪婪演算法並介紹實例', 1, N'Greedy', N'testVideo2.mp4', 5, CAST(N'2024-10-05T15:28:02.900' AS DateTime), CAST(N'2024-10-05T15:28:02.900' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (76, 59, N'介紹何謂DP演算法', 1, N'DP', N'testVideo1.mp4', 6, CAST(N'2024-10-05T15:31:24.807' AS DateTime), CAST(N'2024-10-05T15:31:24.807' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (77, 60, N'DP實例1', 1, N'DP實例1', N'testVideo1.mp4', 6, CAST(N'2024-10-05T15:32:12.207' AS DateTime), CAST(N'2024-10-05T15:32:12.207' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (78, 60, N'DP實例2', 2, N'DP實例2', N'testVideo1.mp4', 6, CAST(N'2024-10-05T15:32:51.360' AS DateTime), CAST(N'2024-10-05T15:32:51.360' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (79, 60, N'DP實例3', 3, N'DP實例3', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:33:21.980' AS DateTime), CAST(N'2024-10-05T15:33:39.020' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (80, 61, N'DP綜合演練1', 1, N'DP綜合演練1', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:33:57.853' AS DateTime), CAST(N'2024-10-05T15:34:25.103' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (81, 61, N'DP綜合演練2', 2, N'DP綜合演練2', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:34:16.063' AS DateTime), CAST(N'2024-10-05T15:34:26.660' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (82, 62, N'DFS', 1, N'介紹何謂DFS', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:42:33.070' AS DateTime), CAST(N'2024-10-05T15:44:45.080' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (83, 62, N'BFS', 2, N'介紹何謂BFS', N'testVideo2.mp4', 5, CAST(N'2024-10-05T15:42:59.520' AS DateTime), CAST(N'2024-10-05T15:44:02.800' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (85, 62, N'Graph演算法實際演練', 3, N'Graph實際演練例題示範', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:43:41.343' AS DateTime), CAST(N'2024-10-05T15:44:06.237' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (86, 63, N'氣泡排序法，選擇排序法，插值排序法', 1, N'介紹三種排序及其時間複雜度', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:50:56.360' AS DateTime), CAST(N'2024-10-05T15:52:56.533' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (87, 64, N'合併排序法，快速排序法', 1, N'介紹兩種排序法及其時間複雜度', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:52:00.110' AS DateTime), CAST(N'2024-10-05T15:52:57.790' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (88, 65, N'計數排序法', 1, N'介紹計數排序法及其時間複雜度', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:52:50.017' AS DateTime), CAST(N'2024-10-05T15:53:02.190' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (89, 66, N'高中生物課程', 1, N'高中生物', N'testVideo1.mp4', 5, CAST(N'2024-10-05T15:57:13.013' AS DateTime), CAST(N'2024-10-05T15:57:13.013' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (90, 67, N'韓文初級課程', 1, N'韓文初級課程', N'testVideo1.mp4', 5, CAST(N'2024-10-05T16:01:40.037' AS DateTime), CAST(N'2024-10-05T16:01:40.037' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (91, 68, N'韓文中級課程', 1, N'韓文中級課程', N'testVideo1.mp4', 5, CAST(N'2024-10-05T16:01:51.970' AS DateTime), CAST(N'2024-10-05T16:01:51.970' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (92, 69, N'介紹C#的介面宣告與實作1', 1, N'介面宣告與實作1', N'testVideo1.mp4', 5, CAST(N'2024-10-05T16:06:41.667' AS DateTime), CAST(N'2024-10-05T16:06:41.667' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (97, 69, N'介紹C#的介面宣告與實作2', 2, N'介面宣告與實作2', N'testVideo2.mp4', 5, CAST(N'2024-10-05T16:12:59.463' AS DateTime), CAST(N'2024-10-05T16:12:59.463' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseChapters] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseComments] ON 

INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (2, 6, 1, 1, N'這門課非常好！', CAST(N'2024-09-11T02:02:47.493' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (3, 7, 2, 3, N'設計理論很有幫助。', CAST(N'2024-09-11T02:02:47.493' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (4, 9, 3, 4, N'看完以後我終於會宣告變數了', CAST(N'2024-09-11T02:58:21.467' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (5, 9, 3, 5, N'if跟else後面一定需要加大括號嗎?', CAST(N'2024-09-11T02:58:54.780' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (6, 9, 9, 16, N'Dapper跟ADO.NET差在哪?', CAST(N'2024-09-11T03:00:26.853' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (7, 10, 10, 21, N'SSMS也太難學了吧', CAST(N'2024-09-11T03:02:38.130' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (8, 10, 10, 18, N'只有SSMS使用T-SQLa87', CAST(N'2024-09-11T03:03:07.357' AS DateTime))
INSERT [dbo].[CourseComments] ([Id], [MemberId], [CourseId], [ChapterId], [Comments], [CreatedDate]) VALUES (11, 10, 10, 20, N'我可以在SSMS寫其他SQL語法嗎', CAST(N'2024-09-11T03:04:33.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseComments] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 1, N'Python 程式設計入門', N'學習 Python 的基本概念和語法，奠定日後學習Python的重要基礎', 800, N'thumbnail_Python程式設計入門.png', 1, CAST(N'2024-09-11T01:57:31.220' AS DateTime), CAST(N'2024-10-05T09:40:30.440' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 2, N'平面設計基礎', N'學習平面設計的基本技巧', 600, N'thumbnail_平面設計基礎.png', 1, CAST(N'2024-09-11T01:57:31.220' AS DateTime), CAST(N'2024-10-05T09:40:55.953' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 1, 3, N'C#入門', N'教授C#程式語言基礎語法', 4200, N'thumbnail_C入門.png', 1, CAST(N'2024-09-11T02:15:18.367' AS DateTime), CAST(N'2024-10-05T16:12:59.507' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, 1, 3, N'ADO.NET', N'教授使用ADO.NET存取資料庫', 1600, N'thumbnail_ADO.Net.png', 1, CAST(N'2024-09-11T02:17:57.800' AS DateTime), CAST(N'2024-10-05T09:41:26.360' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, 1, 3, N'Dapper', N'教授使用Dapper存取資料庫', 2400, N'thumbnail_Dapper.png', 1, CAST(N'2024-09-11T02:19:15.400' AS DateTime), CAST(N'2024-10-05T09:41:33.723' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, 8, 4, N'SSMS入門', N'初入SSMS認識資料庫', 2800, N'thumbnail_SSMS入門.png', 1, CAST(N'2024-09-11T02:20:18.247' AS DateTime), CAST(N'2024-10-05T09:44:37.797' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (11, 1, 3, N'JavaScript入門', N'介紹JavaScript，奠定學習各大前端框架基礎', 1800, N'thumbnail_JS入門.png', 1, CAST(N'2024-09-15T22:45:20.163' AS DateTime), CAST(N'2024-10-05T11:01:17.590' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (12, 8, 4, N'MySQL入門', N'介紹MySQL各式應用', 1000, N'thumbnail_MYSQL入門.png', 1, CAST(N'2024-09-15T22:46:13.980' AS DateTime), CAST(N'2024-10-05T11:05:14.630' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (13, 3, 1, N'爬蟲入門', N'介紹何謂網路爬蟲，提供三個實際例子手把手教你從零開始寫爬蟲程式', 1200, N'', 1, CAST(N'2024-09-15T22:47:05.057' AS DateTime), CAST(N'2024-10-05T11:05:16.180' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (14, 1, 3, N'CSS入門', N'介紹CSS來美化html,並介紹BootStrap5的應用方式', 2000, N'thumbnail_CSS入門.png', 1, CAST(N'2024-09-15T22:47:36.180' AS DateTime), CAST(N'2024-10-05T11:05:50.327' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (15, 1, 3, N'html入門', N'介紹html，帶你從頭開始寫網頁', 720, N'thumbnail_HTML入門.png', 1, CAST(N'2024-09-15T22:47:54.817' AS DateTime), CAST(N'2024-10-05T11:06:19.317' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (16, 4, 5, N'全民英檢中級班', N'教授全民英檢中級必考60種文法，並實際解析檢討歷年考古題', 3200, NULL, 1, CAST(N'2024-10-05T09:57:05.353' AS DateTime), CAST(N'2024-10-05T11:06:53.397' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (18, 4, 5, N'全民英檢高級', N'教授全民英檢高級必考120種文法，並提供多年來經驗的猜題分析', 4000, NULL, 1, CAST(N'2024-10-05T09:58:33.023' AS DateTime), CAST(N'2024-10-05T11:07:13.877' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (19, 4, 5, N'日本語能力試驗N2檢定班', N'教授JLPT N2必考各式單字及文法', 2800, NULL, 1, CAST(N'2024-10-05T10:02:16.770' AS DateTime), CAST(N'2024-10-05T11:07:59.953' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (20, 4, 5, N'日本語能力試驗N1檢定班', N'教授JLPT N1必考各式單字及文法，教授範圍實際出題率高達87%', 5000, NULL, 1, CAST(N'2024-10-05T10:03:45.327' AS DateTime), CAST(N'2024-10-05T11:08:38.087' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (21, 4, 5, N'法文初級', N'您還在只會BonJour嗎? 本課程將介紹基礎法文單字及文法，增加法文語彙量並培養基本法文會話基礎', 3000, NULL, 1, CAST(N'2024-10-05T10:06:36.820' AS DateTime), CAST(N'2024-10-05T11:08:57.913' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (22, 4, 5, N'法文中級', N'比法文初級更深更廣的內容，適合已有一定法文基礎的學員學習', 4200, NULL, 1, CAST(N'2024-10-05T10:07:52.857' AS DateTime), CAST(N'2024-10-05T11:09:25.217' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (23, 5, 8, N'羽球初級', N'介紹羽球歷史並教授羽球基礎技巧', 1200, NULL, 1, CAST(N'2024-10-05T10:12:46.083' AS DateTime), CAST(N'2024-10-05T11:09:52.770' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (24, 5, 8, N'重量訓練初級', N'站在科學角度分析重訓對人體帶來的影響，並介紹健身房常見各式重訓器材的正確使用方式', 3300, NULL, 1, CAST(N'2024-10-05T10:15:03.380' AS DateTime), CAST(N'2024-10-05T11:10:09.623' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (25, 6, 10, N'我阿嬤也會的大學微積分', N'範圍涵蓋大學理工科微積分必修範圍，讓您輕鬆應付學校作業與考試外，還能學習一些微積分的進階知識', 4000, NULL, 1, CAST(N'2024-10-05T10:22:25.977' AS DateTime), CAST(N'2024-10-05T14:58:05.890' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (26, 6, 10, N'離散數學', N'教學內容廣泛，重心將著重於一般學員較畏懼的排列組合問題', 2800, NULL, 1, CAST(N'2024-10-05T10:23:54.270' AS DateTime), CAST(N'2024-10-05T11:12:55.600' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (27, 6, 10, N'機率論', N'介紹各式機率模型與生活上的應用，適合有微積分及離散數學基礎的學員學習', 4200, NULL, 1, CAST(N'2024-10-05T10:25:11.143' AS DateTime), CAST(N'2024-10-05T11:13:17.090' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (28, 6, 10, N'線性代數初級', N'範圍為一般理工科系線性代數內容', 2000, NULL, 1, CAST(N'2024-10-05T10:27:42.117' AS DateTime), CAST(N'2024-10-05T11:13:34.943' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (30, 6, 10, N'工程數學', N'範圍為一般理工科系工程數學內容', 2600, NULL, 1, CAST(N'2024-10-05T10:28:22.477' AS DateTime), CAST(N'2024-10-05T11:13:58.173' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (31, 7, 12, N'高中物理', N'涵蓋普通高中三類組所學物理所有範圍，含課外補充', 3200, NULL, 1, CAST(N'2024-10-05T10:33:50.767' AS DateTime), CAST(N'2024-10-05T11:14:27.710' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (32, 7, 12, N'高中化學', N'涵蓋普通高中三類組所學化學的所有範圍，含課外補充', 3200, NULL, 1, CAST(N'2024-10-05T10:34:29.880' AS DateTime), CAST(N'2024-10-05T11:14:55.880' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (33, 1, 3, N'Java入門', N'介紹Java基礎語法', 2100, NULL, 1, CAST(N'2024-10-05T10:39:57.443' AS DateTime), CAST(N'2024-10-05T11:15:38.507' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (34, 8, 4, N'Orcale入門', N'介紹Orcale基本查詢語法與操作', 1600, NULL, 1, CAST(N'2024-10-05T10:41:08.540' AS DateTime), CAST(N'2024-10-05T11:16:02.783' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (35, 4, 5, N'日語會話', N'介紹各種實際日語對話情境，並提供各式會話應答例句', 1400, NULL, 1, CAST(N'2024-10-05T10:43:13.713' AS DateTime), CAST(N'2024-10-05T11:17:05.610' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (36, 1, 3, N'PHP入門', N'介紹PHP基本語法及應用', 1200, NULL, 1, CAST(N'2024-10-05T10:47:24.103' AS DateTime), CAST(N'2024-10-05T11:18:18.477' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (37, 1, 3, N'物件導向程式設計', N'介紹如何利用物件導向寫出有尊嚴的程式，適合已有一定程式基礎的學員學習', 1300, NULL, 1, CAST(N'2024-10-05T14:37:15.143' AS DateTime), CAST(N'2024-10-05T14:41:57.657' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (38, 2, 2, N'室內設計基礎', N'介紹基礎的室內設計', 3000, NULL, 1, CAST(N'2024-10-05T14:44:30.990' AS DateTime), CAST(N'2024-10-05T14:45:21.350' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (39, 3, 13, N'機器學習', N'使用Pytho及各種套件帶領學員訓練模型來做資料分析，適合已具有演算法基礎的學員學習', 6000, NULL, 1, CAST(N'2024-10-05T14:50:09.767' AS DateTime), CAST(N'2024-10-05T14:55:18.417' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (40, 3, 13, N'資料視覺化', N'使用Python的Matplotlib、Seaborn等進行資料視覺化', 4800, NULL, 1, CAST(N'2024-10-05T14:52:07.903' AS DateTime), CAST(N'2024-10-05T14:55:39.910' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (41, 4, 5, N'德文初級', N'課程目標為能夠進行簡易的德文日常會話', 3200, NULL, 1, CAST(N'2024-10-05T15:01:47.427' AS DateTime), CAST(N'2024-10-05T15:02:32.637' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (42, 5, 8, N'瑜珈入門', N'帶領學員們一起透過瑜珈來減少日常累積的壓力，正向生活', 2600, NULL, 1, CAST(N'2024-10-05T15:11:55.233' AS DateTime), CAST(N'2024-10-05T15:12:43.433' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (43, 4, 5, N'越語初級', N'教授基本的越南語', 1800, NULL, 1, CAST(N'2024-10-05T15:15:34.120' AS DateTime), CAST(N'2024-10-05T15:16:19.667' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (45, 10, 14, N'Divide And Conquer', N'介紹各個擊破演算法，教授學員如何將一個大問題切分成子問題後各個擊破解決問題', 4500, NULL, 1, CAST(N'2024-10-05T15:23:50.653' AS DateTime), CAST(N'2024-10-05T15:26:11.140' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (46, 10, 14, N'貪婪演算法', N'介紹何謂貪婪演算法並實際演練', 3800, NULL, 1, CAST(N'2024-10-05T15:27:18.783' AS DateTime), CAST(N'2024-10-05T15:28:02.920' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (47, 10, 14, N'動態規劃演算法', N'介紹何謂動態規劃，已10個例子演示DP思考模式', 5800, NULL, 1, CAST(N'2024-10-05T15:29:44.293' AS DateTime), CAST(N'2024-10-05T15:34:26.660' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (49, 10, 14, N'圖演算法', N'介紹各式圖演算法，教授DFS,BFS,及各式生成樹演算法來解決如最短路徑，圖的顏色塗抹及最大流等問題', 7200, NULL, 1, CAST(N'2024-10-05T15:41:31.570' AS DateTime), CAST(N'2024-10-05T15:44:45.080' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (50, 10, 14, N'排序演算法', N'介紹各種排序演算法，如氣泡排序法，快速排序法，插值排序法，合併排序法，計數排序法，選擇排序法...等', 4500, NULL, 1, CAST(N'2024-10-05T15:49:01.783' AS DateTime), CAST(N'2024-10-05T15:53:23.647' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (51, 7, 12, N'高中生物', N'涵蓋普通高中三類組所教生物範圍', 3200, NULL, 1, CAST(N'2024-10-05T15:56:33.730' AS DateTime), CAST(N'2024-10-05T15:57:13.050' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (52, 4, 5, N'韓文初級', N'介紹基本韓文，讓你能學會日常生活常用韓文單字!', 2600, NULL, 1, CAST(N'2024-10-05T16:00:20.947' AS DateTime), CAST(N'2024-10-05T16:01:40.073' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (53, 4, 5, N'韓文中級', N'介紹更深入韓文，讓你追韓劇不用再靠字幕!', 3800, NULL, 1, CAST(N'2024-10-05T16:00:55.483' AS DateTime), CAST(N'2024-10-05T16:01:51.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberCollections] ON 

INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (2, 6, 1, CAST(N'2024-09-11T02:02:19.290' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (3, 7, 2, CAST(N'2024-09-11T02:02:19.290' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (4, 9, 10, CAST(N'2024-09-11T03:06:00.777' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (5, 9, 3, CAST(N'2024-09-11T03:06:14.187' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (6, 9, 9, CAST(N'2024-09-11T03:06:17.310' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (7, 9, 7, CAST(N'2024-09-11T03:06:41.163' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (8, 10, 10, CAST(N'2024-09-11T03:06:57.727' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (9, 10, 3, CAST(N'2024-09-11T03:07:06.773' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (10, 10, 1, CAST(N'2024-09-11T03:07:09.120' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (11, 7, 3, CAST(N'2024-09-11T03:07:25.463' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (12, 7, 1, CAST(N'2024-09-11T03:07:31.723' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (14, 10, 9, CAST(N'2024-09-11T03:08:07.840' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (27, 11, 2, CAST(N'2024-10-01T16:20:41.373' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (29, 11, 3, CAST(N'2024-10-04T15:40:36.623' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (30, 11, 1, CAST(N'2024-10-04T15:44:07.497' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (31, 43, 3, CAST(N'2024-10-05T11:42:34.487' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (32, 43, 9, CAST(N'2024-10-05T11:42:38.500' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (33, 43, 7, CAST(N'2024-10-05T11:42:41.773' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (34, 43, 10, CAST(N'2024-10-05T11:42:45.303' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (35, 43, 18, CAST(N'2024-10-05T11:42:52.987' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (36, 44, 23, CAST(N'2024-10-05T11:46:15.797' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (37, 44, 16, CAST(N'2024-10-05T11:46:25.220' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (38, 44, 26, CAST(N'2024-10-05T11:46:36.250' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (39, 44, 34, CAST(N'2024-10-05T11:47:01.357' AS DateTime))
INSERT [dbo].[MemberCollections] ([Id], [MemberId], [CourseId], [CreatedDate]) VALUES (40, 47, 3, CAST(N'2024-10-05T11:55:07.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberCollections] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, N'王小明', N'member1@example.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', N'熱愛學習', N'台北市', 1, N'0912345678', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T02:14:41.260' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, N'李小華', N'member2@example.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', N'設計愛好者', N'新北市', 1, N'0987654321', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T03:14:18.030' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (8, N'老陳', N'LaoChen@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', N'我不愛學習', NULL, 0, NULL, 1, CAST(N'2024-09-11T02:23:23.787' AS DateTime), CAST(N'2024-09-27T09:24:01.543' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, N'黃Mary', N'MaryHung@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', N'想成為工程師', N'宜蘭市', 0, NULL, 1, CAST(N'2024-09-11T02:25:47.757' AS DateTime), CAST(N'2024-09-11T02:25:47.757' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, N'阿貓', N'Mao@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic3.PNG', N'Meow', N'Meow City', 0, N'0962633457', 1, CAST(N'2024-09-11T02:27:22.140' AS DateTime), CAST(N'2024-09-11T02:27:22.140' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (11, N'TS', N'TS@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-09-27T08:58:46.303' AS DateTime), CAST(N'2024-10-04T15:43:33.450' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (12, N'TS2', N'TS2@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-09-27T13:08:53.463' AS DateTime), CAST(N'2024-10-01T16:49:36.300' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (34, N'TS3', N'TS3@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic2.PNG', NULL, NULL, 1, N'', 0, CAST(N'2024-09-27T13:26:11.930' AS DateTime), CAST(N'2024-09-27T13:26:22.930' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (39, N'楊先生', N'Yang@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 0, N'profilePic3.PNG', N'我是楊先生', N'屏東縣', 1, NULL, 1, CAST(N'2024-10-05T09:37:29.920' AS DateTime), CAST(N'2024-10-05T09:37:29.920' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (40, N'小明', N'Ming@gmail.com', N'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 4050, N'5160BE7391E8267A0BB2ACF23B66CB95B32F1DAEDC290940442F69BA461DBCB1.jpg', N'喵', NULL, 1, N'0966655214', 1, CAST(N'2024-10-05T11:26:13.150' AS DateTime), CAST(N'2024-10-05T11:27:21.237' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (41, N'小貓', N'MaoMao@gmail.com', N'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 6100, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:31:48.577' AS DateTime), CAST(N'2024-10-05T11:31:48.577' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (42, N'阿狗', N'Go@gmail.com', N'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 10580, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:35:04.730' AS DateTime), CAST(N'2024-10-05T11:35:04.730' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (43, N'小鳥', N'Bird@gmail.com', N'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 10480, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:39:29.890' AS DateTime), CAST(N'2024-10-05T11:39:29.890' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (44, N'隔壁老王', N'LaoWang@gmail.com', N'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 8300, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:45:11.890' AS DateTime), CAST(N'2024-10-05T11:45:11.890' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (45, N'烏龜', N'turtle@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 10000, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:48:06.910' AS DateTime), CAST(N'2024-10-05T11:48:06.910' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (46, N'老鼠', N'rat@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 23900, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:50:57.050' AS DateTime), CAST(N'2024-10-05T11:50:57.050' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (47, N'哈哈', N'haha@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 11280, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T11:54:21.157' AS DateTime), CAST(N'2024-10-05T11:54:21.157' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (48, N'hi', N'hi@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 9300, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T13:08:50.390' AS DateTime), CAST(N'2024-10-05T13:08:50.390' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (49, N'qq', N'qq@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 15300, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T13:18:00.067' AS DateTime), CAST(N'2024-10-05T13:18:00.067' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (50, N'm', N'm@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 5600, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:03:39.140' AS DateTime), CAST(N'2024-10-05T16:03:39.140' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (51, N'S', N's@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 4000, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:17:54.090' AS DateTime), CAST(N'2024-10-05T16:17:54.090' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (52, N'T', N'T@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 5380, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:22:21.533' AS DateTime), CAST(N'2024-10-05T16:22:21.533' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (53, N'aa', N'aa@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 8800, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:26:58.113' AS DateTime), CAST(N'2024-10-05T16:26:58.113' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (54, N'bb', N'bb@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 32200, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:30:46.460' AS DateTime), CAST(N'2024-10-05T16:30:46.460' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (55, N'cc', N'cc@gmail.com', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', 3000, N'profilePic2.PNG', NULL, NULL, 0, NULL, 1, CAST(N'2024-10-05T16:35:10.510' AS DateTime), CAST(N'2024-10-05T16:35:10.510' AS DateTime))
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (2, 2, 1, 1, 300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (3, 3, 2, 1, 500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (4, 4, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (5, 4, 9, 0, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (6, 5, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (7, 5, 9, 0, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (8, 5, 10, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (9, 6, 10, 0, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (10, 7, 3, 0, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (11, 8, 2, 0, 500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (12, 9, 1, 0, 300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (13, 9, 11, 0, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (14, 10, 10, 0, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (15, 11, 3, 0, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (16, 12, 3, 0, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (17, 13, 10, 0, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (18, 13, 1, 0, 300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (19, 14, 10, 0, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (20, 15, 1, 0, 300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (21, 15, 2, 0, 500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (22, 16, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (23, 17, 10, 0, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (24, 18, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (25, 19, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (26, 19, 1, 1, 800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (27, 20, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (28, 20, 19, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (29, 20, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (30, 21, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (31, 22, 1, 1, 800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (32, 23, 21, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (33, 24, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (34, 25, 33, 1, 2100)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (35, 25, 11, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (36, 25, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (37, 25, 15, 1, 720)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (38, 25, 16, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (39, 26, 19, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (40, 26, 27, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (41, 26, 21, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (42, 26, 24, 1, 3300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (43, 26, 32, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (44, 27, 34, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (45, 28, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (46, 28, 9, 1, 2400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (47, 28, 15, 1, 720)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (48, 28, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (49, 28, 11, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (50, 28, 13, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (51, 28, 35, 0, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (52, 28, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (53, 29, 24, 1, 3300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (54, 30, 23, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (55, 30, 16, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (56, 30, 26, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (57, 30, 27, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (58, 31, 34, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (59, 32, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (60, 33, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (61, 34, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (62, 34, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (63, 34, 21, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (64, 34, 30, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (65, 34, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (66, 35, 35, 1, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (67, 36, 18, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (68, 37, 35, 1, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (69, 38, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (70, 38, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (71, 38, 19, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (72, 38, 30, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (73, 38, 16, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (74, 38, 27, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (75, 38, 12, 1, 1000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (76, 39, 36, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (77, 40, 21, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (78, 41, 3, 0, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (79, 42, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (80, 42, 11, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (81, 42, 15, 1, 720)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (82, 42, 33, 1, 2100)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (83, 42, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (84, 42, 27, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (85, 42, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (86, 43, 12, 1, 1000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (87, 44, 24, 1, 3300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (88, 45, 31, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (89, 45, 32, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (90, 45, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (91, 46, 2, 1, 600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (92, 47, 35, 1, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (93, 47, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (94, 47, 31, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (95, 47, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (96, 47, 26, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (97, 47, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (98, 47, 23, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (99, 47, 22, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (100, 47, 36, 1, 1200)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (101, 47, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (102, 48, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (103, 49, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (104, 49, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (105, 49, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (106, 49, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (107, 49, 26, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (108, 49, 34, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (109, 49, 13, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (110, 50, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (111, 51, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (112, 52, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (113, 53, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (114, 53, 37, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (115, 53, 36, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (116, 53, 38, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (117, 53, 52, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (118, 53, 53, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (119, 54, 30, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (120, 54, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (121, 54, 42, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (122, 54, 51, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (123, 55, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (124, 56, 47, 1, 5800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (125, 56, 50, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (126, 56, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (127, 56, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (128, 57, 40, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (129, 58, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (130, 59, 13, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (131, 60, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (132, 60, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (133, 60, 47, 1, 5800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (134, 60, 35, 1, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (135, 60, 50, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (136, 60, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (137, 61, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (138, 61, 16, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (139, 61, 19, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (140, 61, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (141, 61, 43, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (142, 61, 53, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (143, 62, 42, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (144, 63, 38, 1, 3000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (145, 64, 12, 1, 1000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (146, 65, 34, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (147, 66, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (148, 67, 1, 1, 800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (149, 67, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (150, 67, 9, 1, 2400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (151, 67, 11, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (152, 67, 14, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (153, 67, 15, 1, 720)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (154, 67, 33, 1, 2100)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (155, 67, 36, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (156, 67, 37, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (157, 68, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (158, 68, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (159, 68, 47, 1, 5800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (160, 68, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (161, 68, 50, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (162, 69, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (163, 69, 40, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (164, 70, 43, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (165, 70, 52, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (166, 70, 53, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (167, 70, 41, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (168, 71, 12, 1, 1000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (169, 72, 30, 1, 2600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (170, 73, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (171, 73, 27, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (172, 73, 26, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (173, 74, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (174, 74, 47, 1, 5800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (175, 74, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (176, 74, 50, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (177, 74, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (178, 75, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (179, 75, 9, 1, 2400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (180, 75, 37, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (181, 75, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (182, 75, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (183, 76, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (184, 77, 31, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (185, 78, 32, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (186, 79, 13, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (187, 80, 40, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (188, 80, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (189, 81, 23, 1, 1200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (190, 82, 2, 1, 600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (191, 83, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (192, 83, 1, 1, 800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (193, 83, 7, 1, 1600)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (194, 83, 11, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (195, 83, 37, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (196, 83, 24, 1, 3300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (197, 83, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (198, 83, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (199, 83, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (200, 83, 50, 1, 4500)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (201, 84, 10, 1, 2800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (202, 85, 25, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (203, 86, 28, 1, 2000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (204, 86, 40, 1, 4800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (205, 86, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (206, 86, 32, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (207, 87, 1, 1, 800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (208, 87, 3, 1, 4200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (209, 87, 9, 1, 2400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (210, 87, 37, 1, 1300)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (211, 88, 45, 1, 4500)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (212, 88, 46, 1, 3800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (213, 88, 47, 1, 5800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (214, 88, 49, 1, 7200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (215, 88, 43, 1, 1800)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (216, 88, 41, 1, 3200)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (217, 89, 20, 1, 5000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (218, 89, 18, 1, 4000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (219, 89, 35, 1, 1400)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (220, 90, 39, 1, 6000)
INSERT [dbo].[OrderItems] ([Id], [OrderId], [CourseId], [Status], [Price]) VALUES (221, 91, 2, 1, 600)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (2, 6, 300, 1, CAST(N'2024-09-11T02:01:21.077' AS DateTime), CAST(N'2024-09-11T02:01:21.077' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 7, 500, 1, CAST(N'2024-09-11T02:01:21.077' AS DateTime), CAST(N'2024-09-11T02:01:21.077' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (4, 9, 4200, 0, CAST(N'2024-09-11T03:12:23.610' AS DateTime), CAST(N'2024-09-17T03:07:03.583' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (5, 10, 7400, 0, CAST(N'2024-09-11T03:13:00.450' AS DateTime), CAST(N'2024-09-17T03:06:36.087' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, 9, 0, -1, CAST(N'2024-09-11T03:14:05.427' AS DateTime), CAST(N'2024-09-17T03:07:12.537' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, 11, 0, -1, CAST(N'2024-09-27T09:00:09.653' AS DateTime), CAST(N'2024-10-04T09:15:59.133' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (8, 11, 0, -1, CAST(N'2024-09-27T11:33:33.763' AS DateTime), CAST(N'2024-10-04T09:47:14.970' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, 11, 0, -1, CAST(N'2024-10-01T15:49:42.643' AS DateTime), CAST(N'2024-10-04T09:45:57.133' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, 11, 0, -1, CAST(N'2024-10-01T15:53:54.140' AS DateTime), CAST(N'2024-10-04T09:19:28.667' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (11, 11, 0, -1, CAST(N'2024-10-04T09:17:21.507' AS DateTime), CAST(N'2024-10-04T09:19:21.280' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (12, 11, 0, -1, CAST(N'2024-10-04T09:48:15.813' AS DateTime), CAST(N'2024-10-04T15:14:59.930' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (13, 11, 0, -1, CAST(N'2024-10-04T10:32:24.637' AS DateTime), CAST(N'2024-10-04T10:32:51.607' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (14, 11, 0, -1, CAST(N'2024-10-04T10:51:13.043' AS DateTime), CAST(N'2024-10-04T10:52:28.480' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (15, 11, 0, -1, CAST(N'2024-10-04T10:51:58.337' AS DateTime), CAST(N'2024-10-04T15:14:46.763' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (16, 11, 4200, 1, CAST(N'2024-10-04T15:17:18.300' AS DateTime), CAST(N'2024-10-04T15:17:18.300' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (17, 11, 0, -1, CAST(N'2024-10-04T15:42:31.170' AS DateTime), CAST(N'2024-10-04T16:23:47.910' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (18, 40, 4200, 1, CAST(N'2024-10-05T11:28:58.823' AS DateTime), CAST(N'2024-10-05T11:28:58.823' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (19, 40, 3600, 1, CAST(N'2024-10-05T11:29:37.830' AS DateTime), CAST(N'2024-10-05T11:29:37.830' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (20, 40, 11800, 1, CAST(N'2024-10-05T11:30:35.303' AS DateTime), CAST(N'2024-10-05T11:30:35.303' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (21, 41, 5000, 1, CAST(N'2024-10-05T11:32:54.737' AS DateTime), CAST(N'2024-10-05T11:32:54.737' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (22, 41, 800, 1, CAST(N'2024-10-05T11:33:14.347' AS DateTime), CAST(N'2024-10-05T11:33:14.347' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (23, 41, 3000, 1, CAST(N'2024-10-05T11:34:02.050' AS DateTime), CAST(N'2024-10-05T11:34:02.050' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (24, 41, 1600, 1, CAST(N'2024-10-05T11:34:25.740' AS DateTime), CAST(N'2024-10-05T11:34:25.740' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (25, 42, 9820, 1, CAST(N'2024-10-05T11:36:33.327' AS DateTime), CAST(N'2024-10-05T11:36:33.327' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (26, 42, 16500, 1, CAST(N'2024-10-05T11:37:58.287' AS DateTime), CAST(N'2024-10-05T11:37:58.287' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (27, 42, 1600, 1, CAST(N'2024-10-05T11:38:38.523' AS DateTime), CAST(N'2024-10-05T11:38:38.523' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (28, 43, 13720, 0, CAST(N'2024-10-05T11:41:59.887' AS DateTime), CAST(N'2024-10-05T11:42:11.420' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (29, 43, 3300, 1, CAST(N'2024-10-05T11:43:00.333' AS DateTime), CAST(N'2024-10-05T11:43:00.333' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (30, 44, 11400, 1, CAST(N'2024-10-05T11:46:49.920' AS DateTime), CAST(N'2024-10-05T11:46:49.920' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (31, 44, 1600, 1, CAST(N'2024-10-05T11:47:04.337' AS DateTime), CAST(N'2024-10-05T11:47:04.337' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (32, 44, 4200, 1, CAST(N'2024-10-05T11:47:13.387' AS DateTime), CAST(N'2024-10-05T11:47:13.387' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (33, 44, 2000, 1, CAST(N'2024-10-05T11:47:22.563' AS DateTime), CAST(N'2024-10-05T11:47:22.563' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (34, 45, 17600, 1, CAST(N'2024-10-05T11:50:02.953' AS DateTime), CAST(N'2024-10-05T11:50:02.953' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (35, 45, 1400, 1, CAST(N'2024-10-05T11:50:17.400' AS DateTime), CAST(N'2024-10-05T11:50:17.400' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (36, 45, 4000, 1, CAST(N'2024-10-05T11:50:38.507' AS DateTime), CAST(N'2024-10-05T11:50:38.507' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (37, 46, 1400, 1, CAST(N'2024-10-05T11:52:05.913' AS DateTime), CAST(N'2024-10-05T11:52:05.913' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (38, 46, 20000, 1, CAST(N'2024-10-05T11:53:08.957' AS DateTime), CAST(N'2024-10-05T11:53:08.957' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (39, 46, 1200, 1, CAST(N'2024-10-05T11:53:23.893' AS DateTime), CAST(N'2024-10-05T11:53:23.893' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (40, 46, 3000, 1, CAST(N'2024-10-05T11:53:36.260' AS DateTime), CAST(N'2024-10-05T11:53:36.260' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (41, 47, 0, -1, CAST(N'2024-10-05T11:56:02.350' AS DateTime), CAST(N'2024-10-05T11:56:30.650' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (42, 47, 20020, 1, CAST(N'2024-10-05T11:57:49.003' AS DateTime), CAST(N'2024-10-05T11:57:49.003' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (43, 47, 1000, 1, CAST(N'2024-10-05T12:02:07.043' AS DateTime), CAST(N'2024-10-05T12:02:07.043' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (44, 47, 3300, 1, CAST(N'2024-10-05T12:03:28.690' AS DateTime), CAST(N'2024-10-05T12:03:28.690' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (45, 47, 8400, 1, CAST(N'2024-10-05T12:04:21.263' AS DateTime), CAST(N'2024-10-05T12:04:21.263' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (46, 48, 600, 1, CAST(N'2024-10-05T13:09:43.190' AS DateTime), CAST(N'2024-10-05T13:09:43.190' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (47, 48, 24400, 1, CAST(N'2024-10-05T13:12:51.297' AS DateTime), CAST(N'2024-10-05T13:12:51.297' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (48, 48, 4200, 1, CAST(N'2024-10-05T13:13:22.443' AS DateTime), CAST(N'2024-10-05T13:13:22.443' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (49, 49, 16200, 1, CAST(N'2024-10-05T13:21:10.663' AS DateTime), CAST(N'2024-10-05T13:21:10.663' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (50, 49, 5000, 1, CAST(N'2024-10-05T13:21:49.777' AS DateTime), CAST(N'2024-10-05T13:21:49.777' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (51, 49, 2000, 1, CAST(N'2024-10-05T13:22:05.793' AS DateTime), CAST(N'2024-10-05T13:22:05.793' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (52, 50, 4200, 1, CAST(N'2024-10-05T16:08:57.563' AS DateTime), CAST(N'2024-10-05T16:08:57.563' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (53, 50, 13500, 1, CAST(N'2024-10-05T16:15:03.313' AS DateTime), CAST(N'2024-10-05T16:15:03.313' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (54, 50, 10400, 1, CAST(N'2024-10-05T16:15:33.390' AS DateTime), CAST(N'2024-10-05T16:15:33.390' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (55, 50, 4500, 1, CAST(N'2024-10-05T16:15:44.820' AS DateTime), CAST(N'2024-10-05T16:15:44.820' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (56, 50, 21300, 1, CAST(N'2024-10-05T16:16:51.570' AS DateTime), CAST(N'2024-10-05T16:16:51.570' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (57, 50, 4800, 1, CAST(N'2024-10-05T16:17:11.853' AS DateTime), CAST(N'2024-10-05T16:17:11.853' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (58, 50, 6000, 1, CAST(N'2024-10-05T16:17:27.363' AS DateTime), CAST(N'2024-10-05T16:17:27.363' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (59, 50, 1200, 1, CAST(N'2024-10-05T16:17:38.307' AS DateTime), CAST(N'2024-10-05T16:17:38.307' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (60, 51, 27200, 1, CAST(N'2024-10-05T16:19:53.087' AS DateTime), CAST(N'2024-10-05T16:19:53.087' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (61, 51, 22600, 1, CAST(N'2024-10-05T16:21:01.693' AS DateTime), CAST(N'2024-10-05T16:21:01.693' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (62, 51, 2600, 1, CAST(N'2024-10-05T16:21:16.827' AS DateTime), CAST(N'2024-10-05T16:21:16.827' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (63, 51, 3000, 1, CAST(N'2024-10-05T16:21:29.807' AS DateTime), CAST(N'2024-10-05T16:21:29.807' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (64, 51, 1000, 1, CAST(N'2024-10-05T16:21:39.613' AS DateTime), CAST(N'2024-10-05T16:21:39.613' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (65, 51, 1600, 1, CAST(N'2024-10-05T16:21:45.580' AS DateTime), CAST(N'2024-10-05T16:21:45.580' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (66, 51, 4000, 1, CAST(N'2024-10-05T16:22:03.917' AS DateTime), CAST(N'2024-10-05T16:22:03.917' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (67, 52, 16520, 1, CAST(N'2024-10-05T16:23:54.700' AS DateTime), CAST(N'2024-10-05T16:23:54.700' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (68, 52, 25800, 1, CAST(N'2024-10-05T16:24:19.260' AS DateTime), CAST(N'2024-10-05T16:24:19.260' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (69, 52, 10800, 1, CAST(N'2024-10-05T16:24:39.740' AS DateTime), CAST(N'2024-10-05T16:24:39.740' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (70, 52, 11400, 1, CAST(N'2024-10-05T16:25:51.623' AS DateTime), CAST(N'2024-10-05T16:25:51.623' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (71, 52, 1000, 1, CAST(N'2024-10-05T16:26:05.057' AS DateTime), CAST(N'2024-10-05T16:26:05.057' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (72, 52, 2600, 1, CAST(N'2024-10-05T16:26:19.577' AS DateTime), CAST(N'2024-10-05T16:26:19.577' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (73, 52, 9000, 1, CAST(N'2024-10-05T16:26:42.373' AS DateTime), CAST(N'2024-10-05T16:26:42.373' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (74, 53, 25800, 1, CAST(N'2024-10-05T16:28:26.920' AS DateTime), CAST(N'2024-10-05T16:28:26.920' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (75, 53, 13900, 1, CAST(N'2024-10-05T16:29:16.167' AS DateTime), CAST(N'2024-10-05T16:29:16.167' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (76, 53, 2800, 1, CAST(N'2024-10-05T16:29:23.177' AS DateTime), CAST(N'2024-10-05T16:29:23.177' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (77, 53, 3200, 1, CAST(N'2024-10-05T16:29:29.713' AS DateTime), CAST(N'2024-10-05T16:29:29.713' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (78, 53, 3200, 1, CAST(N'2024-10-05T16:29:35.227' AS DateTime), CAST(N'2024-10-05T16:29:35.227' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (79, 53, 1200, 1, CAST(N'2024-10-05T16:29:44.090' AS DateTime), CAST(N'2024-10-05T16:29:44.090' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (80, 53, 10800, 1, CAST(N'2024-10-05T16:30:06.383' AS DateTime), CAST(N'2024-10-05T16:30:06.383' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (81, 53, 1200, 1, CAST(N'2024-10-05T16:30:12.953' AS DateTime), CAST(N'2024-10-05T16:30:12.953' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (82, 53, 600, 1, CAST(N'2024-10-05T16:30:20.170' AS DateTime), CAST(N'2024-10-05T16:30:20.170' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (83, 54, 33000, 1, CAST(N'2024-10-05T16:33:20.650' AS DateTime), CAST(N'2024-10-05T16:33:20.650' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (84, 54, 2800, 1, CAST(N'2024-10-05T16:33:27.060' AS DateTime), CAST(N'2024-10-05T16:33:27.060' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (85, 54, 4000, 1, CAST(N'2024-10-05T16:33:33.300' AS DateTime), CAST(N'2024-10-05T16:33:33.300' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (86, 54, 16000, 1, CAST(N'2024-10-05T16:34:21.903' AS DateTime), CAST(N'2024-10-05T16:34:21.903' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (87, 55, 8700, 1, CAST(N'2024-10-05T16:36:36.950' AS DateTime), CAST(N'2024-10-05T16:36:36.950' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (88, 55, 26300, 1, CAST(N'2024-10-05T16:37:20.527' AS DateTime), CAST(N'2024-10-05T16:37:20.527' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (89, 55, 10400, 1, CAST(N'2024-10-05T16:37:46.253' AS DateTime), CAST(N'2024-10-05T16:37:46.253' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (90, 55, 6000, 1, CAST(N'2024-10-05T16:37:58.317' AS DateTime), CAST(N'2024-10-05T16:37:58.317' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (91, 55, 600, 1, CAST(N'2024-10-05T16:38:14.877' AS DateTime), CAST(N'2024-10-05T16:38:14.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PointHistories] ON 

INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (3, 6, 0, 300, 22000, -1, CAST(N'2024-09-11T02:04:40.427' AS DateTime), 2)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (4, 7, 0, 500, 50000, -1, CAST(N'2024-09-11T02:04:40.427' AS DateTime), 3)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (5, 9, 44600, 44600, 44600, 1, CAST(N'2024-09-11T03:28:30.003' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (6, 6, 16000, 16000, 38000, 1, CAST(N'2024-09-11T03:29:50.060' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (7, 9, 0, 5800, 38800, -1, CAST(N'2024-09-11T03:32:02.437' AS DateTime), 4)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (8, 10, 0, 9000, 1600, -1, CAST(N'2024-09-11T03:35:54.153' AS DateTime), 5)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (9, 10, 0, 1600, 3200, 0, CAST(N'2024-09-11T03:38:34.437' AS DateTime), 5)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (11, 9, 0, 3200, 42000, 0, CAST(N'2024-09-11T03:41:52.790' AS DateTime), 6)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (12, 11, 0, 4200, 17900, 0, CAST(N'2024-10-04T09:15:59.257' AS DateTime), 7)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (13, 11, 0, -4200, 13700, -1, CAST(N'2024-10-04T09:17:21.603' AS DateTime), 11)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (14, 11, 0, 300, 14000, 0, CAST(N'2024-10-04T09:18:16.967' AS DateTime), 9)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (15, 11, 0, 4200, 18200, 0, CAST(N'2024-10-04T09:19:21.323' AS DateTime), 11)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (16, 11, 0, 3200, 21400, 0, CAST(N'2024-10-04T09:19:28.690' AS DateTime), 10)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (17, 11, 1500, 1650, 23050, 1, CAST(N'2024-10-04T09:29:33.757' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (18, 11, 30, 33, 23083, 1, CAST(N'2024-10-04T09:29:58.410' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (19, 11, 0, 2800, 25883, 0, CAST(N'2024-10-04T09:45:57.333' AS DateTime), 9)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (20, 11, 0, 500, 26383, 0, CAST(N'2024-10-04T09:47:14.997' AS DateTime), 8)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (21, 11, 0, -4200, 22183, -1, CAST(N'2024-10-04T09:48:15.887' AS DateTime), 12)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (22, 11, 0, -3500, 18683, -1, CAST(N'2024-10-04T10:32:24.733' AS DateTime), 13)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (23, 11, 0, 3200, 21883, 0, CAST(N'2024-10-04T10:32:38.830' AS DateTime), 13)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (24, 11, 0, 300, 22183, 0, CAST(N'2024-10-04T10:32:51.647' AS DateTime), 13)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (25, 11, 0, -3200, 18983, -1, CAST(N'2024-10-04T10:51:13.087' AS DateTime), 14)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (26, 11, 0, -800, 18183, -1, CAST(N'2024-10-04T10:51:58.380' AS DateTime), 15)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (27, 11, 0, 500, 18683, 0, CAST(N'2024-10-04T10:52:14.530' AS DateTime), 15)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (28, 11, 0, 3200, 21883, 0, CAST(N'2024-10-04T10:52:28.503' AS DateTime), 14)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (29, 11, 0, 3200, 21883, 0, CAST(N'2024-10-04T10:52:28.503' AS DateTime), 14)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (30, 11, 0, 3200, 21883, 0, CAST(N'2024-10-04T10:52:28.503' AS DateTime), 14)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (31, 11, 0, 3200, 21883, 0, CAST(N'2024-10-04T10:52:28.503' AS DateTime), 14)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (32, 11, 0, 300, 22183, 0, CAST(N'2024-10-04T15:14:46.790' AS DateTime), 15)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (33, 11, 0, 4200, 26383, 0, CAST(N'2024-10-04T15:14:59.947' AS DateTime), 12)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (34, 11, 0, -4200, 22183, -1, CAST(N'2024-10-04T15:17:18.373' AS DateTime), 16)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (35, 11, 0, -3200, 18983, -1, CAST(N'2024-10-04T15:42:31.283' AS DateTime), 17)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (36, 11, 500, 550, 19533, 1, CAST(N'2024-10-04T15:43:33.430' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (37, 11, 0, 3200, 22733, 0, CAST(N'2024-10-04T16:23:47.923' AS DateTime), 17)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (38, 40, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:28:26.810' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (39, 40, 1500, 1650, 7150, 1, CAST(N'2024-10-05T11:28:32.847' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (40, 40, 5000, 5500, 12650, 1, CAST(N'2024-10-05T11:28:38.297' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (41, 40, 0, -4200, 8450, -1, CAST(N'2024-10-05T11:28:58.963' AS DateTime), 18)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (42, 40, 0, -3600, 4850, -1, CAST(N'2024-10-05T11:29:37.897' AS DateTime), 19)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (43, 40, 5000, 5500, 10350, 1, CAST(N'2024-10-05T11:29:52.380' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (44, 40, 5000, 5500, 15850, 1, CAST(N'2024-10-05T11:29:57.483' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (45, 40, 0, -11800, 4050, -1, CAST(N'2024-10-05T11:30:35.377' AS DateTime), 20)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (46, 41, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:32:24.803' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (47, 41, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:32:29.217' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (48, 41, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:32:34.543' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (49, 41, 0, -5000, 11500, -1, CAST(N'2024-10-05T11:32:54.793' AS DateTime), 21)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (50, 41, 0, -800, 10700, -1, CAST(N'2024-10-05T11:33:14.373' AS DateTime), 22)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (51, 41, 0, -3000, 7700, -1, CAST(N'2024-10-05T11:34:02.100' AS DateTime), 23)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (52, 41, 0, -1600, 6100, -1, CAST(N'2024-10-05T11:34:25.810' AS DateTime), 24)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (53, 42, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:35:35.627' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (54, 42, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:35:40.177' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (55, 42, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:35:44.807' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (56, 42, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:35:49.883' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (57, 42, 0, -9820, 12180, -1, CAST(N'2024-10-05T11:36:33.400' AS DateTime), 25)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (58, 42, 5000, 5500, 17680, 1, CAST(N'2024-10-05T11:37:25.127' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (59, 42, 5000, 5500, 23180, 1, CAST(N'2024-10-05T11:37:29.627' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (60, 42, 5000, 5500, 28680, 1, CAST(N'2024-10-05T11:37:33.833' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (61, 42, 0, -16500, 12180, -1, CAST(N'2024-10-05T11:37:58.380' AS DateTime), 26)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (62, 42, 0, -1600, 10580, -1, CAST(N'2024-10-05T11:38:38.557' AS DateTime), 27)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (63, 43, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:40:30.563' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (64, 43, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:40:37.357' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (65, 43, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:40:41.447' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (66, 43, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:40:45.560' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (67, 43, 5000, 5500, 27500, 1, CAST(N'2024-10-05T11:40:49.343' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (68, 43, 0, -15120, 12380, -1, CAST(N'2024-10-05T11:42:00.007' AS DateTime), 28)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (69, 43, 0, 1400, 13780, 0, CAST(N'2024-10-05T11:42:11.460' AS DateTime), 28)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (70, 43, 0, -3300, 10480, -1, CAST(N'2024-10-05T11:43:00.373' AS DateTime), 29)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (71, 44, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:45:39.533' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (72, 44, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:45:43.880' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (73, 44, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:45:48.343' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (74, 44, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:45:52.187' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (75, 44, 5000, 5500, 27500, 1, CAST(N'2024-10-05T11:45:56.713' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (76, 44, 0, -11400, 16100, -1, CAST(N'2024-10-05T11:46:50.013' AS DateTime), 30)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (77, 44, 0, -1600, 14500, -1, CAST(N'2024-10-05T11:47:04.370' AS DateTime), 31)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (78, 44, 0, -4200, 10300, -1, CAST(N'2024-10-05T11:47:13.430' AS DateTime), 32)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (79, 44, 0, -2000, 8300, -1, CAST(N'2024-10-05T11:47:22.597' AS DateTime), 33)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (80, 45, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:48:26.803' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (81, 45, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:48:31.687' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (82, 45, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:48:35.483' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (83, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.477' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (84, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.477' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (85, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.477' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (86, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.477' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (87, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.473' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (88, 45, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:48:43.477' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (89, 45, 5000, 5500, 27500, 1, CAST(N'2024-10-05T11:48:48.213' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (90, 45, 5000, 5500, 33000, 1, CAST(N'2024-10-05T11:48:52.327' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (91, 45, 0, -17600, 15400, -1, CAST(N'2024-10-05T11:50:03.017' AS DateTime), 34)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (92, 45, 0, -1400, 14000, -1, CAST(N'2024-10-05T11:50:17.430' AS DateTime), 35)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (93, 45, 0, -4000, 10000, -1, CAST(N'2024-10-05T11:50:38.543' AS DateTime), 36)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (94, 46, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:51:11.560' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (95, 46, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:51:16.447' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (96, 46, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:51:19.740' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (97, 46, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:51:24.310' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (98, 46, 5000, 5500, 27500, 1, CAST(N'2024-10-05T11:51:27.573' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (99, 46, 5000, 5500, 33000, 1, CAST(N'2024-10-05T11:51:31.143' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (100, 46, 5000, 5500, 38500, 1, CAST(N'2024-10-05T11:51:34.407' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (101, 46, 5000, 5500, 44000, 1, CAST(N'2024-10-05T11:51:39.000' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (102, 46, 5000, 5500, 49500, 1, CAST(N'2024-10-05T11:51:42.993' AS DateTime), NULL)
GO
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (103, 46, 0, -1400, 48100, -1, CAST(N'2024-10-05T11:52:05.957' AS DateTime), 37)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (104, 46, 0, -20000, 28100, -1, CAST(N'2024-10-05T11:53:09.047' AS DateTime), 38)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (105, 46, 0, -1200, 26900, -1, CAST(N'2024-10-05T11:53:23.923' AS DateTime), 39)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (106, 46, 0, -3000, 23900, -1, CAST(N'2024-10-05T11:53:36.290' AS DateTime), 40)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (107, 47, 5000, 5500, 5500, 1, CAST(N'2024-10-05T11:54:31.073' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (108, 47, 5000, 5500, 11000, 1, CAST(N'2024-10-05T11:54:35.240' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (109, 47, 5000, 5500, 16500, 1, CAST(N'2024-10-05T11:54:38.633' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (110, 47, 5000, 5500, 22000, 1, CAST(N'2024-10-05T11:54:42.257' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (111, 47, 5000, 5500, 27500, 1, CAST(N'2024-10-05T11:54:45.360' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (112, 47, 5000, 5500, 33000, 1, CAST(N'2024-10-05T11:54:49.377' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (113, 47, 5000, 5500, 38500, 1, CAST(N'2024-10-05T11:54:52.817' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (114, 47, 5000, 5500, 44000, 1, CAST(N'2024-10-05T11:54:56.160' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (115, 47, 0, -4200, 39800, -1, CAST(N'2024-10-05T11:56:02.393' AS DateTime), 41)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (116, 47, 0, 4200, 44000, 0, CAST(N'2024-10-05T11:56:30.690' AS DateTime), 41)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (117, 47, 0, -20020, 23980, -1, CAST(N'2024-10-05T11:57:49.107' AS DateTime), 42)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (118, 47, 0, -1000, 22980, -1, CAST(N'2024-10-05T12:02:07.110' AS DateTime), 43)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (119, 47, 0, -3300, 19680, -1, CAST(N'2024-10-05T12:03:28.740' AS DateTime), 44)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (120, 47, 0, -8400, 11280, -1, CAST(N'2024-10-05T12:04:21.333' AS DateTime), 45)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (121, 48, 5000, 5500, 5500, 1, CAST(N'2024-10-05T13:09:05.857' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (122, 48, 5000, 5500, 11000, 1, CAST(N'2024-10-05T13:09:10.583' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (123, 48, 5000, 5500, 16500, 1, CAST(N'2024-10-05T13:09:17.003' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (124, 48, 5000, 5500, 22000, 1, CAST(N'2024-10-05T13:09:21.960' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (125, 48, 0, -600, 21400, -1, CAST(N'2024-10-05T13:09:43.260' AS DateTime), 46)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (126, 48, 5000, 5500, 26900, 1, CAST(N'2024-10-05T13:12:32.643' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (127, 48, 5000, 5500, 32400, 1, CAST(N'2024-10-05T13:12:36.793' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (128, 48, 5000, 5500, 37900, 1, CAST(N'2024-10-05T13:12:40.807' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (129, 48, 0, -24400, 13500, -1, CAST(N'2024-10-05T13:12:51.420' AS DateTime), 47)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (130, 48, 0, -4200, 9300, -1, CAST(N'2024-10-05T13:13:22.480' AS DateTime), 48)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (131, 49, 5000, 5500, 5500, 1, CAST(N'2024-10-05T13:18:12.180' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (132, 49, 5000, 5500, 11000, 1, CAST(N'2024-10-05T13:18:18.020' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (133, 49, 5000, 5500, 16500, 1, CAST(N'2024-10-05T13:18:22.093' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (134, 49, 5000, 5500, 22000, 1, CAST(N'2024-10-05T13:18:26.110' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (135, 49, 5000, 5500, 27500, 1, CAST(N'2024-10-05T13:18:30.467' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (136, 49, 5000, 5500, 33000, 1, CAST(N'2024-10-05T13:18:34.310' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (137, 49, 5000, 5500, 38500, 1, CAST(N'2024-10-05T13:18:39.023' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (138, 49, 0, -16200, 22300, -1, CAST(N'2024-10-05T13:21:10.753' AS DateTime), 49)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (139, 49, 0, -5000, 17300, -1, CAST(N'2024-10-05T13:21:49.830' AS DateTime), 50)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (140, 49, 0, -2000, 15300, -1, CAST(N'2024-10-05T13:22:05.827' AS DateTime), 51)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (141, 50, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:03:54.193' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (142, 50, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:03:58.723' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (143, 50, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:04:02.770' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (144, 50, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:04:07.580' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (145, 50, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:04:11.213' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (146, 50, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:04:14.850' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (147, 50, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:04:18.387' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (148, 50, 0, -4200, 34300, -1, CAST(N'2024-10-05T16:08:57.610' AS DateTime), 52)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (149, 50, 0, -13500, 20800, -1, CAST(N'2024-10-05T16:15:03.363' AS DateTime), 53)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (150, 50, 0, -10400, 10400, -1, CAST(N'2024-10-05T16:15:33.413' AS DateTime), 54)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (151, 50, 0, -4500, 5900, -1, CAST(N'2024-10-05T16:15:44.853' AS DateTime), 55)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (152, 50, 5000, 5500, 11400, 1, CAST(N'2024-10-05T16:15:50.517' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (153, 50, 5000, 5500, 16900, 1, CAST(N'2024-10-05T16:15:54.810' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (154, 50, 5000, 5500, 22400, 1, CAST(N'2024-10-05T16:15:58.713' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (155, 50, 5000, 5500, 27900, 1, CAST(N'2024-10-05T16:16:02.433' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (156, 50, 5000, 5500, 33400, 1, CAST(N'2024-10-05T16:16:05.853' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (157, 50, 5000, 5500, 38900, 1, CAST(N'2024-10-05T16:16:09.057' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (158, 50, 0, -21300, 17600, -1, CAST(N'2024-10-05T16:16:51.613' AS DateTime), 56)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (159, 50, 0, -4800, 12800, -1, CAST(N'2024-10-05T16:17:11.867' AS DateTime), 57)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (160, 50, 0, -6000, 6800, -1, CAST(N'2024-10-05T16:17:27.377' AS DateTime), 58)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (161, 50, 0, -1200, 5600, -1, CAST(N'2024-10-05T16:17:38.323' AS DateTime), 59)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (162, 51, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:18:05.773' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (163, 51, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:18:09.260' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (164, 51, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:18:12.200' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (165, 51, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:18:16.317' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (166, 51, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:18:20.027' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (167, 51, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:18:23.460' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (168, 51, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:18:26.430' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (169, 51, 5000, 5500, 44000, 1, CAST(N'2024-10-05T16:18:29.457' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (170, 51, 5000, 5500, 49500, 1, CAST(N'2024-10-05T16:18:33.003' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (171, 51, 5000, 5500, 55000, 1, CAST(N'2024-10-05T16:18:36.347' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (172, 51, 5000, 5500, 60500, 1, CAST(N'2024-10-05T16:18:40.273' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (173, 51, 5000, 5500, 66000, 1, CAST(N'2024-10-05T16:18:43.513' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (174, 51, 0, -27200, 38800, -1, CAST(N'2024-10-05T16:19:53.133' AS DateTime), 60)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (175, 51, 0, -22600, 16200, -1, CAST(N'2024-10-05T16:21:01.743' AS DateTime), 61)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (176, 51, 0, -2600, 13600, -1, CAST(N'2024-10-05T16:21:16.863' AS DateTime), 62)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (177, 51, 0, -3000, 10600, -1, CAST(N'2024-10-05T16:21:29.820' AS DateTime), 63)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (178, 51, 0, -1000, 9600, -1, CAST(N'2024-10-05T16:21:39.630' AS DateTime), 64)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (179, 51, 0, -1600, 8000, -1, CAST(N'2024-10-05T16:21:45.590' AS DateTime), 65)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (180, 51, 0, -4000, 4000, -1, CAST(N'2024-10-05T16:22:03.930' AS DateTime), 66)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (181, 52, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:22:32.263' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (182, 52, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:22:35.713' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (183, 52, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:22:38.797' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (184, 52, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:22:42.257' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (185, 52, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:22:45.793' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (186, 52, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:22:48.723' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (187, 52, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:22:51.860' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (188, 52, 5000, 5500, 44000, 1, CAST(N'2024-10-05T16:22:54.730' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (189, 52, 5000, 5500, 49500, 1, CAST(N'2024-10-05T16:22:57.673' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (190, 52, 5000, 5500, 55000, 1, CAST(N'2024-10-05T16:23:00.810' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (191, 52, 5000, 5500, 60500, 1, CAST(N'2024-10-05T16:23:04.267' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (192, 52, 5000, 5500, 66000, 1, CAST(N'2024-10-05T16:23:07.387' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (193, 52, 0, -16520, 49480, -1, CAST(N'2024-10-05T16:23:54.757' AS DateTime), 67)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (194, 52, 0, -25800, 23680, -1, CAST(N'2024-10-05T16:24:19.283' AS DateTime), 68)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (195, 52, 0, -10800, 12880, -1, CAST(N'2024-10-05T16:24:39.780' AS DateTime), 69)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (196, 52, 5000, 5500, 18380, 1, CAST(N'2024-10-05T16:25:39.273' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (197, 52, 5000, 5500, 23880, 1, CAST(N'2024-10-05T16:25:43.907' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (198, 52, 5000, 5500, 29380, 1, CAST(N'2024-10-05T16:25:47.827' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (199, 52, 0, -11400, 17980, -1, CAST(N'2024-10-05T16:25:51.663' AS DateTime), 70)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (200, 52, 0, -1000, 16980, -1, CAST(N'2024-10-05T16:26:05.073' AS DateTime), 71)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (201, 52, 0, -2600, 14380, -1, CAST(N'2024-10-05T16:26:19.593' AS DateTime), 72)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (202, 52, 0, -9000, 5380, -1, CAST(N'2024-10-05T16:26:42.420' AS DateTime), 73)
GO
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (203, 53, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:27:08.170' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (204, 53, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:27:11.953' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (205, 53, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:27:15.523' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (206, 53, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:27:18.980' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (207, 53, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:27:22.883' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (208, 53, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:27:26.153' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (209, 53, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:27:30.370' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (210, 53, 5000, 5500, 44000, 1, CAST(N'2024-10-05T16:27:33.713' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (211, 53, 5000, 5500, 49500, 1, CAST(N'2024-10-05T16:27:37.417' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (212, 53, 5000, 5500, 55000, 1, CAST(N'2024-10-05T16:27:41.093' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (213, 53, 5000, 5500, 60500, 1, CAST(N'2024-10-05T16:27:44.933' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (214, 53, 5000, 5500, 66000, 1, CAST(N'2024-10-05T16:27:48.097' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (215, 53, 5000, 5500, 71500, 1, CAST(N'2024-10-05T16:27:51.260' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (216, 53, 0, -25800, 45700, -1, CAST(N'2024-10-05T16:28:26.960' AS DateTime), 74)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (217, 53, 0, -13900, 31800, -1, CAST(N'2024-10-05T16:29:16.213' AS DateTime), 75)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (218, 53, 0, -2800, 29000, -1, CAST(N'2024-10-05T16:29:23.190' AS DateTime), 76)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (219, 53, 0, -3200, 25800, -1, CAST(N'2024-10-05T16:29:29.733' AS DateTime), 77)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (220, 53, 0, -3200, 22600, -1, CAST(N'2024-10-05T16:29:35.237' AS DateTime), 78)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (221, 53, 0, -1200, 21400, -1, CAST(N'2024-10-05T16:29:44.103' AS DateTime), 79)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (222, 53, 0, -10800, 10600, -1, CAST(N'2024-10-05T16:30:06.420' AS DateTime), 80)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (223, 53, 0, -1200, 9400, -1, CAST(N'2024-10-05T16:30:12.970' AS DateTime), 81)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (224, 53, 0, -600, 8800, -1, CAST(N'2024-10-05T16:30:20.187' AS DateTime), 82)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (225, 54, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:31:16.183' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (226, 54, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:31:19.790' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (227, 54, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:31:23.753' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (228, 54, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:31:27.313' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (229, 54, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:31:30.777' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (230, 54, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:31:34.397' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (231, 54, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:31:37.937' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (232, 54, 5000, 5500, 44000, 1, CAST(N'2024-10-05T16:31:41.267' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (233, 54, 5000, 5500, 49500, 1, CAST(N'2024-10-05T16:31:45.283' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (234, 54, 5000, 5500, 55000, 1, CAST(N'2024-10-05T16:31:48.667' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (235, 54, 5000, 5500, 60500, 1, CAST(N'2024-10-05T16:31:52.283' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (236, 54, 5000, 5500, 66000, 1, CAST(N'2024-10-05T16:31:55.500' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (237, 54, 5000, 5500, 71500, 1, CAST(N'2024-10-05T16:31:58.580' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (238, 54, 5000, 5500, 77000, 1, CAST(N'2024-10-05T16:32:04.457' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (239, 54, 5000, 5500, 77000, 1, CAST(N'2024-10-05T16:32:04.457' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (240, 54, 5000, 5500, 77000, 1, CAST(N'2024-10-05T16:32:04.457' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (241, 54, 5000, 5500, 82500, 1, CAST(N'2024-10-05T16:32:08.630' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (242, 54, 5000, 5500, 88000, 1, CAST(N'2024-10-05T16:32:12.397' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (243, 54, 0, -33000, 55000, -1, CAST(N'2024-10-05T16:33:20.700' AS DateTime), 83)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (244, 54, 0, -2800, 52200, -1, CAST(N'2024-10-05T16:33:27.077' AS DateTime), 84)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (245, 54, 0, -4000, 48200, -1, CAST(N'2024-10-05T16:33:33.317' AS DateTime), 85)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (246, 54, 0, -16000, 32200, -1, CAST(N'2024-10-05T16:34:21.960' AS DateTime), 86)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (247, 55, 5000, 5500, 5500, 1, CAST(N'2024-10-05T16:35:24.360' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (248, 55, 5000, 5500, 11000, 1, CAST(N'2024-10-05T16:35:28.760' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (249, 55, 5000, 5500, 16500, 1, CAST(N'2024-10-05T16:35:32.090' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (250, 55, 5000, 5500, 22000, 1, CAST(N'2024-10-05T16:35:35.637' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (251, 55, 5000, 5500, 27500, 1, CAST(N'2024-10-05T16:35:39.213' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (252, 55, 5000, 5500, 33000, 1, CAST(N'2024-10-05T16:35:42.203' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (253, 55, 5000, 5500, 38500, 1, CAST(N'2024-10-05T16:35:45.260' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (254, 55, 5000, 5500, 44000, 1, CAST(N'2024-10-05T16:35:48.397' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (255, 55, 5000, 5500, 49500, 1, CAST(N'2024-10-05T16:35:51.473' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (256, 55, 5000, 5500, 55000, 1, CAST(N'2024-10-05T16:35:55.170' AS DateTime), NULL)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (257, 55, 0, -8700, 46300, -1, CAST(N'2024-10-05T16:36:36.997' AS DateTime), 87)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (258, 55, 0, -26300, 20000, -1, CAST(N'2024-10-05T16:37:20.557' AS DateTime), 88)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (259, 55, 0, -10400, 9600, -1, CAST(N'2024-10-05T16:37:46.293' AS DateTime), 89)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (260, 55, 0, -6000, 3600, -1, CAST(N'2024-10-05T16:37:58.333' AS DateTime), 90)
INSERT [dbo].[PointHistories] ([Id], [MemberId], [Cash], [Amount], [Point], [GetPointType], [GetPointDate], [OrderId]) VALUES (261, 55, 0, -600, 3000, -1, CAST(N'2024-10-05T16:38:14.893' AS DateTime), 91)
SET IDENTITY_INSERT [dbo].[PointHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (1, N'張老師', N'', N'專注於Python程式教學', N'Chang@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (2, N'李老師', N'', N'設計專家', N'Li@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (3, N'郭老師', N'profilePic2.PNG', N'全端工程師課程講師', N'AllenKuo@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (4, N'黃老師', NULL, N'致力於教學資料庫設計超過40年', N'Hung@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (5, N'林老師', N'profilePic4.PNG', N'精通48國語言，與政府合作在語言學校教學超過30年資深經歷，使用正統母語教學法帶領學員輕鬆學習外語', N'Lin@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (8, N'陳老師', NULL, N'前台灣奧運田徑國手，精通各式運動，現已退休專職於運動項目教學', N'Chen@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (10, N'楊老師', N'profilePic4.PNG', N'國立台灣大學數學系系主任，以自己研發的"中心思想教學法"帶領學員探討數學的真理', N'Yang@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (12, N'沈老師', NULL, N'高中自然科補教界知名教師，連續數年擔任大考中心解題教師', N'Shan@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (13, N'Terry', NULL, N'年薪千萬的數據科學界權威', N'Terry@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (14, N'Sophia', N'profilePic5.PNG', N'麻省理工學院資訊工程博士，主攻演算法', N'Sophia@gmail.com')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (1, N'Chen', N'Chen123', N'123', N'Chen.jpg')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (2, N'Wu', N'Wu456', N'123', NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (3, N'Hsu', N'Hsu789', N'123', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_CartItemsUnique]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[CartItems] ADD  CONSTRAINT [IX_CartItemsUnique] UNIQUE NONCLUSTERED 
(
	[CartId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CourseCategories_Name]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[CourseCategories] ADD  CONSTRAINT [IX_CourseCategories_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseCommentsUnique]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[CourseComments] ADD  CONSTRAINT [IX_CourseCommentsUnique] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[CourseId] ASC,
	[ChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberCollectionsUnique]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[MemberCollections] ADD  CONSTRAINT [IX_MemberCollectionsUnique] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MembersEmail]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [IX_MembersEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItemsUnique]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[OrderItems] ADD  CONSTRAINT [IX_OrderItemsUnique] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Teachers_Email]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [IX_Teachers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users]    Script Date: 2024/10/05 16:43:55 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems] ADD  CONSTRAINT [DF_CartItems_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CourseCatalogs] ADD  CONSTRAINT [DF_CoursesCatalogs_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CourseCatalogs] ADD  CONSTRAINT [DF_CoursesCatalogs_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CourseChapters] ADD  CONSTRAINT [DF_CourseChapters_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CourseChapters] ADD  CONSTRAINT [DF_CourseChapters_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[CourseComments] ADD  CONSTRAINT [DF_CourseComments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[MemberCollections] ADD  CONSTRAINT [DF_MemberCollections_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[PointHistories] ADD  CONSTRAINT [DF_PointHistories_Cash]  DEFAULT ((0)) FOR [Cash]
GO
ALTER TABLE [dbo].[PointHistories] ADD  CONSTRAINT [DF_PointHistories_GetPointDate]  DEFAULT (getdate()) FOR [GetPointDate]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Courses]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Members]
GO
ALTER TABLE [dbo].[CourseCatalogs]  WITH CHECK ADD  CONSTRAINT [FK_CoursesCatalogs_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[CourseCatalogs] CHECK CONSTRAINT [FK_CoursesCatalogs_Courses]
GO
ALTER TABLE [dbo].[CourseChapters]  WITH CHECK ADD  CONSTRAINT [FK_CourseChapters_CoursesCatalogs] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[CourseCatalogs] ([Id])
GO
ALTER TABLE [dbo].[CourseChapters] CHECK CONSTRAINT [FK_CourseChapters_CoursesCatalogs]
GO
ALTER TABLE [dbo].[CourseComments]  WITH CHECK ADD  CONSTRAINT [FK_CourseComments_CourseChapters] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[CourseChapters] ([Id])
GO
ALTER TABLE [dbo].[CourseComments] CHECK CONSTRAINT [FK_CourseComments_CourseChapters]
GO
ALTER TABLE [dbo].[CourseComments]  WITH CHECK ADD  CONSTRAINT [FK_CourseComments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[CourseComments] CHECK CONSTRAINT [FK_CourseComments_Courses]
GO
ALTER TABLE [dbo].[CourseComments]  WITH CHECK ADD  CONSTRAINT [FK_CourseComments_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[CourseComments] CHECK CONSTRAINT [FK_CourseComments_Members]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CourseCategories] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseCategories]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teachers] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teachers]
GO
ALTER TABLE [dbo].[MemberCollections]  WITH CHECK ADD  CONSTRAINT [FK_MemberCollections_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[MemberCollections] CHECK CONSTRAINT [FK_MemberCollections_Courses]
GO
ALTER TABLE [dbo].[MemberCollections]  WITH CHECK ADD  CONSTRAINT [FK_MemberCollections_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MemberCollections] CHECK CONSTRAINT [FK_MemberCollections_Members]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Courses]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_Members]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_Orders]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [CK_CartsStatus] CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [CK_CartsStatus]
GO
ALTER TABLE [dbo].[CourseChapters]  WITH CHECK ADD  CONSTRAINT [CK_CourseChapters_VideoLength] CHECK  (([VideoLength]>(0)))
GO
ALTER TABLE [dbo].[CourseChapters] CHECK CONSTRAINT [CK_CourseChapters_VideoLength]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [CK_Courses_Price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [CK_Courses_Price]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [CK_Courses_Status] CHECK  (([Status]=(-1) OR [Status]=(0) OR [Status]=(1)))
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [CK_Courses_Status]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [CK_MembersGender] CHECK  (([Gender]=(3) OR [Gender]=(0) OR [Gender]=(1) OR [Gender]=(2)))
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [CK_MembersGender]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [CK_MembersPoint] CHECK  (([Point]>=(0)))
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [CK_MembersPoint]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [CK_MembersStatus] CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [CK_MembersStatus]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [CK_OrderItemsStatus] CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [CK_OrderItemsStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_OrdersStatus] CHECK  (([Status]=(1) OR [Status]=(0) OR [Status]=(-1)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_OrdersStatus]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [CK_PointHistoriesGetPointType] CHECK  (([GetPointType]=(1) OR [GetPointType]=(0) OR [GetPointType]=(-1)))
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [CK_PointHistoriesGetPointType]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [CK_PointHistoriesPoint] CHECK  (([Point]>=(0)))
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [CK_PointHistoriesPoint]
GO
/****** Object:  Trigger [dbo].[trg_UpdateCartOnCartItemChange]    Script Date: 2024/10/05 16:43:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[trg_UpdateCartOnCartItemChange]
ON [dbo].[CartItems]
AFTER INSERT, DELETE
AS
BEGIN
    -- 更新對應的 Carts 的 UpdatedDate 並重新計算 TotalAmount
    UPDATE Carts
    SET 
        UpdatedDate = GETDATE(),
        TotalAmount = (
            SELECT ISNULL(SUM(Price), 0) 
            FROM CartItems 
            WHERE CartItems.CartId = Carts.Id
        )
    WHERE Id IN (
        SELECT CartId FROM inserted
        UNION
        SELECT CartId FROM deleted
    );
END;

GO
ALTER TABLE [dbo].[CartItems] ENABLE TRIGGER [trg_UpdateCartOnCartItemChange]
GO
/****** Object:  Trigger [dbo].[trg_UpdateCourseOnCatalogChange]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateCourseOnCatalogChange]
ON [dbo].[CourseCatalogs]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- 更新對應的 Course 的 UpdatedDate
    -- 使用 DISTINCT 以避免重複更新相同的 CourseId
    UPDATE Courses
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT DISTINCT CourseId FROM inserted
        UNION
        SELECT DISTINCT CourseId FROM deleted
    );
END;
GO
ALTER TABLE [dbo].[CourseCatalogs] ENABLE TRIGGER [trg_UpdateCourseOnCatalogChange]
GO
/****** Object:  Trigger [dbo].[trg_UpdateOnCatalogUpdate]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateOnCatalogUpdate]
ON [dbo].[CourseCatalogs]
AFTER UPDATE
AS
BEGIN
    -- 更新CourseCatalogs自己的 UpdatedDate
    UPDATE CourseCatalogs
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT Id FROM inserted
    );
END;
GO
ALTER TABLE [dbo].[CourseCatalogs] ENABLE TRIGGER [trg_UpdateOnCatalogUpdate]
GO
/****** Object:  Trigger [dbo].[trg_UpdateCatalogOnChapterChange]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateCatalogOnChapterChange]
ON [dbo].[CourseChapters]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- 更新對應的 CourseCatalog 的 UpdatedDate
    -- 使用 DISTINCT 以避免重複更新相同的 CatalogId
    UPDATE CourseCatalogs
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT DISTINCT CatalogId FROM inserted
        UNION
        SELECT DISTINCT CatalogId FROM deleted
    );
END;
GO
ALTER TABLE [dbo].[CourseChapters] ENABLE TRIGGER [trg_UpdateCatalogOnChapterChange]
GO
/****** Object:  Trigger [dbo].[trg_UpdateChapterOnUpdate]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateChapterOnUpdate]
ON [dbo].[CourseChapters]
AFTER UPDATE
AS
BEGIN
    -- 更新被修改的 CourseChapters 記錄的 UpdatedDate
    UPDATE CourseChapters
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT Id FROM inserted
    );
END;
GO
ALTER TABLE [dbo].[CourseChapters] ENABLE TRIGGER [trg_UpdateChapterOnUpdate]
GO
/****** Object:  Trigger [dbo].[trg_UpdateOnCoursesUpdate]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateOnCoursesUpdate]
ON [dbo].[Courses]
AFTER UPDATE
AS
BEGIN
    -- 更新Courses自己的的 UpdatedDate
    UPDATE Courses
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT Id FROM inserted
    );
END;
GO
ALTER TABLE [dbo].[Courses] ENABLE TRIGGER [trg_UpdateOnCoursesUpdate]
GO
/****** Object:  Trigger [dbo].[trg_UpdateOrderOnOrderItemsChange]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateOrderOnOrderItemsChange]
ON [dbo].[OrderItems]
AFTER UPDATE
AS
BEGIN
    -- 更新 Orders 表的 Status 和 TotalAmount
    UPDATE Orders
    SET TotalAmount = ISNULL((
        SELECT SUM(Price)
        FROM OrderItems
        WHERE OrderId = Orders.Id
          AND Status = 1 -- 只計算狀態為1(已購入)的項目
    ), 0), -- 使用 ISNULL 來處理 NULL 值

    Status = CASE
        -- 當有 Status 為 1 和 0 的 OrderItems 時，設置為 0
        WHEN EXISTS (
            SELECT 1
            FROM OrderItems
            WHERE OrderId = Orders.Id
              AND Status = 1
        ) AND EXISTS (
            SELECT 1
            FROM OrderItems
            WHERE OrderId = Orders.Id
              AND Status = 0
        ) THEN 0 -- 部分退款
        
        -- 當只有 Status 為 0 的 OrderItems 時，設置為 -1
        WHEN NOT EXISTS (
            SELECT 1
            FROM OrderItems
            WHERE OrderId = Orders.Id
              AND Status = 1
        ) THEN -1 -- 全部退款
        
        -- 如果沒有退貨的記錄存在，且存在已購買的記錄，設置為 1
        WHEN EXISTS (
            SELECT 1
            FROM OrderItems
            WHERE OrderId = Orders.Id
              AND Status = 1
        ) THEN 1 -- 已結帳
        
        ELSE Status -- 保持原狀態
    END
    FROM Orders
    WHERE Orders.Id IN (
        SELECT DISTINCT OrderId
        FROM inserted
        UNION
        SELECT DISTINCT OrderId
        FROM deleted
    );
END;
GO
ALTER TABLE [dbo].[OrderItems] ENABLE TRIGGER [trg_UpdateOrderOnOrderItemsChange]
GO
/****** Object:  Trigger [dbo].[trg_UpdateOrderOnUpdate]    Script Date: 2024/10/05 16:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateOrderOnUpdate]
ON [dbo].[Orders]
AFTER UPDATE
AS
BEGIN
    -- 更新被修改的 Orders 記錄的 UpdatedDate
    UPDATE Orders
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT Id FROM inserted
    );
END;
GO
ALTER TABLE [dbo].[Orders] ENABLE TRIGGER [trg_UpdateOrderOnUpdate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CartId + CourseId的組合必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CartItems', @level2type=N'CONSTRAINT',@level2name=N'IX_CartItemsUnique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status只能是1(已結帳),0(未結帳)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Carts', @level2type=N'CONSTRAINT',@level2name=N'CK_CartsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'課程目錄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseCatalogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制CourseCategories的Name唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseCategories', @level2type=N'CONSTRAINT',@level2name=N'IX_CourseCategories_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'課程分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'課程章節' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseChapters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制為正整數,因為秒數不會是負數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseChapters', @level2type=N'CONSTRAINT',@level2name=N'CK_CourseChapters_VideoLength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'這邊還沒做關聯! 要fk到Users的Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseComments', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MemberId + CourseId + ChapterId 的組合必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseComments', @level2type=N'CONSTRAINT',@level2name=N'IX_CourseCommentsUnique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'課程留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CourseComments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Courses', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'課程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Courses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制Price不能為負數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Courses', @level2type=N'CONSTRAINT',@level2name=N'CK_Courses_Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制只能是1(上架),0(審核中),-1(下架)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Courses', @level2type=N'CONSTRAINT',@level2name=N'CK_Courses_Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'MemberId+CourseId的組合必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberCollections', @level2type=N'CONSTRAINT',@level2name=N'IX_MemberCollectionsUnique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'IX_MembersEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gender只能是1(男), 2(女), 3(其他),0(預設)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersGender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point不能是負數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status只能是0(被凍結)或1(啟用狀態),預設是１
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'OrderId + CourseId的組合必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'CONSTRAINT',@level2name=N'IX_OrderItemsUnique'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status只能是1(已結帳),0(退款)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderItems', @level2type=N'CONSTRAINT',@level2name=N'CK_OrderItemsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status只能是1(已結帳),0(部分退款),-1(退款)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_OrdersStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'預設為0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PointHistories', @level2type=N'COLUMN',@level2name=N'Cash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GetPointType只能是1(現金儲值)或0(退款)或-1(購買課程)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PointHistories', @level2type=N'CONSTRAINT',@level2name=N'CK_PointHistoriesGetPointType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point不可以是負數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PointHistories', @level2type=N'CONSTRAINT',@level2name=N'CK_PointHistoriesPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'要FK到Carts的ID 還沒做' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Teachers', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制Teachers的Email唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Teachers', @level2type=N'CONSTRAINT',@level2name=N'IX_Teachers_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開課老師' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Teachers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Account必須是唯一' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'CONSTRAINT',@level2name=N'IX_Users'
GO
