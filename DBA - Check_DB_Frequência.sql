/* CHECK_DB FREQUÊNCIA */

USE master
GO
DECLARE @logs TABLE
(
LogDate DATETIME,
ProcessInfor VARCHAR(255),
Text VARCHAR(MAX)
)

INSERT INTO @logs
EXEC sp_readerrorlog 0

INSERT INTO @logs
EXEC sp_readerrorlog 1

INSERT INTO @logs
EXEC sp_readerrorlog 2