-- Pregunta 5.1: Desarrolle una consulta que muestre el nombre de la comuna y el total de productos
--  vendidos por comuna (sumando las unidades de cantidad). Ordenado por total de productos, de mayor
--   a menor.

-- Debes unir en cadena: comunas → clientes → facturas → detalle_factura usando INNER JOIN, aplicar SUM(df.cantidad) 
-- AS total_productos, agrupar con GROUP BY por el nombre de la comuna y ordenar con ORDER BY total_productos DESC.

SELECT * from COMUNAS;
SELECT * from ARTICULOS;
SELECT * from DETALLE_FACTURA;
select * from FACTURA;
SELECT * from CLIENTES;


SELECT nom_comuna, SUM(df.CANTIDAD) as cantidad_total from comunas co
join clientes cl ON co.ID = cl.COMUNA_ID
join FACTURA fa on fa.CLIENTE_ID = cl.ID
join DETALLE_FACTURA df on fa.ID = df.FACTURA_ID
group by co.NOM_COMUNA
order by cantidad_total DESC
;

-- Pregunta 5.2: Desarrolle una consulta que muestre los datos del vendedor y el monto total vendido por cada vendedor
-- calculado como la suma de cantidad * precio). Ordenado por monto total vendido, de mayor a menor.

select * from VENDEDORES;
SELECT * from DETALLE_FACTURA;
SELECT * from ARTICULOS;
SELECT * from FACTURA;

SELECT ve.RUT_VENDEDOR, ve.NOMBRES, ve.PATERNO, ve.ZONA_ID, ve.CATEGORIA_ID, SUM(df.CANTIDAD * ar.PRECIO) AS monto_total_vendido from VENDEDORES ve
join FACTURA fa on fa.VENDEDOR_ID = ve.ID
join DETALLE_FACTURA df on fa.id = df.factura_id
join ARTICULOS ar on ar.ID = df.ARTICULO_ID

group by ve.RUT_VENDEDOR, ve.NOMBRES, ve.PATERNO, ve.ZONA_ID, ve.CATEGORIA_ID
order by monto_total_vendido desc
;
