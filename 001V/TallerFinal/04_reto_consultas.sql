-- 1
SELECT nom_articulo AS Coleccionable, precio AS Precio_Unitario, (stock_actual - stock_minimo) AS Holgura_stock , (precio * stock_actual) AS Capital_bodega FROM ARTICULOS
WHERE precio >= 10000 AND (stock_actual - stock_minimo) >= 30 
ORDER BY Capital_bodega DESC;
-- 2
SELECT rut_vendedor AS rut, nombres, paterno, sueldo AS Sueldo_base, comision, zona_id FROM VENDEDORES
WHERE (ZONA_ID = 1 OR ZONA_ID = 3) AND (sueldo > 560000 OR comision = 0.13)
ORDER BY Sueldo_base DESC, paterno ASC;
-- 3
SELECT rut_vendedor, nombres, paterno, materno, zona_id, fec_contrato FROM VENDEDORES WHERE materno IS NULL OR zona_id IS NULL ORDER BY fec_contrato DESC;
-- 4
SELECT rut_vendedor, nombres, paterno, sueldo AS sueldo_base, ROUND(sueldo + (sueldo*comision),0) AS total_haberes FROM VENDEDORES
WHERE materno IS NOT NULL OR sueldo > 570000 
ORDER BY total_haberes DESC;
-- 5
SELECT nom_articulo AS titulo, precio AS precio_neto, ROUND(precio*0.19, 0) AS monto_iva, ROUND(precio*1.19, 0) AS precio_con_iva FROM ARTICULOS
WHERE marca_id IN(1,2,4,5) AND precio BETWEEN 10000 AND 50000 AND stock_actual >= STOCK_MINIMO*2
ORDER BY precio_con_iva ASC;
--6
