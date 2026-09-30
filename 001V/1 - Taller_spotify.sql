DROP TABLE CANCION;

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    album VARCHAR2(200),
    genero VARCHAR2(100),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE 
);


CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100),
    nacionalidad VARCHAR(100),
    esta_verificado CHAR(1)
);

INSERT INTO CANCION( titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Black', 6, 'Ten', 'Grunch', 180, DATE '1991-08-17');

INSERT INTO CANCION( titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Jeremy', 6, 'Ten', 'Grunch', 230, DATE '1991-08-17');

INSERT INTO CANCION( titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Alive', 6, 'Ten', 'Grunch', 450, DATE '1991-08-17');


INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('La voz de los 80', 1, 'La voz de los 80', 'Rock', 324, DATE '1984-12-13');

INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Para amar', 1, 'La voz de los 80', 'Rock', 400, DATE '1984-12-13');

INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Chicago', 5, 'Xscape', 'Pop', 458, DATE '2014-05-12');

INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Slave to the rythm', 5, 'Xscape', 'Pop', 254, DATE '2014-05-12');

COMMIT;

SELECT * FROM CANCION;

INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Los Prisioneros', 'Chilena', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Nirvana', 'EE.UU', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Queen', 'Britanicos', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('PinkPanters', 'Britanicos', 'N');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Michael Jakson', 'EE.UU', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Pearl Jam', 'EE.UU', 'S');

COMMIT;


SELECT * FROM CANCION;
SELECT * FROM ARTISTA;


-- JOINS/ INTERSECCIONES
SELECT * FROM CANCION JOIN ARTISTA ON CANCION.ID_ARTISTA = ARTISTA.ID_ARTISTA;

SELECT * FROM CANCION c JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;

SELECT c.TITULO , c.FECHA_LANZAMIENTO, a.NOMBRE FROM CANCION c JOIN ARTISTA a ON c.ID_ARTISTA = a.ID_ARTISTA;
