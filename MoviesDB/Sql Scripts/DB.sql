USE [MoviesDB1]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[EntertainmentId] [int] NOT NULL,
	[UserId] [int] NULL,
	[ReplyId] [int] NOT NULL,
	[LikesCount] [int] NULL,
	[DisLikesCount] [int] NULL,
	[CreationDate] [date] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ent_Genre]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ent_Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Entertainment_Id] [int] NOT NULL,
	[Genre_Id] [int] NOT NULL,
 CONSTRAINT [PK_Ent_Genre_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entertainments]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entertainments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Release_Year] [nvarchar](max) NULL,
	[Duration] [nvarchar](max) NULL,
	[Image_Cover] [nvarchar](max) NULL,
	[Item_Type] [nvarchar](max) NULL,
	[Director_Id] [int] NULL,
	[Ratings] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Entertainments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/21/2023 11:36:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Created_Date] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[isDeleted] [bit] NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (1, N'Comment 1', 1, 2, 0, 10, 5, NULL)
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (2, N'Comment 2', 1, 2, 0, 14, 17, NULL)
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (3, N'Comment 3', 1, 2, 0, 2, 7, NULL)
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (4, N'Reply1 to comment 1', 1, 2, 1, 5, 0, NULL)
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (5, N'Reply2 to comment 1', 1, 2, 1, 7, 3, NULL)
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (6, N'test comment', 1, 2, 0, NULL, NULL, CAST(N'2023-06-21' AS Date))
GO
INSERT [dbo].[Comments] ([Id], [Comment], [EntertainmentId], [UserId], [ReplyId], [LikesCount], [DisLikesCount], [CreationDate]) VALUES (7, N'aa', 3, 2, 0, NULL, NULL, CAST(N'2023-06-21' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (1, N'Matt Reeves', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (2, N'Joseph Kosinski', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (3, N'Colin Trevorrow', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (4, N'Angus MacLane', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (5, N'James Gunn', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (6, N'Peyton Reed', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (7, N'Ryan Coogler', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (8, N'Andy Muschietti', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (9, N'Chad Stahelski', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (10, N'Christopher Nolan', 0)
GO
INSERT [dbo].[Directors] ([Id], [Name], [isDeleted]) VALUES (11, N'Joaquim Dos Santos', 0)
GO
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[Ent_Genre] ON 
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (2, 1, 4)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (3, 1, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (5, 2, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (6, 3, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (7, 3, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (8, 3, 10)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (9, 4, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (10, 4, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (11, 4, 2)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (12, 4, 3)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (13, 4, 14)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (14, 5, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (15, 5, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (16, 5, 3)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (17, 5, 16)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (18, 6, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (19, 6, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (20, 6, 3)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (21, 6, 16)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (22, 7, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (23, 7, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (24, 7, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (25, 7, 6)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (26, 8, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (27, 8, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (28, 8, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (29, 8, 6)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (30, 9, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (31, 9, 4)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (32, 9, 11)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (33, 10, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (34, 10, 7)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (35, 10, 18)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (36, 11, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (37, 11, 13)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (38, 11, 2)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (39, 11, 3)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (40, 11, 4)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (41, 11, 5)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (42, 11, 6)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (44, 11, 16)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (45, 17, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (46, 17, 11)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (47, 18, 1)
GO
INSERT [dbo].[Ent_Genre] ([Id], [Entertainment_Id], [Genre_Id]) VALUES (48, 18, 3)
GO
SET IDENTITY_INSERT [dbo].[Ent_Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Entertainments] ON 
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (1, N'The Batman', N'A gritty and dark take on the Caped Crusader, starring Robert Pattinson.', N'2022-01-01', N'2h 56m', N'TheBatMan.jpg', NULL, 1, N'8.2', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (2, N'Top Gun: Maverick', N'Tom Cruise returns as Pete "Maverick" Mitchell in this sequel to the 1986 hit.', N'2022-02-01', N'2h 11m', N'Top_Gun_Maverick.jpg', NULL, 2, N'9.3', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (3, N'Jurassic World Dominion', N'The third and final film in the Jurassic World trilogy brings back the original cast from Jurassic Park.', N'2022-03-01', N'2h 27m', N'Jurassic_World_Dominion.jpg', NULL, 3, N'5.7', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (4, N'Lightyear', N'The origin story of Buzz Lightyear, the space ranger who inspired the toy.', N'2022-04-01', N'1h 45m', N'Lightyear.jpg', NULL, 4, N'6.8', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (5, N'Guardians of the Galaxy Vol. 3', N'The Guardians of the Galaxy return for another adventure, this time to face off against Adam Warlock.', N'2023-01-01', N'2h 30m', N'Guardians_of_the_Galaxy_Vol_3.jpg', NULL, 5, N'8.1', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (6, N'Ant-Man and the Wasp: Quantumania', N'Scott Lang and Hope van Dyne return to take on Kang the Conqueror.', N'2023-02-01', N'1h 55m', N'Ant-Man_and_the_Wasp_Quantumania.jpg', NULL, 6, N'7.9', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (7, N'Black Panther: Wakanda Forever', N'The sequel to Black Panther sees the return of T''Challa and the Dora Milaje.', N'2022-05-01', N'2h 15m', N'Black_Panther_Wakanda_Foreve.jpg', NULL, 7, N'6.9', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (8, N'The Flash', N'Ezra Miller stars as Barry Allen, a.k.a. the Flash, in this solo film.', N'2023-03-01', N'2h 23m', N'The_Flash.jpg', NULL, 8, N'6.7', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (9, N'John Wick: Chapter 4', N'Keanu Reeves returns as John Wick in this fourth installment of the franchise.', N'2023-04-01', N'2h 10m', N'John_Wick_Chapter_4.jpg', NULL, 9, N'7.8', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (10, N'Oppenheimer', N'Cillian Murphy stars as J. Robert Oppenheimer, the scientist who led the Manhattan Project.', N'2023-05-01', N'2h 40m', N'Oppenheimer.jpg', NULL, 10, N'7.5', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (11, N'Spider-Man: Across the Spider-Verse', N'The sequel to the critically acclaimed animated film sees Miles Morales team up with Gwen Stacy and other Spider-People from across the multiverse.', N'2023-06-01', N'1h 45m', N'Spider-Man_ Across_the_Spider-Verse.jpg', NULL, 11, N'9.1', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (12, N'Blacklight ', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, NULL, N'7.5', 1)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (13, N'Blacklight ', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, NULL, N'6.7', 1)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (14, N'Blacklight ', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.
', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (15, N'Blacklight', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (16, N'Blacklight ', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (17, N'Blacklight ', N'Political activist Sofia Flores speaks at a rally in Washington, D.C. about women''s and racial equality. That evening, she is killed in a deliberately planned hit-and-run outside of her home.', N'2022', N'1h 48m', N'Blacklight.jpg', NULL, 1, N'6.7', 0)
GO
INSERT [dbo].[Entertainments] ([Id], [Title], [Description], [Release_Year], [Duration], [Image_Cover], [Item_Type], [Director_Id], [Ratings], [IsDeleted]) VALUES (18, N'Operation Fortune: Ruse de Guerre', N'Special agent Orson Fortune and his team of operatives recruit one of Hollywood''s biggest movie stars to help them on an undercover mission when the sale of a deadly new weapons technology threatens to disrupt the world order.

', N'2023', N'1h 54m', N'operation_fortune_ruse_de_guerre[1].jpg', NULL, 1, N'6.3', 0)
GO
SET IDENTITY_INSERT [dbo].[Entertainments] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (1, N'Action', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (2, N'Animation', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (3, N'Comedy', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (4, N'Crime', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (5, N'Drama', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (6, N'Fantasy', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (7, N'History', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (8, N'Horror', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (9, N'Romance', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (10, N'Science-fiction', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (11, N'Thriller', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (12, N'Western', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (13, N'Adventure', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (14, N'Family', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (16, N'Sci-Fi', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (18, N'War', 0)
GO
INSERT [dbo].[Genres] ([Id], [Name], [IsDeleted]) VALUES (20, N'Mystery', 0)
GO
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Created_Date], [IsActive], [isDeleted], [RoleId]) VALUES (2, N'sameer', N'sameer123', N'almutairi.sameer@hotmail.com', CAST(N'2023-06-10' AS Date), 1, 0, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Created_Date], [IsActive], [isDeleted], [RoleId]) VALUES (3, N'sameer1', N'123', N'almutairi.sameer@hotmail.com', CAST(N'2023-06-10' AS Date), 1, 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Entertainments] FOREIGN KEY([EntertainmentId])
REFERENCES [dbo].[Entertainments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Entertainments]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Ent_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Ent_Genre_Entertainments] FOREIGN KEY([Entertainment_Id])
REFERENCES [dbo].[Entertainments] ([Id])
GO
ALTER TABLE [dbo].[Ent_Genre] CHECK CONSTRAINT [FK_Ent_Genre_Entertainments]
GO
ALTER TABLE [dbo].[Ent_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Ent_Genre_Genre] FOREIGN KEY([Genre_Id])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Ent_Genre] CHECK CONSTRAINT [FK_Ent_Genre_Genre]
GO
ALTER TABLE [dbo].[Entertainments]  WITH CHECK ADD  CONSTRAINT [FK_Entertainments_directors] FOREIGN KEY([Director_Id])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Entertainments] CHECK CONSTRAINT [FK_Entertainments_directors]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
