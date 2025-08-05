USE [msdb]
GO
SET NOCOUNT ON
GO

DECLARE @Dias Int

Set @Dias = 2

SELECT
S.Database_name,
M.Physical_Device_name,
CONVERT(Decimal(12,2), S.Backup_Size / 1024 / 1024) As Size,
S.Backup_Start_Date,
S.Backup_Finish_Date,
Cast(DateDiff(Second, S.backup_start_date ,S.Backup_Finish_Date) As varchar(4)) As Seconds_Duration,
Case S.type
 When 'D' Then 'Full'
 When 'I' Then 'Differential'
 When 'L' Then 'Trnasction Log'
 End As BackupType,
 S.Server_name
 From msdb.dbo.backupset S
 JOIN msdb.dbo.backupmediafamily M ON S.media_set_id = M.media_set_id
 WHERE S.backup_start_date > Convert(Char(10), (DateAdd(Day, - @Dias, GetDate())), 121)
 --S.Database_Name = 'ALTERDATA_ERP'
 ORDER BY S.backup_start_date DESC, S.backup_finish_date

