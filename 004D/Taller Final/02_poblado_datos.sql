INSERT INTO comunas (nom_comuna) VALUES ('Puerto Montt');
INSERT INTO comunas (nom_comuna) VALUES ('Puerto Varas');
INSERT INTO comunas (nom_comuna) VALUES ('Osorno');
INSERT INTO comunas (nom_comuna) VALUES ('Castro');
INSERT INTO comunas (nom_comuna) VALUES ('Valdivia');

INSERT INTO marcas (nom_marca) VALUES ('Bandai Namco');
INSERT INTO marcas (nom_marca) VALUES ('Panini Manga');
INSERT INTO marcas (nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO marcas (nom_marca) VALUES ('Konami TCG');
INSERT INTO marcas (nom_marca) VALUES ('Good Smile');

INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);

INSERT INTO zonas (nom_zona, porcentaje) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ('Cordillera', 11.27);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ('Costera', 7.24);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ('Insular Chiloe', 7.24);


INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('ALCARAZ NOVOA MONTSERRAT',	'AV. DIEGO PORTALES 450', '5694522114', 1);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K',         '5696665443', 2);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('TORRES ROCA MARIA',	'MACKENNA 7421'	,                 '5695626134', 4);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007',           '5692989233', 5);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294',          '5694343456', 2);

INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100',	11990,	150,	80,	2);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1',9990 ,50 ,20 ,3);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('GUNPLA RX-78-2 GUNDAM HG', 24990 ,200 ,50 ,1);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH'	,45990	,50	,20	,4);
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('NENDOROID MIKU HATSUNE'	,54990	,80	,40	,5);

INSERT INTO VENDEDORES (rut_vendedor, nombre,  paterno, materno, fec_nacimiento, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('11111112-6' , 'BENITO', 'ORDENES',	'ROMERO',   TO_DATE('1983-05-22', 'YYYY-MM-DD'),    TO_DATE('2018-04-16', 'YYYY-MM-DD') , 550000	,0.13	,1	,3);
INSERT INTO VENDEDORES (rut_vendedor, nombre,  paterno, materno, fec_nacimiento, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('12222222-3',	'MARTA',	'VIVEROS',	(null),	TO_DATE('1988-08-07', 'YYYY-MM-DD'),	TO_DATE('2020-07-02', 'YYYY-MM-DD'),	545000,	0.07,	2,	2);
INSERT INTO VENDEDORES (rut_vendedor, nombre,  paterno, materno, fec_nacimiento, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('13333333-K',	'OSCAR',	'CACERES',	'LAGOS',TO_DATE('1989-10-09', 'YYYY-MM-DD'),	TO_DATE('2021-09-03', 'YYYY-MM-DD'),	567400,	0.13,	1,	1);
INSERT INTO VENDEDORES (rut_vendedor, nombre,  paterno, materno, fec_nacimiento, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('14444444-5',	'MILENA',	'MENA',	'CARTES',	TO_DATE('1992-12-08', 'YYYY-MM-DD'),	TO_DATE('2019-11-03', 'YYYY-MM-DD'),	573620,	0.05,	3,	3);
INSERT INTO VENDEDORES (rut_vendedor, nombre,  paterno, materno, fec_nacimiento, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('15555555-6',	'ESTEBAN',	'ROMERO',	(null),	TO_DATE('1995-12-08', 'YYYY-MM-DD'),	TO_DATE('2023-11-03', 'YYYY-MM-DD'),	573620,	0.08,	(null),	3);


INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES (1,2,TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES (2,4,TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES (4,3,TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES (3,5,TO_DATE('2026-01-18','YYYY-MM-DD'));
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES (2,2,TO_DATE('2026-01-18','YYYY-MM-DD'));


INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (1,1,20);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (1,5,23);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (2,3,38);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (2,4,43);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (2,1,48);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (3,4,30);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (3,2,20);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (4,5,60);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (4,2,45);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (4,3,35);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (5,4,29);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (5,5,28);
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES (5,2,21);