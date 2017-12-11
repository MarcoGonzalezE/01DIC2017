use SLAvicapp
select top 1000 
    VendId 'ID',
	Name 'Cliente',
	Addr1 'Direccion', 
	Addr2 'Colonia', 
	City 'Ciudad',
	State 'Estado',
	RemitZIP 'ZIP',
	Country 'Pais',
	TaxRegNbr 'RFC',
	Terms 'TerminosCondiciones',
	RemitPhone 'Phone',
	* from vendor	
	
	use SLAvicapp
	select  VendId,VName,* from vr_03651 where perpost = '201711'
	
	
	select SUM(Balance), 
		CpnyID,
		VendID, 
		RefNbr, 
		DocDate, 
		InvcNbr, 
		InvcDate, 
		DocType,
		S4Future11,
		MasterDocNbr,
		
		PerEnt, 
		 
		 
		PerPost, 
		PerClosed, 
		OrigDocAmt, 
		CuryOrigDocAmt, VName, APAcct, APSub, DocBal, CuryID, CurrBalance, CpnyName, Period, dStatus, 
		vStatus, DueDate, PayDate, cRI_ID, APDocUser1, APDocUser2, APDocUser3, APDocUser4, 
		APDocUser5, APDocUser6, 
		APDocUser7, APDocUser8, VendorUser1, VendorUser2, VendorUser3, VendorUser4, VendorUser5, 
		VendorUser6, VendorUser7, VendorUser8 
		from vr_03651 
		group by Parent, 
		CpnyID, 
		Ord, 
		VendID, 
		RefNbr, 
		DocDate, 
		InvcNbr, InvcDate, DocType, PerEnt, MasterDocNbr, S4Future11, PerPost, PerClosed, OrigDocAmt, CuryOrigDocAmt, VName, APAcct, APSub, Balance, DocBal, CuryID, CurrBalance, CpnyName, Period, dStatus, vStatus, DueDate, PayDate, cRI_ID, APDocUser1, APDocUser2, APDocUser3, APDocUser4, APDocUser5, APDocUser6, APDocUser7, APDocUser8, VendorUser1, VendorUser2, VendorUser3, VendorUser4, VendorUser5, VendorUser6, VendorUser7, VendorUser8
	having perpost = '201711'
	
	
	SELECT 
		Parent, 
		CpnyID, 
		Ord, 
		VendID, 
		RefNbr, 
		DocDate, 
		InvcNbr, InvcDate, DocType, PerEnt, MasterDocNbr, S4Future11, PerPost, PerClosed, OrigDocAmt, CuryOrigDocAmt, VName, APAcct, APSub, Balance, DocBal, CuryID, CurrBalance, CpnyName, Period, dStatus, vStatus, DueDate, PayDate, cRI_ID, APDocUser1, APDocUser2, APDocUser3, APDocUser4, APDocUser5, APDocUser6, APDocUser7, APDocUser8, VendorUser1, VendorUser2, VendorUser3, VendorUser4, VendorUser5, VendorUser6, VendorUser7, VendorUser8
FROM SLAvicapp.dbo.vr_03651;





 SELECT "vr_03651"."VendID", 
 		"vr_03651"."APAcct", 
 		"vr_03651"."VName", 
 		"vr_03651"."RefNbr", 
 		"vr_03651"."InvcNbr", 
 		"vr_03651"."DocDate", 
 		"vr_03651"."InvcDate", 
 		"vr_03651"."DocType", 
 		"vr_03651"."OrigDocAmt", 
 		"vr_03651"."PerEnt", 
 		"vr_03651"."PerPost", 
 		"vr_03651"."PerClosed", 
 		 "vr_03651"."CpnyID", 
 		 "vr_03651"."CpnyName", 
 		 "vr_03651"."Ord", 
 		 "vr_03651"."Parent", 
 		 "vr_03651"."Balance", 
 		 "vr_03651"."MasterDocNbr", 
 		 "vr_03651"."S4Future11", 
 		 "vr_03651"."APSub" 
 FROM     "SLAvicapp"."dbo"."vr_03651" "vr_03651" 
 WHERE (Period = '201711' AND cRI_ID = 14)
 ORDER BY "vr_03651"."CpnyID", "vr_03651"."VendID"
 
 SELECT 
 		SUM(vr_03651.Balance) 
 		 
 FROM   vr_03651 vr_03651
 GROUP BY 
 		"vr_03651"."VendID", 
 		"vr_03651"."APAcct", 
 		"vr_03651"."VName", 
 		"vr_03651"."RefNbr", 
 		"vr_03651"."InvcNbr", 
 		"vr_03651"."DocDate", 
 		"vr_03651"."InvcDate", 
 		"vr_03651"."DocType", 
 		"vr_03651"."OrigDocAmt", 
 		"vr_03651"."PerEnt", 
 		"vr_03651"."PerPost", 
 		"vr_03651"."PerClosed", 
 		 "vr_03651"."CpnyID", 
 		 "vr_03651"."CpnyName", 
 		 "vr_03651"."Ord", 
 		 "vr_03651"."Parent",  
 		 "vr_03651"."MasterDocNbr", 
 		 "vr_03651"."S4Future11", 
 		 "vr_03651"."APSub" 
 HAVING (vr_03651.Perpost = '201711')
 ORDER BY "vr_03651"."CpnyID", "vr_03651"."VendID"


	
	
