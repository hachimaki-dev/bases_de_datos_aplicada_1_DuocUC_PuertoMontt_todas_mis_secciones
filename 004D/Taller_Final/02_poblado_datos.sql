-- 1. COMUNAS
INSERT INTO comunas (nom_comuna) VALUES ('Puerto Montt');
INSERT INTO comunas (nom_comuna) VALUES ('Puerto Varas');
INSERT INTO comunas (nom_comuna) VALUES ('Osorno');
INSERT INTO comunas (nom_comuna) VALUES ('Castro');
INSERT INTO comunas (nom_comuna) VALUES ('Valdivia');

-- 2. MARCAS
INSERT INTO marcas (nom_marca) VALUES ('Bandai Namco');
INSERT INTO marcas (nom_marca) VALUES ('Panini Manga');
INSERT INTO marcas (nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO marcas (nom_marca) VALUES ('Konami TCG');
INSERT INTO marcas (nom_marca) VALUES ('Good Smile');

-- 3. CATEGORIAS
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);

-- 4. ZONAS
INSERT INTO zonas (nom_zona, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas (nom_zona, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas (nom_zona, porc) VALUES ('Cordillera', 11.27);
INSERT INTO zonas (nom_zona, porc) VALUES ('Costera', 7.24);
INSERT INTO zonas (nom_zona, porc) VALUES ('Insular Chiloe', 7.24);

-- 5. CLIENTES
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', '56945221141', 2);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', '56966654432', 3);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', '56956261344', 4);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', '56929892335', 3);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '56943434562', 1);

-- 6. ARTICULOS
INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100', 11990, 150, 80, 2);
INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1', 9990, 50, 20, 3);
INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('GUNPLA RX-78-2 GUNDAM HG', 24990, 200, 50, 1);
INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('NENDOROID MIKU HATSUNE', 54990, 80, 40, 5);

-- 7. VENDEDORES
INSERT INTO vendedores (rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) 
VALUES ('11111111-6', 'BENITO', 'ORDENES', 'ROMERO', DATE '1983-05-22', DATE '2018-04-16', 5500000, 0.13, 1, 3);

INSERT INTO vendedores (rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) 
VALUES ('12222222-3', 'MARTA', 'VIVEROS', NULL, DATE '1988-08-07', DATE '2020-07-02', 5450000, 0.07, 2, 2);

INSERT INTO vendedores (rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) 
VALUES ('13333333-K', 'OSCAR', 'CACERES', 'LAGOS', DATE '1989-10-09', DATE '2021-09-03', 5674000, 0.13, 1, 1);

INSERT INTO vendedores (rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) 
VALUES ('14444444-5', 'MILENA', 'MENA', 'CARTES', DATE '1992-12-08', DATE '2019-11-03', 5736200, 0.05, 3, 3);

INSERT INTO vendedores (rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) 
VALUES ('15555555-6', 'ESTEBAN', 'ROMERO', NULL, DATE '1995-12-08', DATE '2023-11-03', 5736200, 0.08, NULL, 3);

-- 8. FACTURAS
INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (1, 1, DATE '2026-01-18');
INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (2, 4, DATE '2026-01-18');
INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (3, 4, DATE '2026-01-18');
INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (4, 3, DATE '2026-01-18');
INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (5, 2, DATE '2026-01-18');

-- 9. DETALLE_FACTURA
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (1, 1, 20);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (1, 2, 15);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (2, 3, 38);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (2, 4, 3);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (2, 5, 21);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (3, 4, 30);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (3, 2, 20);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (4, 5, 60);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (4, 2, 45);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (4, 3, 35);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (5, 1, 42);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (5, 5, 28);
INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (5, 2, 21);

COMMIT;