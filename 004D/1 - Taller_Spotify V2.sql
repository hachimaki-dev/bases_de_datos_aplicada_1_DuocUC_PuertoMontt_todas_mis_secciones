DROP TABLE CANCION CASCADE CONSTRAINTS;
DROP TABLE ARTISTA CASCADE CONSTRAINTS;
DROP TABLE NACIONALIDAD CASCADE CONSTRAINTS;
DROP TABLE ALBUM CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;




CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    id_nacionalidad NUMBER REFERENCES NACIONALIDAD(id_nacionalidad)
);

CREATE TABLE NACIONALIDAD(
    id_nacionalidad NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100)
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


CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100),
    fecha_lanzamiento DATE
);

CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100)
);

INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Bunkers', 'S', 2);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Pink Floyd', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Eric Clapton', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BB King', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('David Gilmoure', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Slash', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Guns and Roses', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Iron Maiden', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bruno Mars', 'S', 4);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bad Bunny', 'S', 3);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Kid Voodo', 'S', 2);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('31 minutos', 'S', 2);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BKN', 'S', 2);
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Pulentos', 'S', 2);
COMMIT;

SELECT * FROM ARTISTA;


INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1, 1, 2, 200, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 1, 2, 240, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 2, 2, 186, DATE '2005-09-08');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Confortably Num', 5, 3, 1, 600, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Confortably Num', 5, 3, 1, 420, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('La señora interesante', 12, 4, 1, 190, DATE '2004-08-15');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 5, 3, 260, DATE '2005-07-01');
COMMIT;

INSERT INTO NACIONALIDAD(nombre) VALUES ('EE.UU');
INSERT INTO NACIONALIDAD(nombre) VALUES ('Chilena');
INSERT INTO NACIONALIDAD(nombre) VALUES ('Puertoriqueño');
INSERT INTO NACIONALIDAD(nombre) VALUES ('Inglés');
COMMIT;

INSERT INTO ALBUM(titulo, fecha_lanzamiento) VALUES ('La culpa', DATE '2003-09-01');
INSERT INTO ALBUM(titulo, fecha_lanzamiento) VALUES ('Vida de perros', DATE '2005-09-08');
INSERT INTO ALBUM(titulo, fecha_lanzamiento) VALUES ('The Wall', DATE '1999-12-03');
INSERT INTO ALBUM(titulo, fecha_lanzamiento) VALUES ('31 Canciones de Amor y una Canción de Guaripolo', DATE '2004-08-15');
INSERT INTO ALBUM(titulo, fecha_lanzamiento) VALUES ('Ratoncitos', DATE '2005-07-01');
COMMIT;

INSERT INTO GENERO(nombre) VALUES ('Rock');
INSERT INTO GENERO(nombre) VALUES ('Rock Latino');
INSERT INTO GENERO(nombre) VALUES ('Opera Rock');
COMMIT;

SELECT * FROM CANCION;

SELECT * FROM CANCION 
JOIN ARTISTA  ON CANCION.ID_ARTISTA = ARTISTA.ID_ARTISTA;

SELECT * FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT c.TITULO, c.GENERO, a.NOMBRE, a.NACIONALIDAD FROM CANCION c
JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;




