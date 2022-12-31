/*

With concurrent licenses, having users staying logged in too long will tie up seats... this identifies
logins from the prior day in a SQL view suitable for reporting.

*/

CREATE VIEW avt_v_GetPriorDayLogins
AS
SELECT ['User Activity'].USERID AS 'User ID'
	,ISNULL(['Users Master'].USERNAME, 'User Master record not found') AS 'User Name'
	,ISNULL(['Company Master'].INTERID, 'Company Master record not found') AS 'Inter ID'
	,['User Activity'].CMPNYNAM AS 'Company Name'
	,FORMAT(['User Activity'].LOGINDAT, 'yyyy-MM-dd') AS 'Login Date'
	,FORMAT(['User Activity'].LOGINTIM, 'hh:mm:ss') AS 'Login Time'
FROM ACTIVITY AS ['User Activity']
LEFT JOIN SY01400 AS ['Users Master'] ON ['User Activity'].USERID = ['Users Master'].USERID
LEFT JOIN SY01500 AS ['Company Master'] ON ['User Activity'].CMPNYNAM = ['Company Master'].CMPNYNAM
WHERE ['User Activity'].LOGINDAT <= DATEADD(DAY, - 1, GETDATE())
GO

GRANT SELECT
	ON avt_v_GetPriorDayLogins
	TO DYNGRP
GO


