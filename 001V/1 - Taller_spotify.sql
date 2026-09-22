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

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Black', 'Pearl Jam', 'Ten', 'Grunch', 180, DATE '1991-08-17');

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Jeremy', 'Pearl Jam', 'Ten', 'Grunch', 230, DATE '1991-08-17');

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ( 'Alive', 'PEARLJAM', 'Ten', 'Grunch', 450, DATE '1991-08-17');

COMMIT;