DROP TABLE cancion_genero CASCADE CONSTRAINTS;
DROP TABLE cancion CASCADE CONSTRAINTS;
DROP TABLE artista CASCADE CONSTRAINTS;
DROP TABLE genero CASCADE CONSTRAINTS;
DROP TABLE album CASCADE CONSTRAINTS;
DROP TABLE pais CASCADE CONSTRAINTS;

CREATE TABLE pais
(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE album
(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    fecha_lanzamiento DATE
);

CREATE TABLE genero
(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);





CREATE TABLE artista
(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1) NOT NULL,
    id_pais NUMBER REFERENCES pais(id_pais)
);

CREATE TABLE cancion
(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    id_artista NUMBER REFERENCES artista(id_artista),
    id_album NUMBER REFERENCES album(id_album),
    duracion_segundos NUMBER NOT NULL,
    fecha_lanzamiento DATE
);



CREATE TABLE cancion_genero
(
    id_cancion NUMBER REFERENCES cancion(id_cancion),
    id_genero NUMBER REFERENCES genero(id_genero)
);

INSERT INTO pais VALUES ("Chile");
INSERT INTO pais VALUES ("Argentina");