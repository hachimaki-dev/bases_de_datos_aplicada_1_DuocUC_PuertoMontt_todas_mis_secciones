

SELECT
    c.nom_comuna,
    SUM(df.cantidad) AS total_productos
FROM comunas c
INNER JOIN clientes cl
    ON c.id = cl.comuna_id
INNER JOIN facturas f
    ON cl.id = f.cliente_id
INNER JOIN detalle_factura df
    ON f.id = df.factura_id
GROUP BY c.nom_comuna
ORDER BY total_productos DESC;







SELECT
    v.id,
    v.rut_vendedor,
    v.nombre,
    v.paterno,
    v.materno,
    SUM(df.cantidad * a.precio) AS monto_total_vendido
FROM vendedores v
INNER JOIN facturas f
    ON v.id = f.vendedor_id
INNER JOIN detalle_factura df
    ON f.id = df.factura_id
INNER JOIN articulos a
    ON df.articulo_id = a.id
GROUP BY
    v.id,
    v.rut_vendedor,
    v.nombre,
    v.paterno,
    v.materno
ORDER BY monto_total_vendido DESC;