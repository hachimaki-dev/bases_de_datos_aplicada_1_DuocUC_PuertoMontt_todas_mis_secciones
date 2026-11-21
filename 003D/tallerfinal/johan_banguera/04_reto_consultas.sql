-- #1 --
SELECT nom_articulo AS coleccionable, precio AS precio_unitario, (stock_actual - stock_minimo) AS holgura_stock, (precio * stock_actual) AS capital_bodega 
FROM ARTICULOS WHERE (precio >= 10000) AND ((stock_actual - stock_minimo) >= 30) ORDER BY capital_bodega DESC;

-- #2 --
SELECT rut_vendedor AS rut, nombres, paterno, sueldo AS sueldo_base, comision, zona_id 
FROM VENDEDORES WHERE (ZONA_ID = 1 OR ZONA_ID = 3) AND (sueldo > 560000 OR comision = 0.13) ORDER BY sueldo_base DESC, paterno ASC;

-- #3 --
SELECT rut_vendedor, nombres, paterno, materno, zona_id, fec_contrato 
FROM VENDEDORES WHERE (materno IS NULL OR zona_id IS NULL) ORDER BY FEC_CONTRATO DESC;

-- #4 --
SELECT rut_vendedor, nombres, paterno, sueldo AS sueldo_base, ROUND(sueldo * comision, 0) AS bono_comision, ROUND(sueldo + (sueldo * comision), 0) AS total_haberes 
FROM VENDEDORES WHERE (materno IS NOT NULL OR sueldo > 570000) ORDER BY total_haberes DESC;

-- #5 --
SELECT nom_articulo AS titulo, precio AS precio_neto, ROUND(precio * 0.19, 0) AS monto_iva, ROUND(precio * 1.19, 0) AS precio_con_iva
FROM ARTICULOS WHERE marca_id IN (1, 2, 4, 5) AND (precio between 10000 AND 50000) AND stock_actual >= stock_minimo * 2 ORDER BY precio_con_iva ASC;

-- #6 --
SELECT m.nom_marca AS marca_editorial, a.nom_articulo AS producto, a.precio, a.stock_actual, (a.precio * stock_actual) AS valor_inventario
FROM ARTICULOS a JOIN MARCAS m ON a.MARCA_ID = m.id 
WHERE m.nom_marca IN ('Bandai Namco', 'Panini Manga', 'Good Smile') AND (a.STOCK_ACTUAL >= 80) ORDER BY valor_inventario DESC;

-- #7 --
SELECT c.nombre_cliente AS cliente, c.direccion, c.telefono, co.nom_comuna AS comuna
FROM CLIENTES c INNER JOIN COMUNAS co ON c.comuna_id = co.ID
WHERE co.nom_comuna IN ('Puerto Montt', 'Puerto Varas', 'Castro') ORDER BY comuna ASC, cliente ASC;

-- #8 --
SELECT v.rut_vendedor, v.nombres, v.paterno, z.nom_zona AS zona, ca.nom_categoria AS categoria, v.sueldo, ROUND(v.sueldo * (porcentaje / 100), 0) AS bono_categoria
FROM VENDEDORES v INNER JOIN ZONAS z ON v.zona_id = z.id INNER JOIN CATEGORIAS ca ON v.categoria_id = ca.ID 
WHERE ca.PORCENTAJE > 8 AND z.porc > 8 ORDER BY bono_categoria DESC;
-- #9 --
SELECT f.id AS num_factura, f.fecha_factura, c.nombre_cliente AS cliente, co.nom_comuna AS comuna_cliente, v.nombres, v.paterno, v.materno
FROM FACTURAS f INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.id INNER JOIN VENDEDORES v ON f.VENDEDOR_ID = V.id INNER JOIN COMUNAS co ON c.COMUNA_ID = co.id
WHERE co.nom_comuna IN ('Puerto Varas') OR (v.COMISION >= 0.10) ORDER BY num_factura ASC;
-- #10 --
SELECT f.id AS folio_factura, m.nom_marca AS marca, a.nom_articulo AS articulo, df.cantidad, a.precio AS precio_unitario, (df.cantidad * a.precio) AS subtotal_linea
FROM DETALLE_FACTURA df INNER JOIN ARTICULOS a ON df.ARTICULO_ID = a.ID INNER JOIN FACTURAS f ON df.FACTURA_ID = f.ID INNER JOIN MARCAS m ON a.MARCA_ID = m.ID
WHERE df.CANTIDAD >= 25 AND m.NOM_MARCA IN ('Good Smile', 'Konami TCG', 'Bandai Namco') ORDER BY subtotal_linea DESC;
-- #11 --

-- #12 --

-- #13 --

-- #14 --

-- #15 --

-- #16 --

-- #17 --

-- #18 --

-- #19 --

-- #20 --