DROP TABLE accesorio_prueba CASCADE CONSTRAINT;
DROP TABLE jugador CASCADE CONSTRAINT;
DROP TABLE videojuego CASCADE CONSTRAINT;
DROP TABLE franquicia CASCADE CONSTRAINT;
DROP TABLE consola CASCADE CONSTRAINT;

CREATE TABLE consola(
    id_consola NUMBER(4) PRIMARY KEY,
    nombre_consola VARCHAR2(60) NOT NULL UNIQUE,
    tipo_consola VARCHAR2(20) NOT NULL CHECK(tipo_consola IN ('SOBREMESA', 'PORTATIL', 'HIBRIDA')),
    anio_lanzamiento NUMBER(4) NOT NULL CHECK(anio_lanzamiento BETWEEN 1983 AND 2030),
    precio_referencia_usd NUMBER(6,2) NOT NULL CHECK(precio_referencia_usd > 0),
    estado_fabricacion VARCHAR2(15) DEFAULT 'ACTIVA' NOT NULL CHECK(estado_fabricacion IN ('ACTIVA', 'DESCONTINUADA'))
);

CREATE TABLE franquicia(
    id_franquicia NUMBER(4) PRIMARY KEY,
    nombre_franquicia VARCHAR2(60) NOT NULL UNIQUE,
    creador_principal VARCHAR2(80),
    anio_debut NUMBER(4) NOT NULL CHECK(anio_debut >= 1980),
    estudio_principal VARCHAR2(60) DEFAULT 'NINTENDO EPD' NOT NULL
);

CREATE TABLE videojuego(
    id_juego NUMBER(6) PRIMARY KEY,
    codigo_catalogo VARCHAR2(10) NOT NULL UNIQUE,
    titulo VARCHAR2(100) NOT NULL,
    id_franquicia NUMBER(4) NOT NULL REFERENCES franquicia(id_franquicia),
    id_consola NUMBER(4) NOT NULL REFERENCES consola(id_consola),
    clasificacion_esrb VARCHAR2(5) NOT NULL CHECK(clasificacion_esrb IN ('E', 'E10+', 'T','M')),
    precio_clp NUMBER(8) NOT NULL CHECK(precio_clp >= 0),
    puntaje_metacritic NUMBER(8) CHECK(puntaje_metacritic BETWEEN 0 and 100),
    stock_fisico NUMBER(5) DEFAULT '0' NOT NULL CHECK(stock_fisico >= 0),
    fecha_lanzamiento DATE NOT NULL 
);

CREATE TABLE jugador(
    id_jugador NUMBER(6) PRIMARY KEY,
    nickname VARCHAR2(30) NOT NULL UNIQUE,
    email VARCHAR2(100) NOT NULL UNIQUE,
    pais VARCHAR2(40) DEFAULT 'CHILE' NOT NULL,
    monedas_oro NUMBER(6) DEFAULT '0' NOT NULL CHECK(monedas_oro >= 0),
    suscripciones_online VARCHAR2(15) DEFAULT 'GRATUITA' NOT NULL CHECK(suscripciones_online IN ('GRATUITA', 'INDIVIDUAL', 'FAMILIAR', 'EXPANSION')),
    id_juego_favorito NUMBER(6) REFERENCES videojuego(id_juego)
);

CREATE TABLE accesorio_prueba(
    id_accesorio NUMBER(4) PRIMARY KEY,
    nombre_accesorio VARCHAR2(40) NOT NULL,
    precio_usd NUMBER(5,2) NOT NULL CHECK(precio_usd > 0),
    id_consola NUMBER(4) NOT NULL REFERENCES consola(id_consola)
);

ALTER TABLE jugador
    ADD fecha_lanzamiento DATE DEFAULT SYSDATE NOT NULL;

ALTER TABLE jugador
    ADD nivel_cuenta NUMBER(3) DEFAULT '1' NOT NULL CHECK(nivel_cuenta BETWEEN '1' AND '99');

ALTER TABLE accesorio_prueba
    MODIFY nombre_accesorio VARCHAR2(100);

ALTER TABLE accesorio_prueba
    ADD color_edicion VARCHAR2(25);

ALTER TABLE accesorio_prueba
    DROP COLUMN color_edicion;

ALTER TABLE videojuego
    ADD descuento_porcentaje NUMBER(3) DEFAULT '0' CHECK(descuento_porcentaje BETWEEN '0' and '80');


INSERT INTO consola(id_consola,nombre_consola,tipo_consola,anio_lanzamiento,precio_referencia_usd,estado_fabricacion) VALUES (1, 'Nintendo Switch', 'HIBRIDA', '2017', '299.99', 'ACTIVA');
INSERT INTO consola(id_consola,nombre_consola,tipo_consola,anio_lanzamiento,precio_referencia_usd) VALUES (2, 'Nintendo Switch 2', 'HIBRIDA', '2025', '449.99');
INSERT INTO consola(id_consola,nombre_consola,tipo_consola,anio_lanzamiento,precio_referencia_usd) VALUES (3, 'Nintendo 3DS ', 'PORTATIL', '2011', '169.99');
INSERT INTO consola(id_consola,nombre_consola,tipo_consola,anio_lanzamiento,precio_referencia_usd) VALUES (4, 'Nintendo GameCube', 'SOBREMESA', '2001', '199.99');


COMMIT;