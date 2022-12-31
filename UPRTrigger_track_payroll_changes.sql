
/*


This creates a table (trackPayrollChanges) and has triggers on the tables shown.

Any changes to select payroll data results in logging the event at a database level.

Make sure to grant permissions for this table to the DYNGRP (grant included)


 Tables included: 
UPR00100 - Employee Master 
UPR00102 - Employee Address master 
UPR00300 - Payroll Tax Information Master 
UPR00400 - Pay Code Master 
UPR00500 - Employee Deductions 
UPR00501    - Based On Pay Codes (deductions)
UPR00600 - Employee Benefits 
UPR00601    - Based on Pay Codes (benefits)
UPR00700    - Payroll State Tax Master 
UPR00900 - Employee Summary 
BE010130 - Benefits and Deductions 
DD00100  - Direct Deposit Setup 
DD00200  - Direct Deposit Account Setup 
*/

-- Run this to create the table. 
-- Run the grant script to add the table here to the DYNGRP
-- or else errors will follow
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackPayrollChanges'
			AND type = 'U'
		)
	DROP TABLE [trackPayrollChanges]
GO

CREATE TABLE [trackPayrollChanges] (
	USERID CHAR(25)
	,TableName CHAR(20)
	,ColumnName CHAR(30)
	,dateTimeChanged DATETIME
	,oldValue CHAR(50)
	,newValue CHAR(50)
	,employeeID CHAR(15)
	,Comments CHAR(200)
	)

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackEmployeeMasterChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackEmployeeMasterChanges]
GO

CREATE TRIGGER [trackEmployeeMasterChanges] ON UPR00100
FOR UPDATE
AS
IF 
	UPDATE (EMPLCLAS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'EMPLCLAS'
		,getdate()
		,cast(a.EMPLCLAS AS CHAR(50))
		,cast(b.EMPLCLAS AS CHAR(50))
		,a.EMPLOYID
		,'Employee Class changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'Inactive changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (LASTNAME)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'LASTNAME'
		,getdate()
		,cast(a.LASTNAME AS CHAR(50))
		,cast(b.LASTNAME AS CHAR(50))
		,a.EMPLOYID
		,'Last Name changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (FRSTNAME)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'FRSTNAME'
		,getdate()
		,cast(a.FRSTNAME AS CHAR(50))
		,cast(b.FRSTNAME AS CHAR(50))
		,a.EMPLOYID
		,'First Name changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (MIDLNAME)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'MIDLNAME'
		,getdate()
		,cast(a.MIDLNAME AS CHAR(50))
		,cast(b.MIDLNAME AS CHAR(50))
		,a.EMPLOYID
		,'Middle Name changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ADRSCODE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ADRSCODE'
		,getdate()
		,cast(a.ADRSCODE AS CHAR(50))
		,cast(b.ADRSCODE AS CHAR(50))
		,a.EMPLOYID
		,'Address Code changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SOCSCNUM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SOCSCNUM'
		,getdate()
		,cast(a.SOCSCNUM AS CHAR(50))
		,cast(b.SOCSCNUM AS CHAR(50))
		,a.EMPLOYID
		,'Social Security Number changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (BRTHDATE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'BRTHDATE'
		,getdate()
		,cast(a.BRTHDATE AS CHAR(50))
		,cast(b.BRTHDATE AS CHAR(50))
		,a.EMPLOYID
		,'Birth Date changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (GENDER)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'GENDER'
		,getdate()
		,cast(a.GENDER AS CHAR(50))
		,cast(b.GENDER AS CHAR(50))
		,a.EMPLOYID
		,'Gender changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ETHNORGN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ETHNORGN'
		,getdate()
		,cast(a.ETHNORGN AS CHAR(50))
		,cast(b.ETHNORGN AS CHAR(50))
		,a.EMPLOYID
		,'Ethnic Origin changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (Calc_Min_Wage_Bal)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'Calc_Min_Wage_Bal'
		,getdate()
		,cast(a.Calc_Min_Wage_Bal AS CHAR(50))
		,cast(b.Calc_Min_Wage_Bal AS CHAR(50))
		,a.EMPLOYID
		,'Calculate Minimum Wage Balance changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DIVISIONCODE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DIVISIONCODE_I'
		,getdate()
		,cast(a.DIVISIONCODE_I AS CHAR(50))
		,cast(b.DIVISIONCODE_I AS CHAR(50))
		,a.EMPLOYID
		,'Division Code changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DEPRTMNT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DEPRTMNT'
		,getdate()
		,cast(a.DEPRTMNT AS CHAR(50))
		,cast(b.DEPRTMNT AS CHAR(50))
		,a.EMPLOYID
		,'Department changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (JOBTITLE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'JOBTITLE'
		,getdate()
		,cast(a.JOBTITLE AS CHAR(50))
		,cast(b.JOBTITLE AS CHAR(50))
		,a.EMPLOYID
		,'Job Title changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SUPERVISORCODE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SUPERVISORCODE_I'
		,getdate()
		,cast(a.SUPERVISORCODE_I AS CHAR(50))
		,cast(b.SUPERVISORCODE_I AS CHAR(50))
		,a.EMPLOYID
		,'Supervisor Code changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (LOCATNID)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'LOCATNID'
		,getdate()
		,cast(a.LOCATNID AS CHAR(50))
		,cast(b.LOCATNID AS CHAR(50))
		,a.EMPLOYID
		,'Location ID changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (WCACFPAY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'WCACFPAY'
		,getdate()
		,cast(a.WCACFPAY AS CHAR(50))
		,cast(b.WCACFPAY AS CHAR(50))
		,a.EMPLOYID
		,'Which Cash Account for Pay changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ACTINDX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ACTINDX'
		,getdate()
		,cast(a.ACTINDX AS CHAR(50))
		,cast(b.ACTINDX AS CHAR(50))
		,a.EMPLOYID
		,'Account index changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (WKHRPRYR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'WKHRPRYR'
		,getdate()
		,cast(a.WKHRPRYR AS CHAR(50))
		,cast(b.WKHRPRYR AS CHAR(50))
		,a.EMPLOYID
		,'Work Hours Per Year changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (STRTDATE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'STRTDATE'
		,getdate()
		,cast(a.STRTDATE AS CHAR(50))
		,cast(b.STRTDATE AS CHAR(50))
		,a.EMPLOYID
		,'Start Date changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DEMPINAC)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DEMPINAC'
		,getdate()
		,cast(a.DEMPINAC AS CHAR(50))
		,cast(b.DEMPINAC AS CHAR(50))
		,a.EMPLOYID
		,'Date Employee Inactivated changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (RSNEMPIN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'RSNEMPIN'
		,getdate()
		,cast(a.RSNEMPIN AS CHAR(50))
		,cast(b.RSNEMPIN AS CHAR(50))
		,a.EMPLOYID
		,'Reason Employee Inactivated changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (MINETPAY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'MINETPAY'
		,getdate()
		,cast(a.MINETPAY AS CHAR(50))
		,cast(b.MINETPAY AS CHAR(50))
		,a.EMPLOYID
		,'Minimum Net Pay changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SUTASTAT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SUTASTAT'
		,getdate()
		,cast(a.SUTASTAT AS CHAR(50))
		,cast(b.SUTASTAT AS CHAR(50))
		,a.EMPLOYID
		,'SUTA State changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (WRKRCOMP)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'WRKRCOMP'
		,getdate()
		,cast(a.WRKRCOMP AS CHAR(50))
		,cast(b.WRKRCOMP AS CHAR(50))
		,a.EMPLOYID
		,'Workers Comp changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ATACRVAC)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ATACRVAC'
		,getdate()
		,cast(a.ATACRVAC AS CHAR(50))
		,cast(b.ATACRVAC AS CHAR(50))
		,a.EMPLOYID
		,'Auto Accrue Vacation changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VACCRAMT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VACCRAMT'
		,getdate()
		,cast(a.VACCRAMT AS CHAR(50))
		,cast(b.VACCRAMT AS CHAR(50))
		,a.EMPLOYID
		,'Vacation Accrual Amount changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VACCRMTH)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VACCRMTH'
		,getdate()
		,cast(a.VACCRMTH AS CHAR(50))
		,cast(b.VACCRMTH AS CHAR(50))
		,a.EMPLOYID
		,'Vacation Accrual Method changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VACAPRYR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VACAPRYR'
		,getdate()
		,cast(a.VACAPRYR AS CHAR(50))
		,cast(b.VACAPRYR AS CHAR(50))
		,a.EMPLOYID
		,'Vacation Hours Per Year changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VACAVLBL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VACAVLBL'
		,getdate()
		,cast(a.VACAVLBL AS CHAR(50))
		,cast(b.VACAVLBL AS CHAR(50))
		,a.EMPLOYID
		,'Vacation available changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (WRNVCNFLSBLWZR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'WRNVCNFLSBLWZR'
		,getdate()
		,cast(a.WRNVCNFLSBLWZR AS CHAR(50))
		,cast(b.WRNVCNFLSBLWZR AS CHAR(50))
		,a.EMPLOYID
		,'Warn Vacation Falls Below Zero changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ATACRSTM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ATACRSTM'
		,getdate()
		,cast(a.ATACRSTM AS CHAR(50))
		,cast(b.ATACRSTM AS CHAR(50))
		,a.EMPLOYID
		,'Auto accrue sick time changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (STMACMTH)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'STMACMTH'
		,getdate()
		,cast(a.STMACMTH AS CHAR(50))
		,cast(b.STMACMTH AS CHAR(50))
		,a.EMPLOYID
		,'Sick time accrual method changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SKTMACAM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SKTMACAM'
		,getdate()
		,cast(a.SKTMACAM AS CHAR(50))
		,cast(b.SKTMACAM AS CHAR(50))
		,a.EMPLOYID
		,'Sick time accrual amount changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SIKTIMAV)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SIKTIMAV'
		,getdate()
		,cast(a.SIKTIMAV AS CHAR(50))
		,cast(b.SIKTIMAV AS CHAR(50))
		,a.EMPLOYID
		,'Sick time available changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SKTMHPYR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SKTMHPYR'
		,getdate()
		,cast(a.SKTMHPYR AS CHAR(50))
		,cast(b.SKTMHPYR AS CHAR(50))
		,a.EMPLOYID
		,'Sick time hours per year changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (WRNSTFLSBLWZR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'WRNSTFLSBLWZR'
		,getdate()
		,cast(a.WRNSTFLSBLWZR AS CHAR(50))
		,cast(b.WRNSTFLSBLWZR AS CHAR(50))
		,a.EMPLOYID
		,'Warn sick time falls below zero changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (USERDEF1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'USERDEF1'
		,getdate()
		,cast(a.USERDEF1 AS CHAR(50))
		,cast(b.USERDEF1 AS CHAR(50))
		,a.EMPLOYID
		,'User Defined 1 changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (USERDEF2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'USERDEF2'
		,getdate()
		,cast(a.USERDEF2 AS CHAR(50))
		,cast(b.USERDEF2 AS CHAR(50))
		,a.EMPLOYID
		,'User Defined 2 changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (EMPLOYMENTTYPE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'EMPLOYMENTTYPE'
		,getdate()
		,cast(a.EMPLOYMENTTYPE AS CHAR(50))
		,cast(b.EMPLOYMENTTYPE AS CHAR(50))
		,a.EMPLOYID
		,'Employment type changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (MARITALSTATUS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'MARITALSTATUS'
		,getdate()
		,cast(a.MARITALSTATUS AS CHAR(50))
		,cast(b.MARITALSTATUS AS CHAR(50))
		,a.EMPLOYID
		,'Marital Status changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (BENADJDATE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'BENADJDATE'
		,getdate()
		,cast(a.BENADJDATE AS CHAR(50))
		,cast(b.BENADJDATE AS CHAR(50))
		,a.EMPLOYID
		,'Benefits Adjustment Date changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (LASTDAYWORKED_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'LASTDAYWORKED_I'
		,getdate()
		,cast(a.LASTDAYWORKED_I AS CHAR(50))
		,cast(b.LASTDAYWORKED_I AS CHAR(50))
		,a.EMPLOYID
		,'Last Day worked changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (BIRTHDAY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'BIRTHDAY'
		,getdate()
		,cast(a.BIRTHDAY AS CHAR(50))
		,cast(b.BIRTHDAY AS CHAR(50))
		,a.EMPLOYID
		,'Birth Day changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (BIRTHMONTH)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'BIRTHMONTH'
		,getdate()
		,cast(a.BIRTHMONTH AS CHAR(50))
		,cast(b.BIRTHMONTH AS CHAR(50))
		,a.EMPLOYID
		,'Birth Month changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SPOUSE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SPOUSE'
		,getdate()
		,cast(a.SPOUSE AS CHAR(50))
		,cast(b.SPOUSE AS CHAR(50))
		,a.EMPLOYID
		,'Spouse changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SPOUSESSN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SPOUSESSN'
		,getdate()
		,cast(a.SPOUSESSN AS CHAR(50))
		,cast(b.SPOUSESSN AS CHAR(50))
		,a.EMPLOYID
		,'Spouse Social Security Number changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (NICKNAME)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'NICKNAME'
		,getdate()
		,cast(a.NICKNAME AS CHAR(50))
		,cast(b.NICKNAME AS CHAR(50))
		,a.EMPLOYID
		,'Nickname changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ALTERNATENAME)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'ALTERNATENAME'
		,getdate()
		,cast(a.ALTERNATENAME AS CHAR(50))
		,cast(b.ALTERNATENAME AS CHAR(50))
		,a.EMPLOYID
		,'Alternate name changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (HRSTATUS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'HRSTATUS'
		,getdate()
		,cast(a.HRSTATUS AS CHAR(50))
		,cast(b.HRSTATUS AS CHAR(50))
		,a.EMPLOYID
		,'HR Status changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DATEOFLASTREVIEW_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DATEOFLASTREVIEW_I'
		,getdate()
		,cast(a.DATEOFLASTREVIEW_I AS CHAR(50))
		,cast(b.DATEOFLASTREVIEW_I AS CHAR(50))
		,a.EMPLOYID
		,'Date of Last Review changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DATEOFNEXTREVIEW_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DATEOFNEXTREVIEW_I'
		,getdate()
		,cast(a.DATEOFNEXTREVIEW_I AS CHAR(50))
		,cast(b.DATEOFNEXTREVIEW_I AS CHAR(50))
		,a.EMPLOYID
		,'Date of Next Review changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (BENEFITEXPIRE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'BENEFITEXPIRE_I'
		,getdate()
		,cast(a.BENEFITEXPIRE_I AS CHAR(50))
		,cast(b.BENEFITEXPIRE_I AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Expire changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (HANDICAPPED)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'HANDICAPPED'
		,getdate()
		,cast(a.HANDICAPPED AS CHAR(50))
		,cast(b.HANDICAPPED AS CHAR(50))
		,a.EMPLOYID
		,'Handicapped changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VETERAN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VETERAN'
		,getdate()
		,cast(a.VETERAN AS CHAR(50))
		,cast(b.VETERAN AS CHAR(50))
		,a.EMPLOYID
		,'Veteran changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VIETNAMVETERAN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VIETNAMVETERAN'
		,getdate()
		,cast(a.VIETNAMVETERAN AS CHAR(50))
		,cast(b.VIETNAMVETERAN AS CHAR(50))
		,a.EMPLOYID
		,'Vietnam Veteran changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DISABLEDVETERAN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'DISABLEDVETERAN'
		,getdate()
		,cast(a.DISABLEDVETERAN AS CHAR(50))
		,cast(b.DISABLEDVETERAN AS CHAR(50))
		,a.EMPLOYID
		,'Disabled Veteran changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (UNIONEMPLOYEE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'UNIONEMPLOYEE'
		,getdate()
		,cast(a.UNIONEMPLOYEE AS CHAR(50))
		,cast(b.UNIONEMPLOYEE AS CHAR(50))
		,a.EMPLOYID
		,'Union employee changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (SMOKER_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'SMOKER_I'
		,getdate()
		,cast(a.SMOKER_I AS CHAR(50))
		,cast(b.SMOKER_I AS CHAR(50))
		,a.EMPLOYID
		,'Smoker changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (CITIZEN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'CITIZEN'
		,getdate()
		,cast(a.CITIZEN AS CHAR(50))
		,cast(b.CITIZEN AS CHAR(50))
		,a.EMPLOYID
		,'Citizen changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (VERIFIED)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'VERIFIED'
		,getdate()
		,cast(a.VERIFIED AS CHAR(50))
		,cast(b.VERIFIED AS CHAR(50))
		,a.EMPLOYID
		,'Verified changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (I9RENEW)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'I9RENEW'
		,getdate()
		,cast(a.I9RENEW AS CHAR(50))
		,cast(b.I9RENEW AS CHAR(50))
		,a.EMPLOYID
		,'I9 renew changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (Primary_Pay_Record)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'Primary_Pay_Record'
		,getdate()
		,cast(a.Primary_Pay_Record AS CHAR(50))
		,cast(b.Primary_Pay_Record AS CHAR(50))
		,a.EMPLOYID
		,'Primary Pay Record changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (CHANGEBY_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'CHANGEBY_I'
		,getdate()
		,cast(a.CHANGEBY_I AS CHAR(50))
		,cast(b.CHANGEBY_I AS CHAR(50))
		,a.EMPLOYID
		,'Change By changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (CHANGEDATE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'CHANGEDATE_I'
		,getdate()
		,cast(a.CHANGEDATE_I AS CHAR(50))
		,cast(b.CHANGEDATE_I AS CHAR(50))
		,a.EMPLOYID
		,'Change Date changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (UNIONCD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'UNIONCD'
		,getdate()
		,cast(a.UNIONCD AS CHAR(50))
		,cast(b.UNIONCD AS CHAR(50))
		,a.EMPLOYID
		,'Union Code changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (RATECLSS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'RATECLSS'
		,getdate()
		,cast(a.RATECLSS AS CHAR(50))
		,cast(b.RATECLSS AS CHAR(50))
		,a.EMPLOYID
		,'Rate Class changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (FEDCLSSCD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'FEDCLSSCD'
		,getdate()
		,cast(a.FEDCLSSCD AS CHAR(50))
		,cast(b.FEDCLSSCD AS CHAR(50))
		,a.EMPLOYID
		,'Federal Classification Code changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (OTHERVET)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00100'
		,'OTHERVET'
		,getdate()
		,cast(a.OTHERVET AS CHAR(50))
		,cast(b.OTHERVET AS CHAR(50))
		,a.EMPLOYID
		,'Other veterans changed for Employee: ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackEmployeeAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackEmployeeAdditions]
GO

CREATE TRIGGER [trackEmployeeAdditions] ON UPR00100
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00100'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Employee ' + rtrim(EMPLOYID) + ' was added'
FROM inserted
GO

/*UPR00300*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackEmployeeTaxAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackEmployeeTaxAdditions]
GO

CREATE TRIGGER [trackEmployeeTaxAdditions] ON UPR00300
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00300'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Tax Information for employee ' + rtrim(EMPLOYID) + ' was added'
FROM inserted
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackHRChangesOnUPR00300'
			AND type = 'tr'
		)
	DROP TRIGGER [trackHRChangesOnUPR00300]
GO

CREATE TRIGGER [trackHRChangesOnUPR00300] ON UPR00300
FOR UPDATE
AS
IF 
	UPDATE (EXMFRFED)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'EXMFRFED'
		,getdate()
		,cast(a.EXMFRFED AS CHAR(50))
		,cast(b.EXMFRFED AS CHAR(50))
		,a.EMPLOYID
		,'Federal Filing Status was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (FDFLGSTS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'FDFLGSTS'
		,getdate()
		,cast(a.FDFLGSTS AS CHAR(50))
		,cast(b.FDFLGSTS AS CHAR(50))
		,a.EMPLOYID
		,'Federal Filing Status was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (FEDEXMPT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'FEDEXMPT'
		,getdate()
		,cast(a.FEDEXMPT AS CHAR(50))
		,cast(b.FEDEXMPT AS CHAR(50))
		,a.EMPLOYID
		,'Number of Exemptions was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ADFDWHDG)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'ADFDWHDG'
		,getdate()
		,cast(a.ADFDWHDG AS CHAR(50))
		,cast(b.ADFDWHDG AS CHAR(50))
		,a.EMPLOYID
		,'Additional Withholding was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (ESTFEDWH)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'ESTFEDWH'
		,getdate()
		,cast(a.ESTFEDWH AS CHAR(50))
		,cast(b.ESTFEDWH AS CHAR(50))
		,a.EMPLOYID
		,'Estimated withholding was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (STATECD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'STATECD'
		,getdate()
		,cast(a.STATECD AS CHAR(50))
		,cast(b.STATECD AS CHAR(50))
		,a.EMPLOYID
		,'Tax Withholding State was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (LOCALTAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'LOCALTAX'
		,getdate()
		,cast(a.LOCALTAX AS CHAR(50))
		,cast(b.LOCALTAX AS CHAR(50))
		,a.EMPLOYID
		,'Local Tax Code was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BF942E)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BF942E'
		,getdate()
		,cast(a.W2BF942E AS CHAR(50))
		,cast(b.W2BF942E AS CHAR(50))
		,a.EMPLOYID
		,'Household Employee Checkbox changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BFDCSD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BFDCSD'
		,getdate()
		,cast(a.W2BFDCSD AS CHAR(50))
		,cast(b.W2BFDCSD AS CHAR(50))
		,a.EMPLOYID
		,'W-2 box for deceased changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BFDCMP)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BFDCMP'
		,getdate()
		,cast(a.W2BFDCMP AS CHAR(50))
		,cast(b.W2BFDCMP AS CHAR(50))
		,a.EMPLOYID
		,'W-2 box for Deferred Compensation changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BFLREP)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BFLREP'
		,getdate()
		,cast(a.W2BFLREP AS CHAR(50))
		,cast(b.W2BFLREP AS CHAR(50))
		,a.EMPLOYID
		,'W-2 box for legal representation changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BFPPLN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BFPPLN'
		,getdate()
		,cast(a.W2BFPPLN AS CHAR(50))
		,cast(b.W2BFPPLN AS CHAR(50))
		,a.EMPLOYID
		,'W-2 box for pension plan changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (W2BFSTEM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'W2BFSTEM'
		,getdate()
		,cast(a.W2BFSTEM AS CHAR(50))
		,cast(b.W2BFSTEM AS CHAR(50))
		,a.EMPLOYID
		,'Subject to FICA not federal was changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (MCRQGEMP)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'MCRQGEMP'
		,getdate()
		,cast(a.MCRQGEMP AS CHAR(50))
		,cast(b.MCRQGEMP AS CHAR(50))
		,a.EMPLOYID
		,'Medicare Qualified Government Employee changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (EICFLGST)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'EICFLGST'
		,getdate()
		,cast(a.EICFLGST AS CHAR(50))
		,cast(b.EICFLGST AS CHAR(50))
		,a.EMPLOYID
		,'EIC Filing Status changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (NYTXDiff)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00300'
		,'NYTXDiff'
		,getdate()
		,cast(a.NYTXDiff AS CHAR(50))
		,cast(b.NYTXDiff AS CHAR(50))
		,a.EMPLOYID
		,'Withheld NY Tax Difference changed for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END
GO

/*UPR00400*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackPayRateChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackPayRateChanges]
GO

CREATE TRIGGER [trackPayRateChanges] ON UPR00400
FOR UPDATE
AS
IF 
	UPDATE (PAYRTAMT)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'PAYRTAMT'
		,getdate()
		,cast(a.PAYRTAMT AS CHAR(50))
		,cast(b.PAYRTAMT AS CHAR(50))
		,a.EMPLOYID
		,'Payrate was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (PAYUNIT)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'PAYUNIT'
		,getdate()
		,cast(a.PAYUNIT AS CHAR(50))
		,cast(b.PAYUNIT AS CHAR(50))
		,a.EMPLOYID
		,'Unit of pay was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (PAYPEROD)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'PAYPEROD'
		,getdate()
		,cast(a.PAYPEROD AS CHAR(50))
		,cast(b.PAYPEROD AS CHAR(50))
		,a.EMPLOYID
		,'Pay Period was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (TAXABLE)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'TAXABLE'
		,getdate()
		,cast(a.TAXABLE AS CHAR(50))
		,cast(b.TAXABLE AS CHAR(50))
		,a.EMPLOYID
		,'Pay Period was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTFDTX)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTFDTX'
		,getdate()
		,cast(a.SBJTFDTX AS CHAR(50))
		,cast(b.SBJTFDTX AS CHAR(50))
		,a.EMPLOYID
		,'Subject to Federal Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTSSEC)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTSSEC'
		,getdate()
		,cast(a.SBJTSSEC AS CHAR(50))
		,cast(b.SBJTSSEC AS CHAR(50))
		,a.EMPLOYID
		,'Subject to FICA Social Security Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTMCAR)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTMCAR'
		,getdate()
		,cast(a.SBJTMCAR AS CHAR(50))
		,cast(b.SBJTMCAR AS CHAR(50))
		,a.EMPLOYID
		,'Subject to Medicare Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTSTTX)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTSTTX'
		,getdate()
		,cast(a.SBJTSTTX AS CHAR(50))
		,cast(b.SBJTSTTX AS CHAR(50))
		,a.EMPLOYID
		,'Subject to State Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTFUTA)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTFUTA'
		,getdate()
		,cast(a.SBJTFUTA AS CHAR(50))
		,cast(b.SBJTFUTA AS CHAR(50))
		,a.EMPLOYID
		,'Subject to FUTA Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTSUTA)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTSUTA'
		,getdate()
		,cast(a.SBJTSUTA AS CHAR(50))
		,cast(b.SBJTSUTA AS CHAR(50))
		,a.EMPLOYID
		,'Subject to SUTA Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SUTASTAT)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SUTASTAT'
		,getdate()
		,cast(a.SUTASTAT AS CHAR(50))
		,cast(b.SUTASTAT AS CHAR(50))
		,a.EMPLOYID
		,'SUTA State was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTSTTX)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTSTTX'
		,getdate()
		,cast(a.SBJTSTTX AS CHAR(50))
		,cast(b.SBJTSTTX AS CHAR(50))
		,a.EMPLOYID
		,'Subject to State Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END

IF 
	UPDATE (SBJTLTAX)

BEGIN
	SET NOCOUNT ON

	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00400'
		,'SBJTLTAX'
		,getdate()
		,cast(a.SBJTLTAX AS CHAR(50))
		,cast(b.SBJTLTAX AS CHAR(50))
		,a.EMPLOYID
		,'Subject to Local Tax was updated for ' + rtrim(a.EMPLOYID) + ' for paycode ' + rtrim(a.PAYRCORD)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.PAYRCORD = b.PAYRCORD
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackPayRateAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackPayRateAdditions]
GO

CREATE TRIGGER [trackPayRateAdditions] ON UPR00400
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00400'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID) + ' for pay code ' + rtrim(PAYRCORD)
FROM inserted
GO

/*UPR00500*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDeductionChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDeductionChanges]
GO

CREATE TRIGGER [trackDeductionChanges] ON UPR00500
FOR UPDATE
AS
IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,rtrim(a.EMPLOYID) + ' was inactivated'
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDBEGDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDBEGDT'
		,getdate()
		,cast(a.DEDBEGDT AS CHAR(50))
		,cast(b.DEDBEGDT AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Start Date was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDENDDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDENDDT'
		,getdate()
		,cast(a.DEDENDDT AS CHAR(50))
		,cast(b.DEDENDDT AS CHAR(50))
		,a.EMPLOYID
		,'Deduction End Date was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (VARDEDTN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'VARDEDTN'
		,getdate()
		,cast(a.VARDEDTN AS CHAR(50))
		,cast(b.VARDEDTN AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Transaction Required was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNFREQ)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNFREQ'
		,getdate()
		,cast(a.DEDNFREQ AS CHAR(50))
		,cast(b.DEDNFREQ AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Frequency was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (SFRFEDTX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'SFRFEDTX'
		,getdate()
		,cast(a.SFRFEDTX AS CHAR(50))
		,cast(b.SFRFEDTX AS CHAR(50))
		,a.EMPLOYID
		,'Federal tax TSA Sheltered from was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (SHFRFICA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'SHFRFICA'
		,getdate()
		,cast(a.SHFRFICA AS CHAR(50))
		,cast(b.SHFRFICA AS CHAR(50))
		,a.EMPLOYID
		,'FICA TSA Sheltered from was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (SHFRSTTX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'SHFRSTTX'
		,getdate()
		,cast(a.SHFRSTTX AS CHAR(50))
		,cast(b.SHFRSTTX AS CHAR(50))
		,a.EMPLOYID
		,'State Tax TSA Sheltered from was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (SFRLCLTX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'SFRLCLTX'
		,getdate()
		,cast(a.SFRLCLTX AS CHAR(50))
		,cast(b.SFRLCLTX AS CHAR(50))
		,a.EMPLOYID
		,'Local tax TSA Sheltered from was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (BSDORCDS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'BSDORCDS'
		,getdate()
		,cast(a.BSDORCDS AS CHAR(50))
		,cast(b.BSDORCDS AS CHAR(50))
		,a.EMPLOYID
		,'Based on Codes were changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNMTHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNMTHD'
		,getdate()
		,cast(a.DEDNMTHD AS CHAR(50))
		,cast(b.DEDNMTHD AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Method was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDFRMLA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDFRMLA'
		,getdate()
		,cast(a.DEDFRMLA AS CHAR(50))
		,cast(b.DEDFRMLA AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Tier was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNPRCT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNPRCT_1'
		,getdate()
		,cast(a.DEDNPRCT_1 AS CHAR(50))
		,cast(b.DEDNPRCT_1 AS CHAR(50))
		,a.EMPLOYID
		,'Single Deduction Tier was updated for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNPRCT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNPRCT_2'
		,getdate()
		,cast(a.DEDNPRCT_2 AS CHAR(50))
		,cast(b.DEDNPRCT_2 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNPRCT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNPRCT_3'
		,getdate()
		,cast(a.DEDNPRCT_3 AS CHAR(50))
		,cast(b.DEDNPRCT_3 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNPRCT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNPRCT_4'
		,getdate()
		,cast(a.DEDNPRCT_4 AS CHAR(50))
		,cast(b.DEDNPRCT_4 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDNPRCT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDNPRCT_5'
		,getdate()
		,cast(a.DEDNPRCT_5 AS CHAR(50))
		,cast(b.DEDNPRCT_5 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDCAMNT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDCAMNT_1'
		,getdate()
		,cast(a.DEDCAMNT_1 AS CHAR(50))
		,cast(b.DEDCAMNT_1 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDCAMNT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDCAMNT_2'
		,getdate()
		,cast(a.DEDCAMNT_2 AS CHAR(50))
		,cast(b.DEDCAMNT_2 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDCAMNT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDCAMNT_3'
		,getdate()
		,cast(a.DEDCAMNT_3 AS CHAR(50))
		,cast(b.DEDCAMNT_3 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDCAMNT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDCAMNT_4'
		,getdate()
		,cast(a.DEDCAMNT_4 AS CHAR(50))
		,cast(b.DEDCAMNT_4 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDCAMNT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDCAMNT_5'
		,getdate()
		,cast(a.DEDCAMNT_5 AS CHAR(50))
		,cast(b.DEDCAMNT_5 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDTRMAX_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDTRMAX_1'
		,getdate()
		,cast(a.DEDTRMAX_1 AS CHAR(50))
		,cast(b.DEDTRMAX_1 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDTRMAX_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDTRMAX_2'
		,getdate()
		,cast(a.DEDTRMAX_2 AS CHAR(50))
		,cast(b.DEDTRMAX_2 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDTRMAX_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDTRMAX_3'
		,getdate()
		,cast(a.DEDTRMAX_3 AS CHAR(50))
		,cast(b.DEDTRMAX_3 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDTRMAX_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDTRMAX_4'
		,getdate()
		,cast(a.DEDTRMAX_4 AS CHAR(50))
		,cast(b.DEDTRMAX_4 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDTRMAX_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDTRMAX_5'
		,getdate()
		,cast(a.DEDTRMAX_5 AS CHAR(50))
		,cast(b.DEDTRMAX_5 AS CHAR(50))
		,a.EMPLOYID
		,'Multiple Tier Deduction Percentage was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DETRMXUN_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DETRMXUN_1'
		,getdate()
		,cast(a.DETRMXUN_1 AS CHAR(50))
		,cast(b.DETRMXUN_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DETRMXUN_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DETRMXUN_2'
		,getdate()
		,cast(a.DETRMXUN_2 AS CHAR(50))
		,cast(b.DETRMXUN_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DETRMXUN_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DETRMXUN_3'
		,getdate()
		,cast(a.DETRMXUN_3 AS CHAR(50))
		,cast(b.DETRMXUN_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DETRMXUN_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DETRMXUN_4'
		,getdate()
		,cast(a.DETRMXUN_4 AS CHAR(50))
		,cast(b.DETRMXUN_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DETRMXUN_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DETRMXUN_5'
		,getdate()
		,cast(a.DETRMXUN_5 AS CHAR(50))
		,cast(b.DETRMXUN_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEPYPRMX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEPYPRMX'
		,getdate()
		,cast(a.DEPYPRMX AS CHAR(50))
		,cast(b.DEPYPRMX AS CHAR(50))
		,a.EMPLOYID
		,'Pay Period Maximum Deduction was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDYRMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDYRMAX'
		,getdate()
		,cast(a.DEDYRMAX AS CHAR(50))
		,cast(b.DEDYRMAX AS CHAR(50))
		,a.EMPLOYID
		,'Year Maximum Deduction was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DEDLTMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DEDLTMAX'
		,getdate()
		,cast(a.DEDLTMAX AS CHAR(50))
		,cast(b.DEDLTMAX AS CHAR(50))
		,a.EMPLOYID
		,'Lifetime Maximum Deduction was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (W2BXNMBR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'W2BXNMBR'
		,getdate()
		,cast(a.W2BXNMBR AS CHAR(50))
		,cast(b.W2BXNMBR AS CHAR(50))
		,a.EMPLOYID
		,'W-2 Box Number was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (W2BXLABL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'W2BXLABL'
		,getdate()
		,cast(a.W2BXLABL AS CHAR(50))
		,cast(b.W2BXLABL AS CHAR(50))
		,a.EMPLOYID
		,'W-2 Tax Label was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (LTDDEDTN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'LTDDEDTN'
		,getdate()
		,cast(a.LTDDEDTN AS CHAR(50))
		,cast(b.LTDDEDTN AS CHAR(50))
		,a.EMPLOYID
		,'Life To Date Deduction was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END

IF 
	UPDATE (DATAENTDFLT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00500'
		,'DATAENTDFLT'
		,getdate()
		,cast(a.DATAENTDFLT AS CHAR(50))
		,cast(b.DATAENTDFLT AS CHAR(50))
		,a.EMPLOYID
		,'Data Entry Default was changed for Deduction code' + rtrim(a.DEDUCTON) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.DEDUCTON = b.DEDUCTON
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDeductionAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDeductionAdditions]
GO

CREATE TRIGGER [trackDeductionAdditions] ON UPR00500
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00500'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID) + ' for deduction ' + rtrim(DEDUCTON)
FROM inserted
GO

/*UPR00501*/
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDedBasedOnAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDedBasedOnAdditions]
GO

CREATE TRIGGER [trackDedBasedOnAdditions] ON UPR00501
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00501'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID) + ' for deduction ' + rtrim(DEDUCTON)
FROM inserted
GO

/*UPR00600*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'findBenefitChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [findBenefitChanges]
GO

CREATE TRIGGER [findBenefitChanges] ON UPR00600
FOR UPDATE
AS
IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'Benefits were inactivated for ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFBEGDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFBEGDT'
		,getdate()
		,cast(a.BNFBEGDT AS CHAR(50))
		,cast(b.BNFBEGDT AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Start date was inactivated for Benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFENDDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFENDDT'
		,getdate()
		,cast(a.BNFENDDT AS CHAR(50))
		,cast(b.BNFENDDT AS CHAR(50))
		,a.EMPLOYID
		,'Benefit End date was inactivated for Benefit' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (VARBENFT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'VARBENFT'
		,getdate()
		,cast(a.VARBENFT AS CHAR(50))
		,cast(b.VARBENFT AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Transaction Required was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTFREQ)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTFREQ'
		,getdate()
		,cast(a.BNFTFREQ AS CHAR(50))
		,cast(b.BNFTFREQ AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Frequency was changed for Benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (TAXABLE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'TAXABLE'
		,getdate()
		,cast(a.TAXABLE AS CHAR(50))
		,cast(b.TAXABLE AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Subject to tax was changed for ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTFDTX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTFDTX'
		,getdate()
		,cast(a.SBJTFDTX AS CHAR(50))
		,cast(b.SBJTFDTX AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Subject to Federal tax was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTSSEC)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTSSEC'
		,getdate()
		,cast(a.SBJTSSEC AS CHAR(50))
		,cast(b.SBJTSSEC AS CHAR(50))
		,a.EMPLOYID
		,'Benefit subject to FICA Social Security was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTMCAR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTMCAR'
		,getdate()
		,cast(a.SBJTMCAR AS CHAR(50))
		,cast(b.SBJTMCAR AS CHAR(50))
		,a.EMPLOYID
		,'Benefit subject for Medicare was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTSTTX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTSTTX'
		,getdate()
		,cast(a.SBJTSTTX AS CHAR(50))
		,cast(b.SBJTSTTX AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Subject to State Tax was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTLTAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTLTAX'
		,getdate()
		,cast(a.SBJTLTAX AS CHAR(50))
		,cast(b.SBJTLTAX AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Subject to Local Tax was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTFUTA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTFUTA'
		,getdate()
		,cast(a.SBJTFUTA AS CHAR(50))
		,cast(b.SBJTFUTA AS CHAR(50))
		,a.EMPLOYID
		,'Benefit subject to FUTA was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SBJTSUTA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'SBJTSUTA'
		,getdate()
		,cast(a.SBJTSUTA AS CHAR(50))
		,cast(b.SBJTSUTA AS CHAR(50))
		,a.EMPLOYID
		,'Benefit subject to SUTA was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (FFEDTXRT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'FFEDTXRT'
		,getdate()
		,cast(a.FFEDTXRT AS CHAR(50))
		,cast(b.FFEDTXRT AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Flat Federal Tax Rate was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (FLSTTXRT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'FLSTTXRT'
		,getdate()
		,cast(a.FLSTTXRT AS CHAR(50))
		,cast(b.FLSTTXRT AS CHAR(50))
		,a.EMPLOYID
		,'Flat State Tax Rate was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BORCDTYP)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BORCDTYP'
		,getdate()
		,cast(a.BORCDTYP AS CHAR(50))
		,cast(b.BORCDTYP AS CHAR(50))
		,a.EMPLOYID
		,'Based on was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BSDORCDS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BSDORCDS'
		,getdate()
		,cast(a.BSDORCDS AS CHAR(50))
		,cast(b.BSDORCDS AS CHAR(50))
		,a.EMPLOYID
		,'Based on was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTMTHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTMTHD'
		,getdate()
		,cast(a.BNFTMTHD AS CHAR(50))
		,cast(b.BNFTMTHD AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Method was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFFRMLA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFFRMLA'
		,getdate()
		,cast(a.BNFFRMLA AS CHAR(50))
		,cast(b.BNFFRMLA AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFPRCNT_1'
		,getdate()
		,cast(a.BNFPRCNT_1 AS CHAR(50))
		,cast(b.BNFPRCNT_1 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFPRCNT_2'
		,getdate()
		,cast(a.BNFPRCNT_2 AS CHAR(50))
		,cast(b.BNFPRCNT_2 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFPRCNT_3'
		,getdate()
		,cast(a.BNFPRCNT_3 AS CHAR(50))
		,cast(b.BNFPRCNT_3 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFPRCNT_4'
		,getdate()
		,cast(a.BNFPRCNT_4 AS CHAR(50))
		,cast(b.BNFPRCNT_4 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFPRCNT_5'
		,getdate()
		,cast(a.BNFPRCNT_5 AS CHAR(50))
		,cast(b.BNFPRCNT_5 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFITAMT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFITAMT_1'
		,getdate()
		,cast(a.BNFITAMT_1 AS CHAR(50))
		,cast(b.BNFITAMT_1 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFITAMT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFITAMT_2'
		,getdate()
		,cast(a.BNFITAMT_2 AS CHAR(50))
		,cast(b.BNFITAMT_2 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFITAMT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFITAMT_3'
		,getdate()
		,cast(a.BNFITAMT_3 AS CHAR(50))
		,cast(b.BNFITAMT_3 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFITAMT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFITAMT_4'
		,getdate()
		,cast(a.BNFITAMT_4 AS CHAR(50))
		,cast(b.BNFITAMT_4 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFITAMT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFITAMT_5'
		,getdate()
		,cast(a.BNFITAMT_5 AS CHAR(50))
		,cast(b.BNFITAMT_5 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTRMAX_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTRMAX_1'
		,getdate()
		,cast(a.BNFTRMAX_1 AS CHAR(50))
		,cast(b.BNFTRMAX_1 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTRMAX_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTRMAX_2'
		,getdate()
		,cast(a.BNFTRMAX_2 AS CHAR(50))
		,cast(b.BNFTRMAX_2 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTRMAX_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTRMAX_3'
		,getdate()
		,cast(a.BNFTRMAX_3 AS CHAR(50))
		,cast(b.BNFTRMAX_3 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTRMAX_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTRMAX_4'
		,getdate()
		,cast(a.BNFTRMAX_4 AS CHAR(50))
		,cast(b.BNFTRMAX_4 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTRMAX_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFTRMAX_5'
		,getdate()
		,cast(a.BNFTRMAX_5 AS CHAR(50))
		,cast(b.BNFTRMAX_5 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNTRMXUN_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNTRMXUN_1'
		,getdate()
		,cast(a.BNTRMXUN_1 AS CHAR(50))
		,cast(b.BNTRMXUN_1 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNTRMXUN_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNTRMXUN_2'
		,getdate()
		,cast(a.BNTRMXUN_2 AS CHAR(50))
		,cast(b.BNTRMXUN_2 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNTRMXUN_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNTRMXUN_3'
		,getdate()
		,cast(a.BNTRMXUN_3 AS CHAR(50))
		,cast(b.BNTRMXUN_3 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNTRMXUN_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNTRMXUN_4'
		,getdate()
		,cast(a.BNTRMXUN_4 AS CHAR(50))
		,cast(b.BNTRMXUN_4 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNTRMXUN_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNTRMXUN_5'
		,getdate()
		,cast(a.BNTRMXUN_5 AS CHAR(50))
		,cast(b.BNTRMXUN_5 AS CHAR(50))
		,a.EMPLOYID
		,'Benefit Tier Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNPAYPMX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNPAYPMX'
		,getdate()
		,cast(a.BNPAYPMX AS CHAR(50))
		,cast(b.BNPAYPMX AS CHAR(50))
		,a.EMPLOYID
		,'Max Pay Period was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFYRMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFYRMAX'
		,getdate()
		,cast(a.BNFYRMAX AS CHAR(50))
		,cast(b.BNFYRMAX AS CHAR(50))
		,a.EMPLOYID
		,'Max Year was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFLFMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'BNFLFMAX'
		,getdate()
		,cast(a.BNFLFMAX AS CHAR(50))
		,cast(b.BNFLFMAX AS CHAR(50))
		,a.EMPLOYID
		,'Lifetime max was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (W2BXNMBR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'W2BXNMBR'
		,getdate()
		,cast(a.W2BXNMBR AS CHAR(50))
		,cast(b.W2BXNMBR AS CHAR(50))
		,a.EMPLOYID
		,'W-2 box was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (W2BXLABL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'W2BXLABL'
		,getdate()
		,cast(a.W2BXLABL AS CHAR(50))
		,cast(b.W2BXLABL AS CHAR(50))
		,a.EMPLOYID
		,'W-2 Label was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (LTDBNFIT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'LTDBNFIT'
		,getdate()
		,cast(a.LTDBNFIT AS CHAR(50))
		,cast(b.LTDBNFIT AS CHAR(50))
		,a.EMPLOYID
		,'Life To Date was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DATAENTDFLT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00600'
		,'DATAENTDFLT'
		,getdate()
		,cast(a.DATAENTDFLT AS CHAR(50))
		,cast(b.DATAENTDFLT AS CHAR(50))
		,a.EMPLOYID
		,'Data Entry Default was changed for benefit ' + rtrim(a.BENEFIT) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.BENEFIT = b.BENEFIT
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackBenefitAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackBenefitAdditions]
GO

CREATE TRIGGER [trackBenefitAdditions] ON UPR00600
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00600'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID) + ' for benefit ' + rtrim(BENEFIT)
FROM inserted
GO

/*UPR00601*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackBenBasedOnAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackBenBasedOnAdditions]
GO

CREATE TRIGGER [trackBenBasedOnAdditions] ON UPR00601
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00601'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID) + ' for benefit ' + rtrim(BENEFIT)
FROM inserted
GO

/*UPR00700*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackStateCodeChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackStateCodeChanges]
GO

CREATE TRIGGER [trackStateCodeChanges] ON UPR00700
FOR UPDATE
AS
IF 
	UPDATE (TXFLGSTS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'TXFLGSTS'
		,getdate()
		,cast(a.TXFLGSTS AS CHAR(50))
		,cast(b.TXFLGSTS AS CHAR(50))
		,a.EMPLOYID
		,'Tax Filing Status was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXMFBLND)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXMFBLND'
		,getdate()
		,cast(a.EXMFBLND AS CHAR(50))
		,cast(b.EXMFBLND AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Blind was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXFBLSPS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXFBLSPS'
		,getdate()
		,cast(a.EXFBLSPS AS CHAR(50))
		,cast(b.EXFBLSPS AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Blind Spouse was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXFORO65)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXFORO65'
		,getdate()
		,cast(a.EXFORO65 AS CHAR(50))
		,cast(b.EXFORO65 AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Over 65 was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXMFRSLF)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXMFRSLF'
		,getdate()
		,cast(a.EXMFRSLF AS CHAR(50))
		,cast(b.EXMFRSLF AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Self was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXMFSPAL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXMFSPAL'
		,getdate()
		,cast(a.EXMFSPAL AS CHAR(50))
		,cast(b.EXMFSPAL AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Special Allowance was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXMFRSPS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXMFRSPS'
		,getdate()
		,cast(a.EXMFRSPS AS CHAR(50))
		,cast(b.EXMFRSPS AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Spouse was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXFSPO65)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXFSPO65'
		,getdate()
		,cast(a.EXFSPO65 AS CHAR(50))
		,cast(b.EXFSPO65 AS CHAR(50))
		,a.EMPLOYID
		,'Exemption for Spouse over 65 was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (PRSNEXPT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'PRSNEXPT'
		,getdate()
		,cast(a.PRSNEXPT AS CHAR(50))
		,cast(b.PRSNEXPT AS CHAR(50))
		,a.EMPLOYID
		,'Personal Exemptions was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (DEPNDNTS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'DEPNDNTS'
		,getdate()
		,cast(a.DEPNDNTS AS CHAR(50))
		,cast(b.DEPNDNTS AS CHAR(50))
		,a.EMPLOYID
		,'Dependents were changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (ADNLALOW)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'ADNLALOW'
		,getdate()
		,cast(a.ADNLALOW AS CHAR(50))
		,cast(b.ADNLALOW AS CHAR(50))
		,a.EMPLOYID
		,'Additional Allowances were changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (ESTDEDAL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'ESTDEDAL'
		,getdate()
		,cast(a.ESTDEDAL AS CHAR(50))
		,cast(b.ESTDEDAL AS CHAR(50))
		,a.EMPLOYID
		,'Estimated State Withholding was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (EXMTAMNT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'EXMTAMNT'
		,getdate()
		,cast(a.EXMTAMNT AS CHAR(50))
		,cast(b.EXMTAMNT AS CHAR(50))
		,a.EMPLOYID
		,'Exemption Amount was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (ADSTWHDG)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'ADSTWHDG'
		,getdate()
		,cast(a.ADSTWHDG AS CHAR(50))
		,cast(b.ADSTWHDG AS CHAR(50))
		,a.EMPLOYID
		,'Additional State Withholding was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (ESTSTWHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'ESTSTWHD'
		,getdate()
		,cast(a.ESTSTWHD AS CHAR(50))
		,cast(b.ESTSTWHD AS CHAR(50))
		,a.EMPLOYID
		,'Estimated State Withholding was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'INACTIVE was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END

IF 
	UPDATE (NOTEINDX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00700'
		,'NOTEINDX'
		,getdate()
		,cast(a.NOTEINDX AS CHAR(50))
		,cast(b.NOTEINDX AS CHAR(50))
		,a.EMPLOYID
		,'Note Index was changed for State Code ' + rtrim(a.STATECD) + ' for Employee ' + rtrim(a.EMPLOYID)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.STATECD = b.STATECD
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackStateTaxAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackStateTaxAdditions]
GO

CREATE TRIGGER [trackStateTaxAdditions] ON UPR00700
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00700'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'State Tax Code for Employee' + rtrim(EMPLOYID) + ' was added'
FROM inserted
GO

/*UPR00800*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackLocalTaxCodeChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackLocalTaxCodeChanges]
GO

CREATE TRIGGER [trackLocalTaxCodeChanges] ON UPR00800
FOR UPDATE
AS
IF 
	UPDATE (LCLFGSTS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00800'
		,'LCLFGSTS'
		,getdate()
		,cast(a.LCLFGSTS AS CHAR(50))
		,cast(b.LCLFGSTS AS CHAR(50))
		,a.EMPLOYID
		,'Local Filing Status  changed for Employee ' + rtrim(a.EMPLOYID) + ' for local tax code ' + rtrim(a.LOCALTAX)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.LOCALTAX = b.LOCALTAX
END

IF 
	UPDATE (AULCLTAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00800'
		,'AULCLTAX'
		,getdate()
		,cast(a.AULCLTAX AS CHAR(50))
		,cast(b.AULCLTAX AS CHAR(50))
		,a.EMPLOYID
		,'Automatic Local Tax changed for Employee ' + rtrim(a.EMPLOYID) + ' for local tax code ' + rtrim(a.LOCALTAX)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.LOCALTAX = b.LOCALTAX
END

IF 
	UPDATE (NUMOFEXM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00800'
		,'NUMOFEXM'
		,getdate()
		,cast(a.NUMOFEXM AS CHAR(50))
		,cast(b.NUMOFEXM AS CHAR(50))
		,a.EMPLOYID
		,'Number of Exemptions changed for Employee ' + rtrim(a.EMPLOYID) + ' for local tax code ' + rtrim(a.LOCALTAX)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.LOCALTAX = b.LOCALTAX
END

IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00800'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'Inactive changed for Employee ' + rtrim(a.EMPLOYID) + ' for local tax code ' + rtrim(a.LOCALTAX)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.LOCALTAX = b.LOCALTAX
END

IF 
	UPDATE (ADTLLOCWTHDNG)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00800'
		,'ADTLLOCWTHDNG'
		,getdate()
		,cast(a.ADTLLOCWTHDNG AS CHAR(50))
		,cast(b.ADTLLOCWTHDNG AS CHAR(50))
		,a.EMPLOYID
		,'Additional Local Withholding changed for Employee ' + rtrim(a.EMPLOYID) + ' for local tax code ' + rtrim(a.LOCALTAX)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.LOCALTAX = b.LOCALTAX
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackLocalTaxAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackLocalTaxAdditions]
GO

CREATE TRIGGER [trackLocalTaxAdditions] ON UPR00800
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00800'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Local Tax Code for Employee' + rtrim(EMPLOYID) + ' was added'
FROM inserted
GO

/*UPR00900*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackEmployeeSummaryChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackEmployeeSummaryChanges]
GO

CREATE TRIGGER [trackEmployeeSummaryChanges] ON UPR00900
FOR UPDATE
AS
IF 
	UPDATE (LPCHKNUM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'LPCHKNUM'
		,getdate()
		,cast(a.LPCHKNUM AS CHAR(50))
		,cast(b.LPCHKNUM AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (LSTPCKDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'LSTPCKDT'
		,getdate()
		,cast(a.LSTPCKDT AS CHAR(50))
		,cast(b.LSTPCKDT AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (LPCHKAMT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'LPCHKAMT'
		,getdate()
		,cast(a.LPCHKAMT AS CHAR(50))
		,cast(b.LPCHKAMT AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_1'
		,getdate()
		,cast(a.GROSWAGS_1 AS CHAR(50))
		,cast(b.GROSWAGS_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_2'
		,getdate()
		,cast(a.GROSWAGS_2 AS CHAR(50))
		,cast(b.GROSWAGS_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_3'
		,getdate()
		,cast(a.GROSWAGS_3 AS CHAR(50))
		,cast(b.GROSWAGS_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_4'
		,getdate()
		,cast(a.GROSWAGS_4 AS CHAR(50))
		,cast(b.GROSWAGS_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_5'
		,getdate()
		,cast(a.GROSWAGS_5 AS CHAR(50))
		,cast(b.GROSWAGS_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_6'
		,getdate()
		,cast(a.GROSWAGS_6 AS CHAR(50))
		,cast(b.GROSWAGS_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_7'
		,getdate()
		,cast(a.GROSWAGS_7 AS CHAR(50))
		,cast(b.GROSWAGS_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_8'
		,getdate()
		,cast(a.GROSWAGS_8 AS CHAR(50))
		,cast(b.GROSWAGS_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_9'
		,getdate()
		,cast(a.GROSWAGS_9 AS CHAR(50))
		,cast(b.GROSWAGS_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_10'
		,getdate()
		,cast(a.GROSWAGS_10 AS CHAR(50))
		,cast(b.GROSWAGS_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_11'
		,getdate()
		,cast(a.GROSWAGS_11 AS CHAR(50))
		,cast(b.GROSWAGS_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (GROSWAGS_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'GROSWAGS_12'
		,getdate()
		,cast(a.GROSWAGS_12 AS CHAR(50))
		,cast(b.GROSWAGS_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_1'
		,getdate()
		,cast(a.FDWTHLDG_1 AS CHAR(50))
		,cast(b.FDWTHLDG_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_2'
		,getdate()
		,cast(a.FDWTHLDG_2 AS CHAR(50))
		,cast(b.FDWTHLDG_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_3'
		,getdate()
		,cast(a.FDWTHLDG_3 AS CHAR(50))
		,cast(b.FDWTHLDG_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_4'
		,getdate()
		,cast(a.FDWTHLDG_4 AS CHAR(50))
		,cast(b.FDWTHLDG_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_5'
		,getdate()
		,cast(a.FDWTHLDG_5 AS CHAR(50))
		,cast(b.FDWTHLDG_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_6'
		,getdate()
		,cast(a.FDWTHLDG_6 AS CHAR(50))
		,cast(b.FDWTHLDG_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_7'
		,getdate()
		,cast(a.FDWTHLDG_7 AS CHAR(50))
		,cast(b.FDWTHLDG_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_8'
		,getdate()
		,cast(a.FDWTHLDG_8 AS CHAR(50))
		,cast(b.FDWTHLDG_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_9'
		,getdate()
		,cast(a.FDWTHLDG_9 AS CHAR(50))
		,cast(b.FDWTHLDG_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_10'
		,getdate()
		,cast(a.FDWTHLDG_10 AS CHAR(50))
		,cast(b.FDWTHLDG_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_11'
		,getdate()
		,cast(a.FDWTHLDG_11 AS CHAR(50))
		,cast(b.FDWTHLDG_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FDWTHLDG_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FDWTHLDG_12'
		,getdate()
		,cast(a.FDWTHLDG_12 AS CHAR(50))
		,cast(b.FDWTHLDG_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_1'
		,getdate()
		,cast(a.FICASSWG_1 AS CHAR(50))
		,cast(b.FICASSWG_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_2'
		,getdate()
		,cast(a.FICASSWG_2 AS CHAR(50))
		,cast(b.FICASSWG_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_3'
		,getdate()
		,cast(a.FICASSWG_3 AS CHAR(50))
		,cast(b.FICASSWG_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_4'
		,getdate()
		,cast(a.FICASSWG_4 AS CHAR(50))
		,cast(b.FICASSWG_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_5'
		,getdate()
		,cast(a.FICASSWG_5 AS CHAR(50))
		,cast(b.FICASSWG_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_6'
		,getdate()
		,cast(a.FICASSWG_6 AS CHAR(50))
		,cast(b.FICASSWG_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_7'
		,getdate()
		,cast(a.FICASSWG_7 AS CHAR(50))
		,cast(b.FICASSWG_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_8'
		,getdate()
		,cast(a.FICASSWG_8 AS CHAR(50))
		,cast(b.FICASSWG_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_9'
		,getdate()
		,cast(a.FICASSWG_9 AS CHAR(50))
		,cast(b.FICASSWG_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_10'
		,getdate()
		,cast(a.FICASSWG_10 AS CHAR(50))
		,cast(b.FICASSWG_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_11'
		,getdate()
		,cast(a.FICASSWG_11 AS CHAR(50))
		,cast(b.FICASSWG_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWG_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWG_12'
		,getdate()
		,cast(a.FICASSWG_12 AS CHAR(50))
		,cast(b.FICASSWG_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_1'
		,getdate()
		,cast(a.FICAMWGS_1 AS CHAR(50))
		,cast(b.FICAMWGS_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_2'
		,getdate()
		,cast(a.FICAMWGS_2 AS CHAR(50))
		,cast(b.FICAMWGS_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_3'
		,getdate()
		,cast(a.FICAMWGS_3 AS CHAR(50))
		,cast(b.FICAMWGS_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_4'
		,getdate()
		,cast(a.FICAMWGS_4 AS CHAR(50))
		,cast(b.FICAMWGS_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_5'
		,getdate()
		,cast(a.FICAMWGS_5 AS CHAR(50))
		,cast(b.FICAMWGS_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_6'
		,getdate()
		,cast(a.FICAMWGS_6 AS CHAR(50))
		,cast(b.FICAMWGS_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_7'
		,getdate()
		,cast(a.FICAMWGS_7 AS CHAR(50))
		,cast(b.FICAMWGS_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_8'
		,getdate()
		,cast(a.FICAMWGS_8 AS CHAR(50))
		,cast(b.FICAMWGS_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_9'
		,getdate()
		,cast(a.FICAMWGS_9 AS CHAR(50))
		,cast(b.FICAMWGS_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_10'
		,getdate()
		,cast(a.FICAMWGS_10 AS CHAR(50))
		,cast(b.FICAMWGS_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_11'
		,getdate()
		,cast(a.FICAMWGS_11 AS CHAR(50))
		,cast(b.FICAMWGS_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWGS_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWGS_12'
		,getdate()
		,cast(a.FICAMWGS_12 AS CHAR(50))
		,cast(b.FICAMWGS_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_1'
		,getdate()
		,cast(a.FICASSWH_1 AS CHAR(50))
		,cast(b.FICASSWH_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_2'
		,getdate()
		,cast(a.FICASSWH_2 AS CHAR(50))
		,cast(b.FICASSWH_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_3'
		,getdate()
		,cast(a.FICASSWH_3 AS CHAR(50))
		,cast(b.FICASSWH_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_4'
		,getdate()
		,cast(a.FICASSWH_4 AS CHAR(50))
		,cast(b.FICASSWH_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_5'
		,getdate()
		,cast(a.FICASSWH_5 AS CHAR(50))
		,cast(b.FICASSWH_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_6'
		,getdate()
		,cast(a.FICASSWH_6 AS CHAR(50))
		,cast(b.FICASSWH_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_7'
		,getdate()
		,cast(a.FICASSWH_7 AS CHAR(50))
		,cast(b.FICASSWH_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_8'
		,getdate()
		,cast(a.FICASSWH_8 AS CHAR(50))
		,cast(b.FICASSWH_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_9'
		,getdate()
		,cast(a.FICASSWH_9 AS CHAR(50))
		,cast(b.FICASSWH_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_10'
		,getdate()
		,cast(a.FICASSWH_10 AS CHAR(50))
		,cast(b.FICASSWH_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_11'
		,getdate()
		,cast(a.FICASSWH_11 AS CHAR(50))
		,cast(b.FICASSWH_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICASSWH_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICASSWH_12'
		,getdate()
		,cast(a.FICASSWH_12 AS CHAR(50))
		,cast(b.FICASSWH_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_1'
		,getdate()
		,cast(a.FICAMWDG_1 AS CHAR(50))
		,cast(b.FICAMWDG_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_2'
		,getdate()
		,cast(a.FICAMWDG_2 AS CHAR(50))
		,cast(b.FICAMWDG_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_3'
		,getdate()
		,cast(a.FICAMWDG_3 AS CHAR(50))
		,cast(b.FICAMWDG_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_4'
		,getdate()
		,cast(a.FICAMWDG_4 AS CHAR(50))
		,cast(b.FICAMWDG_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_5'
		,getdate()
		,cast(a.FICAMWDG_5 AS CHAR(50))
		,cast(b.FICAMWDG_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_6'
		,getdate()
		,cast(a.FICAMWDG_6 AS CHAR(50))
		,cast(b.FICAMWDG_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_7'
		,getdate()
		,cast(a.FICAMWDG_7 AS CHAR(50))
		,cast(b.FICAMWDG_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_8'
		,getdate()
		,cast(a.FICAMWDG_8 AS CHAR(50))
		,cast(b.FICAMWDG_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_9'
		,getdate()
		,cast(a.FICAMWDG_9 AS CHAR(50))
		,cast(b.FICAMWDG_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_10'
		,getdate()
		,cast(a.FICAMWDG_10 AS CHAR(50))
		,cast(b.FICAMWDG_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_11'
		,getdate()
		,cast(a.FICAMWDG_11 AS CHAR(50))
		,cast(b.FICAMWDG_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FICAMWDG_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FICAMWDG_12'
		,getdate()
		,cast(a.FICAMWDG_12 AS CHAR(50))
		,cast(b.FICAMWDG_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_1'
		,getdate()
		,cast(a.SUTAWAGS_1 AS CHAR(50))
		,cast(b.SUTAWAGS_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_2'
		,getdate()
		,cast(a.SUTAWAGS_2 AS CHAR(50))
		,cast(b.SUTAWAGS_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_3'
		,getdate()
		,cast(a.SUTAWAGS_3 AS CHAR(50))
		,cast(b.SUTAWAGS_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_4'
		,getdate()
		,cast(a.SUTAWAGS_4 AS CHAR(50))
		,cast(b.SUTAWAGS_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_5'
		,getdate()
		,cast(a.SUTAWAGS_5 AS CHAR(50))
		,cast(b.SUTAWAGS_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_6'
		,getdate()
		,cast(a.SUTAWAGS_6 AS CHAR(50))
		,cast(b.SUTAWAGS_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_7'
		,getdate()
		,cast(a.SUTAWAGS_7 AS CHAR(50))
		,cast(b.SUTAWAGS_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_8'
		,getdate()
		,cast(a.SUTAWAGS_8 AS CHAR(50))
		,cast(b.SUTAWAGS_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_9'
		,getdate()
		,cast(a.SUTAWAGS_9 AS CHAR(50))
		,cast(b.SUTAWAGS_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_10'
		,getdate()
		,cast(a.SUTAWAGS_10 AS CHAR(50))
		,cast(b.SUTAWAGS_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_11'
		,getdate()
		,cast(a.SUTAWAGS_11 AS CHAR(50))
		,cast(b.SUTAWAGS_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (SUTAWAGS_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'SUTAWAGS_12'
		,getdate()
		,cast(a.SUTAWAGS_12 AS CHAR(50))
		,cast(b.SUTAWAGS_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_1'
		,getdate()
		,cast(a.FUTAWAGS_1 AS CHAR(50))
		,cast(b.FUTAWAGS_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_2'
		,getdate()
		,cast(a.FUTAWAGS_2 AS CHAR(50))
		,cast(b.FUTAWAGS_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_3'
		,getdate()
		,cast(a.FUTAWAGS_3 AS CHAR(50))
		,cast(b.FUTAWAGS_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_4'
		,getdate()
		,cast(a.FUTAWAGS_4 AS CHAR(50))
		,cast(b.FUTAWAGS_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_5'
		,getdate()
		,cast(a.FUTAWAGS_5 AS CHAR(50))
		,cast(b.FUTAWAGS_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_6'
		,getdate()
		,cast(a.FUTAWAGS_6 AS CHAR(50))
		,cast(b.FUTAWAGS_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_7'
		,getdate()
		,cast(a.FUTAWAGS_7 AS CHAR(50))
		,cast(b.FUTAWAGS_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_8'
		,getdate()
		,cast(a.FUTAWAGS_8 AS CHAR(50))
		,cast(b.FUTAWAGS_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_9'
		,getdate()
		,cast(a.FUTAWAGS_9 AS CHAR(50))
		,cast(b.FUTAWAGS_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_10'
		,getdate()
		,cast(a.FUTAWAGS_10 AS CHAR(50))
		,cast(b.FUTAWAGS_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_11'
		,getdate()
		,cast(a.FUTAWAGS_11 AS CHAR(50))
		,cast(b.FUTAWAGS_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (FUTAWAGS_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'FUTAWAGS_12'
		,getdate()
		,cast(a.FUTAWAGS_12 AS CHAR(50))
		,cast(b.FUTAWAGS_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_1'
		,getdate()
		,cast(a.NETWAGES_1 AS CHAR(50))
		,cast(b.NETWAGES_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_2'
		,getdate()
		,cast(a.NETWAGES_2 AS CHAR(50))
		,cast(b.NETWAGES_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_3'
		,getdate()
		,cast(a.NETWAGES_3 AS CHAR(50))
		,cast(b.NETWAGES_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_4'
		,getdate()
		,cast(a.NETWAGES_4 AS CHAR(50))
		,cast(b.NETWAGES_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_5'
		,getdate()
		,cast(a.NETWAGES_5 AS CHAR(50))
		,cast(b.NETWAGES_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_6'
		,getdate()
		,cast(a.NETWAGES_6 AS CHAR(50))
		,cast(b.NETWAGES_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_7'
		,getdate()
		,cast(a.NETWAGES_7 AS CHAR(50))
		,cast(b.NETWAGES_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_8'
		,getdate()
		,cast(a.NETWAGES_8 AS CHAR(50))
		,cast(b.NETWAGES_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_9'
		,getdate()
		,cast(a.NETWAGES_9 AS CHAR(50))
		,cast(b.NETWAGES_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_10'
		,getdate()
		,cast(a.NETWAGES_10 AS CHAR(50))
		,cast(b.NETWAGES_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_11'
		,getdate()
		,cast(a.NETWAGES_11 AS CHAR(50))
		,cast(b.NETWAGES_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (NETWAGES_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'NETWAGES_12'
		,getdate()
		,cast(a.NETWAGES_12 AS CHAR(50))
		,cast(b.NETWAGES_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_1'
		,getdate()
		,cast(a.Federal_Wages_1 AS CHAR(50))
		,cast(b.Federal_Wages_1 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_2'
		,getdate()
		,cast(a.Federal_Wages_2 AS CHAR(50))
		,cast(b.Federal_Wages_2 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_3'
		,getdate()
		,cast(a.Federal_Wages_3 AS CHAR(50))
		,cast(b.Federal_Wages_3 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_4'
		,getdate()
		,cast(a.Federal_Wages_4 AS CHAR(50))
		,cast(b.Federal_Wages_4 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_5'
		,getdate()
		,cast(a.Federal_Wages_5 AS CHAR(50))
		,cast(b.Federal_Wages_5 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_6)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_6'
		,getdate()
		,cast(a.Federal_Wages_6 AS CHAR(50))
		,cast(b.Federal_Wages_6 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_7)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_7'
		,getdate()
		,cast(a.Federal_Wages_7 AS CHAR(50))
		,cast(b.Federal_Wages_7 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_8)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_8'
		,getdate()
		,cast(a.Federal_Wages_8 AS CHAR(50))
		,cast(b.Federal_Wages_8 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_9)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_9'
		,getdate()
		,cast(a.Federal_Wages_9 AS CHAR(50))
		,cast(b.Federal_Wages_9 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_10)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_10'
		,getdate()
		,cast(a.Federal_Wages_10 AS CHAR(50))
		,cast(b.Federal_Wages_10 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_11)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_11'
		,getdate()
		,cast(a.Federal_Wages_11 AS CHAR(50))
		,cast(b.Federal_Wages_11 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END

IF 
	UPDATE (Federal_Wages_12)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00900'
		,'Federal_Wages_12'
		,getdate()
		,cast(a.Federal_Wages_12 AS CHAR(50))
		,cast(b.Federal_Wages_12 AS CHAR(50))
		,a.EMPLOYID
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.YEAR1 = b.YEAR1
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackEmpSummaryAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackEmpSummaryAdditions]
GO

CREATE TRIGGER [trackEmpSummaryAdditions] ON UPR00900
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00900'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID)
FROM inserted
GO

/*BE010130*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackHRBenefitChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackHRBenefitChanges]
GO

CREATE TRIGGER [trackHRBenefitChanges] ON BE010130
FOR UPDATE
AS
IF 
	UPDATE (BENEFITTYPE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENEFITTYPE_I'
		,getdate()
		,cast(a.BENEFITTYPE_I AS CHAR(50))
		,cast(b.BENEFITTYPE_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit type was updated for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (IINDEX_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'IINDEX_I'
		,getdate()
		,cast(a.IINDEX_I AS CHAR(50))
		,cast(b.IINDEX_I AS CHAR(50))
		,a.EMPID_I
		,'Index was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BENEFITKIND_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENEFITKIND_I'
		,getdate()
		,cast(a.BENEFITKIND_I AS CHAR(50))
		,cast(b.BENEFITKIND_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit Kind was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COMPLETIONSTATUS_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COMPLETIONSTATUS_I'
		,getdate()
		,cast(a.COMPLETIONSTATUS_I AS CHAR(50))
		,cast(b.COMPLETIONSTATUS_I AS CHAR(50))
		,a.EMPID_I
		,'Completion status was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (POLICYNUMBER_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'POLICYNUMBER_I'
		,getdate()
		,cast(a.POLICYNUMBER_I AS CHAR(50))
		,cast(b.POLICYNUMBER_I AS CHAR(50))
		,a.EMPID_I
		,'Policy Number was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BENEFITSTATUS_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENEFITSTATUS_I'
		,getdate()
		,cast(a.BENEFITSTATUS_I AS CHAR(50))
		,cast(b.BENEFITSTATUS_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit Status was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPID_I
		,'Activation was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (OVERRIDE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'OVERRIDE_I'
		,getdate()
		,cast(a.OVERRIDE_I AS CHAR(50))
		,cast(b.OVERRIDE_I AS CHAR(50))
		,a.EMPID_I
		,'Override was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHECK1_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHECK1_I'
		,getdate()
		,cast(a.CHECK1_I AS CHAR(50))
		,cast(b.CHECK1_I AS CHAR(50))
		,a.EMPID_I
		,'Check box was changed on HR Benefit Palette for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHECK2_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHECK2_I'
		,getdate()
		,cast(a.CHECK2_I AS CHAR(50))
		,cast(b.CHECK2_I AS CHAR(50))
		,a.EMPID_I
		,'Check box was changed on HR Benefit Palette for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHECK3_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHECK3_I'
		,getdate()
		,cast(a.CHECK3_I AS CHAR(50))
		,cast(b.CHECK3_I AS CHAR(50))
		,a.EMPID_I
		,'Check box was changed on HR Benefit Palette for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHECK4_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHECK4_I'
		,getdate()
		,cast(a.CHECK4_I AS CHAR(50))
		,cast(b.CHECK4_I AS CHAR(50))
		,a.EMPID_I
		,'Check box was changed on HR Benefit Palette for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHECK5_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHECK5_I'
		,getdate()
		,cast(a.CHECK5_I AS CHAR(50))
		,cast(b.CHECK5_I AS CHAR(50))
		,a.EMPID_I
		,'Check box was changed on HR Benefit Palette for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DATEDUE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DATEDUE_I'
		,getdate()
		,cast(a.DATEDUE_I AS CHAR(50))
		,cast(b.DATEDUE_I AS CHAR(50))
		,a.EMPID_I
		,'Due Date was changed for Benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DSCRIPTN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DSCRIPTN'
		,getdate()
		,cast(a.DSCRIPTN AS CHAR(50))
		,cast(b.DSCRIPTN AS CHAR(50))
		,a.EMPID_I
		,'Description was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COMMENTSTR10_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COMMENTSTR10_I'
		,getdate()
		,cast(a.COMMENTSTR10_I AS CHAR(50))
		,cast(b.COMMENTSTR10_I AS CHAR(50))
		,a.EMPID_I
		,'Comments were changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (IBENEFITAMOUNT_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'IBENEFITAMOUNT_I'
		,getdate()
		,cast(a.IBENEFITAMOUNT_I AS CHAR(50))
		,cast(b.IBENEFITAMOUNT_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit Amount was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (LIFEAMTEMPL_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'LIFEAMTEMPL_I'
		,getdate()
		,cast(a.LIFEAMTEMPL_I AS CHAR(50))
		,cast(b.LIFEAMTEMPL_I AS CHAR(50))
		,a.EMPID_I
		,'Life Employee Amount was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (LIFEAMTSPOUSE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'LIFEAMTSPOUSE_I'
		,getdate()
		,cast(a.LIFEAMTSPOUSE_I AS CHAR(50))
		,cast(b.LIFEAMTSPOUSE_I AS CHAR(50))
		,a.EMPID_I
		,'Spouse''s Life Amount was updated for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (LIFEAMTCHILDREN_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'LIFEAMTCHILDREN_I'
		,getdate()
		,cast(a.LIFEAMTCHILDREN_I AS CHAR(50))
		,cast(b.LIFEAMTCHILDREN_I AS CHAR(50))
		,a.EMPID_I
		,'Children''s Life Amount was updated for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BENELIGIBILEDATE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENELIGIBILEDATE_I'
		,getdate()
		,cast(a.BENELIGIBILEDATE_I AS CHAR(50))
		,cast(b.BENELIGIBILEDATE_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit Eligibility Date was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFBEGDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFBEGDT'
		,getdate()
		,cast(a.BNFBEGDT AS CHAR(50))
		,cast(b.BNFBEGDT AS CHAR(50))
		,a.EMPID_I
		,'Benefit begin date was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFENDDT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFENDDT'
		,getdate()
		,cast(a.BNFENDDT AS CHAR(50))
		,cast(b.BNFENDDT AS CHAR(50))
		,a.EMPID_I
		,'Benefit End Date was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (VARBENFT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'VARBENFT'
		,getdate()
		,cast(a.VARBENFT AS CHAR(50))
		,cast(b.VARBENFT AS CHAR(50))
		,a.EMPID_I
		,'Variable benefits has been updated for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTFREQ)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFTFREQ'
		,getdate()
		,cast(a.BNFTFREQ AS CHAR(50))
		,cast(b.BNFTFREQ AS CHAR(50))
		,a.EMPID_I
		,'Benefit Frequency was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTEMPLOYEE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTEMPLOYEE_I'
		,getdate()
		,cast(a.COSTEMPLOYEE_I AS CHAR(50))
		,cast(b.COSTEMPLOYEE_I AS CHAR(50))
		,a.EMPID_I
		,'Default cost for the employee was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTEMPLOYER_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTEMPLOYER_I'
		,getdate()
		,cast(a.COSTEMPLOYER_I AS CHAR(50))
		,cast(b.COSTEMPLOYER_I AS CHAR(50))
		,a.EMPID_I
		,'Default cost for the employer was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTOTHER1_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTOTHER1_I'
		,getdate()
		,cast(a.COSTOTHER1_I AS CHAR(50))
		,cast(b.COSTOTHER1_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTOTHER2_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTOTHER2_I'
		,getdate()
		,cast(a.COSTOTHER2_I AS CHAR(50))
		,cast(b.COSTOTHER2_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (I1_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'I1_I'
		,getdate()
		,cast(a.I1_I AS CHAR(50))
		,cast(b.I1_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (I2_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'I2_I'
		,getdate()
		,cast(a.I2_I AS CHAR(50))
		,cast(b.I2_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (I3_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'I3_I'
		,getdate()
		,cast(a.I3_I AS CHAR(50))
		,cast(b.I3_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (I4_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'I4_I'
		,getdate()
		,cast(a.I4_I AS CHAR(50))
		,cast(b.I4_I AS CHAR(50))
		,a.EMPID_I
		,'Smoking preference was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (NUMBEROFCHILDREN_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'NUMBEROFCHILDREN_I'
		,getdate()
		,cast(a.NUMBEROFCHILDREN_I AS CHAR(50))
		,cast(b.NUMBEROFCHILDREN_I AS CHAR(50))
		,a.EMPID_I
		,'Number of children was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTTOTAL_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTTOTAL_I'
		,getdate()
		,cast(a.COSTTOTAL_I AS CHAR(50))
		,cast(b.COSTTOTAL_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (COSTCOBRA_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'COSTCOBRA_I'
		,getdate()
		,cast(a.COSTCOBRA_I AS CHAR(50))
		,cast(b.COSTCOBRA_I AS CHAR(50))
		,a.EMPID_I
		,'Amount to receive COBRA benefits was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BENEFITDEDUCTIBLE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENEFITDEDUCTIBLE_I'
		,getdate()
		,cast(a.BENEFITDEDUCTIBLE_I AS CHAR(50))
		,cast(b.BENEFITDEDUCTIBLE_I AS CHAR(50))
		,a.EMPID_I
		,'Deductible amount was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNPAYPMX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNPAYPMX'
		,getdate()
		,cast(a.BNPAYPMX AS CHAR(50))
		,cast(b.BNPAYPMX AS CHAR(50))
		,a.EMPID_I
		,'Benefit pay period max was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFYRMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFYRMAX'
		,getdate()
		,cast(a.BNFYRMAX AS CHAR(50))
		,cast(b.BNFYRMAX AS CHAR(50))
		,a.EMPID_I
		,'Benefit Year Max was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFLFMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFLFMAX'
		,getdate()
		,cast(a.BNFLFMAX AS CHAR(50))
		,cast(b.BNFLFMAX AS CHAR(50))
		,a.EMPID_I
		,'Benefit Lifetime Max was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BENEFICIARYINDEX_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BENEFICIARYINDEX_I'
		,getdate()
		,cast(a.BENEFICIARYINDEX_I AS CHAR(50))
		,cast(b.BENEFICIARYINDEX_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHANGEBY_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHANGEBY_I'
		,getdate()
		,cast(a.CHANGEBY_I AS CHAR(50))
		,cast(b.CHANGEBY_I AS CHAR(50))
		,a.EMPID_I
		,'User who last saved this record was changed by ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CHANGEDATE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CHANGEDATE_I'
		,getdate()
		,cast(a.CHANGEDATE_I AS CHAR(50))
		,cast(b.CHANGEDATE_I AS CHAR(50))
		,a.EMPID_I
		,'Date this record was changed was changed by ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTRIBPRETAX_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTRIBPRETAX_I'
		,getdate()
		,cast(a.CONTRIBPRETAX_I AS CHAR(50))
		,cast(b.CONTRIBPRETAX_I AS CHAR(50))
		,a.EMPID_I
		,'Pre-tax percentage for retirement was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTPRETAXDLR_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTPRETAXDLR_I'
		,getdate()
		,cast(a.CONTPRETAXDLR_I AS CHAR(50))
		,cast(b.CONTPRETAXDLR_I AS CHAR(50))
		,a.EMPID_I
		,'Pre-tax dollar amount for retirement was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTRIBAFTERTAX_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTRIBAFTERTAX_I'
		,getdate()
		,cast(a.CONTRIBAFTERTAX_I AS CHAR(50))
		,cast(b.CONTRIBAFTERTAX_I AS CHAR(50))
		,a.EMPID_I
		,'After tax percentage for retirement was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTAFTERTAXDLR_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTAFTERTAXDLR_I'
		,getdate()
		,cast(a.CONTAFTERTAXDLR_I AS CHAR(50))
		,cast(b.CONTAFTERTAXDLR_I AS CHAR(50))
		,a.EMPID_I
		,'After tax dollar amount was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTRIBBONUS_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTRIBBONUS_I'
		,getdate()
		,cast(a.CONTRIBBONUS_I AS CHAR(50))
		,cast(b.CONTRIBBONUS_I AS CHAR(50))
		,a.EMPID_I
		,'Pre-tax bonus percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (CONTRIBBONUSDOLLAR_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'CONTRIBBONUSDOLLAR_I'
		,getdate()
		,cast(a.CONTRIBBONUSDOLLAR_I AS CHAR(50))
		,cast(b.CONTRIBBONUSDOLLAR_I AS CHAR(50))
		,a.EMPID_I
		,'Pre-tax bonus dollar amount was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (HIGHLYCOMPENSATED_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'HIGHLYCOMPENSATED_I'
		,getdate()
		,cast(a.HIGHLYCOMPENSATED_I AS CHAR(50))
		,cast(b.HIGHLYCOMPENSATED_I AS CHAR(50))
		,a.EMPID_I
		,'High paid employee was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (LOANACTIVE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'LOANACTIVE_I'
		,getdate()
		,cast(a.LOANACTIVE_I AS CHAR(50))
		,cast(b.LOANACTIVE_I AS CHAR(50))
		,a.EMPID_I
		,'Loan active was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (TYPEOFCODE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'TYPEOFCODE_I'
		,getdate()
		,cast(a.TYPEOFCODE_I AS CHAR(50))
		,cast(b.TYPEOFCODE_I AS CHAR(50))
		,a.EMPID_I
		,'Code type was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (TIERSUSED_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'TIERSUSED_I'
		,getdate()
		,cast(a.TIERSUSED_I AS CHAR(50))
		,cast(b.TIERSUSED_I AS CHAR(50))
		,a.EMPID_I
		,'Tiers used was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (MAJMEDCOVERAGE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'MAJMEDCOVERAGE_I'
		,getdate()
		,cast(a.MAJMEDCOVERAGE_I AS CHAR(50))
		,cast(b.MAJMEDCOVERAGE_I AS CHAR(50))
		,a.EMPID_I
		,'Major Medical Coverage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (MAXOUTOFPOCKET_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'MAXOUTOFPOCKET_I'
		,getdate()
		,cast(a.MAXOUTOFPOCKET_I AS CHAR(50))
		,cast(b.MAXOUTOFPOCKET_I AS CHAR(50))
		,a.EMPID_I
		,'Max Out of Pocket was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (ELIGIBILITYDATE_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'ELIGIBILITYDATE_I'
		,getdate()
		,cast(a.ELIGIBILITYDATE_I AS CHAR(50))
		,cast(b.ELIGIBILITYDATE_I AS CHAR(50))
		,a.EMPID_I
		,'Benefit eligibility date was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (PRIMARYBENEFICIARY_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'PRIMARYBENEFICIARY_I'
		,getdate()
		,cast(a.PRIMARYBENEFICIARY_I AS CHAR(50))
		,cast(b.PRIMARYBENEFICIARY_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (SECBENEFICIARY_I)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'SECBENEFICIARY_I'
		,getdate()
		,cast(a.SECBENEFICIARY_I AS CHAR(50))
		,cast(b.SECBENEFICIARY_I AS CHAR(50))
		,a.EMPID_I
		,''
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFTMTHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFTMTHD'
		,getdate()
		,cast(a.BNFTMTHD AS CHAR(50))
		,cast(b.BNFTMTHD AS CHAR(50))
		,a.EMPID_I
		,'Benefit method was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFFRMLA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFFRMLA'
		,getdate()
		,cast(a.BNFFRMLA AS CHAR(50))
		,cast(b.BNFFRMLA AS CHAR(50))
		,a.EMPID_I
		,'Benefit formula was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFPRCNT_1'
		,getdate()
		,cast(a.BNFPRCNT_1 AS CHAR(50))
		,cast(b.BNFPRCNT_1 AS CHAR(50))
		,a.EMPID_I
		,'Benefit percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFPRCNT_2'
		,getdate()
		,cast(a.BNFPRCNT_2 AS CHAR(50))
		,cast(b.BNFPRCNT_2 AS CHAR(50))
		,a.EMPID_I
		,'Benefit percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFPRCNT_3'
		,getdate()
		,cast(a.BNFPRCNT_3 AS CHAR(50))
		,cast(b.BNFPRCNT_3 AS CHAR(50))
		,a.EMPID_I
		,'Benefit percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFPRCNT_4'
		,getdate()
		,cast(a.BNFPRCNT_4 AS CHAR(50))
		,cast(b.BNFPRCNT_4 AS CHAR(50))
		,a.EMPID_I
		,'Benefit percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (BNFPRCNT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'BNFPRCNT_5'
		,getdate()
		,cast(a.BNFPRCNT_5 AS CHAR(50))
		,cast(b.BNFPRCNT_5 AS CHAR(50))
		,a.EMPID_I
		,'Benefit percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNMTHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNMTHD'
		,getdate()
		,cast(a.DEDNMTHD AS CHAR(50))
		,cast(b.DEDNMTHD AS CHAR(50))
		,a.EMPID_I
		,'Deduction method was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDFRMLA)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDFRMLA'
		,getdate()
		,cast(a.DEDFRMLA AS CHAR(50))
		,cast(b.DEDFRMLA AS CHAR(50))
		,a.EMPID_I
		,'Deduction formula was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNPRCT_1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNPRCT_1'
		,getdate()
		,cast(a.DEDNPRCT_1 AS CHAR(50))
		,cast(b.DEDNPRCT_1 AS CHAR(50))
		,a.EMPID_I
		,'Deduction Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNPRCT_2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNPRCT_2'
		,getdate()
		,cast(a.DEDNPRCT_2 AS CHAR(50))
		,cast(b.DEDNPRCT_2 AS CHAR(50))
		,a.EMPID_I
		,'Deduction Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNPRCT_3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNPRCT_3'
		,getdate()
		,cast(a.DEDNPRCT_3 AS CHAR(50))
		,cast(b.DEDNPRCT_3 AS CHAR(50))
		,a.EMPID_I
		,'Deduction Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNPRCT_4)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNPRCT_4'
		,getdate()
		,cast(a.DEDNPRCT_4 AS CHAR(50))
		,cast(b.DEDNPRCT_4 AS CHAR(50))
		,a.EMPID_I
		,'Deduction Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDNPRCT_5)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDNPRCT_5'
		,getdate()
		,cast(a.DEDNPRCT_5 AS CHAR(50))
		,cast(b.DEDNPRCT_5 AS CHAR(50))
		,a.EMPID_I
		,'Deduction Percentage was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEPYPRMX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEPYPRMX'
		,getdate()
		,cast(a.DEPYPRMX AS CHAR(50))
		,cast(b.DEPYPRMX AS CHAR(50))
		,a.EMPID_I
		,'Deduction Pay Period Max was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDYRMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDYRMAX'
		,getdate()
		,cast(a.DEDYRMAX AS CHAR(50))
		,cast(b.DEDYRMAX AS CHAR(50))
		,a.EMPID_I
		,'Max Yearly deduction was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDLTMAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDLTMAX'
		,getdate()
		,cast(a.DEDLTMAX AS CHAR(50))
		,cast(b.DEDLTMAX AS CHAR(50))
		,a.EMPID_I
		,'Lifetime max deduction was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (DEDINITBAL)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'DEDINITBAL'
		,getdate()
		,cast(a.DEDINITBAL AS CHAR(50))
		,cast(b.DEDINITBAL AS CHAR(50))
		,a.EMPID_I
		,'Deduction initial balance was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (INACTBENEMPLOYEE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'INACTBENEMPLOYEE'
		,getdate()
		,cast(a.INACTBENEMPLOYEE AS CHAR(50))
		,cast(b.INACTBENEMPLOYEE AS CHAR(50))
		,a.EMPID_I
		,'Employee active benefit was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END

IF 
	UPDATE (INACTBENEMPLR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'BE010130'
		,'INACTBENEMPLR'
		,getdate()
		,cast(a.INACTBENEMPLR AS CHAR(50))
		,cast(b.INACTBENEMPLR AS CHAR(50))
		,a.EMPID_I
		,'Employer active benefit was changed for benefit ' + rtrim(a.BENEFIT) + ' for employee ' + rtrim(a.EMPID_I)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPID_I = b.EMPID_I
		AND a.BENEFIT = b.BENEFIT
END
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackHRBenefitAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackHRBenefitAdditions]
GO

CREATE TRIGGER [trackHRBenefitAdditions] ON BE010130
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'BE010130'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPID_I
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPID_I) + ' for benefit ' + rtrim(BENEFIT)
FROM inserted
GO

/*UPR00102*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackAddressChanges'
			AND type = 'tr'
		)
	DROP TRIGGER trackAddressChanges
GO

CREATE TRIGGER [trackAddressChanges] ON UPR00102
FOR UPDATE
AS
IF 
	UPDATE (ADDRESS1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'ADDRESS1'
		,getdate()
		,cast(a.ADDRESS1 AS CHAR(50))
		,cast(b.ADDRESS1 AS CHAR(50))
		,a.EMPLOYID
		,'Address1 changed for employee ' + rtrim(a.EMPLOYID) + ' for address code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (ADDRESS2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'ADDRESS2'
		,getdate()
		,cast(a.ADDRESS2 AS CHAR(50))
		,cast(b.ADDRESS2 AS CHAR(50))
		,a.EMPLOYID
		,'Address2 changed for employee ' + rtrim(a.EMPLOYID) + ' for address code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (ADDRESS3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'ADDRESS3'
		,getdate()
		,cast(a.ADDRESS3 AS CHAR(50))
		,cast(b.ADDRESS3 AS CHAR(50))
		,a.EMPLOYID
		,'Address3 changed for employee ' + rtrim(a.EMPLOYID) + ' for address code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (CITY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'CITY'
		,getdate()
		,cast(a.CITY AS CHAR(50))
		,cast(b.CITY AS CHAR(50))
		,a.EMPLOYID
		,'City changed for employee ' + rtrim(a.EMPLOYID) + ' for City code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (STATE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'STATE'
		,getdate()
		,cast(a.STATE AS CHAR(50))
		,cast(b.STATE AS CHAR(50))
		,a.EMPLOYID
		,'State changed for employee ' + rtrim(a.EMPLOYID) + ' for State code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (ZIPCODE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'ZIPCODE'
		,getdate()
		,cast(a.ZIPCODE AS CHAR(50))
		,cast(b.ZIPCODE AS CHAR(50))
		,a.EMPLOYID
		,'Zip Code changed for employee ' + rtrim(a.EMPLOYID) + ' for Zip Code code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (COUNTY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'COUNTY'
		,getdate()
		,cast(a.COUNTY AS CHAR(50))
		,cast(b.COUNTY AS CHAR(50))
		,a.EMPLOYID
		,'County changed for employee ' + rtrim(a.EMPLOYID) + ' for County code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (COUNTRY)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'COUNTRY'
		,getdate()
		,cast(a.COUNTRY AS CHAR(50))
		,cast(b.COUNTRY AS CHAR(50))
		,a.EMPLOYID
		,'Country changed for employee ' + rtrim(a.EMPLOYID) + ' for Coountry code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (PHONE1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'PHONE1'
		,getdate()
		,cast(a.PHONE1 AS CHAR(50))
		,cast(b.PHONE1 AS CHAR(50))
		,a.EMPLOYID
		,'Phone1 changed for employee ' + rtrim(a.EMPLOYID) + ' for Phone1 code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (PHONE2)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'PHONE2'
		,getdate()
		,cast(a.PHONE2 AS CHAR(50))
		,cast(b.PHONE2 AS CHAR(50))
		,a.EMPLOYID
		,'Phone2 changed for employee ' + rtrim(a.EMPLOYID) + ' for Phone2 code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (PHONE3)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'PHONE3'
		,getdate()
		,cast(a.PHONE3 AS CHAR(50))
		,cast(b.PHONE3 AS CHAR(50))
		,a.EMPLOYID
		,'PHONE3 changed for employee ' + rtrim(a.EMPLOYID) + ' for PHONE3 code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (FAX)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'FAX'
		,getdate()
		,cast(a.FAX AS CHAR(50))
		,cast(b.FAX AS CHAR(50))
		,a.EMPLOYID
		,'FAX changed for employee ' + rtrim(a.EMPLOYID) + ' for FAX code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (Foreign_Address)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'Foreign_Address'
		,getdate()
		,cast(a.Foreign_Address AS CHAR(50))
		,cast(b.Foreign_Address AS CHAR(50))
		,a.EMPLOYID
		,'Foreign_Address changed for employee ' + rtrim(a.EMPLOYID) + ' for Foreign_Address code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (Foreign_StateProvince)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'Foreign_StateProvince'
		,getdate()
		,cast(a.Foreign_StateProvince AS CHAR(50))
		,cast(b.Foreign_StateProvince AS CHAR(50))
		,a.EMPLOYID
		,'Foreign_StateProvince changed for employee ' + rtrim(a.EMPLOYID) + ' for Foreign_StateProvince code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (Foreign_Postal_Code)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'Foreign_Postal_Code'
		,getdate()
		,cast(a.Foreign_Postal_Code AS CHAR(50))
		,cast(b.Foreign_Postal_Code AS CHAR(50))
		,a.EMPLOYID
		,'Foreign_Postal_Code changed for employee ' + rtrim(a.EMPLOYID) + ' for Foreign_Postal_Code code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END

IF 
	UPDATE (CCode)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'UPR00102'
		,'CCode'
		,getdate()
		,cast(a.CCode AS CHAR(50))
		,cast(b.CCode AS CHAR(50))
		,a.EMPLOYID
		,'CCode changed for employee ' + rtrim(a.EMPLOYID) + ' for CCode code ' + rtrim(a.ADRSCODE)
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.ADRSCODE = b.ADRSCODE
END
GO


GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackAddressCodeAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER trackAddressCodeAdditions
GO

CREATE TRIGGER [trackAddressCodeAdditions] ON UPR00102
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'UPR00102'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Address Code ' + rtrim(ADRSCODE) + ' was added for employee ' + rtrim(EMPLOYID)
FROM inserted
GO

/*DD00100*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDDEmpMSTRAdditions1'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDDEmpMSTRAdditions1]
GO

CREATE TRIGGER [trackDDEmpMSTRAdditions1] ON DD00100
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'DD00100'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID)
FROM inserted
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDirectDepositMasterChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDirectDepositMasterChanges]
GO

CREATE TRIGGER [trackDirectDepositMasterChanges] ON DD00100
FOR UPDATE
AS
IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00100'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'Inactive was changed for Employee ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (DDREMAIN)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00100'
		,'DDREMAIN'
		,getdate()
		,cast(a.DDREMAIN AS CHAR(50))
		,cast(b.DDREMAIN AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Remainder was changed for Employee ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END

IF 
	UPDATE (INDEX1)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00100'
		,'INDEX1'
		,getdate()
		,cast(a.INDEX1 AS CHAR(50))
		,cast(b.INDEX1 AS CHAR(50))
		,a.EMPLOYID
		,'Index was changed for Employee ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
END
GO

/*DD00200*/
IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDDEmpMSTRAdditions'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDDEmpMSTRAdditions]
GO

CREATE TRIGGER [trackDDEmpMSTRAdditions] ON DD00200
FOR INSERT
AS
INSERT trackPayrollChanges
SELECT system_user
	,'DD00200'
	,'Inserted Record'
	,getdate()
	,'Inserted Record'
	,'Inserted Record'
	,EMPLOYID
	,'Record with DEX_ROW_ID ' + rtrim(cast(DEX_ROW_ID AS CHAR(6))) + ' was added for employee ' + rtrim(EMPLOYID)
FROM inserted
GO

IF EXISTS (
		SELECT 1
		FROM sysobjects
		WHERE name = 'trackDirectDepositEmployeeAccountChanges'
			AND type = 'tr'
		)
	DROP TRIGGER [trackDirectDepositEmployeeAccountChanges]
GO

CREATE TRIGGER [trackDirectDepositEmployeeAccountChanges] ON DD00200
FOR UPDATE
AS
IF 
	UPDATE (INACTIVE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'INACTIVE'
		,getdate()
		,cast(a.INACTIVE AS CHAR(50))
		,cast(b.INACTIVE AS CHAR(50))
		,a.EMPLOYID
		,'Inactive changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DEDNMTHD)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DEDNMTHD'
		,getdate()
		,cast(a.DEDNMTHD AS CHAR(50))
		,cast(b.DEDNMTHD AS CHAR(50))
		,a.EMPLOYID
		,'Deduction Method changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DEDUCTON)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DEDUCTON'
		,getdate()
		,cast(a.DEDUCTON AS CHAR(50))
		,cast(b.DEDUCTON AS CHAR(50))
		,a.EMPLOYID
		,'Deduction changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDPRE)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDPRE'
		,getdate()
		,cast(a.DDPRE AS CHAR(50))
		,cast(b.DDPRE AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Prenote changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDPRECNT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDPRECNT'
		,getdate()
		,cast(a.DDPRECNT AS CHAR(50))
		,cast(b.DDPRECNT AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Prenote count changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDPCT)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDPCT'
		,getdate()
		,cast(a.DDPCT AS CHAR(50))
		,cast(b.DDPCT AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Percent changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDAMTDLR)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDAMTDLR'
		,getdate()
		,cast(a.DDAMTDLR AS CHAR(50))
		,cast(b.DDAMTDLR AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit AmountDlr changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDACTNUM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDACTNUM'
		,getdate()
		,cast(a.DDACTNUM AS CHAR(50))
		,cast(b.DDACTNUM AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Account Number changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDTRANUM)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDTRANUM'
		,getdate()
		,cast(a.DDTRANUM AS CHAR(50))
		,cast(b.DDTRANUM AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Transit Number changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END

IF 
	UPDATE (DDTRANS)

BEGIN
	INSERT trackPayrollChanges
	SELECT system_user
		,'DD00200'
		,'DDTRANS'
		,getdate()
		,cast(a.DDTRANS AS CHAR(50))
		,cast(b.DDTRANS AS CHAR(50))
		,a.EMPLOYID
		,'Direct Deposit Transaction Code changed for Employee ID ' + a.EMPLOYID
	FROM deleted a
	INNER JOIN inserted b ON a.EMPLOYID = b.EMPLOYID
		AND a.INDEX1 = b.INDEX1
END
GO

GRANT SELECT, INSERT, DELETE, UPDATE
     ON trackPayrollChanges
     TO DYNGRP
GO


