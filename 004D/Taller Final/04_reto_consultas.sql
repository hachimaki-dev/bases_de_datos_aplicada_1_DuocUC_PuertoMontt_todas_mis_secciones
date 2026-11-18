--Abarca proyecciones con cálculos matemáticos, alias (AS), filtros con conjunción (AND), disyunción (OR), manejo de paréntesis,
--valores nulos (IS NULL / IS NOT NULL), ordenamientos múltiples (ORDER BY), cruces de 2 a 6 tablas (INNER JOIN), 
--agrupaciones (GROUP BY) y funciones de agregación (COUNT, SUM, AVG, MIN, MAX).

--ejercicio 1
SELECT nom_articulo AS coleccionable, precio AS precio_unitario, stock_actual - stock_minimo AS holgura_stock, precio * stock_actual AS capital_bodega
FROM articulos WHERE precio >= 10000 AND (stock_actual - stock_minimo) >= 30 ORDER BY capital_bodega DESC;

--ejercicio 2
SELECT rut_vendedor AS rut, nombres, paterno, sueldo AS sueldo_base, comision, zona_id FROM VENDEDORES WHERE (ZONA_ID = 1 OR ZONA_ID = 3) AND (sueldo > 560000 OR COMISION = 0.13) ORDER BY sueldo_base DESC, paterno ASC;

--ejercicio 3
SELECT rut_vendedor, nombres, paterno, materno, zona_id, fec_contrato FROM VENDEDORES WHERE MATERNO IS NULL OR ZONA_ID IS NULL ORDER BY FEC_CONTRATO desc;

--ejercicio 4
SELECT rut_vendedor, nombres, paterno, sueldo AS sueldo_base, ROUND (sueldo * comision, 0) AS bono_comision, ROUND(sueldo + (sueldo * comision), 0) AS total_haberes FROM VENDEDORES WHERE materno IS NOT NULL OR sueldo > 570000 ORDER BY total_haberes DESC;

--ejercicio 5
SELECT nom_articulo AS titulo, precio AS precio_neto, ROUND(precio * 0.19, 0) AS monto_iva, ROUND(precio * 1.19 , 0) AS precio_con_iva FROM ARTICULOS WHERE MARCA_ID IN (1,2,4,5) AND precio BETWEEN 10000 AND 50000 AND STOCK_ACTUAL >= STOCK_MINIMO * 2 ORDER BY precio_con_iva ASC;

--ejercicio 6
SELECT m.nom_marca AS marca_editorial, a.nom_articulo AS producto, a.precio, a.stock_actual, a.precio * a.stock_actual AS valor_inventario 
FROM ARTICULOS a INNER JOIN marcas m ON a.MARCA_ID = m.id WHERE m.NOM_MARCA IN ('Bandai Namco', 'Panini Manga', 'Good Smile') AND a.STOCK_ACTUAL >= 80 ORDER BY valor_inventario DESC;