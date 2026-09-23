DROP TABLE CANCION;

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    artista VARCHAR2(100),
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

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Black', 'Pearl Jam', 'Ten', 'Grunch', 180, DATE '1991-08-17');

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Jeremy', 'Pearl Jam', 'Ten', 'Grunch', 230, DATE '1991-08-17');

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Alive', 'PEARLJAM', 'Ten', 'Grunch', 450, DATE '1991-08-17');

COMMIT;

SELECT * FROM CANCION;



INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Los Prisioneros', 'Chilena', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Nirvana', 'EE.UU', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Queen', 'Britanicos', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('PinkPanters', 'Britanicos', 'N');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Michael Jakson', 'EE.UU', 'S');
INSERT INTO ARTISTA(nombre, nacionalidad, esta_verificado) VALUES('Pearl Jam', 'EE.UU', 'S');

COMMIT;



