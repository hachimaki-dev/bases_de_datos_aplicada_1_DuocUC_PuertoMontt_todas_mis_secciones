SELECT c.nom_comuna, SUM(df.cantidad) AS total_productos_vendidos
FROM comunas c
JOIN clientes cl ON c.id = cl.comuna_id
JOIN facturas f ON cl.id = f.cliente_id
JOIN detalle_factura df ON f.id = df.factura_id
GROUP BY c.nom_comuna
ORDER BY total_productos_vendidos DESC;