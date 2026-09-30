DROP TABLE CANCION CASCADE CONSTRAINT;
DROP TABLE ARTISTA CASCADE CONSTRAINT;
DROP TABLE GENEROS CASCADE CONSTRAINT;
DROP TABLE ALBUMES CASCADE CONSTRAINT;



CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    nacionalidad VARCHAR2(50)
);

CREATE TABLE GENEROS(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE ALBUMES (
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);

--Esto esta en 1FN
CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    id_album NUMBER REFERENCES ALBUMES(id_album),
    id_genero NUMBER REFERENCES GENEROS(id_genero),
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


INSERT INTO ALBUMES(nombre) VALUES ('La culpa');
INSERT INTO ALBUMES(nombre) VALUES ('Vida de perros');
INSERT INTO ALBUMES(nombre) VALUES ('The Wall');
INSERT INTO ALBUMES(nombre) VALUES ('31 Canciones de Amor y una Canción de Guaripolo');
INSERT INTO ALBUMES(nombre) VALUES ('Ratoncitos');
COMMIT;


INSERT INTO GENEROS (nombre) VALUES ('ROCK');
INSERT INTO GENEROS (nombre) VALUES ('POP');
INSERT INTO GENEROS (nombre) VALUES ('REGGAE');
INSERT INTO GENEROS (nombre) VALUES ('ELECTRONICA');
INSERT INTO GENEROS (nombre) VALUES ('BALADAS');
INSERT INTO GENEROS (nombre) VALUES ('J-rock');
INSERT INTO GENEROS (nombre) VALUES ('RAP');
INSERT INTO GENEROS (nombre) VALUES ('HIP-HOP');
INSERT INTO GENEROS (nombre) VALUES ('METAL');
INSERT INTO GENEROS (nombre) VALUES ('TRASH');
INSERT INTO GENEROS (nombre) VALUES ('JAZZ');
INSERT INTO GENEROS (nombre) VALUES ('BLUES');
INSERT INTO GENEROS (nombre) VALUES ('K-POP');
INSERT INTO GENEROS (nombre) VALUES ('ROCK LATINO');
INSERT INTO GENEROS (nombre) VALUES ('OPERA ROCK');
COMMIT;


INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1 , 1, 14, 200, DATE '2003-09-01');

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 1, 14, 240, DATE '2003-09-01');

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 2, 14, 186, DATE '2005-09-08');

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Confortubly Num', 5, 3, 1, 600, DATE '1999-12-03' );

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('The Wall', 5, 3, 1, 420, DATE '1999-12-03' );

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La señora interesante', 12, 4, 1, 190, DATE '2004-08-15');

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 5, 15, 260, DATE '2005-07-01');

COMMIT;

SELECT * FROM CANCION;
SELECT * FROM ARTISTA;


SELECT * FROM CANCION
JOIN ARTISTA ON CANCION.ID_ARTISTA = ARTISTA.ID_ARTISTA;

SELECT * FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT c.TITULO, c.GENERO, a.NOMBRE, a.NACIONALIDAD FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT * FROM CANCION
JOIN ALBUMES ON CANCION.ID_ALBUM = ALBUMES.ID_ALBUM;

SELECT * FROM CANCION
JOIN GENEROS ON CANCION.ID_GENERO = GENEROS.ID_GENERO;