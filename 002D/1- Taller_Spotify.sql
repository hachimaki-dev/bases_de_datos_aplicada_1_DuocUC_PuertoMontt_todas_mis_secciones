DROP TABLE  CANCION_GENERO   CASCADE CONSTRAINTS;
DROP TABLE  CANCION          CASCADE CONSTRAINTS;
DROP TABLE  ARTISTA          CASCADE CONSTRAINTS;
DROP TABLE  GENERO           CASCADE CONSTRAINTS;
DROP TABLE  ALBUM            CASCADE CONSTRAINTS;
DROP TABLE  PAIS             CASCADE CONSTRAINTS;


CREATE TABLE PAIS(
    id_pais             NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2(100) NOT NULL
);

CREATE TABLE ALBUM(
    id_album            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2 NOT NULL,
    fecha_lanzamiento   DATE

);

CREATE TABLE GENERO(
    id_genero           NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2(200) NOT NULL
);

CREATE TABLE ARTISTA(
    id_artista          NUMERIC GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2(100) NOT NULL,
    esta_verificado     CHAR(1),
    id_pais             NUMBER REFERENCES PAIS(id_pais)
);



CREATE TABLE CANCION (
    id_cancion          NUMERIC GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo              VARCHAR2(200) NOT NULL,
    id_artista          NUMBER REFERENCES ARTISTA(id_artista),
    id_album            NUMBER REFERENCES ALBUM(id_album),
    id_genero              VARCHAR2(100),
    duracion_segundos   NUMBER NOT NULL,
    fecha_lanzamiento   DATE

);

CREATE TABLE CANCION_GENERO(
    id_cancion          NUMBER REFERENCES CANCION(id_cancion),
    id_genero           NUMBER REFERENCES GENERO(id_genero)
);





--INSERT INTO cancion VALUES (1, 'Anti-Hero', 'Taylor Swift', 'Midnights', 'Pop', 200, DATE '2022-10-21');
--INSERT INTO cancion VALUES (1, 'Shake It Off', 'Taylor Swift', '1989', 'Pop', 219, DATE '2014-08-18');
--COMMIT;