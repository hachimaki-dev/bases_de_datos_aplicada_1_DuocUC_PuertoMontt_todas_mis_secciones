DROP TABLE CANCION;

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    titulo VARCHAR2(200),
    artista VARCHAR2(200),
    album VARCHAR2(200),
    genero VARCHAR2(200),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento ) VALUES ( 'Dont Cry', 'guns and roses', 'Use you illusions', 'Rock', 200, DATE '1991-09-17');

INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento ) VALUES ('November Rain', 'Guns n Roses', 'Use you illusions', 'Rock', 240, DATE '1991-09-17');



INSERT INTO CANCION( titulo, artista, album, genero, duracion_segundos, fecha_lanzamiento ) VALUES ( 'Strainch', 'Guns %&% Roses', 'Use you illusions', 'Rock', 240, DATE '1991-09-17');

COMMIT;


DELETE FROM CANCION WHERE ID_CANCION = 1;

commit;