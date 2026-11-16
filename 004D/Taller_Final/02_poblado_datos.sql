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

INSERT INTO zonas (nom_zona, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas (nom_zona, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas (nom_zona, porc) VALUES ('Cordillera', 11.27);
INSERT INTO zonas (nom_zona, porc) VALUES ('Costa', 7.24);
INSERT INTO zonas (nom_zona, porc) VALUES ('Insular Chiloe', 7.24);

INSERT INTO clientes (nom_cliente, direccion, telefono, comuna_id) VALUES ('Alcaraz Novoa Montserrat', 'Av. Diego Portales 450', '5694522114', 1);

INSERT INTO articulos (nom_articulo, precio, stock_actual, stock_minimo, marca_id) VALUES ('Manga One Piece Vol 100', 17990, 150, 80, 2);

INSERT INTO vendedores(rut_vendedor, nombres, paterno, materno, fec_nac, fec_contrato, sueldo, comision, zona_id, categoria_id) VALUES ('11111112-6', 'Benito', 'Ordenes', 'Moreno', TO_DATE('1983-05-22', 'YYYY-MM-DD'), TO_DATE('2018-04-16', 'YYYY-MM-DD'), 550000, 0.13, 1, 3);

INSERT INTO facturas (cliente_id, vendedor_id, fecha_factura) VALUES (1, 2, TO_DATE('2026-01-18', 'YYYY-MM-DD'));

INSERT INTO detalle_factura (factura_id, articulo_id, cantidad) VALUES (1, 1, 20);