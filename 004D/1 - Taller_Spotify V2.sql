DROP TABLE ARTISTA CASCADE CONSTRAINTS;
DROP TABLE ALBUM CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;
DROP TABLE CANCION CASCADE CONSTRAINTS;

CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    nacionalidad VARCHAR2(100)
);

CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    id_album NUMBER REFERENCES ALBUM(id_album),
    id_genero NUMBER REFERENCES GENERO(id_genero),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);


INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Bunkers', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Pink Floyd', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Eric Clapton', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BB King', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('David Gilmoure', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Slash', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Guns and Roses', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Iron Maiden', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bruno Mars', 'S', 'Ingles');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bad Bunny', 'S', 'Puerto riqueño');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Kid Voodo', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('31 minutos', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BKN', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Pulentos', 'S', 'Chilena');
COMMIT;

SELECT * FROM ARTISTA;

INSERT INTO ALBUM(nombre) VALUES ('La culpa');
INSERT INTO ALBUM(nombre) VALUES ('Vida de perros');
INSERT INTO ALBUM(nombre) VALUES ('The Wall');
INSERT INTO ALBUM(nombre) VALUES ('31 Canciones de Amor y una Canción de Guaripolo');
INSERT INTO ALBUM(nombre) VALUES ('Ratoncitos');
COMMIT;

SELECT * FROM ALBUM;

INSERT INTO GENERO (nombre) VALUES ('Rock Latino');
INSERT INTO GENERO (nombre) VALUES ('Rock');
INSERT INTO GENERO (nombre) VALUES ('Opera Rock');
COMMIT;

SELECT * FROM GENERO;

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1 , 1, 1, 200, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 1, 1, 240, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 2, 1, 186, DATE '2005-09-08');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Confortubly Num', 5, 3, 2, 600, DATE '1999-12-03' );
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('The Wall', 5, 3, 2, 420, DATE '1999-12-03' );
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La señora interesante', 12, 4, 2, 190, DATE '2004-08-15');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 5, 3, 260, DATE '2005-07-01');
COMMIT;

SELECT * FROM CANCION;


SELECT * FROM CANCION
JOIN ARTISTA ON CANCION.ID_ARTISTA = ARTISTA.ID_ARTISTA;

SELECT * FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT * FROM CANCION c
JOIN GENERO g ON c.ID_GENERO = g.ID_GENERO;

SELECT * FROM CANCION c
JOIN ALBUM b ON c.ID_ALBUM = b.ID_ALBUM;

SELECT c.TITULO, c.GENERO, a.NOMBRE, a.NACIONALIDAD FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;