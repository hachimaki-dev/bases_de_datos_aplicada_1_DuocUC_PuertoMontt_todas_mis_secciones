--Pregunta 5.1: Desarrolle una consulta que muestre el nombre de la comuna y el total de productos vendidos por comuna (sumando las unidades de cantidad). Ordenado por total de productos, de mayor a menor.
SELECT * FROM COMUNAS;
SELECT * FROM ARTICULOS;
SELECT * FROM DETALLE_FACTURA;
SELECT * FROM FACTURAS;
SELECT * FROM CLIENTES;

SELECT NOM_COMUNA, SUM(df.CANTIDAD) AS CANTIDAD_TOTAL FROM COMUNAS co
JOIN CLIENTES cl ON co.ID = cl.COMUNA_ID
JOIN FACTURAS fa ON fa.CLIENTE_ID = cl.ID
JOIN DETALLE_FACTURA df ON fa.ID = df.FACTURA_ID
GROUP BY NOM_COMUNA
ORDER BY CANTIDAD_TOTAL DESC;

--Pregunta 5.2: Desarrolle una consulta que muestre los datos del vendedor y el monto total vendido por cada vendedor (calculado como la suma de cantidad * precio). Ordenado por monto total vendido, de mayor a menor.
SELECT * FROM VENDEDORES;
SELECT * FROM FACTURAS;
SELECT * FROM DETALLE_FACTURA;
SELECT * FROM ARTICULOS;

SELECT RUT_VENDEDOR, SUM(df.CANTIDAD * a.PRECIO) AS CANTIDAD_VENDIDO, a.NOM_ARTICULO FROM VENDEDORES ve
JOIN FACTURAS fa ON ve.ID = fa.VENDEDOR_ID
JOIN DETALLE_FACTURA df ON fa.ID = df.FACTURA_ID
JOIN ARTICULOS a ON a.ID = df.ARTICULO_ID
GROUP BY RUT_VENDEDOR , a.NOM_ARTICULO;