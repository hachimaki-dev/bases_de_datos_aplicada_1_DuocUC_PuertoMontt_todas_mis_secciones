--#1
SELECT 
nombre_articulo AS coleccionable, 
precio AS precio_unitario, 
(stock_actual - stock_minimo) AS holgura_stock, 
(precio * stock_actual) AS capital_bodega 
FROM ARTICULOS 
WHERE (precio >= 10000) AND ((stock_actual - stock_minimo) >= 30) 
ORDER BY capital_bodega DESC;

--#2
SELECT 
rut_vendedor AS rut,
nombres, 
paterno, 
sueldo AS sueldo_base, 
comision, 
zona_id
FROM VENDEDORES 
WHERE (zona_id = 1 OR zona_id = 3) AND (sueldo > 560000 OR comision = 0.13) 
ORDER BY sueldo_base DESC, paterno ASC;

--#3
SELECT 
rut_vendedor, 
nombres, 
paterno, 
materno, 
zona_id, 
fecha_contrato 
FROM VENDEDORES 
WHERE (materno IS NULL OR zona_id IS NULL) 
ORDER BY fecha_contrato DESC;

--#4
SELECT 
rut_vendedor, 
nombres, 
paterno, 
sueldo AS sueldo_base, 
ROUND(sueldo * comision, 0) 
FROM VENDEDORES;

--#5
SELECT 
nombre_articulo AS titulo, 
precio AS precio_neto, 
ROUND(precio * 0.19, 0) AS monto_iva, 
ROUND(precio * 1.19, 0) AS precio_con_iva 
FROM ARTICULOS 
WHERE (marca_id IN (1,2,3,4,5)) AND (precio BETWEEN 10000 AND 50000) 
AND (stock_actual >=  stock_minimo * 2) ORDER BY precio_con_iva ASC;

--#6
SELECT 
m.nombre_marca AS marca_editorial, 
a.nombre_articulo AS producto, 
a.precio, a.stock_actual, 
a.precio * a.stock_actual AS valor_inventario 
FROM ARTICULOS a 
INNER JOIN MARCAS m ON a.marca_id = m.id_marca 
WHERE (m.nombre_marca = 'Bandai Namco' OR  m.nombre_marca = 'Panini Manga' OR m.nombre_marca = 'Good Smile') 
AND a.stock_actual >= 80 ORDER BY valor_inventario DESC;

--#7
SELECT 
cl.nombre_cliente AS cliente, 
cl.direccion, 
cl.telefono, 
co.nombre_comuna AS comuna 
FROM CLIENTES cl 
INNER JOIN COMUNAS co ON cl.comuna_id = co.id_comuna 
WHERE (co.nombre_comuna = 'Puerto Montt' OR co.nombre_comuna = 'Puerto Varas' OR co.nombre_comuna = 'Castro') 
ORDER BY comuna ASC, cliente ASC;

--#8
SELECT 
v.rut_vendedor, 
v.nombres, 
v.paterno, 
z.nombre_zona AS zona, 
c.nombre_categoria AS categoria, 
v.sueldo, ROUND(v.sueldo * (c.porcentaje / 100), 0) AS bono_categoria 
FROM VENDEDORES v 
INNER JOIN ZONAS z ON v.zona_id = z.id_zona 
INNER JOIN CATEGORIAS c ON v.categoria_id = c.id_categoria 
WHERE c.porcentaje > 8 AND z.porc > 8 ORDER BY bono_categoria DESC;

--#9
SELECT 
f.id_factura AS num_factura, 
f.fecha_factura, 
cl.nombre_cliente AS cliente, 
co.nombre_comuna AS comuna_cliente, 
v.nombres, 
v.paterno 
FROM FACTURAS f INNER JOIN CLIENTES cl ON f.cliente_id = cl.id_cliente 
INNER JOIN COMUNAS co ON cl.comuna_id = co.id_comuna 
INNER JOIN VENDEDORES v ON f.vendedor_id = v.id_vendedor 
WHERE co.nombre_comuna = 'Puerto Varas' OR v.comision >= 0.10 
ORDER BY num_factura ASC;

--#10
SELECT 
f.id_factura AS folio_factura, 
m.nombre_marca AS marca, 
a.nombre_articulo AS articulo, 
df.cantidad, 
a.precio AS precio_unitario, 
df.cantidad * a.precio AS subtotal_linea 
FROM DETALLE_FACTURA df 
INNER JOIN FACTURAS f ON df.factura_id = f.id_factura 
INNER JOIN ARTICULOS a ON df.articulo_id = a.id_articulo 
INNER JOIN MARCAS m ON a.marca_id = m.id_marca 
WHERE df.cantidad >= 25 AND m.nombre_marca = 'Good Smile' OR m.nombre_marca = 'Konami TCG' OR m.nombre_marca = 'Bandai Namco' 
ORDER BY subtotal_linea DESC;

--#11
SELECT 
c.nombre_categoria AS categoria, 
COUNT(*) AS total_vendedores, 
ROUND(AVG(v.sueldo), 0) AS sueldo_promedio, 
MIN(v.sueldo) AS sueldo_minimo, 
MAX(v.sueldo) AS sueldo_maximo 
FROM VENDEDORES v 
INNER JOIN CATEGORIAS c ON v.categoria_id = c.id_categoria 
GROUP BY c.nombre_categoria 
ORDER BY total_vendedores DESC, sueldo_promedio DESC;

--#12
SELECT 
co.nombre_comuna AS comuna, 
COUNT(cl.id_cliente) AS cantidad_clientes 
FROM CLIENTES cl 
INNER JOIN COMUNAS co ON cl.comuna_id = co.id_comuna 
GROUP BY co.nombre_comuna 
ORDER BY cantidad_clientes DESC, comuna ASC;

--#13
SELECT 
df.factura_id AS numero_factura, 
COUNT(*) AS lineas_detalle, 
SUM(df.cantidad) AS total_unidades, 
MIN(df.cantidad) AS menor_cantidad, 
MAX(df.cantidad) AS mayor_cantidad 
FROM DETALLE_FACTURA df 
INNER JOIN FACTURAS f ON df.factura_id = f.id_factura 
GROUP BY df.factura_id 
ORDER BY total_unidades DESC;

--#14
SELECT 
a.nombre_articulo AS coleccionable, 
a.precio AS precio_actual, 
COUNT(df.id_detalle_factura) AS veces_facturado, 
SUM(df.cantidad) AS unidades_vendidas, 
ROUND(AVG(df.cantidad), 1) AS promedio_unidades 
FROM ARTICULOS a 
INNER JOIN DETALLE_FACTURA df ON a.id_articulo = df.articulo_id 
GROUP BY a.nombre_articulo, a.precio 
ORDER BY unidades_vendidas DESC;

--#15
SELECT 
m.nombre_marca AS marca_editorial, 
COUNT(df.id_detalle_factura) AS transacciones, 
SUM(df.cantidad) AS total_unidades, 
SUM(df.cantidad * a.precio) AS ingresos_totales_pesos 
FROM MARCAS m 
INNER JOIN ARTICULOS a ON m.id_marca = a.marca_id 
INNER JOIN DETALLE_FACTURA df ON a.id_articulo = df.articulo_id 
GROUP BY m.nombre_marca ORDER BY ingresos_totales_pesos DESC;

--#16
SELECT 
f.id_factura AS folio_factura, 
cl.nombre_cliente AS cliente, 
SUM(df.cantidad) AS unidades_compradas, 
SUM(df.cantidad * a.precio) AS monto_neto, 
ROUND(SUM(df.cantidad * precio) * 1.19, 0) AS monto_total_iva 
FROM FACTURAS f 
INNER JOIN CLIENTES cl ON f.cliente_id = cl.id_cliente 
INNER JOIN DETALLE_FACTURA df ON f.id_factura = df.factura_id 
INNER JOIN ARTICULOS a ON df.articulo_id = a.id_articulo 
GROUP BY f.id_factura, cl.nombre_cliente 
ORDER BY monto_total_iva DESC;

--#17
SELECT 
cl.nombre_cliente AS cliente, 
co.nombre_comuna AS comuna, 
COUNT(df.id_detalle_factura) AS lineas_compradas, 
SUM(df.cantidad) AS total_unidades, 
SUM(df.cantidad * a.precio) AS gasto_total_acumulado 
FROM COMUNAS co 
INNER JOIN CLIENTES cl ON co.id_comuna = cl.comuna_id 
INNER JOIN FACTURAS f ON f.cliente_id = cl.id_cliente 
INNER JOIN DETALLE_FACTURA df ON df.factura_id = f.id_factura 
INNER JOIN ARTICULOS a ON df.articulo_id = a.id_articulo 
GROUP BY cl.nombre_cliente, co.nombre_comuna 
ORDER BY gasto_total_acumulado DESC;

--#18
SELECT 
v.rut_vendedor AS rut, 
v.nombres, 
v.paterno, 
v.comision AS tasa_comision, 
SUM(df.cantidad * a.precio) AS total_vendido, 
ROUND(SUM(df.cantidad * a.precio) * v.comision, 0) AS comision_ganada_pesos 
FROM VENDEDORES v 
INNER JOIN FACTURAS f ON v.id_vendedor = f.vendedor_id 
INNER JOIN DETALLE_FACTURA df ON f.id_factura = df.factura_id 
INNER JOIN ARTICULOS a ON a.id_articulo = df.articulo_id 
GROUP BY v.rut_vendedor, v.nombres, v.paterno, v.comision 
ORDER BY comision_ganada_pesos DESC;

--#19
SELECT 
c.nombre_categoria AS categoria_vendedor, 
COUNT(df.id_detalle_factura) AS ventas_premium, 
SUM(df.cantidad) AS unidades_premium, 
SUM(df.cantidad * a.precio) AS recaudacion_premium 
FROM CATEGORIAS c 
INNER JOIN VENDEDORES v ON c.id_categoria = v.categoria_id 
INNER JOIN FACTURAS f ON v.id_vendedor = f.vendedor_id 
INNER JOIN DETALLE_FACTURA df ON f.id_factura = df.factura_id 
INNER JOIN ARTICULOS a ON df.articulo_id = a.id_articulo 
WHERE a.precio > 15000 AND df.cantidad >= 20 
GROUP BY c.nombre_categoria 
ORDER BY recaudacion_premium DESC;

--#20
SELECT 
co.nombre_comuna AS comuna, 
m.nombre_marca AS marca_editorial, 
SUM(df.cantidad) AS unidades_vendidas,
SUM(df.cantidad * a.precio) AS monto_neto, 
ROUND(SUM(df.cantidad * a.precio) * 1.19, 0) AS monto_bruto_con_iva 
FROM COMUNAS co 
INNER JOIN CLIENTES cl ON co.id_comuna = cl.comuna_id 
INNER JOIN FACTURAS f ON cl.id_cliente = f.cliente_id 
INNER JOIN DETALLE_FACTURA df ON f.id_factura = df.factura_id 
INNER JOIN ARTICULOS a ON df.articulo_id = a.id_articulo 
INNER JOIN MARCAS m ON a.marca_id = m.id_marca 
WHERE (co.nombre_comuna = 'Puerto Montt' OR co.nombre_comuna = 'Puerto Varas' OR co.nombre_comuna = 'Castro') 
AND a.precio > 10000 
GROUP BY co.nombre_comuna, m.nombre_marca 
ORDER BY comuna ASC, monto_bruto_con_iva DESC;