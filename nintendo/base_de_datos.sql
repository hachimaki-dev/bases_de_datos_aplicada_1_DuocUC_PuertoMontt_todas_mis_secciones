DROP TABLE CONSOLA CASCADE CONSTRAINTS

DROP TABLE FRANQUICIA CASCADE CONSTRAINTS

DROP TABLE VIDEOJUEGO CASCADE CONSTRAINTS

DROP TABLE JUGADOR CASCADE CONSTRAINTS





CREATE TABLE CONSOLA

( id_consola NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

 nombre_consola VARCHAR(60) NOT NULL UNIQUE,

 tipo_consola VARCHAR(20) NOT NULL CHECK (tipo_consola in ('sobremesa', 'portatil','hibrida')),

 anio_lanzamiento NUMBER(4) NOT NULL CHECK (anio_lanzamiento BETWEEN 1983 AND 2030),

 precio_referencia_usd NUMBER(6,2) NOT NULL CHECK (precio_referencia_usd > 0),

 estado_fabricacion VARCHAR2(15) DEFAULT 'ACTIVA' NOT NULL CHECK (estado_fabricacion IN ('ACTIVA', 'DESCONTINUADA'))

 );

 CREATE TABLE FRANQUICIA(

  id_franquicia NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre_franquicia VARCHAR2(60) NOT NULL UNIQUE,

  creador_principal VARCHAR2(80),

  anio_debut NUMBER(4) NOT NULL CHECK (anio_debut >= 1980),

  estudio_principal VARCHAR2(60) DEFAULT 'NINTENDO EPD' NOT NULL CHECK (estudio_principal IN ('NINTENDO EPD')) 

 );

 CREATE TABLE VIDEOJUEGO(

  id_juego NUMBER(6) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  codigo_catalogo VARCHAR2(10) NOT NULL UNIQUE,

  titulo VARCHAR2(100) NOT NULL,

  id_franquicia NUMBER(4) NOT NULL REFERENCES FRANQUICIA(id_franquicia),

  id_consola NUMBER(4) NOT NULL REFERENCES CONSOLA(id_consola),

  clasificacion_esrb VARCHAR2(5) NOT NULL CHECK (clasificacion_esrb IN ('E', '10+', 'T', 'M')),

  precio_clp NUMBER(8) NOT NULL CHECK (precio_clp >= 0),

  puntaje_metacritic NUMBER(3),

  stock_fisico NUMBER(5) DEFAULT 0 NOT NULL CHECK (stock_fisico >= 0),

  fecha_lazamiento DATE NOT NULL

);

 CREATE TABLE JUGADOR(

  id_jugador NUMBER(6) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nickname VARCHAR2(30) NOT NULL UNIQUE,

  email VARCHAR2(100) NOT NULL UNIQUE,

  pais VARCHAR2(40) DEFAULT 'CHILE' NOT NULL,

  monedas_oro NUMBER(6) DEFAULT 0 NOT NULL CHECK (monedas_oro >= 0),

  suscripcion_online VARCHAR2(15) NOT NULL CHECK (suscripcion_online IN ('GRATUITA', 'INDIVIDUAL', 'FAMILIAR', 'EXPACION')),

  id_juego_favorito NUMBER(6) REFERENCES JUEGO_FAVORITO(id_juego_favorito)

);

 CREATE TABLE ACCESORIO_PRUEBA(

  id_accesorio_prueba NUMBER(4) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre_accesorio VARCHAR2(40) NOT NULL UNIQUE,

  precio_usd NUMBER(5,2) NOT NULL CHECK(precio_usd >= 0),

  id_consola NUMBER(4) NOT NULL REFERENCES CONSOLA(id_consola)

);

 ALTER TABLE JUGADOR

 ADD fecha_registro DATE DEFAULT SYSDATE NOT NULL;