DROP TABLE consola;

DROP TABLE franquicia;

DROP TABLE videojuegos;

DROP TABLE jugadores;


CREATE TABLE consola (

  id NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(60) NOT NULL UNIQUE,

  tipo_consola VARCHAR2(20) NOT NULL CHECK (tipo_consola IN ('SOBREMESA', 'PORTATIL', 'HIBRIDA')),

  anio_lanzamiento NUMBER(4) NOT NULL CHECK (anio_lanzamiento BETWEEN 1983 AND 2030),

  precio_referecia_usd NUMBER(6,2) NOT NULL CHECK (precio_referecia_usd > 0),

  estado_fabricacion VARCHAR2(15) DEFAULT 'ACTIVA' NOT NULL CHECK (estado_fabricacion IN ('ACTIVA','DESCONTINUADA'))

);


CREATE TABLE franquicia (

  id NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(60) NOT NULL UNIQUE,

  creador_principal VARCHAR2(80),

  anio_debut NUMBER(4) NOT NULL CHECK (anio_debut >= 1980),

  estudio_principal VARCHAR2(60) DEFAULT 'NINTENDO EPD' NOT NULL

);


CREATE TABLE videojuegos (

  id NUMBER(6) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  codigo_catalogo VARCHAR2(10) NOT NULL UNIQUE,

  titulo VARCHAR2(100) NOT NULL,

  id_franquicia NUMBER(4) REFERENCES franquicia (id),

  id_consola NUMBER(4) REFERENCES consola (id),

  clasificacion_esrb VARCHAR2(5) NOT NULL CHECK (clasificacion_esrb IN ('E', 'E+10', 'T', 'M')),

  precio_clp NUMBER(8) NOT NULL CHECK (precio_clp >= 0),

  puntaje_metacritic NUMBER(3) CHECK (puntaje_metacritic BETWEEN 0 AND 100),

  stock_fisico NUMBER(5) DEFAULT 0 NOT NULL CHECK (stock_fisico >= 0),

  fecha_lanzamiento DATE NOT NULL

);


CREATE TABLE jugadores (

  id NUMBER(6) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nickname VARCHAR2(30) NOT NULL UNIQUE,

  email VARCHAR2(100) NOT NULL UNIQUE,

  pais VARCHAR2(40) DEFAULT 'CHILE' NOT NULL,

  monedas_oro NUMBER(5) DEFAULT 0 NOT NULL CHECK (monedas_oro >= 0),

  suscripcion_online VARCHAR(15) DEFAULT 'GRATUITA' NOT NULL CHECK (suscripcion_online IN ('GRATUITA', 'INDIVIDUAL', 'FAMILIAR', 'EXPANSION')),

  id_juego_favorito NUMBER(6) REFERENCES videojuegos (id)

);


CREATE TABLE accesorio_prueba (

  id NUMBER(6) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(40) NOT NULL,

  precio_usd NUMBER(5,2) NOT NULL CHECK (precio_usd > 0),

  id_consola NUMBER(4) NOT NULL REFERENCES consola (id)

);


ALTER TABLE jugadores ADD fecha_registro DATE DEFAULT SYSDATE NOT NULL;

ALTER TABLE jugadores ADD nivel_cuenta NUMBER(3) DEFAULT 1 NOT NULL CHECK (nivel_cuenta BETWEEN 1 AND 99);

ALTER TABLE accesorio_prueba MODIFY nombre VARCHAR2(100);
ALTER TABLE accesorio_prueba ADD color_edicion VARCHAR2(25);
ALTER TABLE accesorio_prueba DROP COLUMN color_edicion;

DROP TABLE accesorio_prueba;

ALTER TABLE videojuegos ADD descuento_porcentaje NUMBER(3) DEFAULT 0 NOT NULL CHECK (descuento_porcentaje BETWEEN 0 AND 80);

INSERT INTO consola(nombre, tipo_consola, anio_lanzamiento, precio_referencia_usd, estado_fabricacion) VALUES ('Nintendo Switch', 'HIBRIDA', 2017, 299.99, 'ACTIVA');
INSERT INTO consola(nombre, tipo_consola, anio_lanzamiento, precio_referencia_usd, estado_fabricacion) VALUES ('Nintendo Switch 2', 'HIBRIDA', 2025, 449.99);
INSERT INTO consola(nombre, tipo_consola, anio_lanzamiento, precio_referencia_usd, estado_fabricacion) VALUES ('Nintendo 3DS', 'PORTATIL', 2011, 169.99, 'DESCONTINUADA');
INSERT INTO consola(nombre, tipo_consola, anio_lanzamiento, precio_referencia_usd, estado_fabricacion) VALUES ('Nintendo GameCube', 'SOBREMESA', 2001, 199.99, 'DESCONTINUADA');

INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('Super Mario', 'Shigeru Miyamoto', 1985);
INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('The Legend of Zelda', 'Shigeru Miyamoto', 1986);
INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('Pokemon', 'Satoshi Tajiri', 1996, 'Game Freak');
INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('Metroid', 'Gunpei Yokoi', 1986, 'MercurySteam');
INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('Super Smash Bros', 'Masahiro Sakurai', 1999, 'Bandai Namco / Sora');
INSERT INTO franquicia(nombre, creador_principal, anio_debut, estudio_principal) VALUES ('Splatoon', NULL, 2015);

INSERT INTO videojuegos(codigo_catalogo, titulo, id_franquicia, id_consola, clasificacion_esrb, puntaje_metacritic, precio_clp, stock_fisico, fecha_lanzamiento) VALUES ('NSW-001', 'The Legend of Zelda: Breath of the Wild', 2, 1, 'E10+', 97, 54990, 45, TO_DATE('2017-03-03', 'YYYY-MM-DD'));
INSERT INTO videojuegos(codigo_catalogo, titulo, id_franquicia, id_consola, clasificacion_esrb, puntaje_metacritic, precio_clp, stock_fisico, fecha_lanzamiento) VALUES ('NSW-002', 'Super Mario Odyssey', 1, 1, 'E10+', 97, 49990, 60, TO_DATE('2017-10-27', 'YYYY-MM-DD'));
INSERT INTO videojuegos(codigo_catalogo, titulo, id_franquicia, id_consola, clasificacion_esrb, puntaje_metacritic, precio_clp, stock_fisico, fecha_lanzamiento) VALUES ('NSW-003', 'Metroid Dread', 4, 1, 'T', 88, 44990, 15, TO_DATE('2021-10-08', 'YYYY-MM-DD'));