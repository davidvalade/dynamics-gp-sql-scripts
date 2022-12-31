/*

This reconciles dollar and count of SOP Batches

*/
DECLARE @bachnumb CHAR(25)
	,@numtrx INT
	,@batchamount NUMERIC(19, 5)

SET NOCOUNT ON

DECLARE c_sop CURSOR
FOR
SELECT bachnumb
FROM sy00500
WHERE series = 3
	AND bchsourc = 'Sales Entry'

OPEN c_sop

FETCH NEXT
FROM c_sop
INTO @bachnumb

WHILE @@fetch_status = 0
BEGIN
	SELECT @numtrx = IsNull(count(sopnumbe), 0)
		,@batchamount = IsNull(sum(docamnt), 0)
	FROM sop10100
	WHERE bachnumb = @bachnumb

	UPDATE SY00500
	SET NUMOFTRX = @numtrx
		,BCHTOTAL = @batchamount
	WHERE bachnumb = @bachnumb

	FETCH NEXT
	FROM c_sop
	INTO @bachnumb
END

CLOSE c_sop

DEALLOCATE c_sop

SET NOCOUNT OFF

