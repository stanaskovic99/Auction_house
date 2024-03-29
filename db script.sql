USE [master]
GO
/****** Object:  Database [AukcijskaKuca_DB]    Script Date: 02/06/2022 18:48:26 ******/
CREATE DATABASE [AukcijskaKuca_DB] ON  PRIMARY 
( NAME = N'AukcijskaKuca_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AukcijskaKuca_DB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AukcijskaKuca_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AukcijskaKuca_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AukcijskaKuca_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AukcijskaKuca_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET  MULTI_USER 
GO
ALTER DATABASE [AukcijskaKuca_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AukcijskaKuca_DB] SET DB_CHAINING OFF 
GO
USE [AukcijskaKuca_DB]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleId] [uniqueidentifier] NOT NULL,
	[ArticleName] [nvarchar](256) NOT NULL,
	[EstimatedAge] [int] NOT NULL,
	[Damaged] [bit] NOT NULL,
	[StartPrice] [float] NOT NULL,
	[Comment] [nvarchar](256) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticlePerAuction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlePerAuction](
	[AuctionId] [uniqueidentifier] NOT NULL,
	[ArticleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ArticlePerAuction] PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC,
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionId] [uniqueidentifier] NOT NULL,
	[AuctionName] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TimeStart] [time](7) NOT NULL,
	[TimeEnd] [time](7) NOT NULL,
 CONSTRAINT [PK_Auctions] PRIMARY KEY CLUSTERED 
(
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferedPrices]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferedPrices](
	[Id] [uniqueidentifier] NOT NULL,
	[ArticleId] [uniqueidentifier] NOT NULL,
	[AuctionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[OfferedPrice] [float] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_OfferedPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ArticleId] ASC,
	[AuctionId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[DateBirth] [datetime] NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordC] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[Approved] [bit] NULL,
	[Rejected] [bit] NULL,
 CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Winners]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Winners](
	[NumId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ArticleId] [uniqueidentifier] NOT NULL,
	[AuctionId] [uniqueidentifier] NOT NULL,
	[OfferedPrice] [float] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Winners_1] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC,
	[AuctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[ArticlePerAuction]  WITH CHECK ADD  CONSTRAINT [FK_ArticlePerAuction_Article] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Article] ([ArticleId])
GO
ALTER TABLE [dbo].[ArticlePerAuction] CHECK CONSTRAINT [FK_ArticlePerAuction_Article]
GO
ALTER TABLE [dbo].[ArticlePerAuction]  WITH CHECK ADD  CONSTRAINT [FK_ArticlePerAuction_Auction] FOREIGN KEY([AuctionId])
REFERENCES [dbo].[Auction] ([AuctionId])
GO
ALTER TABLE [dbo].[ArticlePerAuction] CHECK CONSTRAINT [FK_ArticlePerAuction_Auction]
GO
ALTER TABLE [dbo].[OfferedPrices]  WITH CHECK ADD  CONSTRAINT [FK_OfferedPrices_ArticlePerAuction] FOREIGN KEY([AuctionId], [ArticleId])
REFERENCES [dbo].[ArticlePerAuction] ([AuctionId], [ArticleId])
GO
ALTER TABLE [dbo].[OfferedPrices] CHECK CONSTRAINT [FK_OfferedPrices_ArticlePerAuction]
GO
ALTER TABLE [dbo].[OfferedPrices]  WITH CHECK ADD  CONSTRAINT [FK_OfferedPrices_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[OfferedPrices] CHECK CONSTRAINT [FK_OfferedPrices_Users]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Winners]  WITH CHECK ADD  CONSTRAINT [FK_Winners_OfferedPrices] FOREIGN KEY([NumId], [ArticleId], [AuctionId], [UserId])
REFERENCES [dbo].[OfferedPrices] ([Id], [ArticleId], [AuctionId], [UserId])
GO
ALTER TABLE [dbo].[Winners] CHECK CONSTRAINT [FK_Winners_OfferedPrices]
GO
/****** Object:  StoredProcedure [dbo].[Article_CreateArticle]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Article_CreateArticle]
    @ArticleName         nvarchar(256),
	@EstimatedAge        int,
	@Damaged             bit,
	@StartPrice          float,
	@Comment             nvarchar(256)
AS
BEGIN
    DECLARE  @ArticleId  uniqueidentifier
    SET @ArticleId = NEWID()

    BEGIN
        IF( EXISTS( SELECT ArticleId FROM dbo.Article
                    WHERE @ArticleId = ArticleId ) )
            RETURN -1
    END

    INSERT dbo.Article (ArticleId,ArticleName, EstimatedAge,Damaged,StartPrice,Comment)
    VALUES (@ArticleId,@ArticleName,@EstimatedAge,@Damaged,@StartPrice,@Comment)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Article_DeleteArticle]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Article_DeleteArticle]
	@ArticleId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT ArticleId FROM dbo.Article WHERE @ArticleId = ArticleId ) )
    BEGIN
		DELETE FROM dbo.Article WHERE ArticleId = @ArticleId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Article_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Article_Get]
	
AS
BEGIN
    
	SELECT * FROM dbo.Article ORDER BY ArticleName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Article_GetArticleByDamaged]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Article_GetArticleByDamaged]
	@Damaged bit
AS
BEGIN
    
	SELECT * FROM dbo.Article WHERE @Damaged = Damaged

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Article_GetArticleById]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Article_GetArticleById]
	@ArticleId uniqueidentifier
AS
BEGIN
    
	SELECT * FROM dbo.Article WHERE @ArticleId = ArticleId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Article_GetArticleByName]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Article_GetArticleByName]
	@ArticleName nvarchar(256)
AS
BEGIN
    
	SELECT * FROM dbo.Article WHERE @ArticleName = ArticleName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Article_UpdateArticle]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Article_UpdateArticle]
	@ArticleName         nvarchar(256),
	@EstimatedAge        int,
	@Damaged             bit,
	@StartPrice          float,
	@Comment             nvarchar(256),
    @ArticleId           uniqueidentifier 
AS
BEGIN
    IF( EXISTS( SELECT ArticleId FROM dbo.Article WHERE @ArticleId = ArticleId ) )
    BEGIN
		UPDATE dbo.Article
		SET ArticleName  = @ArticleName ,
			EstimatedAge = @EstimatedAge,
			Damaged      = @Damaged     ,
			StartPrice   = @StartPrice  ,
			Comment      = @Comment     			
		WHERE ArticleId    = @ArticleId   

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_Create]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_Create]
    @ArticleId         uniqueidentifier,
	@AuctionId        uniqueidentifier
AS
BEGIN
    BEGIN
        IF( EXISTS( SELECT * FROM dbo.ArticlePerAuction
                    WHERE @ArticleId = ArticleId and @AuctionId = AuctionId ) )
            RETURN -1
    END

    INSERT dbo.ArticlePerAuction (ArticleId,AuctionId)
    VALUES (@ArticleId,@AuctionId)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_Delete]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_Delete]
    @ArticleId         uniqueidentifier,
	@AuctionId        uniqueidentifier
AS
BEGIN
    BEGIN
        IF( EXISTS( SELECT * FROM dbo.ArticlePerAuction
                    WHERE @ArticleId = ArticleId and @AuctionId = AuctionId ) )
            DELETE FROM dbo.ArticlePerAuction WHERE @ArticleId = ArticleId and @AuctionId = AuctionId

			RETURN 0
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_Get]
AS
BEGIN

	SELECT au.AuctionName,ar.ArticleName, aa.ArticleId, aa.AuctionId FROM dbo.ArticlePerAuction aa
	join [dbo].[Auction] au on au.AuctionId = aa.AuctionId
	join [dbo].[Article] ar on ar.ArticleId = aa.ArticleId

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetArticleToBid]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetArticleToBid]
AS
BEGIN

	DECLARE @NowTime datetime
	set @NowTime = getdate()	
   
	select au.AuctionName, au.TimeStart, au.TimeEnd, ar.ArticleName, ar.EstimatedAge, ar.Damaged,
	ar.StartPrice, ar.Comment, apa.AuctionId, apa.ArticleId
	from [dbo].[ArticlePerAuction] apa 
	join [dbo].[Auction] au on au.AuctionId = apa.AuctionId
	join Article ar on ar.ArticleId = APA.ArticleId
	where convert(datetime,au.TimeStart) + au.Date < @NowTime and
	convert(datetime,au.TimeEnd) + au.Date > @NowTime

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetArticleToBid_0]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetArticleToBid_0]
	@minAge int,
	@minPrice float,
	@Damaged bit
AS
BEGIN
	DECLARE @NowTime datetime
	set @NowTime = getdate()	
   
	select au.AuctionName, au.TimeStart, au.TimeEnd, ar.ArticleName, ar.EstimatedAge, ar.Damaged,
	ar.StartPrice, ar.Comment, apa.AuctionId, apa.ArticleId
	from [dbo].[ArticlePerAuction] apa 
	join [dbo].[Auction] au on au.AuctionId = apa.AuctionId
	join Article ar on ar.ArticleId = APA.ArticleId
	where convert(datetime,au.TimeStart) + au.Date < @NowTime and
	convert(datetime,au.TimeEnd) + au.Date > @NowTime and
	@minAge < ar.EstimatedAge and @minPrice < ar.StartPrice and @Damaged = ar.Damaged

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetArticleToBid_1]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetArticleToBid_1]
	@minAge int,
	@minPrice float,
	@Damaged bit,
	@maxAge int
AS
BEGIN
	DECLARE @NowTime datetime
	set @NowTime = getdate()	
   
	select au.AuctionName, au.TimeStart, au.TimeEnd, ar.ArticleName, ar.EstimatedAge, ar.Damaged,
	ar.StartPrice, ar.Comment, apa.AuctionId, apa.ArticleId
	from [dbo].[ArticlePerAuction] apa 
	join [dbo].[Auction] au on au.AuctionId = apa.AuctionId
	join Article ar on ar.ArticleId = APA.ArticleId
	where convert(datetime,au.TimeStart) + au.Date < @NowTime and
	convert(datetime,au.TimeEnd) + au.Date > @NowTime and
	@minAge < ar.EstimatedAge and @minPrice < ar.StartPrice and @Damaged = ar.Damaged
	and @maxAge > ar.EstimatedAge

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetArticleToBid_2]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetArticleToBid_2]
	@minAge int,
	@minPrice float,
	@Damaged bit,
	@maxPrice int
AS
BEGIN
	DECLARE @NowTime datetime
	set @NowTime = getdate()	
   
	select au.AuctionName, au.TimeStart, au.TimeEnd, ar.ArticleName, ar.EstimatedAge, ar.Damaged,
	ar.StartPrice, ar.Comment, apa.AuctionId, apa.ArticleId
	from [dbo].[ArticlePerAuction] apa 
	join [dbo].[Auction] au on au.AuctionId = apa.AuctionId
	join Article ar on ar.ArticleId = APA.ArticleId
	where convert(datetime,au.TimeStart) + au.Date < @NowTime and
	convert(datetime,au.TimeEnd) + au.Date > @NowTime and
	@minAge < ar.EstimatedAge and @minPrice < ar.StartPrice and @Damaged = ar.Damaged
	and @maxPrice > ar.StartPrice

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetArticleToBid_3]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetArticleToBid_3]
	@minAge int,
	@minPrice float,
	@Damaged bit,
	@maxPrice int,
	@maxAge int
AS
BEGIN
	DECLARE @NowTime datetime
	set @NowTime = getdate()	
   
	select au.AuctionName, au.TimeStart, au.TimeEnd, ar.ArticleName, ar.EstimatedAge, ar.Damaged,
	ar.StartPrice, ar.Comment, apa.AuctionId, apa.ArticleId
	from [dbo].[ArticlePerAuction] apa 
	join [dbo].[Auction] au on au.AuctionId = apa.AuctionId
	join Article ar on ar.ArticleId = APA.ArticleId
	where convert(datetime,au.TimeStart) + au.Date < @NowTime and
	convert(datetime,au.TimeEnd) + au.Date > @NowTime and
	@minAge < ar.EstimatedAge and @minPrice < ar.StartPrice and @Damaged = ar.Damaged
	and @maxPrice > ar.StartPrice and @maxAge > ar.EstimatedAge

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetByArticleId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetByArticleId]
    @ArticleId         uniqueidentifier
AS
BEGIN
   
            SELECT * FROM dbo.ArticlePerAuction WHERE @ArticleId = ArticleId 

			RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetByArticleIDAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetByArticleIDAuctionId]
    @ArticleId         uniqueidentifier,
	@AuctionId         uniqueidentifier
AS
BEGIN
   
            SELECT a.ArticleName, a.Comment, a.Damaged, a.EstimatedAge, a.StartPrice, au.TimeEnd, au.TimeStart, au.Date
			FROM dbo.ArticlePerAuction apa
			join [dbo].[Article] a on a.ArticleId = apa.ArticleId
			join Auction au on au.AuctionId = apa.AuctionId
			WHERE @ArticleId = apa.ArticleId and @AuctionId = apa.AuctionId

			RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[ArticlePerAuction_GetByAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[ArticlePerAuction_GetByAuctionId]
	@AuctionId uniqueidentifier
AS
BEGIN

	SELECT aa.AuctionId, ar.ArticleId,ar.ArticleName, ar.EstimatedAge, ar.Damaged, ar.StartPrice, ar.Comment 
	FROM dbo.ArticlePerAuction aa
	join [dbo].[Article] ar on ar.ArticleId = aa.ArticleId
	where aa.AuctionId = @AuctionId

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Auction_CreateAuction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Auction_CreateAuction]
    @AuctionName         nvarchar(50),
	@Date                datetime,
	@TimeStart     time(7),
	@TimeEnd     time(7)
AS
BEGIN
    DECLARE  @AuctionId  uniqueidentifier
    SET @AuctionId = NEWID()
    
    BEGIN
        IF( EXISTS( SELECT AuctionId FROM dbo.Auction
                    WHERE @AuctionId = AuctionId ) )
            RETURN -1
    END

    INSERT dbo.Auction (AuctionId,AuctionName,Date, TimeStart, TimeEnd)
    VALUES (@AuctionId,@AuctionName,@Date, @TimeStart, @TimeEnd)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Auction_DeleteAuction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Auction_DeleteAuction]
	@AuctionId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT AuctionId FROM dbo.Auction WHERE @AuctionId = AuctionId ) )
    BEGIN
		DELETE FROM dbo.Auction WHERE AuctionId = @AuctionId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Auction_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Auction_Get]
	
AS
BEGIN
    
	SELECT * FROM dbo.Auction ORDER BY AuctionName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Auction_GetAuctionById]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Auction_GetAuctionById]
	@AuctionId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT AuctionId FROM dbo.Auction WHERE @AuctionId = AuctionId ) )
    BEGIN
		SELECT * FROM dbo.Auction WHERE @AuctionId = AuctionId

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Auction_GetAuctionByName]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Auction_GetAuctionByName]
	@AuctionName nvarchar(50)
AS
BEGIN
    IF( EXISTS( SELECT AuctionName FROM dbo.Auction WHERE @AuctionName = AuctionName ) )
    BEGIN
		SELECT * FROM dbo.Auction WHERE @AuctionName = AuctionName

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Auction_UpdateAuction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Auction_UpdateAuction]
	@AuctionName         nvarchar(50),
	@Date				 datetime,
	@TimeStart           time(7),
	@TimeEnd             time(7),
    @AuctionId           uniqueidentifier 
AS
BEGIN
	IF( EXISTS( SELECT AuctionId FROM dbo.Auction WHERE @AuctionId = AuctionId ) )
    BEGIN
		UPDATE dbo.Auction
		SET AuctionName = @AuctionName ,
			Date	    = @Date ,
			TimeStart   = @TimeStart ,
			TimeEnd  	= @TimeEnd  
		WHERE AuctionId   = @AuctionId 
		RETURN 0
	END
    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_Create]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_Create]
    @ArticleId         uniqueidentifier,
	@AuctionId         uniqueidentifier,
	@UserId            uniqueidentifier,
	@OfferedPrice             float
AS
BEGIN
    DECLARE  @Id  uniqueidentifier
    SET @Id = NEWID()

    DECLARE  @Time  datetime
    SET @Time = GETDATE()

    INSERT [dbo].[OfferedPrices] (Id,ArticleId,AuctionId, UserId,OfferedPrice,Time)
    VALUES (@Id,@ArticleId,@AuctionId,@UserId,@OfferedPrice,@Time)

	DECLARE	@return_value int
	EXEC	@return_value = [dbo].[OfferedPrices_GetCurrentWinnersForArticleAuctionId] @AuctionId, @ArticleId
	select @return_value
	IF(@return_value < @OfferedPrice)
	begin

		EXEC @return_value = [dbo].[Winners_Create] @AuctionId ,@ArticleId ,@OfferedPrice ,@Time ,@UserId ,@Id 
		return 0									
	end												
													
    RETURN 0										
END													
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_Get]
AS
BEGIN
        SELECT auc.AuctionName, art.ArticleName, art.StartPrice, offe.Time, offe.OfferedPrice, us.FirstName, us.LastName, offe.ArticleId, offe.AuctionId, offe.Id, offe.UserId
		FROM dbo.OfferedPrices offe
		join Article art on art.ArticleId = offe.ArticleId
		join Auction auc on auc.AuctionId = offe.AuctionId
		join Users us on us.UserId = offe.UserId
		RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByArticleId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByArticleId]
    @ArticleId         uniqueidentifier
AS
BEGIN
        SELECT * FROM dbo.OfferedPrices WHERE @ArticleId = ArticleId 
		RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByArticleIdAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByArticleIdAuctionId]
	@ArticleId uniqueidentifier,
	@AuctionId uniqueidentifier
AS
BEGIN

	SELECT Time, OfferedPrice, UserId, ArticleId, AuctionId
	FROM [dbo].[OfferedPrices] 
	where ArticleId = @ArticleId and AuctionId = @AuctionId
	order by Time

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByAuctionId]
    @AuctionId         uniqueidentifier
AS
BEGIN
        SELECT * FROM dbo.OfferedPrices WHERE @AuctionId = AuctionId 
		RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId]
	@UserId uniqueidentifier
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time) as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId 
	group by o.ArticleId, o.AuctionId, o.UserId)
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_0]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_0]
	@UserId uniqueidentifier,
	@minPrice float
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_1]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_1]
	@UserId uniqueidentifier,
	@minPrice float,
	@minTime datetime
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@minTime < o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_2]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_2]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxTime > o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_3]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_3]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxPrice float
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxPrice > o.OfferedPrice
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_4]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_4]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime,
	@minTime datetime
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxTime > o.Time and @minTime <= o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_5]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_5]
	@UserId uniqueidentifier,
	@minPrice float,
	@minTime datetime,
	@maxPrice float
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxPrice > o.OfferedPrice and @minTime < o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_6]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_6]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime,
	@maxPrice float
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time)as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxPrice > o.OfferedPrice and @maxTime > o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetByUserId_7]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetByUserId_7]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime,
	@maxPrice float,
	@minTime datetime
AS
BEGIN

	SELECT au.AuctionName, ar.ArticleName, max(o.Time) as 'Time', o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	FROM [dbo].[OfferedPrices] o
	join [dbo].[Article] ar on ar.ArticleId = o.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = o.AuctionId
	where o.UserId = @UserId and o.OfferedPrice in (SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where o.UserId = @UserId
	group by o.ArticleId, o.AuctionId, o.UserId) and @minPrice < o.OfferedPrice and 
	@maxPrice > o.OfferedPrice and @maxTime > o.Time and @minTime < o.Time
	 group by au.AuctionName, ar.ArticleName, o.OfferedPrice, o.ArticleId, o.AuctionId, o.UserId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[OfferedPrices_GetCurrentWinnersForArticleAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[OfferedPrices_GetCurrentWinnersForArticleAuctionId]
	@AucionId uniqueidentifier,
	@ArticleId uniqueidentifier
AS
BEGIN

	SELECT max(o.OfferedPrice)
	FROM [dbo].[OfferedPrices] o
	where @AucionId = AuctionId and @ArticleId = ArticleId
	group by o.ArticleId, o.AuctionId
	

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Roles_CreateRole]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Roles_CreateRole]
    @RoleName           nvarchar(50)
AS
BEGIN
    DECLARE  @RoleId  uniqueidentifier
    SET @RoleId = NEWID()
    BEGIN
        IF( EXISTS( SELECT RoleId FROM dbo.Roles
                    WHERE @RoleId = RoleId ) )
            RETURN -1
    END

	BEGIN
        IF( EXISTS( SELECT RoleName FROM dbo.Roles
                    WHERE @RoleName = RoleName ) )
            RETURN -1
    END

    INSERT dbo.Roles(RoleId, RoleName)
    VALUES (@RoleId, @RoleName)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Roles_Get]
	
AS
BEGIN
    
	SELECT * FROM dbo.Roles ORDER BY RoleName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Roles_GetRoleById]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Roles_GetRoleById]
	@RoleId nvarchar(50)
AS
BEGIN
    
	SELECT * FROM dbo.Roles WHERE @RoleId = RoleId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Roles_GetRoleByName]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Roles_GetRoleByName]
	@RoleName nvarchar(50)
AS
BEGIN
    
	SELECT * FROM dbo.Roles WHERE @RoleName = RoleName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_AddUserToRole]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_AddUserToRole]
	@RoleId uniqueidentifier,
	@UserId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT RoleId FROM dbo.Roles WHERE @RoleId = RoleId ) )
    BEGIN
		IF( EXISTS( SELECT UserId FROM dbo.Users WHERE @UserId = UserId ) )
		BEGIN
			INSERT dbo.UsersInRoles (UserId, RoleId, Approved, Rejected)
			VALUES (@UserId,@RoleId, 0, 0)

			RETURN 0
		END
		ELSE
			RETURN -1
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_DeleteAccount]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_DeleteAccount]
	@UserId   uniqueidentifier
AS
BEGIN
	declare @rejected bit
	set @rejected = 1

	declare @approved bit
	set @approved = 1

    IF( EXISTS( SELECT UserId FROM dbo.UsersInRoles WHERE @UserId = UserId ) )
    BEGIN
		UPDATE dbo.UsersInRoles
		SET Approved = @Approved,
			Rejected = @Rejected
		WHERE UserId = @UserId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_DeleteUserInRole]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_DeleteUserInRole]
	@UserId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT UserId FROM dbo.UsersInRoles WHERE @UserId = UserId ) )
    BEGIN
		DELETE FROM dbo.UsersInRoles WHERE UserId = @UserId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_GetApprove]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_GetApprove]
	@UserId uniqueidentifier
AS
BEGIN
    
	SELECT Approved FROM dbo.UsersInRoles 
	where UserId = @UserId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_GetRejected]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





CREATE PROCEDURE [dbo].[UserInRole_GetRejected]
	@UserId uniqueidentifier
AS
BEGIN
    
	SELECT Rejected FROM dbo.UsersInRoles 
	where UserId = @UserId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_GetUsersInRoles]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_GetUsersInRoles]
	@UserId uniqueidentifier
AS
BEGIN
    
	SELECT r.RoleName FROM dbo.UsersInRoles ur
	join dbo.Roles r on r.RoleId = ur.RoleId
	where UserId = @UserId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_GetWaitingApproval]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_GetWaitingApproval]
AS
BEGIN
    
	SELECT u.FirstName, u.LastName, u.Title, u.DateBirth, u.Email, ur.UserId, ur.RoleId FROM dbo.UsersInRoles ur
	join [dbo].[Users] u on u.UserId = ur.UserId
	where Approved = 0 and Rejected = 0 and RoleId = 'AEB2A259-2BCC-40FE-9211-A9C8D36CFCA5'

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_UpdateApproval]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_UpdateApproval]
	@UserId   uniqueidentifier,
	@Approved bit
AS
BEGIN
	declare @rejected bit
	set @rejected = ~@Approved

    IF( EXISTS( SELECT UserId FROM dbo.UsersInRoles WHERE @UserId = UserId ) )
    BEGIN
		UPDATE dbo.UsersInRoles
		SET Approved = @Approved,
			Rejected = @Rejected
		WHERE UserId = @UserId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[UserInRole_UpdateRoleForUser]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[UserInRole_UpdateRoleForUser]
	@RoleId uniqueidentifier,
	@UserId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT UserId FROM dbo.UsersInRoles WHERE @UserId = UserId ) )
    BEGIN
		UPDATE dbo.UsersInRoles
		SET RoleId = @RoleId
		WHERE UserId = @UserId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Users_CreateUser]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Users_CreateUser]
    @FirstName          nvarchar(50),                
	@LastName           nvarchar(50), 
	@Title              nvarchar(50),
	@DateBirth          datetime,
	@Email              nvarchar(256),
	@PasswordC          nvarchar(256)
AS
BEGIN
    DECLARE  @UserId  uniqueidentifier
    SET @UserId = NEWID()
   
    IF( EXISTS( SELECT UserId FROM dbo.Users
                WHERE @UserId = UserId ) )
        RETURN -1


    IF( EXISTS( SELECT Email FROM dbo.Users
                WHERE @Email = Email ) )
        RETURN -1


    INSERT dbo.Users (UserId, FirstName, LastName, Title, DateBirth, Email, PasswordC)
    VALUES (@UserId, @FirstName, @LastName, @Title, @DateBirth, @Email, @PasswordC)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_DeleteUser]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO






CREATE PROCEDURE [dbo].[Users_DeleteUser]
	@UserId uniqueidentifier
AS
BEGIN
    IF( EXISTS( SELECT UserId FROM dbo.Users WHERE @UserId = UserId ) )
    BEGIN
		DELETE FROM dbo.Users WHERE UserId = @UserId 

		EXEC [dbo].[UserInRole_DeleteUserInRole] @UserId 

		RETURN 0
	END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[Users_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Users_Get]
	
AS
BEGIN
    
	SELECT * FROM dbo.Users order by UserId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetUserByEmail]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Users_GetUserByEmail]
	@Email nvarchar(256)
AS
BEGIN
    
	SELECT * FROM dbo.Users WHERE @Email = Email

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetUserByEmailPassword]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[Users_GetUserByEmailPassword]
	@Email nvarchar(256),
	@PasswordC nvarchar(256)
AS
BEGIN
    
	SELECT * FROM dbo.Users WHERE @Email = Email AND @PasswordC = PasswordC

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetUserByFirstLastName]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



create PROCEDURE [dbo].[Users_GetUserByFirstLastName]
	@FirstName nvarchar(50),
	@LastName nvarchar(50)
AS
BEGIN
    
	SELECT * FROM dbo.Users WHERE @FirstName = FirstName AND @LastName = LastName

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetUserById]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Users_GetUserById]
	@UserId nvarchar(50)
AS
BEGIN
    
	SELECT * FROM dbo.Users WHERE @UserId = UserId

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdatePassword]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Users_UpdatePassword]
	@PasswordC          nvarchar(256),
	@UserId             uniqueidentifier
AS
BEGIN
   		UPDATE dbo.Users
		SET PasswordC = @PasswordC
		WHERE UserId = @UserId

		RETURN 0
	
END
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdateUser]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [dbo].[Users_UpdateUser]
	@FirstName          nvarchar(50),                
	@LastName           nvarchar(50), 
	@Title              nvarchar(50),
	@DateBirth          datetime,
	@Email              nvarchar(256),
	@UserId             uniqueidentifier
AS
BEGIN
   		UPDATE dbo.Users
		SET FirstName = @FirstName,
			LastName = @LastName,
			Title = @Title,
			DateBirth = @DateBirth,
			Email = @Email
		WHERE UserId = @UserId

		RETURN 0
	
END
GO
/****** Object:  StoredProcedure [dbo].[Winners_Create]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_Create]
	@AuctionId uniqueidentifier,
	@ArticleId uniqueidentifier,
	@OfferedPrice float,
	@Time datetime,
	@UserId uniqueidentifier,
	@NumId uniqueidentifier
AS
BEGIN

        IF( EXISTS( SELECT ArticleId, AuctionId FROM [dbo].[Winners]
                    WHERE @ArticleId = ArticleId and @AuctionId = AuctionId) )
		BEGIN
            UPDATE [dbo].[Winners]
			SET OfferedPrice =	@OfferedPrice,
				Time = @Time,
				UserId = @UserId,
				NumId = @NumId			
			WHERE @ArticleId = ArticleId and @AuctionId = AuctionId

			RETURN 0
		END

	INSERT [dbo].[Winners] (NumId, UserId, ArticleId, AuctionId, OfferedPrice, Time) 
	VALUES (@NumId, @UserId, @ArticleId, @AuctionId, @OfferedPrice, @Time)

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_Get]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_Get]
AS
BEGIN
	
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT  au.AuctionName, ar.ArticleName, u.FirstName, u.LastName, u.Title, u.DateBirth, u.Email, w.OfferedPrice, w.ArticleId, w.AuctionId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	join [dbo].[Users] u on u.UserId = w.UserId 
	where @NowTime > (au.Date + au.TimeEnd)

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByArticleIdAuctionId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByArticleIdAuctionId]
	@ArticleId uniqueidentifier,
	@AuctionId uniqueidentifier
AS
BEGIN

	SELECT w.OfferedPrice
	FROM [dbo].[Winners] w
	where w.ArticleId = @ArticleId and w.AuctionId = @AuctionId	 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId]
	@UserId uniqueidentifier
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd)
	 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_0]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_0]
	@UserId uniqueidentifier,
	@minPrice float
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice	 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_1]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_1]
	@UserId uniqueidentifier,
	@minPrice float,
	@minTime datetime
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @minTime < w.Time

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_2]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_2]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxTime > w.Time

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_3]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_3]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxPrice float
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxPrice > w.OfferedPrice

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_4]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_4]
	@UserId uniqueidentifier,
	@minPrice float,
	@minTime datetime,
	@maxTime datetime
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxTime > w.Time and @minTime < w.Time 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_5]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_5]
	@UserId uniqueidentifier,
	@minPrice float,
	@minTime datetime,
	@maxPrice float
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxPrice > w.OfferedPrice and @minTime < w.Time 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_6]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_6]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime,
	@maxPrice float
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxPrice > w.OfferedPrice and @maxTime > w.Time 

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserId_7]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Winners_GetByUserId_7]
	@UserId uniqueidentifier,
	@minPrice float,
	@maxTime datetime,
	@maxPrice float,
	@minTime datetime
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @minPrice < w.OfferedPrice and @maxPrice > w.OfferedPrice and @maxTime > w.Time 
	and @minTime < w.Time

	RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[Winners_GetByUserIdArticleAuction]    Script Date: 02/06/2022 18:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


create PROCEDURE [dbo].[Winners_GetByUserIdArticleAuction]
	@UserId uniqueidentifier,
	@ArticleId uniqueidentifier,
	@AuctionId uniqueidentifier
AS
BEGIN
	DECLARE @NowTime datetime
	SET  @NowTime = GETDATE()

	SELECT au.AuctionName, ar.ArticleName, w.Time, w.OfferedPrice, w.ArticleId, w.AuctionId, w.UserId
	FROM [dbo].[Winners] w
	join [dbo].[Article] ar on ar.ArticleId = w.ArticleId 
	join [dbo].[Auction] au on au.AuctionId = w.AuctionId
	where w.UserId = @UserId AND @NowTime > (au.Date + au.TimeEnd) and @ArticleId = w.ArticleId and @AuctionId = w.AuctionId

	RETURN 0

END
GO
USE [master]
GO
ALTER DATABASE [AukcijskaKuca_DB] SET  READ_WRITE 
GO
