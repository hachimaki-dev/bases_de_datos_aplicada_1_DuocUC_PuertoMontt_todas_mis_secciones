INSERT INTO comunas(nom_comuna) VALUES ("Puerto Montt");
INSERT INTO comunas(nom_comuna) VALUES ("Puerto Varas");
INSERT INTO comunas(nom_comuna) VALUES ("Osorno");
INSERT INTO comunas(nom_comuna) VALUES ("Castro");
INSERT INTO comunas(nom_comuna) VALUES ("Valdivia");

INSERT INTO marcas(nom_marca) VALUES ('Bandai Namco');
INSERT INTO marcas(nom_marca) VALUES ('Panini Manga');
INSERT INTO marcas(nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO marcas(nom_marca) VALUES ('Konami TCG');
INSERT INTO marcas(nom_marca) VALUES ('Good Smile');

INSERT INTO categorias(nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO categorias(nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO categorias(nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO categorias(nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO categorias(nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);

INSERT INTO zonas(nom_categoria, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas(nom_categoria, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas(nom_categoria, porc) VALUES ('Cordillera', 11.27);
INSERT INTO zonas(nom_categoria, porc) VALUES ('Costera', 7.24);
INSERT INTO zonas(nom_categoria, porc) VALUES ('Insular Chiloe', 7.24);

INSERT INTO clientes(nombre_cliente, direccion, telefono, comuna_id) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', 5694522114, 1);
INSERT INTO clientes(nombre_cliente, direccion, telefono, comuna_id) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', 5696665443, 2);
INSERT INTO clientes(nombre_cliente, direccion, telefono, comuna_id) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', 5695626134, 3);
INSERT INTO clientes(nombre_cliente, direccion, telefono, comuna_id) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', 5692989233, 4);
INSERT INTO clientes(nombre_cliente, direccion, telefono, comuna_id) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', 5694343456, 5);

INSERT INTO articulos(nombre_cliente, precio, stock_actual, stock_minimo, marcas_id) VALUES ("MANGA ONE PIECE VOL 100", 11990, 150, 80, 2);
INSERT INTO articulos(nombre_cliente, precio, stock_actual, stock_minimo, marcas_id) VALUES ("MANGA CHAINSAW MAN VOL 1", 9990, 50, 20, 3);
INSERT INTO articulos(nombre_cliente, precio, stock_actual, stock_minimo, marcas_id) VALUES ("GUNPLA RX-78-2 GUNDAM HG", 24990, 200, 50, 1);
INSERT INTO articulos(nombre_cliente, precio, stock_actual, stock_minimo, marcas_id) VALUES ("BOOSTER BOX YU-GI-OH", 45990, 50, 20, 4);
INSERT INTO articulos(nombre_cliente, precio, stock_actual, stock_minimo, marcas_id) VALUES ("NENDOROID MIKU HATSUNE", 54990, 80, 40, 5);

INSERT INTO vendedores(rut_ve, precio, stock_actual, stock_minimo, marcas_id) VALUES ("NENDOROID MIKU HATSUNE", 54990, 80, 40, 5);


COMMIT;