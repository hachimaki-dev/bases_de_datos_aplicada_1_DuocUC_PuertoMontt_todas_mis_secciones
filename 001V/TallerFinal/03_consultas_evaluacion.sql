SELECT c.nom_comuna AS COMUNA, SUM(df.cantidad) AS Total_vendidos 
FROM DETALLE_FACTURA df 
JOIN FACTURAS f ON df.factura_id = f.id 
JOIN CLIENTES cl ON f.cliente_id = cl.id 
JOIN COMUNAS c ON cl.comuna_id = c.id
GROUP BY c.NOM_COMUNA ORDER BY Total_vendidos DESC;

SELECT v.rut_vendedor AS Rut_Vendedor, SUM(ar.precio * df.cantidad) AS Monto_total_vendido 
FROM DETALLE_FACTURA df 
JOIN FACTURAS f ON df.FACTURA_ID = f.ID
JOIN VENDEDORES v ON f.VENDEDOR_ID = v.ID
JOIN ARTICULOS ar ON df.ARTICULO_ID = ar.ID
GROUP BY v.RUT_VENDEDOR ORDER BY Monto_total_vendido DESC;