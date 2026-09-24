DROP TABLE CANCION_GENERO CASCADE CONSTRAINTS;
DROP TABLE CANCION CASCADE CONSTRAINTS;
DROP TABLE ARTISTA CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;
DROP TABLE ALBUM CASCADE CONSTRAINTS;
DROP TABLE PAIS CASCADE CONSTRAINTS;

CREATE TABLE PAIS(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    fecha_de_lanzamiento DATE
);

CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);

CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    id_pais NUMBER REFERENCES PAIS(id_pais)
);

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    id_album NUMBER REFERENCES ALBUM(id_album),
    duracion_segundos NUMBER NOT NULL,
    fecha_lanzamiento DATE
);

CREATE TABLE CANCION_GENERO(
    id_cancion NUMBER REFERENCES CANCION(id_cancion),
    id_genero NUMBER REFERENCES GENERO(id_genero)
);

INSERT INTO PAIS(nombre) VALUES('Chile');
INSERT INTO PAIS(nombre) VALUES('Estados Unidos');
INSERT INTO PAIS(nombre) VALUES('Inglaterra');

INSERT INTO ALBUM(nombre, fecha_de_lanzamiento) VALUES('La Voz de los 80', DATE '1984-01-01');
INSERT INTO ALBUM(nombre, fecha_de_lanzamiento) VALUES('Dynasty', DATE '1979-03-23');
INSERT INTO ALBUM(nombre, fecha_de_lanzamiento) VALUES('(Whats The History)Morning Glory?', DATE '1995-10-02');

INSERT INTO GENERO(nombre) VALUES('Hard Rock');
INSERT INTO GENERO(nombre) VALUES('Disco');
INSERT INTO GENERO(nombre) VALUES('Pop Rock');
INSERT INTO GENERO(nombre) VALUES('Rock en Español');
INSERT INTO GENERO(nombre) VALUES('Britpop');

INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES('Los Prisioneros', 'Y', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES('Kiss', 'Y', 2);
INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES('Oasis', 'Y', 3);

INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES('Sexo', 1, 1, 200, DATE '1985-03-21' );
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES('I Was Made For Lovin You', 2, 2, 271, DATE '1979-05-20');
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES('Wonderwall-Remastered', 3, 3, 258, DATE '1995-10-30');

INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES(1, 1);
COMMIT;