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
    fecha_lanzamiento DATE
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

INSERT INTO PAIS(nombre) VALUES ('Chile');
INSERT INTO PAIS(nombre) VALUES ('Argentina');
INSERT INTO PAIS(nombre) VALUES ('Mexico');
INSERT INTO PAIS(nombre) VALUES ('Estados unidos');

INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Canta Trovador', DATE '1991-09-26');
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Nevermind', DATE '1969-10-31');
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Signos', DATE '1986-10-09');
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Busca Una Mujer', DATE '1988-11-25');

INSERT INTO GENERO(nombre) VALUES ('Rock');
INSERT INTO GENERO(nombre) VALUES ('Pop');
INSERT INTO GENERO(nombre) VALUES ('Grunge');
INSERT INTO GENERO(nombre) VALUES ('Balada');

INSERT INTO ARTISTA(nombre,esta_verificado,id_pais) VALUES ('Leo Dan', 'S', 2);
INSERT INTO ARTISTA(nombre,esta_verificado,id_pais) VALUES ('Nirvana', 'S', 4);
INSERT INTO ARTISTA(nombre,esta_verificado,id_pais) VALUES ('Soda Stereo', 'S', 2);
INSERT INTO ARTISTA(nombre,esta_verificado,id_pais) VALUES ('Luis Miguel', 'S', 3);

INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Te He Prometido',1,1,180,DATE '1991-09-26');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Drain You',2,2,210,DATE'1969-10-31');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Lithium',2,2,210,DATE'1969-10-31');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Come As You Are',2,2,210,DATE'1969-10-31');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Persiana Americana',3,3,300,DATE'1986-10-09');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Culpable O No - Mienteme Como Siempre',4,4,240,DATE'1988-11-25');
INSERT INTO CANCION(titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Pupilas De Gato',4,4,240,DATE'1988-11-25');

INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (1,1);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (1,2);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (1,4);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (2,1);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (2,3);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (3,1);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (3,3);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (4,1);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (4,3);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (5,1);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (5,2);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (6,2);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (6,4);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (7,2);
INSERT INTO CANCION_GENERO(id_cancion,id_genero) VALUES (7,4);

COMMIT;