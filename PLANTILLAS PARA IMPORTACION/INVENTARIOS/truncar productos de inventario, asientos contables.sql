--#con esta query se eliminan los productos, asientos contables,
truncate table public.product_product cascade

--#borrar ordenes de venta
truncate table public.sale_order cascade

--# borrar movimientos de almacenes
truncate table public.stock_picking cascade