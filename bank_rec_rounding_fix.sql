/*

The bank rec module displays 2 decimal accuracy, but the database holds 5.

A misbehaving application might have a fractional cent error that isn't displayed through the UI. This rectifies that error.

*/
UPDATE CM20200
SET ClrdAmt = ROUND(ClrdAmt, 2)
	,TRXAMNT = ROUND(TRXAMNT, 2)
	,ORIGAMT = ROUND(ORIGAMT, 2)
	,Checkbook_Amount = ROUND(Checkbook_Amount, 2)
WHERE right(ClrdAmt, 3) <> 0
	OR right(TRXAMNT, 3) <> 0
	OR right(ORIGAMT, 3) <> 0
	OR right(Checkbook_Amount, 3) <> 0

UPDATE CM20500
SET StmntBal = ROUND(StmntBal, 2)
	,CUTOFFBAL = ROUND(CUTOFFBAL, 2)
	,ClrePayAmt = ROUND(ClrePayAmt, 2)
	,ClrdDepAmt = ROUND(ClrdDepAmt, 2)
	,Cleared_Difference = ROUND(Cleared_Difference, 2)
	,OUTPAYTOT = ROUND(OUTPAYTOT, 2)
	,OUTDEPTOT = ROUND(OUTDEPTOT, 2)
	,IINADJTOT = ROUND(IINADJTOT, 2)
	,DECADJTOT = ROUND(DECADJTOT, 2)
	,ASOFBAL = ROUND(ASOFBAL, 2)
WHERE right(StmntBal, 3) <> 0
	OR right(CUTOFFBAL, 3) <> 0
	OR right(ClrePayAmt, 3) <> 0
	OR right(ClrdDepAmt, 3) <> 0
	OR right(ClrdDepAmt, 3) <> 0
	OR right(Cleared_Difference, 3) <> 0
	OR right(OUTPAYTOT, 3) <> 0
	OR right(OUTDEPTOT, 3) <> 0
	OR right(IINADJTOT, 3) <> 0
	OR right(DECADJTOT, 3) <> 0
	OR right(ASOFBAL, 3) <> 0

UPDATE CM00100
SET CURRBLNC = ROUND(CURRBLNC, 2)
