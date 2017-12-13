use SLAvicapp
select top 1000 
    VendId 'ID',
	Name 'Proveedor',
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
	



-- OBTENER BALANZAZ DE COMPROBACION DE CLIENTES

use SLAvicapp

select  aracct,arsub,CustId,CName,sum(DocBal)/2 'SUMA' 
		from vr_08621
group by aracct,arsub,CustId,CName, GrpAcctSub
order by arsub asc
	
	
