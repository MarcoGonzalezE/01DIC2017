use SLAvicapp
select top 1000 
    VendId 'ID',
	Name 'Cliente',
	Addr1 'Direccion', 
	Addr2 'Direccion2', 
	City 'Ciudad',
	State 'Estado',
	RemitZIP 'ZIP',
	Country 'Pais',
	TaxRegNbr 'RFC',
	* from vendor