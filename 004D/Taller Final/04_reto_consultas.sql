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

--ejercicio 7
SELECT 
    cl.nombre_cliente AS cliente,
    cl.direccion,
    cl.telefono,
    co.nom_comuna AS comuna
FROM clientes cl
INNER JOIN comunas co ON cl.comuna_id = co.id
WHERE co.nom_comuna IN ('Puerto Montt', 'Puerto Varas', 'Castro')
ORDER BY comuna ASC, cliente ASC;

--ejercicio 1 de gemini
SELECT ar.nom_articulo AS articulo, ar.precio, ma.nom_marca AS marca, ar.STOCK_ACTUAL 
FROM articulos ar INNER JOIN marcas ma 
ON ar.marca_id = ma.id 
WHERE ar.STOCK_ACTUAL < 100
ORDER BY precio DESC; 

--ejercicio 2 de gemini
SELECT 
    ma.nom_marca AS marca,
    COUNT(ar.id) AS total_articulos,
    MAX(ar.precio) AS precio_maximo
FROM marcas ma
INNER JOIN articulos ar ON ar.marca_id = ma.id
GROUP BY ma.nom_marca
ORDER BY total_articulos DESC;

--ejercicio 3 gemini
SELECT ca.nom_categoria AS categoria, COUNT(ve.id) AS cantidad_vendedores, ROUND(AVG(sueldo), 0) AS promedio_sueldo 
FROM CATEGORIAS ca INNER JOIN vendedores ve ON ve.categoria_id = ca.ID
GROUP BY ca.NOM_CATEGORIA
ORDER BY cantidad_vendedores DESC;

--ejercicio 4 gemini
SELECT f.id AS num_factura, v.nombres, v.paterno, z.nom_zona AS zona, v.sueldo + 50000 AS sueldo_con_bono
FROM FACTURAS f
INNER JOIN vendedores v ON f.vendedor_id = v.id 
INNER JOIN zonas z ON v.zona_id = z.id 
WHERE v.comision >= 0.08 AND z.NOM_ZONA IN ('Norte Lagos', 'Sur Austral') ORDER BY num_factura ASC;

--ejercicio 8
SELECT 
    v.rut_vendedor,
    v.nombres,
    v.paterno,
    z.nom_zona AS zona,
    c.nom_categoria AS categoria,
    v.sueldo,
    ROUND(v.sueldo * (c.porcentaje / 100), 0) AS bono_categoria
FROM vendedores v
INNER JOIN zonas z ON v.zona_id = z.id
INNER JOIN categorias c ON v.categoria_id = c.id
WHERE c.porcentaje > 8 AND z.porc > 8
ORDER BY bono_categoria DESC;

--ejercicio 9
SELECT f.id AS num_factura, f.fecha_factura, cl.nombre_cliente AS cliente, co.nom_comuna AS comuna_cliente, v.nombres, v.paterno FROM facturas f 
INNER JOIN clientes cl ON f.cliente_id = cl.id
INNER JOIN comunas co ON cl.comuna_id = co.id
INNER JOIN vendedores v ON f.vendedor_id = v.id
WHERE co.nom_comuna = 'Puerto Varas' OR v.comision >= 0.10 ORDER BY num_factura ASC;

--ejercicio 10
SELECT f.id AS folio_factura, m.nom_marca AS marca, a.nom_articulo AS articulo, df.cantidad, a.precio AS precio_unitario, df.cantidad * a.precio AS subtotal_linea
FROM detalle_factura df 
INNER JOIN facturas f ON df.factura_id = f.id
INNER JOIN articulos a ON df.articulo_id = a.id
INNER JOIN marcas m ON a.marca_id = m.id
WHERE df.cantidad >= 25
  AND m.nom_marca IN ('Good Smile', 'Konami TCG', 'Bandai Namco')
ORDER BY subtotal_linea DESC;

--ejercicio 11
SELECT c.nom_categoria AS categoria, COUNT(*) AS total_vendedores, ROUND(AVG(v.sueldo), 0) AS sueldo_promedio, 
MIN(v.sueldo) AS sueldo_minimo, MAX(v.sueldo) AS sueldo_maximo FROM CATEGORIAS c
INNER JOIN VENDEDORES v ON v.CATEGORIA_ID = c.id 
GROUP BY c.nom_categoria 
ORDER BY total_vendedores DESC, sueldo_promedio DESC; 

--ejercicio 12
