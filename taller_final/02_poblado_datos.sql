
INSERT INTO comunas (nom_comuna) values ('Puerto montt');
INSERT INTO comunas (nom_comuna) values ('Puerto Varas');
INSERT INTO comunas (nom_comuna) values ('Osorno');
INSERT INTO comunas (nom_comuna) values ('Castro');
INSERT INTO comunas (nom_comuna) values ('Valdivia');

INSERT INTO marcas (nom_marca) values ('Bandai Namco');
INSERT INTO marcas (nom_marca) values ('Panini Manga');
INSERT INTO marcas (nom_marca) values ('Editorial Ivrea');
INSERT INTO marcas (nom_marca) values ('Konami TCG');
INSERT INTO marcas (nom_marca) values ('Good Smile');

INSERT INTO categorias (nom_categoria) values ('Categoria S',17.5);
INSERT INTO categorias (nom_categoria) values ('Categoria A',12.6);
INSERT INTO categorias (nom_categoria) values ('Categoria B',9.4);
INSERT INTO categorias (nom_categoria) values ('Categoria C',7.2);
INSERT INTO categorias (nom_categoria) values ('Categoria D',5.4);

INSERT INTO zonas (nom_zona) values ('Norte Lagos',8.56);
INSERT INTO zonas (nom_zona) values ('Sur Austral',10.48);
INSERT INTO zonas (nom_zona) values ('Cordillera',11.27);
INSERT INTO zonas (nom_zona) values ('Costera',7.24);
INSERT INTO zonas (nom_zona) values ('Insular Chiloe',7.24);

INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) values ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', '5694522114',1);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) values ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K','5696665443',2);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) values ('TORRES ROCA MARIA','MACKENNA 7421','5695626134',4);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) values ('LOPEZ ROJAS THOMAS','BLANCO ENCALADA 2007','5692989233',5);
INSERT INTO clientes (nombre_cliente, direccion, telefono, comuna_id) values ('ZAMORA MOLINA TOMAS','WALKER MARTINEZ 1294','5694343456',2);

INSERT INTO articulos (nom_articulo) (precio, stock_actual, stock_minimo, marca_id) values ('MANGA ONE PIECE VOL 100','11990','150','80',2);
INSERT INTO articulos (nom_articulo) (precio, stock_actual, stock_minimo, marca_id) values ('MANGA CHAINSAW MAN VOL 1','9990','50','20',3);
INSERT INTO articulos (nom_articulo) (precio, stock_actual, stock_minimo, marca_id) values ('GUNPLA RX-78-2 GUNDAM HG','24990','200','50',1);
INSERT INTO articulos (nom_articulo) (precio, stock_actual, stock_minimo, marca_id) values ('BOOSTER BOX YU-GI-OH','45990	','50','20',4);
INSERT INTO articulos (nom_articulo) (precio, stock_actual, stock_minimo, marca_id) values ('NENDOROID MIKU HATSUNE','54990','80','40',5);

INSERT INTO vendedores (rut_vendedor,nombres,paterno,materno,fecha_nacimiento,fecha_contrato,sueldo,comision,zona_id,categoria_id) values ('11111112-6','BENITO	','ORDENES','ROMERO','1983-05-22','2018-04-16','550000','0.13',1,3);
INSERT INTO vendedores (rut_vendedor,nombres,paterno,materno,fecha_nacimiento,fecha_contrato,sueldo,comision,zona_id,categoria_id) values ('112222222-3','MARTA	','VIVEROS',null,'1988-08-07','2020-07-02','545000','0.07',2,2);
INSERT INTO vendedores (rut_vendedor,nombres,paterno,materno,fecha_nacimiento,fecha_contrato,sueldo,comision,zona_id,categoria_id) values ('13333333-K','OSCAR	','CACERES','LAGOS','1989-10-09','2021-09-03','567400','0.13',1,1);
INSERT INTO vendedores (rut_vendedor,nombres,paterno,materno,fecha_nacimiento,fecha_contrato,sueldo,comision,zona_id,categoria_id) values ('14444444-5','	MILENA','MENA','CARTES','1992-12-08	','2019-11-03','573620','0.05',3,3);
INSERT INTO vendedores (rut_vendedor,nombres,paterno,materno,fecha_nacimiento,fecha_contrato,sueldo,comision,zona_id,categoria_id) values ('15555555-6','ESTEBAN','ROMERO',null,'1995-12-08','2023-11-03','573620','0.08',null,3);

INSERT INTO facturas (cliente_id,vendedor_id,fecha_factura) values (1,2,'2026-01-18');
INSERT INTO facturas (cliente_id,vendedor_id,fecha_factura) values (2,4,'2026-01-18');
INSERT INTO facturas (cliente_id,vendedor_id,fecha_factura) values (4,3,'2026-01-18');
INSERT INTO facturas (cliente_id,vendedor_id,fecha_factura) values (3,5,'2026-01-18');
INSERT INTO facturas (cliente_id,vendedor_id,fecha_factura) values (2,2,'2026-01-18');

INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (1,1,20);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (1,5,23);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (2,3,38);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (2,4,43);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (2,1,48);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (3,4,30);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (3,2,20);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (4,5,60);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (4,2,45);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (4,3,35);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (5,4,29);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (5,5,28);
INSERT INTO detalle_factura (factura_id,articulo_id,cantidad) values (5,2,21);

COMMIT;



