-- Alimentos T%
-- Medicamento 005%
-- Materia Prima 008%
-- Empaque 003%
-- Semen  (comprado y producido)
-- Materiales y Accesorios (CANAL COMEDERO ROJO) 009% 
-- Consumibles (Geringas, bolsa para semen, pipetas) 005%
-- Refacciones (catarinas, bandas ) 009% - DEBERIAN FILTRAR


use SLAvicapp
select  Descr,Invtid from inventory where invtid like 'T%'





--Listas con cantidades
use SLAvicapp 
SELECT k.KitId, k.Descr,c.cmpnentid,i.Descr, c.CmpnentQty
FROM SLAvicapp.dbo.Kit k
INNER JOIN SLAvicapp.dbo.Component c on c.kitid = k.KitID
inner join SLAvicapp.dbo.Inventory i on i.invtid = c.cmpnentid
order by k.kitid asc




SELECT CmpnentID,KitID,* from Component 
select top 1000 * from kit 


