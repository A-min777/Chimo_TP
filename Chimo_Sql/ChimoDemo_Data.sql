USE [ChimoDemo]
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (1, N'張老師', N'image1.jpg', N'專注於編程教學', N'teacher1@example.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (2, N'李老師', N'image2.jpg', N'設計專家', N'teacher2@example.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (3, N'郭老師', NULL, N'全端工程師課程講師', N'AllenKuo@gmail.com')
INSERT [dbo].[Teachers] ([Id], [Name], [ProfileImage], [Intro], [Email]) VALUES (4, N'黃老師', NULL, N'致力於教學SSMS資料庫超過40年', N'Hung@gmail.com')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCategories] ON 

INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (1, N'編程', 2)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (2, N'設計', 1)
INSERT [dbo].[CourseCategories] ([Id], [Name], [DisplayOrder]) VALUES (3, N'數據科學', 3)
SET IDENTITY_INSERT [dbo].[CourseCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 1, N'Python 程式設計入門', N'學習 Python 的基本概念和語法', 300, N'thumbnail1.jpg', 1, CAST(N'2024-09-11T01:57:31.220' AS DateTime), CAST(N'2024-09-17T02:14:05.627' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 2, N'平面設計基礎', N'學習平面設計的基本技巧', 500, N'thumbnail2.jpg', 1, CAST(N'2024-09-11T01:57:31.220' AS DateTime), CAST(N'2024-09-11T01:57:31.220' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 1, 3, N'C#入門', N'教授C#程式語言基礎語法', 4200, N'C#.jpg', 1, CAST(N'2024-09-11T02:15:18.367' AS DateTime), CAST(N'2024-09-11T02:15:18.367' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, 1, 3, N'ADO.NET', N'教授使用ADO.NET存取資料庫', 2200, N'ADO.jpg', 0, CAST(N'2024-09-11T02:17:57.800' AS DateTime), CAST(N'2024-09-11T02:17:57.800' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, 1, 3, N'Dapper', N'教授使用Dapper存取資料庫', 1600, N'Dapper.jpg', 1, CAST(N'2024-09-11T02:19:15.400' AS DateTime), CAST(N'2024-09-17T01:44:06.787' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, 1, 4, N'SSMS入門', N'初入SSMS認識資料庫', 3200, N'SSMS.jpg', 1, CAST(N'2024-09-11T02:20:18.247' AS DateTime), CAST(N'2024-09-11T02:20:18.247' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (11, 1, 3, N'JavaScript入門', N'介紹JavaScript', 2800, N'JS.jpg', 1, CAST(N'2024-09-15T22:45:20.163' AS DateTime), CAST(N'2024-09-15T22:45:20.163' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (12, 1, 4, N'MySQL入門', N'介紹MySQL', 850, N'MySql.jpg', 0, CAST(N'2024-09-15T22:46:13.980' AS DateTime), CAST(N'2024-09-15T22:46:13.980' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (13, 1, 1, N'爬蟲入門', N'介紹爬蟲', 1200, N'爬蟲.jpg', 0, CAST(N'2024-09-15T22:47:05.057' AS DateTime), CAST(N'2024-09-15T22:47:05.057' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (14, 1, 3, N'CSS入門', N'介紹CSS', 600, N'CSS.jpg', 0, CAST(N'2024-09-15T22:47:36.180' AS DateTime), CAST(N'2024-09-15T22:47:36.180' AS DateTime))
INSERT [dbo].[Courses] ([Id], [CategoryId], [TeacherId], [Title], [Description], [Price], [Thumbnail], [Status], [CreatedDate], [UpdatedDate]) VALUES (15, 1, 3, N'html入門', N'介紹html', 480, N'html.jpg', 0, CAST(N'2024-09-15T22:47:54.817' AS DateTime), CAST(N'2024-09-15T22:47:54.817' AS DateTime))
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCatalogs] ON 

INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Python基礎', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T02:11:27.983' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'進階 Python', 2, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-11T01:57:31.223' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (3, 2, N'設計原則', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-11T01:57:31.223' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (4, 3, N'C#裡的變數', 1, CAST(N'2024-09-11T02:36:57.043' AS DateTime), CAST(N'2024-09-11T02:36:57.043' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (5, 3, N'if及else', 2, CAST(N'2024-09-11T02:37:21.317' AS DateTime), CAST(N'2024-09-11T02:37:21.317' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (6, 3, N'迴圈', 3, CAST(N'2024-09-11T02:37:30.767' AS DateTime), CAST(N'2024-09-11T02:37:30.767' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (7, 3, N'函式', 4, CAST(N'2024-09-11T02:37:59.040' AS DateTime), CAST(N'2024-09-11T02:37:59.040' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (8, 3, N'類別', 5, CAST(N'2024-09-11T02:38:13.000' AS DateTime), CAST(N'2024-09-11T02:38:13.000' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (9, 7, N'ADO介紹', 1, CAST(N'2024-09-11T02:38:55.443' AS DateTime), CAST(N'2024-09-11T02:38:55.443' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (10, 9, N'Dapper介紹', 1, CAST(N'2024-09-11T02:39:13.070' AS DateTime), CAST(N'2024-09-11T02:39:13.070' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (11, 9, N'Dapper應用', 2, CAST(N'2024-09-11T02:39:22.503' AS DateTime), CAST(N'2024-09-11T02:39:22.503' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (12, 10, N'SSMS介紹', 1, CAST(N'2024-09-11T02:39:34.973' AS DateTime), CAST(N'2024-09-11T02:39:34.973' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (14, 10, N'T-SQL語法', 2, CAST(N'2024-09-11T02:39:56.997' AS DateTime), CAST(N'2024-09-11T02:39:56.997' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (15, 10, N'建資料表', 3, CAST(N'2024-09-11T02:40:30.343' AS DateTime), CAST(N'2024-09-11T02:40:30.343' AS DateTime))
INSERT [dbo].[CourseCatalogs] ([Id], [CourseId], [Name], [DisplayOrder], [CreatedDate], [UpdatedDate]) VALUES (16, 10, N'SSMS綜合應用', 3, CAST(N'2024-09-11T02:40:54.453' AS DateTime), CAST(N'2024-09-11T02:40:54.453' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseCatalogs] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseChapters] ON 

INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Python 介紹', 1, N'介紹 Python 語言的特點', N'http://video1.com', 670, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T02:10:37.790' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'變數和類型', 2, N'學習 Python 的變數和數據類型', N'http://video2.com', 600, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-11T01:57:31.223' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (3, 2, N'進階Python應用', 1, N'使用更深入技術撰寫Python', N'http://video3.com', 600, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-11T01:57:31.223' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (4, 3, N'基本設計原則介紹', 1, N'介紹一些基本的設計原則', N'http://design.com', 720, CAST(N'2024-09-11T02:44:35.083' AS DateTime), CAST(N'2024-09-11T02:44:35.083' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (5, 4, N'宣告變數', 1, N'示範如何使用C#宣告變數', N'http://variable.com', 224, CAST(N'2024-09-11T02:45:27.910' AS DateTime), CAST(N'2024-09-11T02:45:27.910' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (6, 5, N'使用if&else', 1, N'示範如何使用if else', N'https://ifelse.com', 427, CAST(N'2024-09-11T02:46:19.097' AS DateTime), CAST(N'2024-09-11T02:46:19.097' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (7, 6, N'使用迴圈while', 1, N'示範如何使用while', N'https://while.com', 212, CAST(N'2024-09-11T02:47:08.270' AS DateTime), CAST(N'2024-09-11T02:47:08.270' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (8, 6, N'使用迴圈for', 2, N'示範如何使用for', N'https://for.com', 174, CAST(N'2024-09-11T02:47:33.767' AS DateTime), CAST(N'2024-09-11T02:47:33.767' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (9, 6, N'使用迴圈foreach', 3, N'示範如何使用foreach', N'https://foreach.com', 328, CAST(N'2024-09-11T02:47:56.197' AS DateTime), CAST(N'2024-09-11T02:47:56.197' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (10, 7, N'函式介紹', 1, N'介紹什麼是函式', N'https://function.com', 1323, CAST(N'2024-09-11T02:48:54.850' AS DateTime), CAST(N'2024-09-11T02:48:54.850' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (12, 8, N'類別較紹', 1, N'介紹什麼是class', N'https://class.com', 742, CAST(N'2024-09-11T02:49:40.987' AS DateTime), CAST(N'2024-09-11T02:49:40.987' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (14, 9, N'介紹ADO.NET', 1, N'介紹ADO.NET如何運作', N'https://ADO.com', 2343, CAST(N'2024-09-11T02:50:23.550' AS DateTime), CAST(N'2024-09-11T02:50:23.550' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (15, 10, N'Dapper基礎', 1, N'介紹一些Dapper基礎', N'https://Dapperbase.com', 1742, CAST(N'2024-09-11T02:51:13.333' AS DateTime), CAST(N'2024-09-11T02:51:13.333' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (16, 11, N'Dapper應用', 1, N'示範更深入的Dapper應用', N'https://Dapperadvance.com', 2224, CAST(N'2024-09-11T02:52:12.030' AS DateTime), CAST(N'2024-09-11T02:52:12.030' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (17, 12, N'SSMS介紹', 1, N'初探SSMS', N'https://ssms.com', 1485, CAST(N'2024-09-11T02:52:42.710' AS DateTime), CAST(N'2024-09-11T02:52:42.710' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (18, 14, N'T-SQL語法介紹', 1, N'介紹T-SQL語法並大致比較與其他SQL語法的差異', N'https://tsql.com', 1414, CAST(N'2024-09-11T02:53:29.257' AS DateTime), CAST(N'2024-09-11T02:53:29.257' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (19, 15, N'建資料表UI', 1, N'介紹如何使用SSMS的UI界面建資料表', N'https://ssmsui.com', 1963, CAST(N'2024-09-11T02:54:29.717' AS DateTime), CAST(N'2024-09-11T02:54:29.717' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (20, 15, N'建資料表TSQL', 2, N'介紹如何使用SQL語法在SSMS建立資料表', N'https://ssmssql.com', 2030, CAST(N'2024-09-11T02:55:08.287' AS DateTime), CAST(N'2024-09-11T02:55:08.287' AS DateTime))
INSERT [dbo].[CourseChapters] ([Id], [CatalogId], [Name], [DisplayOrder], [Description], [VideoURL], [VideoLength], [CreatedDate], [UpdatedDate]) VALUES (21, 16, N'SSMS綜合應用', 1, N'給予多個實際例子示範SSMS在各個專案上的應用', N'https://ssmsapplication', 2332, CAST(N'2024-09-11T02:56:26.000' AS DateTime), CAST(N'2024-09-11T02:56:26.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseChapters] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, N'王小明', N'member1@example.com', N'password1', 3800, N'profile1.jpg', N'熱愛學習', N'台北市', 1, N'0912345678', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T02:14:41.260' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (7, N'李小華', N'member2@example.com', N'password2', 200, N'profile2.jpg', N'設計愛好者', N'新北市', 1, N'0987654321', 1, CAST(N'2024-09-11T01:57:31.223' AS DateTime), CAST(N'2024-09-17T03:14:18.030' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (8, N'老陳', N'LaoChen@gmail.com', N'LaoChen134', 0, NULL, N'我不愛學習', NULL, -1, NULL, 0, CAST(N'2024-09-11T02:23:23.787' AS DateTime), CAST(N'2024-09-11T02:23:23.787' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (9, N'黃Mary', N'MaryHung@gmail.com', N'MH0622', 42000, N'MH.jpg', N'想成為工程師', N'宜蘭市', 0, NULL, 1, CAST(N'2024-09-11T02:25:47.757' AS DateTime), CAST(N'2024-09-11T02:25:47.757' AS DateTime))
INSERT [dbo].[Members] ([Id], [Name], [Email], [Password], [Point], [ProfileImage], [Intro], [Address], [Gender], [Phone], [Status], [CreatedDate], [UpdatedDate]) VALUES (10, N'阿貓', N'Mao@gmail.com', N'Meow123', 3200, N'Meow.jpg', N'Meow', N'Meow City', 0, N'0962633457', 1, CAST(N'2024-09-11T02:27:22.140' AS DateTime), CAST(N'2024-09-11T02:27:22.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[Members] OFF
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
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (2, 6, 300, 1, CAST(N'2024-09-11T02:01:21.077' AS DateTime), CAST(N'2024-09-11T02:01:21.077' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 7, 500, 1, CAST(N'2024-09-11T02:01:21.077' AS DateTime), CAST(N'2024-09-11T02:01:21.077' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (4, 9, 4200, 0, CAST(N'2024-09-11T03:12:23.610' AS DateTime), CAST(N'2024-09-17T03:07:03.583' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (5, 10, 7400, 0, CAST(N'2024-09-11T03:13:00.450' AS DateTime), CAST(N'2024-09-17T03:06:36.087' AS DateTime))
INSERT [dbo].[Orders] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, 9, 0, -1, CAST(N'2024-09-11T03:14:05.427' AS DateTime), CAST(N'2024-09-17T03:07:12.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
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
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
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
SET IDENTITY_INSERT [dbo].[PointHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (3, 6, 300, 0, CAST(N'2024-09-11T02:00:02.057' AS DateTime), CAST(N'2024-09-11T02:00:02.057' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (4, 7, 500, 0, CAST(N'2024-09-11T02:00:02.057' AS DateTime), CAST(N'2024-09-11T02:00:02.057' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (5, 9, 5800, 1, CAST(N'2024-09-11T02:30:42.530' AS DateTime), CAST(N'2024-09-11T02:30:42.530' AS DateTime))
INSERT [dbo].[Carts] ([Id], [MemberId], [TotalAmount], [Status], [CreatedDate], [UpdatedDate]) VALUES (6, 10, 9000, 1, CAST(N'2024-09-11T02:33:44.987' AS DateTime), CAST(N'2024-09-11T02:33:44.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carts] OFF
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
SET IDENTITY_INSERT [dbo].[MemberCollections] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (2, 3, 1, 300, CAST(N'2024-09-11T02:00:38.297' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (3, 4, 2, 500, CAST(N'2024-09-11T02:00:38.297' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (4, 5, 3, 4200, CAST(N'2024-09-11T02:31:50.927' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (5, 5, 9, 1600, CAST(N'2024-09-11T02:32:06.903' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (6, 6, 3, 4200, CAST(N'2024-09-11T02:34:25.107' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (7, 6, 9, 1600, CAST(N'2024-09-11T02:34:32.870' AS DateTime))
INSERT [dbo].[CartItems] ([Id], [CartId], [CourseId], [Price], [CreatedDate]) VALUES (8, 6, 10, 3200, CAST(N'2024-09-11T02:34:47.270' AS DateTime))
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (1, N'Chen', N'Chen123', N'123', N'Chen.jpg')
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (2, N'Wu', N'Wu456', N'123', NULL)
INSERT [dbo].[Users] ([Id], [Name], [Account], [Password], [ProfileImage]) VALUES (3, N'Hsu', N'Hsu789', N'123', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
