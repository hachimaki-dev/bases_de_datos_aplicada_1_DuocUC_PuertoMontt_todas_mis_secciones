INSERT INTO comunas (nom_comuna) VALUES ("Puerto Montt");
INSERT INTO comunas (nom_comuna) VALUES ("Puerto Varas");
INSERT INTO comunas (nom_comuna) VALUES ("Osorno");
INSERT INTO comunas (nom_comuna) VALUES ("Castro");
INSERT INTO comunas (nom_comuna) VALUES ("Valdivia");

INSERT INTO marcas (nom_marca) VALUES ("Bandai Namco");
INSERT INTO marcas (nom_marca) VALUES ("Panini Manga");
INSERT INTO marcas (nom_marca) VALUES ("Editorial Ivrea");
INSERT INTO marcas (nom_marca) VALUES ("Konami TCG");
INSERT INTO marcas (nom_marca) VALUES ("Good Smile");

INSERT INTO categorias (nom_categoria, porcentaje) VALUES ("Categoria S", 17.5);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ("Categoria A", 12.6);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ("Categoria B", 9.4);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ("Categoria C", 7,2);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ("Categoria D", 5.4);

INSERT INTO zonas (nom_zona, porcentaje) VALUES ("Norte Lagos", 8.56);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ("Sur Austral", 10.48);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ("Cordillera", 11.27);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ("Costera", 7.24);
INSERT INTO zonas (nom_zona, porcentaje) VALUES ("Insular Chiloe", 7.24);


INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ("ALCARAZ NOVOA MONTSERRAT",	"AV. DIEGO PORTALES 450", 5694522114, 1);
INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ("JIMENEZ LORCA ELENA", "SAN PEDRO 520 DPTO. K", 5696665443, 2);
INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ("TORRES ROCA MARIA",	"MACKENNA 7421"	,5695626134, 4);
INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ("LOPEZ ROJAS THOMAS", "BLANCO ENCALADA 2007", 5692989233, 5);
INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ("ZAMORA MOLINA TOMAS", "WALKER MARTINEZ 1294", 5694343456, 2);

INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo) VALUES ();
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo) VALUES ();
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo) VALUES ();
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo) VALUES ();
INSERT INTO ARTICULOS (nom_articulo, precio, stock_actual, stock_minimo) VALUES ();

INSERT INTO VENDEDORES (rut_vendedor, nombre, materno, paterno, fec_nacimiento, fec_contrato, sueldo, comision) VALUES ();
INSERT INTO VENDEDORES (rut_vendedor, nombre, materno, paterno, fec_nacimiento, fec_contrato, sueldo, comision) VALUES ();
INSERT INTO VENDEDORES (rut_vendedor, nombre, materno, paterno, fec_nacimiento, fec_contrato, sueldo, comision) VALUES ();
INSERT INTO VENDEDORES (rut_vendedor, nombre, materno, paterno, fec_nacimiento, fec_contrato, sueldo, comision) VALUES ();
INSERT INTO VENDEDORES (rut_vendedor, nombre, materno, paterno, fec_nacimiento, fec_contrato, sueldo, comision) VALUES ();


INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES ();
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES ();
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES ();
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES ();
INSERT INTO FACTURAS (cliente_id, vendedor_id, fecha_factura) VALUES ();


INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();
INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, cantidad) VALUES ();