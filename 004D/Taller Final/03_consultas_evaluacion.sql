--5.1
--Desarrolle una consulta que muestre el nombre de la comuna y el total de productos vendidos por comuna 
--(sumando las unidades de cantidad). Ordenado por total de productos, de mayor a menor.
SELECT co.nom_comuna,SUM(df.cantidad) AS total_productos FROM comunas co INNER JOIN clientes cl ON co.id = cl.comuna_id INNER JOIN facturas f ON cl.id = f.cliente_id INNER JOIN detalle_factura df ON f.id = df.factura_id GROUP BY co.nom_comuna ORDER BY total_productos DESC;

--5.2
-- Desarrolle una consulta que muestre los datos del vendedor y el monto total vendido por cada vendedor 
--(calculado como la suma de cantidad * precio). Ordenado por monto total vendido, de mayor a menor.
SELECT v.id, v.rut_vendedor, v.nombres, v.paterno, v.materno, SUM(df.cantidad * a.precio) AS monto_total_vendido FROM vendedores v INNER JOIN facturas f ON v.id = f.vendedor_id INNER JOIN detalle_factura df ON f.id = df.factura_id INNER JOIN articulos a ON df.articulo_id = a.id GROUP BY v.id, v.rut_vendedor, v.nombres, v.paterno, v.materno ORDER BY monto_total_vendido DESC;