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
select  vr.aracct,vr.arsub,vr.CustId,CName,customer.Addr1,customer.BillZip,sum(DocBal)/2 'SUMA' 
		from vr_08621 vr
		inner join customer customer on customer.Name = vr.CName
		
group by vr.aracct,vr.arsub,vr.CustId,CName, GrpAcctSub,customer.Addr1,customer.BillZip
having sum(DocBal) <> 0
order by arsub asc
	
	
