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