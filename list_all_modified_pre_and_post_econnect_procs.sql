/*


Pre and Post procs can get reset during upgrades. This identifies those that
have been changed to script out for later redeployment.

*/


SELECT name
	,create_date
	,modify_date
FROM sys.objects
WHERE (type = 'P')
	AND (
		name LIKE 'ta%Pre'
		OR name LIKE 'ta%Post'
		)
	AND (create_date <> modify_date)
