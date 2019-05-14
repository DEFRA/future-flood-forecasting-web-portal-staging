CREATE DATABASE fffswebportalstaging
GO
exec sp_configure 'contained database authentication', 1;
GO
RECONFIGURE ;
GO
USE fffswebportalstaging
GO
ALTER DATABASE fffswebportalstaging SET CONTAINMENT = PARTIAL
GO