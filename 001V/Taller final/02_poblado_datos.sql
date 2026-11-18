INSERT INTO COMUNAS (nom_comuna) VALUES ('Puerto Montt');
INSERT INTO COMUNAS (nom_comuna) VALUES ('Puerto Varas');
INSERT INTO COMUNAS (nom_comuna) VALUES ('Osorno');
INSERT INTO COMUNAS (nom_comuna) VALUES ('Castro');
INSERT INTO COMUNAS (nom_comuna) VALUES ('Valdivia');

INSERT INTO MARCAS (nom_marca) VALUES ('Bandai Namco');
INSERT INTO MARCAS (nom_marca) VALUES ('Panini Manga');
INSERT INTO MARCAS (nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO MARCAS (nom_marca) VALUES ('Konami TCG');
INSERT INTO MARCAS (nom_marca) VALUES ('Good Smile');

INSERT INTO CATEGORIAS (nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO CATEGORIAS (nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO CATEGORIAS (nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO CATEGORIAS (nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO CATEGORIAS (nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);

INSERT INTO ZONAS (nom_zona, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO ZONAS (nom_zona, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO ZONAS (nom_zona, porc) VALUES ('Cordillera', 11.27);
INSERT INTO ZONAS (nom_zona, porc) VALUES ('Costera', 7.24);
INSERT INTO ZONAS (nom_zona, porc) VALUES ('Insular Chiloe', 7.24);

INSERT INTO CLIENTES (nom_cliente, direccion, telefono, id_comunas) VALUES ('Alcaraz Novoa Montserrat', 'Av. Diego Portales 450', 5694522114, 1);
INSERT INTO CLIENTES (nom_cliente, direccion, telefono, id_comunas) VALUES ('Jimenez Lorca Elena', 'San Pedro 520 DPTO. k', 5696665443, 2);
INSERT INTO CLIENTES (nom_cliente, direccion, telefono, id_comunas) VALUES ('Torres Roca Maria', 'Mackenna 7421', 5695626134, 4);
INSERT INTO CLIENTES (nom_cliente, direccion, telefono, id_comunas) VALUES ('Lopez Rojas Thomas', 'Blanco Encalada 2007', 5692989233, 5);
INSERT INTO CLIENTES (nom_cliente, direccion, telefono, id_comunas) VALUES ('Zamora Molina Tomas', 'Walker Martinez 1294', 5694343456, 2);

INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, id_marcas) VALUES ('Manga One Piece VOL 100', 11990, 150, 80, 2);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, id_marcas) VALUES ('Manga Chainsaw Man VOL 1', 9990, 50, 20, 3);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, id_marcas) VALUES ('Gunpla RX-78-2 Gundam HG', 24990, 200, 50, 1);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, id_marcas) VALUES ('Booster BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, id_marcas) VALUES ('Nendoroid Miku Hatsune', 54990, 80, 40, 5);

INSERT INTO VENDEDORES (rut_vendedor, nombres_vendedores, apellido_paterno_vendedores, apellido_materno_vendedores, fac_nac, fec_contrato, sueldo, comision, id_zonas, id_categorias) VALUES ('11111112-6', 'Benito', 'Ordenes', 'Romero', DATE '1983-05-22', DATE '2018-04-16', 550000, 0.13, 1, 3);
INSERT INTO VENDEDORES (rut_vendedor, nombres_vendedores, apellido_paterno_vendedores, fac_nac, fec_contrato, sueldo, comision, id_zonas, id_categorias) VALUES ('12222222-3', 'Marta', 'Viveros', DATE '1988-08-07', DATE '2020-07-02', 545000, 0.07, 2, 2);
INSERT INTO VENDEDORES (rut_vendedor, nombres_vendedores, apellido_paterno_vendedores, apellido_materno_vendedores, fac_nac, fec_contrato, sueldo, comision, id_zonas, id_categorias) VALUES ('13333333-K', 'Oscar', 'Caceres', 'Lagos', DATE '1989-10-09', DATE '2021-09-03', 567400, 0.13, 1, 1);
INSERT INTO VENDEDORES (rut_vendedor, nombres_vendedores, apellido_paterno_vendedores, apellido_materno_vendedores, fac_nac, fec_contrato, sueldo, comision, id_zonas, id_categorias) VALUES ('14444444-5', 'Milena', 'Mena', 'Cartes', DATE '1992-12-08', DATE '2019-11-03', 573620, 0.05, 3, 3);
INSERT INTO VENDEDORES (rut_vendedor, nombres_vendedores, apellido_paterno_vendedores, fac_nac, fec_contrato, sueldo, comision, id_categorias) VALUES ('15555555-6', 'Esteban', 'Romero', DATE '1995-12-08', DATE '2023-11-03', 573620, 0.08, 3);

INSERT INTO FACTURAS (id_clientes, id_vendedores, fecha_factura) VALUES (1, 2, DATE '2026-01-18');
INSERT INTO FACTURAS (id_clientes, id_vendedores, fecha_factura) VALUES (2, 4, DATE '2026-01-18');
INSERT INTO FACTURAS (id_clientes, id_vendedores, fecha_factura) VALUES (4, 3, DATE '2026-01-18');
INSERT INTO FACTURAS (id_clientes, id_vendedores, fecha_factura) VALUES (3, 5, DATE '2026-01-18');
INSERT INTO FACTURAS (id_clientes, id_vendedores, fecha_factura) VALUES (2, 2, DATE '2026-01-18');

INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (1, 1, 20);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (1, 5, 23);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (2, 3, 38);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (2, 4, 43);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (2, 1, 48);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (3, 4, 30);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (3, 2, 20);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (4, 5, 60);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (4, 2, 45);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (4, 3, 35);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (5, 4, 29);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (5, 5, 28);
INSERT INTO DETALLE_FACTURA (id_facturas, id_articulos, cantidad) VALUES (5, 2, 21);

COMMIT;