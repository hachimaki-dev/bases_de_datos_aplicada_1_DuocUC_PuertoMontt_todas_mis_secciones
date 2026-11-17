--#1
SELECT nombre_articulo AS coleccionable, precio AS precio_unitario, (stock_actual - stock_minimo) AS holgura_stock, (precio * stock_actual) AS capital_bodega 
FROM ARTICULOS WHERE (precio >= 10000) AND ((stock_actual - stock_minimo) >= 30) ORDER BY capital_bodega DESC;

--#2
SELECT rut_vendedor AS rut, nombres, paterno, sueldo AS sueldo_base, comision, zona_id 
FROM VENDEDORES WHERE (zona_id = 1 OR zona_id = 3) AND (sueldo > 560000 OR comision = 0.13) ORDER BY sueldo_base DESC, paterno ASC;

--#3
SELECT rut_vendedor, nombres, paterno, materno, zona_id, fecha_contrato FROM VENDEDORES WHERE (materno IS NULL OR zona_id IS NULL) ORDER BY fecha_contrato DESC;

--#4
SELECT rut_vendedor, nombres, paterno, sueldo AS sueldo_base, ROUND(sueldo * comision, 0) FROM VENDEDORES;