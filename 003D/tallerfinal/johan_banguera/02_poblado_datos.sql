
-- INSERT INTO COMUNAS --
INSERT INTO COMUNAS(nom_comuna) VALUES ('Puerto Montt');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Puerto Varas');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Osorno');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Castro');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Valdivia');
COMMIT;

-- INSERT INTO MARCAS --
INSERT INTO MARCAS(nom_marca) VALUES ('Bandai Namco');
INSERT INTO MARCAS(nom_marca) VALUES ('Panini Manga');
INSERT INTO MARCAS(nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO MARCAS(nom_marca) VALUES ('Konami TCG');
INSERT INTO MARCAS(nom_marca) VALUES ('Good Smile');
COMMIT;

-- INSERT INTO CATEGORIAS --
INSERT INTO CATEGORIAS(NOM_CATEGORIA, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO CATEGORIAS(NOM_CATEGORIA, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO CATEGORIAS(NOM_CATEGORIA, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO CATEGORIAS(NOM_CATEGORIA, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO CATEGORIAS(NOM_CATEGORIA, porcentaje) VALUES ('Categoria D', 5.4);
COMMIT;

-- INSERT INTO ZONAS --
INSERT INTO ZONAS(NOM_ZONA, PORC) VALUES ('Norte Lagos', 8.56);
INSERT INTO ZONAS(NOM_ZONA, PORC) VALUES ('Sur Austral', 10.48);
INSERT INTO ZONAS(NOM_ZONA, PORC) VALUES ('Cordillera', 11.27);
INSERT INTO ZONAS(NOM_ZONA, PORC) VALUES ('Costera', 7.24);
INSERT INTO ZONAS(NOM_ZONA, PORC) VALUES ('Insular Chiloe', 7.24);
COMMIT;

-- INSERT INTO CLIENTES --
INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', '5694522114', 1);
INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', '5696665443', 2);
INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', '5695626134', 4);
INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', '5692989233', 5);
INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '5694343456', 2);
COMMIT;

-- INSERT INTO ARTICULOS --
INSERT INTO ARTICULOS(nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100', 11990, 150, 80, 2);
INSERT INTO ARTICULOS(nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1', 9990, 50, 20, 3);
INSERT INTO ARTICULOS(nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('GUNPLA RX-78-2 GUNDAM HG', 24990, 200, 50, 1);
INSERT INTO ARTICULOS(nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO ARTICULOS(nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('NENDOROID MIKU HATSUNE', 54990, 80, 40, 5);
COMMIT;

-- INSERT INTO VENDEDORES --
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('11111112-6', 'BENITO', 'ORDENES', 'ROMERO', TO_DATE('1983-05-22', 'YYY-MM-DD'), TO_DATE('2018-04-16', 'YYY-MM-DD'), 550000, 0.13, 1, 3);
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('12222222-3', 'MARTA', 'VIVEROS', NULL, TO_DATE('1988-08-07', 'YYY-MM-DD'), TO_DATE('2020-07-02', 'YYY-MM-DD'), 545000, 0.07, 2, 2);
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('13333333-K', 'OSCAR', 'CACERES', 'LAGOS', TO_DATE('1989-10-09', 'YYY-MM-DD'), TO_DATE('2021-09-03', 'YYY-MM-DD'), 567400, 0.13, 1, 1);
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('14444444-5', 'MILENA', 'MENA', 'CARTES', TO_DATE('1992-12-08', 'YYY-MM-DD'), TO_DATE('2019-11-03', 'YYY-MM-DD'), 573620, 0.05, 3, 3);
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('15555555-6', 'ESTEBAN', 'ROMERO', NULL, TO_DATE('1995-12-08', 'YYY-MM-DD'), TO_DATE('2023-11-03', 'YYY-MM-DD'), 573620, 0.08, NULL, 3);
COMMIT;

-- INSERT INTO FACTURAS --
INSERT INTO FACTURAS(cliente_id, vendedor_id, fecha_factura) VALUES (1, 2, TO_DATE('2026-01-18', 'YYY-MM-DD'));
INSERT INTO FACTURAS(cliente_id, vendedor_id, fecha_factura) VALUES (2, 4, TO_DATE('2026-01-18', 'YYY-MM-DD'));
INSERT INTO FACTURAS(cliente_id, vendedor_id, fecha_factura) VALUES (4, 3, TO_DATE('2026-01-18', 'YYY-MM-DD'));
INSERT INTO FACTURAS(cliente_id, vendedor_id, fecha_factura) VALUES (3, 5, TO_DATE('2026-01-18', 'YYY-MM-DD'));
INSERT INTO FACTURAS(cliente_id, vendedor_id, fecha_factura) VALUES (2, 2, TO_DATE('2026-01-18', 'YYY-MM-DD'));
COMMIT;

-- INSERT INTO DETALLE_FACTURA --
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (1, 1, 20);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (1, 5, 23);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (2, 3, 38);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (2, 4, 43);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (2, 1, 48);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (3, 4, 30);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (3, 2, 20);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (4, 5, 60);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (4, 2, 45);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (4, 3, 35);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (5, 4, 29);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (5, 5, 28);
INSERT INTO DETALLE_FACTURA(factura_id, articulo_id, cantidad) VALUES (5, 2, 21);
COMMIT;


