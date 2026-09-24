DROP TABLE cancion_genero CASCADE CONSTRAINTS;
DROP TABLE cancion CASCADE CONSTRAINTS;
DROP TABLE artista CASCADE CONSTRAINTS;
DROP TABLE genero CASCADE CONSTRAINTS;
DROP TABLE album CASCADE CONSTRAINTS;
DROP TABLE pais CASCADE CONSTRAINTS;


CREATE TABLE pais (
    id_pais         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(100) NOT NULL
);

CREATE TABLE album (
    id_album        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(200) NOT NULL,
    fecha_lanzamiento DATE
);

CREATE TABLE genero (
    id_genero       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(100) NOT NULL
);

CREATE TABLE artista (
    id_artista      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    id_pais         NUMBER REFERENCES pais(id_pais)
);

CREATE TABLE cancion (
    id_cancion      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo          VARCHAR2(200) NOT NULL,
    id_artista      NUMBER REFERENCES artista(id_artista),
    id_album        NUMBER REFERENCES album(id_album),
    duracion_segundos NUMBER NOT NULL,
    fecha_lanzamiento DATE

);

CREATE TABLE cancion_genero(
    id_cancion      NUMBER REFERENCES cancion(id_cancion),
    id_genero       NUMBER REFERENCES genero(id_genero)
);

INSERT INTO pais (nombre) VALUES ('Chile');
INSERT INTO pais (nombre) VALUES ('Japón');

INSERT INTO album (nombre, fecha_lanzamiento) VALUES ('Completeness', TO_DATE('2025-04-23', 'YYYY-MM-DD'));
INSERT INTO album (nombre, fecha_lanzamiento) VALUES ('Meisekiha', TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO genero (nombre) VALUES ('Rock');
INSERT INTO genero (nombre) VALUES ('Metal');

INSERT INTO artista (nombre, esta_verificado, id_pais) VALUES ('Ave Mujica', 't', 2);
INSERT INTO artista (nombre, esta_verificado, id_pais) VALUES ('MyGO!!!!!', 't', 2);

INSERT INTO cancion (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento)
VALUES ('KiLLKiSS', 1, 1, 208, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO cancion (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento)
VALUES ('Mayoiuta', 2, 2, 211, TO_DATE('2022-11-09', 'YYYY-MM-DD'));

INSERT INTO cancion_genero (id_cancion, id_genero) VALUES (1, 2);
INSERT INTO cancion_genero (id_cancion, id_genero) VALUES (2, 1);