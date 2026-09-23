DROP TABLE CANCION;
DROP TABLE ARTISTA;
--Esto esta en 1FN
CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    artista VARCHAR2(200),
    album VARCHAR2(200),
    genero VARCHAR2(100),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 'Los bunkers', 'La culpa', 'Rock latino', 200, DATE '2003-09-01');

INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 'Los bunkers', 'La culpa', 'Rock latino', 240, DATE '2003-09-01');

INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 'Los bunkers', 'Vida de perros', 'Rock latino', 186, DATE '2005-09-08');

COMMIT;


CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100)
);

INSERT INTO ARTISTA(nombre) VALUES('Los Bunkers');
INSERT INTO ARTISTA(nombre) VALUES('Pink Floyd');
INSERT INTO ARTISTA(nombre) VALUES('Eric Clapton');
INSERT INTO ARTISTA(nombre) VALUES('BB King');
INSERT INTO ARTISTA(nombre) VALUES('David Gilmoure');
INSERT INTO ARTISTA(nombre) VALUES('Slash');
INSERT INTO ARTISTA(nombre) VALUES('Guns and Roses');
INSERT INTO ARTISTA(nombre) VALUES('Iron Maiden');
INSERT INTO ARTISTA(nombre) VALUES('Bruno Mars');
INSERT INTO ARTISTA(nombre) VALUES('Bad Bunny');
INSERT INTO ARTISTA(nombre) VALUES('Kid Voodo');
INSERT INTO ARTISTA(nombre) VALUES('31 minutos');
INSERT INTO ARTISTA(nombre) VALUES('BKN');
INSERT INTO ARTISTA(nombre) VALUES('Los Pulentos');
COMMIT;