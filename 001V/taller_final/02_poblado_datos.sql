INSERT INTO COMUNAS(nom_comuna) VALUES('Puerto Montt');
INSERT INTO COMUNAS(nom_comuna) VALUES('Puerto Varas');
INSERT INTO COMUNAS(nom_comuna) VALUES('Osorno');
INSERT INTO COMUNAS(nom_comuna) VALUES('Castro');
INSERT INTO COMUNAS(nom_comuna) VALUES('Valdivia');

INSERT INTO MARCAS(nom_marca) VALUES('Bandai Namco');
INSERT INTO MARCAS(nom_marca) VALUES('Panini Manga');
INSERT INTO MARCAS(nom_marca) VALUES('Ediorial Ivrea');
INSERT INTO MARCAS(nom_marca) VALUES('Konami TCG');
INSERT INTO MARCAS(nom_marca) VALUES('Good Smile');

INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES('Categoría S', 17.5);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES('Categoría A', 12.6);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES('Categoría B', 9.4);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES('Categoría C', 7.0);
INSERT INTO CATEGORIAS(nom_categoria, porcentaje) VALUES('Categoría D', 5.4);
COMMIT;
INSERT INTO ZONAS(nom_zona) VALUES('Norte Lagos');
INSERT INTO ZONAS(nom_zona) VALUES('Sur Austral');
INSERT INTO ZONAS(nom_zona) VALUES('Cordillera');
INSERT INTO ZONAS(nom_zona) VALUES('Costera');
INSERT INTO ZONAS(nom_zona) VALUES('Insular Chiloé');

INSERT INTO CLIENTES(nombre_cliente, direccion, telefono, comuna_id) VALUES('ALCARAZ NOVOA MONTSERRAT', 'AV, DIEGO PORTALES 450', '56945221144');