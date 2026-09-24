DROP TABLE genero_cancion CASCADE CONSTRAINTS;
DROP TABLE cancion CASCADE CONSTRAINTS;
DROP TABLE artista CASCADE CONSTRAINTS;
DROP TABLE album CASCADE CONSTRAINTS;
DROP TABLE genero CASCADE CONSTRAINTS;
DROP TABLE pais CASCADE CONSTRAINTS;

CREATE TABLE album(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    fecha_lanzamiento DATE 

)


CREATE TABLE genero(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);

CREATE TABLE pais(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);


CREATE TABLE artista(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    id_pais REFERENCES pais(id_pais)
);






CREATE TABLE cancion(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    id_artista NUMBER REFERENCES artista(id_artista),
    id_album NUMBER REFERENCES album(id_album),
    duracion_segundos NUMBER NOT NULL,
    fecha_lanzamiento DATE 
    
);



CREATE TABLE genero_cancion(
    id_cancion NUMBER REFERENCES cancion(id_cancion),
    id_genero NUMBER REFERENCES genero(id_genero)
);




INSERT INTO pais(nombre) VALUES ('CHILE');
INSERT INTO pais(nombre) VALUES ('PERU');
INSERT INTO pais(nombre) VALUES ('ESTADOS UNIDOS');
INSERT INTO pais(nombre) VALUES ('INGLATERRA');



INSERT INTO genero(nombre) VALUES ('ROCK');
INSERT INTO genero(nombre) VALUES ('METAL');
INSERT INTO genero(nombre) VALUES ('POP');
INSERT INTO genero(nombre) VALUES ('COUNTRY');
INSERT INTO genero(nombre) VALUES ('TRASH METAL');


INSERT INTO album(nombre, fecha_lanzamiento) VALUES ('Appetite for destruction', '24/07/91', 'Ozzy', '27/05/86');
INSERT INTO artista(nombre, esta_verificado, id_pais) VALUES ('Ozzy Osbourne', 's', 4, 'Guns N Roses', 's', 3, 'Metallica', 's', 3);
INSERT INTO cancion(titulo, id_album, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('No More Tears', 2, 1, 1300, 





INSERT INTO artista(nombre, esta_verificado, id_pais) VALUES ('31 minutos', 's', 1);