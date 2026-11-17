INSERT INTO COMUNAS(nom_comuna) VALUES ('Puerto Montt');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Puerto Varas');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Osorno');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Castro');
INSERT INTO COMUNAS(nom_comuna) VALUES ('Valdivia');
COMMIT;


INSERT INTO MARCAS(nom_marca) VALUES ('Bandai Namco');
INSERT INTO MARCAS(nom_marca) VALUES ('Panini Manga');
INSERT INTO MARCAS(nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO MARCAS(nom_marca) VALUES ('Konami TCG');
INSERT INTO MARCAS(nom_marca) VALUES ('Good Smile');
COMMIT;


INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);
COMMIT;


INSERT INTO ZONAS(nom_zonas, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO ZONAS(nom_zonas, porc) VALUES ('Norte Lagos', 10.48);
INSERT INTO ZONAS(nom_zonas, porc) VALUES ('Norte Lagos', 11.27);
INSERT INTO ZONAS(nom_zonas, porc) VALUES ('Norte Lagos', 7.24);
INSERT INTO ZONAS(nom_zonas, porc) VALUES ('Norte Lagos', 7.24);
COMMIT;


INSERT INTO CLIENTES(nombre_clientes, direccion, telefono, comuna_id) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', 5694522114, 1 );
INSERT INTO CLIENTES(nombre_clientes, direccion, telefono, comuna_id) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', 5696665443, 2 );
INSERT INTO CLIENTES(nombre_clientes, direccion, telefono, comuna_id) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', 5695626134, 4 );
INSERT INTO CLIENTES(nombre_clientes, direccion, telefono, comuna_id) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', 5692989233, 5 );
INSERT INTO CLIENTES(nombre_clientes, direccion, telefono, comuna_id) VALUES ('ZAMORA MOLINA TOMAS', '	WALKER MARTINEZ 1294', 5694343456, 2 );
COMMIT;

INSERT INTO ARTICULOS(nombre_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100', 11990, 150, 80, 2);
INSERT INTO ARTICULOS(nombre_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1', 9990, 	50, 20, 3);
INSERT INTO ARTICULOS(nombre_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('	GUNPLA RX-78-2 GUNDAM HG', 24990, 200, 50, 1);
INSERT INTO ARTICULOS(nombre_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO ARTICULOS(nombre_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('	NENDOROID MIKU HATSUNE', 54990, 80, 40, 5);
COMMIT;

INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id ) VALUES (11111112-6, 'BENITO', 'ORDENES', 'ROMERO', DATE '1983-05-22', DATE '2018-04-16', 550000, 0.13, 1, 3 );
INSERT INTO VENDEDORES(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id ) VALUES (11111112-6, 'BENITO', 'ORDENES', 'ROMERO', DATE '1983-05-22', DATE '2018-04-16', 550000, 0.13, 1, 3 );




