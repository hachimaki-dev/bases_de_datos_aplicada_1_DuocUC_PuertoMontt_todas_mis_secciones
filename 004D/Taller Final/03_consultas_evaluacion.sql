-- Pregunta 5.1: Desarrolle una consulta que muestre el nombre de la comuna y el total de productos vendidos por comuna (sumando las unidades de cantidad). 
-- Ordenado por total de productos, de mayor a menor.

SELECT c.nom_comuna AS Comuna, SUM(df.cantidad) AS Total_Productos
FROM comunas c
INNER JOIN clientes cl ON cl.comuna_id = c.id
INNER JOIN facturas f ON f.cliente_id = cl.id
INNER JOIN detalle_factura df ON df.factura_id = f.id
GROUP BY c.nom_comuna
ORDER BY Total_Productos DESC;

-- Pregunta 5.2: Desarrolle una consulta que muestre los datos del vendedor y el monto total vendido por cada vendedor (calculado como la suma de cantidad * precio). 
-- Ordenado por monto total vendido, de mayor a menor.

SELECT v.rut_vendedor, v.nombres, v.paterno, v.materno, SUM(df.cantidad * a.precio) AS monto_total_vendido
FROM vendedores v
INNER JOIN facturas f ON f.vendedor_id = v.id
INNER JOIN detalle_factura df ON df.factura_id = f.id
INNER JOIN articulos a ON a.id = df.articulo_id
GROUP BY v.rut_vendedor, v.nombres, v.paterno, v.materno
ORDER BY monto_total_vendido DESC;
