﻿/*
Deployment script for HotelDB_1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HotelDB_1"
:setvar DefaultFilePrefix "HotelDB_1"
:setvar DefaultDataPath "C:\Users\Decagon\AppData\Local\Microsoft\VisualStudio\SSDT\Hotel"
:setvar DefaultLogPath "C:\Users\Decagon\AppData\Local\Microsoft\VisualStudio\SSDT\Hotel"

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
PRINT N'Creating Procedure [dbo].[InsertUser]...';


GO

CREATE PROCEDURE InsertUser

    @FullName VARCHAR(100),
    @Email VARCHAR(100),
    @Password VARCHAR(100)
AS
BEGIN
    INSERT INTO dbo.RegisterUserTable ([FullName], [Email], [Password])
    VALUES (@FullName, @Email, @Password)
END
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


TRUNCATE TABLE RegisterUserTable;

INSERT INTO RegisterUserTable([FullName],[Email], [Password]) VALUES('Ajibade', 'mashayete@gmail.com', '@mashayete1' ); 

DELETE FROM StayCationHomeTable

				 /*------------------------------------------------*/
				/*------------  MOST PICKS---------------------- -*/
		       /*------------------------------------------------*/


	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Most picks', 'https://mavics.blob.core.windows.net/images/overlay1.png', '50', 'Blue Origin Fams', 'Jakarta');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Most picks', 'https://mavics.blob.core.windows.net/images/oc.png', '22', 'Ocean Land', 'Bandung');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Most picks', 'https://mavics.blob.core.windows.net/images/ny.png', '856', 'Stark House', 'Malang');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Most picks', 'https://mavics.blob.core.windows.net/images/cc.png', '62', 'Vinna Vill', 'Malang');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Most picks', 'https://mavics.blob.core.windows.net/images/gg.png', '72', 'Bobox', 'Medan');


			 /*------------------------------------------------*/
			/*-------Houses with beautiful Backyards----------*/
		    /*-----------------------------------------------*/


	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location], [Popularity])
	VALUES ('Houses with beautiful Backyards', 'https://mavics.blob.core.windows.net/images/vv.png', '0', 'Shabby Town', 'Gunung', 'Popular choice');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Houses with beautiful Backyards', 'https://mavics.blob.core.windows.net/images/yy.png', '0', 'Anganna', 'Bogor');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Houses with beautiful Backyards', 'https://mavics.blob.core.windows.net/images/roo.png', '0', 'Seattle Rain', 'Jakarta');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Houses with beautiful Backyards', 'https://mavics.blob.core.windows.net/images/aa.png', '0', 'Wooden Pit', 'Wonosob');



				/*------------------------------------------------*/
			   /*-------Hotels with large living rooms ----------*/
			  /*------------------------------------------------*/


	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Hotels with large living rooms', 'https://mavics.blob.core.windows.net/images/ft.png', '0', 'Green ParK', 'Tangarang');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Hotels with large living rooms', 'https://mavics.blob.core.windows.net/images/wq.png', '0', ' Podo Wae', 'Padiun');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Hotels with large living rooms', 'https://mavics.blob.core.windows.net/images/po.png', '0', 'Silver Rain', 'Bandung');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location], [Popularity])
	VALUES ('Hotels with large living rooms', 'https://mavics.blob.core.windows.net/images/jj.png', '0', 'Cashville', 'Kemang', 'Popular choice');


						/*------------------------------------------------*/
					   /*-------Apartments with Kitchen set--------------*/
					  /*------------------------------------------------*/


	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Apartments with Kitchen set', 'https://mavics.blob.core.windows.net/images/ds.png', '0', 'PS Wood ', 'Depok');
	
	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Apartments with Kitchen set', 'https://mavics.blob.core.windows.net/images/dc.png ', '0', 'One Five', 'Jakarta');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location], [Popularity])
	VALUES ('Apartments with Kitchen set', 'https://mavics.blob.core.windows.net/images/er.png', '0', 'Minimal', 'Bogor', 'Popular choice');

	INSERT INTO StayCationHomeTable ([Group], [Image], [Price], [NameOfProp], [Location])
	VALUES ('Apartments with Kitchen set', 'https://mavics.blob.core.windows.net/images/re.png', '0', 'Stays Home', 'Wonosoba');




GO

GO
PRINT N'Update complete.';


GO
