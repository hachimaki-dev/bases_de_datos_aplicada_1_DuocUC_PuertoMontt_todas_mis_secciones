-- Pregunta 5.1: Desarrolle una consulta que muestre el nombre de la comuna y el total de productos vendidos por comuna (sumando las unidades de cantidad).
-- Ordenado por total de productos, de mayor a menor.
SELECT * FROM comunas;
SELECT * FROM articulos;
SELECT * FROM detalle_factura;
SELECT * FROM facturas;
SELECT * FROM clientes;

SELECT co.nom_comuna, SUM(df.cantidad) AS cantidad_total FROM comunas co
JOIN clientes cl ON  co.id = cl.comuna_id
JOIN facturas fa ON fa.cliente_id = cl.id
JOIN detalle_factura df ON fa.id = df.factura_id
GROUP BY co.NOM_COMUNA
ORDER BY cantidad_total DESC;

-- Pregunta 5.2: Desarrolle una consulta que muestre los datos del vendedor y el monto total vendido por cada vendedor (calculado como la suma de cantidad * precio). 
-- Ordenado por monto total vendido, de mayor a menor.
SELECT * FROM vendedores;
SELECT * FROM facturas;
SELECT * FROM detalle_factura;
SELECT * FROM articulos;

SELECT ve.rut_vendedor, a.nom_articulo, (SUM(df.cantidad) * a.precio) AS monto_total  FROM vendedores ve
JOIN facturas fa ON fa.vendedor_id = ve.id
JOIN detalle_factura df ON df.factura_id = fa.id
JOIN articulos a ON df.articulo_id = a.id
GROUP BY ve.rut_vendedor, a.nom_articulo
ORDER BY monto_total DESC;
