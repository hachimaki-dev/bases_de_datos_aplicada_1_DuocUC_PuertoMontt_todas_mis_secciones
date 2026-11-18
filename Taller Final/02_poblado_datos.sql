DELETE FROM comunas;
DELETE FROM marcas;
DELETE FROM categorias;
DELETE FROM zonas;
DELETE FROM clientes;
DELETE FROM articulos;
DELETE FROM vendedores;
DELETE FROM facturas;
DELETE FROM detalle_factura;

INSERT INTO comunas (nombre) VALUES ('Puerto Montt');
INSERT INTO comunas (nombre) VALUES ('Puerto Varas');
INSERT INTO comunas (nombre) VALUES ('Osorno');
INSERT INTO comunas (nombre) VALUES ('Castro');
INSERT INTO comunas (nombre) VALUES ('Valdivia');

INSERT INTO marcas (nombre) VALUES ('Bandai Namco');
INSERT INTO marcas (nombre) VALUES ('Panini Manga');
INSERT INTO marcas (nombre) VALUES ('Editorial Ivrea');
INSERT INTO marcas (nombre) VALUES ('Konami TCG');
INSERT INTO marcas (nombre) VALUES ('Good Smile');

INSERT INTO categorias (nombre, porcentaje) VALUES ('S', 17.5);
INSERT INTO categorias (nombre, porcentaje) VALUES ('A', 12.6);
INSERT INTO categorias (nombre, porcentaje) VALUES ('B', 9.4);
INSERT INTO categorias (nombre, porcentaje) VALUES ('C', 7.2);
INSERT INTO categorias (nombre, porcentaje) VALUES ('D', 5.4);

INSERT INTO zonas (nombre, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas (nombre, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas (nombre, porc) VALUES ('Cordillera', 11.27);
INSERT INTO zonas (nombre, porc) VALUES ('Costera', 7.24);
INSERT INTO zonas (nombre, porc) VALUES ('Insular Chiloe', 7.24);

INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', '5694522114', 1);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', '5696665443', 2);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', '5695626134', 4);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', '5692989233', 5);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '5694343456', 2);

INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('MANGA ONE PIECE VOL 100', 11990, 150, 80, 2);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('MANGA CHAINSAW MAN VOL 1', 9990, 50, 20, 3);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('GUNPLA RX-78-2 GUNDAM HG', 24990, 200, 50, 1);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('BOOSTER BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('NENDOROID MIKU HATSUNE', 54990, 80, 40, 5);

-- Inserción de Vendedores (corregido id_categorias -> id_categoria y uso de TO_DATE)
INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) 
VALUES ('11111112-6', 'BENITO', 'ORDENES', 'ROMERO', TO_DATE('1983-05-22','YYYY-MM-DD'), TO_DATE('2018-04-16','YYYY-MM-DD'), 550000, 0.13, 1, 3);

INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) 
VALUES ('12222222-3', 'MARTA', 'VIVEROS', NULL, TO_DATE('1988-08-07','YYYY-MM-DD'), TO_DATE('2020-07-02','YYYY-MM-DD'), 545000, 0.07, 2, 2);

INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) 
VALUES ('13333333-K', 'OSCAR', 'CACERES', 'LAGOS', TO_DATE('1989-10-09','YYYY-MM-DD'), TO_DATE('2021-09-03','YYYY-MM-DD'), 567400, 0.13, 1, 1);

INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) 
VALUES ('14444444-5', 'MILENA', 'MENA', 'CARTES', TO_DATE('1992-12-08','YYYY-MM-DD'), TO_DATE('2019-11-03','YYYY-MM-DD'), 573620, 0.05, 3, 3);

INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) 
VALUES ('15555555-6', 'ESTEBAN', 'ROMERO', NULL, TO_DATE('1995-12-08','YYYY-MM-DD'), TO_DATE('2023-11-03','YYYY-MM-DD'), 573620, 0.08, NULL, 3);


-- Inserción de Facturas (Aplicando TO_DATE por seguridad)
INSERT INTO facturas (id_cliente, id_vendedor, fecha_factura) VALUES (1, 2, TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO facturas (id_cliente, id_vendedor, fecha_factura) VALUES (2, 4, TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO facturas (id_cliente, id_vendedor, fecha_factura) VALUES (4, 3, TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO facturas (id_cliente, id_vendedor, fecha_factura) VALUES (3, 5, TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO facturas (id_cliente, id_vendedor, fecha_factura) VALUES (2, 2, TO_DATE('2026-01-18','YYYY-MM-DD'));


-- Inserción de Detalles de Factura (Estas están correctas y se pueden usar tal cual)
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (1, 1, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (1, 5, 23);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (2, 3, 38);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (2, 4, 43);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (2, 1, 48);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (3, 4, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (3, 2, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (4, 5, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (4, 2, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (4, 3, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (5, 4, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (5, 5, 20);
INSERT INTO detalle_factura (id_factura, id_articulo, cantidad) VALUES (5, 2, 20);

COMMIT;