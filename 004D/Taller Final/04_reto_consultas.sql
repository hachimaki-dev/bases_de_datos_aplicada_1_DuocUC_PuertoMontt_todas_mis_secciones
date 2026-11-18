-- 1 Consulte la tabla articulos mostrando el nombre del artículo como coleccionable, el precio como precio_unitario, 
-- la resta entre el stock actual y el stock mínimo (stock_actual - stock_minimo) como holgura_stock, y la multiplicación 
-- del precio por el stock actual (precio * stock_actual) como capital_bodega. Filtre únicamente aquellos artículos cuyo 
-- precio sea mayor o igual a 10000 y cuya holgura de stock sea mayor o igual a 30. Ordene el resultado por capital_bodega de mayor a menor.

-- no es necesario el group by
SELECT nom_articulo AS coleccionable, 
       precio AS precio_unitario, 
       stock_actual - stock_minimo AS holgura_stock,
       precio * stock_actual AS capital_bodega
FROM articulos
WHERE precio >= 10000 AND (stock_actual - stock_minimo) >= 30 -- en where no se puede usar alias
ORDER BY capital_bodega DESC;
