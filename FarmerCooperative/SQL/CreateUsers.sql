/*
Deployment script for AB464D77C41E797E843BD7CF8D801B2D_EM\INFORMATION MANAGEMENT\FINAL PROJECT\FARMERCOOPERATIVE\FARMERCOOPERATIVE\APP_DATA\FARMER.MDF

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "INFORMATION MANAGEMENT\FINAL PROJECT\FARMERCOOPERATIVE\FARMERCOOPERATIVE\APP_DATA\FARMER.MDF"
:setvar DefaultFilePrefix "AB464D77C41E797E843BD7CF8D801B2D_EM\INFORMATION MANAGEMENT\FINAL PROJECT\FARMERCOOPERATIVE\FARMERCOOPERATIVE\APP_DATA\FARMER.MDF_"
:setvar DefaultDataPath "C:\Users\pagay\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\pagay\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [dbo].[Users]...';


GO
CREATE TABLE [dbo].[Users] (
    [Id]       INT            NOT NULL,
    [Name]     NVARCHAR (200) NULL,
    [Password] NVARCHAR (50)  NULL,
    [Email]    NVARCHAR (200) NULL,
    [Admin]    BIT            NOT NULL,
    [Status]   SMALLINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating unnamed constraint on [dbo].[Users]...';


GO
ALTER TABLE [dbo].[Users]
    ADD DEFAULT 0 FOR [Admin];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creating unnamed constraint on [dbo].[Users]...';


GO
ALTER TABLE [dbo].[Users]
    ADD DEFAULT 0 FOR [Status];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
GO
PRINT N'Update complete.';


GO
