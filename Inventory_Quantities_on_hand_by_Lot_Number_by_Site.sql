/*

Show inventory quantities on hand by lot and site.
Can be used in reporting.

*/
SELECT A.ITEMNMBR AS ITEM
	,C.ITEMDESC AS DESCRIPTION
	,A.LOCNCODE AS SITE
	,A.LOTNUMBR
	,A.EXPNDATE AS EXPIRY_DATE
	,(
		A.QTYRECVD - (
			CASE 
				WHEN A.QTYTYPE = 1
					THEN A.QTYSOLD
				ELSE (A.QTYRECVD)
				END
			)
		) AS QTY_ON_HAND
	,A.QTYRECVD AS QTY_IN
	,CASE 
		WHEN A.QTYTYPE = 1
			THEN A.QTYSOLD
		ELSE (A.QTYRECVD)
		END AS QTY_OUT
	,A.UNITCOST
	,A.QTYTYPE AS QTY_TYPE
	,A.QTYRECVD AS QTY_RECEIVED
	,A.QTYSOLD AS QTY_SOLD
	,CASE 
		WHEN A.QTYTYPE = 2
			THEN A.QTYRECVD
		ELSE (0)
		END AS QTY_RETURNED
	,C.ITMSHNAM AS SHORTNAME
	,C.ITMGEDSC AS GENERIC_DESC
	,C.ITMCLSCD AS CLASS_ID
FROM IV00300 A
LEFT JOIN SOP10201 B ON B.ITEMNMBR = A.ITEMNMBR
	AND B.SERLTNUM = A.LOTNUMBR
LEFT JOIN IV00101 C ON C.ITEMNMBR = A.ITEMNMBR
GROUP BY A.ITEMNMBR
	,A.QTYRECVD
	,A.QTYSOLD
	,A.LOTNUMBR
	,A.LOCNCODE
	,A.QTYTYPE
	,A.UNITCOST
	,C.ITEMDESC
	,C.ITMSHNAM
	,C.ITMCLSCD
	,C.ITMGEDSC
	,A.EXPNDATE
