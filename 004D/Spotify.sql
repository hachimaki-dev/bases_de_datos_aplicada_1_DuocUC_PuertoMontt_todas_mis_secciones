DROP TABLE CANCION;

CREATE TABLE CANCION (
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    artista VARCHAR2(200) NOT NULL,
    album VARCHAR2(200),
    genero VARCHAR2(200),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

CREATE TABLE ARTISTA (
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL
);

INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 'Los bunkers', 'La culpa', 'Rock latino', 200, DATE '2003-09-01');
INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Anti-Hero', 'Taylor Swift', 'Midnights', 'Pop', 200, DATE '2022-10-21');
INSERT INTO CANCION(titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Shake It Off', 'Taylor Swift', '1989', 'Pop', 219, DATE '2014-08-18');

INSERT INTO ARTISTA(nombre) VALUES ('Los bunkers');
INSERT INTO ARTISTA(nombre) VALUES ('Pink Frloyd');
INSERT INTO ARTISTA(nombre) VALUES ('Eric Clapton');
INSERT INTO ARTISTA(nombre) VALUES ('BB King');
INSERT INTO ARTISTA(nombre) VALUES ('David Gilmoure');
INSERT INTO ARTISTA(nombre) VALUES ('Slash');
INSERT INTO ARTISTA(nombre) VALUES ('Guns and Roses');
INSERT INTO ARTISTA(nombre) VALUES ('Iron Maiden');
INSERT INTO ARTISTA(nombre) VALUES ('Bruno Mars');
INSERT INTO ARTISTA(nombre) VALUES ('Bad Bunny');
INSERT INTO ARTISTA(nombre) VALUES ('Kid Voodo');
INSERT INTO ARTISTA(nombre) VALUES ('31 minutos');
INSERT INTO ARTISTA(nombre) VALUES ('Los Pulentos');

COMMIT;