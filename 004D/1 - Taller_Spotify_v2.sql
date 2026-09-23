DROP TABLE CANCION CASCADE CONSTRAINTS;
DROP TABLE ARTISTA CASCADE CONSTRAINTS;
DROP TABLE ALBUM CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;

CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    nacionalidad VARCHAR2(100)
);

--Esto esta en 1FN
CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    id_album NUMBER REFERENCES ALBUM(id_album),
    id_genero NUMBER REFERENCES GENERO(id_genero),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

INSERT INTO GENERO(nombre) VALUES('Rock');
INSERT INTO GENERO(nombre) VALUES('Rock Latino');
INSERT INTO GENERO(nombre) VALUES('Opera Rock');
INSERT INTO GENERO(nombre) VALUES('Pop');
INSERT INTO GENERO(nombre) VALUES('Jazz');
COMMIT;

INSERT INTO ALBUM(nombre) VALUES('La Culpa');
INSERT INTO ALBUM(nombre) VALUES('Vida de Perros');
INSERT INTO ALBUM(nombre) VALUES('The Wall');
INSERT INTO ALBUM(nombre) VALUES('Ratoncitos');
INSERT INTO ALBUM(nombre) VALUES('31 Canciones de Amor y una Canción de Guaripolo');
COMMIT;

INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Los Bunkers','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Pink Floyd','S','EE.UU.');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Eric Clapton','S','EE.UU.');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('BB King','S','EE.UU.');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('David Gilmoure','S','EE.UU.');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Slash','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Guns and Roses','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Iron Maiden','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Bruno Mars','S','Inglés');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Bad Bunny','S','Puerto Riqueño');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Kid Voodo','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('31 minutos','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('BKN','S','Chileno');
INSERT INTO ARTISTA(nombre,esta_verificado, nacionalidad) VALUES('Los Pulentos','S','Chileno');
COMMIT;

SELECT * FROM ARTISTA;

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1, 1, 2, 200, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 1, 2, 240, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 2, 2, 186, DATE '2005-09-08');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Comfortably Numb', 5, 3, 1, 600, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('The Wall', 5, 3, 1, 420, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La Señora Interesante', 12, 5, 1, 310, DATE '2004-08-15');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 4, 3, 300, DATE '2004-08-15');

COMMIT;

SELECT * FROM CANCION;

SELECT * FROM CANCION
JOIN ARTISTA ON CANCION.ID_ARTISTA = ARTISTA.ID_ARTISTA;

SELECT * FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT c.TITULO, c.GENERO, a.NOMBRE, a.NACIONALIDAD FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT 
    c.TITULO, 
    c.DURACION_SEGUNDOS, 
    a.NOMBRE, 
    al.NOMBRE, 
    g.NOMBRE 
FROM 
    CANCION c
INNER JOIN 
    ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA
INNER JOIN 
    ALBUM al ON c.ID_ALBUM = al.ID_ALBUM
INNER JOIN 
    GENERO g ON c.ID_GENERO = g.ID_GENERO;

--genero, album y join