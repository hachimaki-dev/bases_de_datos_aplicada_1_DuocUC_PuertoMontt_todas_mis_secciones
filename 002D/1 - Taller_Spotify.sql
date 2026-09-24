DROP TABLE canción;
CREATE TABLE canción (
    id_cancion        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo            VARCHAR2(200) NOT NULL,
    artista           VARCHAR2(100),
    album             VARCHAR2(200),
    genero            VARCHAR2(100),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

INSERT INTO canción(titulo,artista,album,genero,duracion_segundos,fecha_lanzamiento) VALUES ('Rock with you', 'Michael Jackson','Off the wall', 'Pop',200,DATE '1979-11-03');
INSERT INTO canción(titulo,artista,album,genero,duracion_segundos,fecha_lanzamiento) VALUES ('Get on the Floor', 'Michael Jackson','Off the wall', 'Pop',140,DATE '1979-11-03');
INSERT INTO canción(titulo,artista,album,genero,duracion_segundos,fecha_lanzamiento) VALUES ('Girlfriend', 'Michael Jackson','Off the wall', 'Pop',160,DATE '1979-11-03');
INSERT INTO canción(titulo,artista,album,genero,duracion_segundos,fecha_lanzamiento) VALUES ('Burn This Disco out', 'Michael Jackson','Off the wall', 'Pop',110,DATE '1979-11-03');

COMMIT;