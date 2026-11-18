-- #1 --
SELECT nom_articulo AS coleccionable, precio AS precio_unitario, (stock_actual - stock_minimo) AS holgura_stock, (precio * stock_actual) AS capital_bodega FROM ARTICULOS WHERE (precio >= 10000) AND ((stock_actual - stock_minimo) >= 30) ORDER BY capital_bodega DESC;

-- #2 --
SELECT rut_vendedor AS rut, nombres, paterno, sueldo AS sueldo_base, comision, zona_id FROM VENDEDORES WHERE (ZONA_ID = 1 OR ZONA_ID = 3) AND (sueldo > 560000 OR comision = 0.13) ORDER BY sueldo_base DESC, paterno ASC;

-- #3 --
SELECT rut_vendedor, nombres, paterno, materno, zona_id, fec_contrato FROM VENDEDORES WHERE (materno IS NULL OR zona_id IS NULL) ORDER BY FEC_CONTRATO DESC;

-- #4 --
SELECT rut_vendedor, nombres, paterno, sueldo AS sueldo_base, ROUND(sueldo * comision, 0) AS bono_comision, ROUND(sueldo + (sueldo * comision), 0) AS total_haberes FROM VENDEDORES WHERE (materno IS NOT NULL OR sueldo > 570000) ORDER BY total_haberes DESC;