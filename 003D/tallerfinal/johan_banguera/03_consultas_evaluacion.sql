-- PREGUNTA 5.1 --

SELECT co.nom_comuna AS NOMBRE_COMUNA, SUM(df.cantidad) AS total_productos FROM 
DETALLE_FACTURA df INNER JOIN FACTURAS fa ON df.FACTURA_ID = fa.id INNER JOIN CLIENTES cl ON fa.CLIENTE_ID = cl.id INNER JOIN COMUNAS co ON cl.COMUNA_ID = co.id GROUP BY co.NOM_COMUNA ORDER BY total_productos DESC;

-- PREGUNTA 5.2 --

SELECT ve.rut_vendedor, ve.nombres, ve.paterno, ve.materno, SUM(df.cantidad * a.precio) AS monto_total_vendido FROM 
DETALLE_FACTURA df INNER JOIN FACTURAS fa ON df.FACTURA_ID = fa.id INNER JOIN VENDEDORES ve ON fa.VENDEDOR_ID = ve.id INNER JOIN ARTICULOS a ON  df.ARTICULO_ID = a.id GROUP BY ve.RUT_VENDEDOR, ve.NOMBRES, ve.PATERNO, ve.MATERNO ORDER BY monto_total_vendido DESC;

