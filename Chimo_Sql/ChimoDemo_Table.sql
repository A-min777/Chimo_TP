USE [ChimoDemo]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_CartItemsUnique] UNIQUE NONCLUSTERED 
(
	[CartId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[CourseCatalogs]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[CourseCategories]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_CourseCategories_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseChapters]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[CourseComments]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_CourseCommentsUnique] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[CourseId] ASC,
	[ChapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[MemberCollections]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_MemberCollectionsUnique] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/09/17 3:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [varchar](70) NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_MembersEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_OrderItemsUnique] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[PointHistories]    Script Date: 2024/09/17 3:26:08 ******/
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
/****** Object:  Table [dbo].[Teachers]    Script Date: 2024/09/17 3:26:08 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Teachers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/09/17 3:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](100) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[ProfileImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Status]  DEFAULT ((0)) FOR [Status]
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
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [CK_MembersGender] CHECK  (([Gender]=NULL OR [Gender]=(-1) OR [Gender]=(0) OR [Gender]=(1)))
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
/****** Object:  Trigger [dbo].[trg_UpdateCartOnCartItemDelete]    Script Date: 2024/09/17 3:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateCartOnCartItemDelete]
ON [dbo].[CartItems]
AFTER DELETE
AS
BEGIN
    -- 更新對應的 Carts 的 UpdatedDate
    UPDATE Carts
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT CartId FROM deleted
    );
END;
GO
ALTER TABLE [dbo].[CartItems] ENABLE TRIGGER [trg_UpdateCartOnCartItemDelete]
GO
/****** Object:  Trigger [dbo].[trg_UpdateCourseOnCatalogChange]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateOnCatalogUpdate]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateCatalogOnChapterChange]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateChapterOnUpdate]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateOnCoursesUpdate]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateOnMemberUpdate]    Script Date: 2024/09/17 3:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateOnMemberUpdate]
ON [dbo].[Members]
AFTER UPDATE
AS
BEGIN
    -- 更新Members自己的的 UpdatedDate
    UPDATE Members
    SET UpdatedDate = GETDATE()
    WHERE Id IN (
        SELECT Id FROM inserted
    );
END;
GO
ALTER TABLE [dbo].[Members] ENABLE TRIGGER [trg_UpdateOnMemberUpdate]
GO
/****** Object:  Trigger [dbo].[trg_UpdateOrderOnOrderItemsChange]    Script Date: 2024/09/17 3:26:09 ******/
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
/****** Object:  Trigger [dbo].[trg_UpdateOrderOnUpdate]    Script Date: 2024/09/17 3:26:09 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gender只能是1(男), 0(女), -1(其他),或null' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersGender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point不能是負數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status只能是0(被凍結)或1(啟用狀態),預設是0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'CONSTRAINT',@level2name=N'CK_MembersStatus'
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
