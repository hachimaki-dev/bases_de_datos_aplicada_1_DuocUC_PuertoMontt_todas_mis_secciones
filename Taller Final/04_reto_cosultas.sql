select NOM_ARTICULO as coleccionable, PRECIO as precio_unitario, (STOCK_ACTUAL-STOCK_MINIMO) as holgura_stock, (precio*STOCK_ACTUAL) as capital_bodega
from ARTICULOS
where (PRECIO>=10000) and ((STOCK_ACTUAL-STOCK_MINIMO)>=30)
order by capital_bodega desc
;

select RUT_VENDEDOR as rut, NOMBRES, PATERNO, SUELDO as sueldo_base, comision, ZONA_ID 
from VENDEDORES
where (ZONA_ID = 1 or ZONA_ID = 3) and (SUELDO >560000 or COMISION = 0.13)
order by sueldo_base desc, PATERNO asc
;

select RUT_VENDEDOR, NOMBRES, PATERNO, MATERNO, ZONA_ID, FEC_CONTRATO
from VENDEDORES
where MATERNO is null or ZONA_ID is null
;

select RUT_VENDEDOR, NOMBRES, PATERNO, SUELDO as sueldo_base, round(SUELDO * COMISION, 0) as bono_comision, round(SUELDO + (SUELDO*COMISION),0) as total_haberes
from VENDEDORES
where MATERNO is not null or SUELDO >570000
order by total_haberes desc
;

select NOM_ARTICULO as titulo, PRECIO as precio_neto, round(PRECIO*0.19,0) as monto_iva, round(precio * 1.19,0) as precio_con_iva 
from ARTICULOS
where (MARCA_ID in (1,2,4,5)) and (precio between 10000 and 50000) and (STOCK_ACTUAL >= STOCK_MINIMO*2)
order by precio_con_iva asc
;

select m.NOM_MARCA as marca_editorial ,ar.NOM_ARTICULO as producto, ar.PRECIO, ar.STOCK_ACTUAL, (ar.PRECIO * ar.STOCK_ACTUAL) as valor_inventario
from ARTICULOS ar
inner join MARCAS m on m.ID = ar.MARCA_ID
where m.NOM_MARCA in ('Bandai Namco', 'Panini Manga', 'Good Smile') and ar.STOCK_ACTUAL >= 80
order by valor_inventario desc
;

select cl.NOMBRE_CLIENTE as cliente, cl.DIRECCION, cl.TELEFONO, co.NOM_COMUNA as comuna
from CLIENTES cl
inner join COMUNAS co on co.ID = cl.COMUNA_ID
where co.NOM_COMUNA in ('Puerto Montt', 'Puerto Varas', 'Castro')
order by co.NOM_COMUNA desc, cl.NOMBRE_CLIENTE
;

select * from VENDEDORES;
select * from zonas;
select * from CATEGORIAS;
select * from clientes;
select * from FACTURAS;
select * from DETALLE_FACTURA;

select v.RUT_VENDEDOR, v.NOMBRES, v.PATERNO, z.NOM_ZONA as zona, c.NOM_CATEGORIA as categoria, v.SUELDO, round(v.SUELDO *(c.PORCENTAJE / 100)) as bono_categoria
from VENDEDORES v
inner join ZONAS z on z.ID = v.ZONA_ID
join CATEGORIAS c on c.ID = v.CATEGORIA_ID
where c.PORCENTAJE > 8 and z.PORC > 8
order by bono_categoria desc
;

select f.ID as num_factura, f.FECHA_FACTURA, cl.NOMBRE_CLIENTE as cliente, co.NOM_COMUNA as comuna_cliente, v.NOMBRES as nom_vendedor, v.PATERNO as apellido_vendedor
from FACTURAS f
inner join CLIENTES cl on cl.ID = f.CLIENTE_ID
join VENDEDORES v on v.ID = f.VENDEDOR_ID
join COMUNAS co on co.ID = cl.COMUNA_ID
where co.NOM_COMUNA = 'Puerto Varas' or v.COMISION >= 0.10
order by num_factura asc
;

select f.id as folio_factura, m.NOM_MARCA as marca, ar.NOM_ARTICULO as articulo, df.cantidad, ar.PRECIO as precio_unitario, (df.CANTIDAD * ar.PRECIO) as subtotal_linea
from DETALLE_FACTURA df
inner join FACTURAS f on f.id = df.FACTURA_ID
join ARTICULOS ar on ar.id = df.ARTICULO_ID
join MARCAS m on m.id = ar.MARCA_ID
where df.CANTIDAD >=25 and m.NOM_MARCA in ('Good Smile', 'Konami TCG', 'Bandai Namco')
order by subtotal_linea desc
;