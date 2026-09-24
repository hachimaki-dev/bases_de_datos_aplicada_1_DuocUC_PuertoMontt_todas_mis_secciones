DROP TABLE cancion_genero CASCADE CONSTRAINT;
DROP TABLE cancion CASCADE CONSTRAINT;
DROP TABLE genero CASCADE CONSTRAINT;
DROP TABLE album CASCADE CONSTRAINT;
DROP TABLE artista CASCADE CONSTRAINT;
DROP TABLE pais CASCADE CONSTRAINT;

CREATE TABLE pais(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(100)    NOT NULL
);

CREATE TABLE artista(
    id_artista      NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          VARCHAR2(100)    NOT NULL,
    verificado      CHAR(1),
    id_pais         NUMBER REFERENCES pais(id_pais)  
);

CREATE TABLE album(
    id_album    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre      VARCHAR2(200) NOT NULL,
    fecha_lanzamiento DATE
);
CREATE TABLE genero(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);





CREATE TABLE cancion (
    id_cancion          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo              VARCHAR2(200) NOT NULL, 
    id_artista          NUMBER REFERENCES artista(id_artista),
    id_album            NUMBER REFERENCES album(id_album),
    duracion_segundos   NUMBER NOT NULL,
    fecha_lanzamiento   DATE
);

CREATE TABLE cancion_genero(
    id_cancion NUMBER REFERENCES cancion(id_cancion),
    id_genero NUMBER REFERENCES genero(id_genero)
);
INSERT INTO pais (nombre) VALUES ('Argentina');
INSERT INTO PAIS (NOMBRE) VALUES ('Brazil');
INSERT INTO PAIS (NOMBRE) VALUES ('Chile');
INSERT INTO PAIS (NOMBRE) VALUES ('United Kingdom');
INSERT INTO PAIS (NOMBRE) VALUES ('United States');
INSERT INTO PAIS (NOMBRE) VALUES ('Mexico');

INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('Bring me the Horizon','Y',4);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('All Time Low','Y',5);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('Peor es nada','N',3);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('Enter Shikari','Y',4);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('INSITE','Y',6);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('PXNDX','Y',6);
INSERT INTO ARTISTA(NOMBRE,VERIFICADO,ID_PAIS) VALUES ('División Minúscula','Y',6);

INSERT INTO ALBUM(NOMBRE,FECHA_LANZAMIENTO) VALUES ('POST HUMAN: NeX GEN',DATE'2024-05-24');
INSERT INTO ALBUM(NOMBRE,FECHA_LANZAMIENTO) VALUES ('Sempiternal',DATE'2013-04-01');
INSERT INTO ALBUM(NOMBRE,FECHA_LANZAMIENTO) VALUES ('LOSE YOUR SELF',DATE'2026-04-10');
INSERT INTO ALBUM(NOMBRE,FECHA_LANZAMIENTO) VALUES ('Una vida no es suficiente',DATE'2007-01-07');
INSERT INTO ALBUM(NOMBRE,FECHA_LANZAMIENTO) VALUES ('Ahora soy yo contra el mundo',DATE'2012-06-10');

INSERT INTO GENERO (NOMBRE) VALUES ('Rock');
INSERT INTO GENERO (NOMBRE) VALUES ('Pop');
INSERT INTO GENERO (NOMBRE) VALUES ('Punk');
INSERT INTO GENERO (NOMBRE) VALUES ('J-Rock');
INSERT INTO GENERO (NOMBRE) VALUES ('Metalcore');
INSERT INTO GENERO (NOMBRE) VALUES ('Post-hardcore');


INSERT INTO cancion (titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('YOUtopia',1,1,243,DATE '2024-05-24');
INSERT INTO cancion (titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('KoolAid',1,1,243,DATE '2024-05-24');
INSERT INTO cancion (titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Sleepwalking',1,2,243,DATE '2013-04-01');
INSERT INTO cancion (titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('Spaceship Earth(I.)',4,3,243,DATE '2024-05-24');
INSERT INTO cancion (titulo,id_artista,id_album,duracion_segundos,fecha_lanzamiento) VALUES ('YOUtopia',1,1,243,DATE '2024-05-24');

COMMIT;