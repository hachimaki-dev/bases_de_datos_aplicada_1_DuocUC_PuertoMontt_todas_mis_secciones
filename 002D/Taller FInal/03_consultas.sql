--Pregunta 5.1: Desarrolle una consulta que muestre el nombre de la comuna y el total de productos vendidos por comuna (sumando las unidades de cantidad). Ordenado por total de productos, de mayor a menor.


SELECT * FROM COMUNAS;
SELECT * FROM ARTICULOS;
SELECT * FROM DETALLE_FACTURA;
SELECT * FROM FACTURAS;
SELECT * FROM CLIENTES;

SELECT NOM_COMUNA, SUM(df.CANTIDAD) AS TOTAL_VENDIDO_POR_COMUNA  FROM COMUNAS co
JOIN CLIENTES cl ON co.ID = cl.COMUNA_ID
JOIN FACTURAS fa ON cl.ID = fa.CLIENTE_ID
JOIN DETALLE_FACTURA df ON fa.ID = df.FACTURA_ID
JOIN ARTICULOS a ON df.ARTICULO_ID = a.ID
GROUP BY co.NOM_COMUNA
ORDER BY TOTAL_VENDIDO_POR_COMUNA DESC;  