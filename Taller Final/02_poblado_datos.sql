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
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('	JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', '5696665443', 2);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', '5695626134', 4);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', '5692989233', 5);
INSERT INTO clientes (nombre, direccion, telefono, id_comuna) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '5694343456', 2);

INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('MANGA ONE PIECE VOL 100', 11990, 150, 80, 2);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('MANGA CHAINSAW MAN VOL 1', 9990, 50, 20, 3);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('GUNPLA RX-78-2 GUNDAM HG', 24990, 200, 50, 1);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('BOOSTER BOX YU-GI-OH', 45990, 50, 20, 4);
INSERT INTO articulos (nombre, precio, stock_actual, stock_minimo, id_marca) VALUES ('NENDOROID MIKU HATSUNE', 54990, 80, 40, 5);

INSERT INTO vendedores (rut, nombres, apellido_p, apellido_m, fecha_nacimiento, fecha_contrato, sueldo, comision, id_zona, id_categorias) VALUES ('11111112-6', 'BENITO', 'ORDENES', 'ROMERO', '1983-05-22', '2018-04-16', 550000, 0.13, 1, 3);