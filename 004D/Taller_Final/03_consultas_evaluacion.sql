select *
  from comunas;
select *
  from articulos;
select *
  from detalle_factura;
select *
  from facturas;
select *
  from clientes;


select nom_comuna,
       sum(df.cantidad) as cantidad_total
  from comunas co
  join clientes cl
on co.id = cl.comuna_id
  join facturas fa
on fa.cliente_id = cl.id
  join detalle_factura df
on fa.id = df.factura_id
 group by nom_comuna
 order by cantidad_total desc;


--Para la Pregunta 5.2: Los datos del vendedor están en vendedores, la cantidad en detalle_factura y el precio unitario en articulos. Debes unir: vendedores → facturas → detalle_factura → articulos, calcular SUM(df.cantidad * a.precio) AS monto_total_vendido, agrupar por las columnas del vendedor mostradas en el SELECT y ordenar de mayor a menor.

SELECT * FROM VENDEDORES;
SELECT * FROM FACTURAS;
SELECT * FROM DETALLE_FACTURA;
SELECT * FROM ARTICULOS;

SELECT RUT_VENDEDOR, (SUM(df.CANTIDAD) * a.PRECIO) AS CANTIDAD_VENDIDO, a.NOM_ARTICULO  FROM VENDEDORES ve
JOIN FACTURAS fa ON ve.ID = fa.VENDEDOR_ID
JOIN DETALLE_FACTURA df ON fa.ID = df.FACTURA_ID
JOIN ARTICULOS a on a.ID = df.ARTICULO_ID
GROUP BY RUT_VENDEDOR, a.NOM_ARTICULO;
;
