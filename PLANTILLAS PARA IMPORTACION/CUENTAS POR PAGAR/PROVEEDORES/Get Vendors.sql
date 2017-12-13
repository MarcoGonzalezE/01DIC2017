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
	
select APAcct,APSub,VendId,VName,sum(Balance)/2 from vr_03651
where perpost = 201712
group by apacct , apsub, vendid, vname
ORDER BY vendid asc
	
	
