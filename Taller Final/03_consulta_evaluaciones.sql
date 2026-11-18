SELECT NOM_COMUNA,SUM(df.CANTIDAD) as total_productos
FROM COMUNAS c 
INNER JOIN CLIENTES cl on cl.COMUNA_ID = c.ID 
join facturas f on f.CLIENTE_ID = cl.ID
join DETALLE_FACTURA df on df.FACTURA_ID = f.ID
group by c.NOM_COMUNA
order by total_productos desc
;


SELECT * FROM VENDEDORES;
SELECT * FROM FACTURAS;
SELECT * FROM DETALLE_FACTURA;
SELECT * FROM ARTICULOS;
select v.NOMBRES, v.RUT_VENDEDOR, sum(df.CANTIDAD*ar.PRECIO) as total_vendido
from vendedores v
inner join FACTURAS f on f.VENDEDOR_ID = v.ID
join DETALLE_FACTURA df on df.FACTURA_ID = f.ID
join ARTICULOS ar on ar.ID = df.ARTICULO_ID
group by v.NOMBRES, v.RUT_VENDEDOR
order by total_vendido DESC
;