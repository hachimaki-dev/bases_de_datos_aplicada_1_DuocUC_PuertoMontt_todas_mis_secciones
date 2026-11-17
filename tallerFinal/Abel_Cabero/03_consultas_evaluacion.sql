SELECT co.nombre_comuna AS comuna, SUM(df.cantidad) AS total_productos
FROM COMUNAS co 
INNER JOIN CLIENTES cl ON cl.comuna_id = co.id_comuna
INNER JOIN FACTURAS f ON cl.id_cliente = f.cliente_id
INNER JOIN DETALLE_FACTURA df ON df.factura_id = f.id_factura
GROUP BY co.nombre_comuna ORDER BY total_productos DESC;


SELECT v.rut_vendedor, v.nombres, v.paterno, v.materno, SUM(df.cantidad * a.precio) AS monto_total_vendido
FROM VENDEDORES v 
INNER JOIN FACTURAS f ON f.vendedor_id = v.id_vendedor
INNER JOIN DETALLE_FACTURA df ON df.factura_id = f.id_factura
INNER JOIN ARTICULOS a ON a.id_articulo = df.articulo_id
GROUP BY v.rut_vendedor, v.nombres, v.paterno, v.materno
ORDER BY monto_total_vendido DESC;