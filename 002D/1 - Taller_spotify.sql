DROP TABLE CANCION_GENERO CASCADE CONSTRAINTS;

DROP TABLE CANCION CASCADE CONSTRAINTS;

DROP TABLE ARTISTA CASCADE CONSTRAINTS;

DROP TABLE GENERO CASCADE CONSTRAINTS;

DROP TABLE ALBUM CASCADE CONSTRAINTS;

DROP TABLE PAIS CASCADE CONSTRAINTS;



CREATE TABLE PAIS(

  id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL UNIQUE

);


CREATE TABLE ALBUM(

  id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL,

  fecha_lanzamiento DATE

);


CREATE TABLE GENERO(

  id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(50) NOT NULL

);


CREATE TABLE ARTISTA(

  id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL,

  esta_verificado CHAR(1),

  id_pais NUMBER REFERENCES PAIS(id_pais)

);

CREATE TABLE CANCION(

  id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  titulo VARCHAR2(200) NOT NULL,

  id_artista NUMBER REFERENCES ARTISTA(id_artista),

  id_album NUMBER REFERENCES ALBUM(id_album),

  duracion_segundos NUMBER NOT NULL,

  fecha_lanzamiento DATE

);

CREATE TABLE CANCION_GENERO(

  id_cancion NUMBER REFERENCES CANCION(id_cancion),

  id_genero NUMBER REFERENCES GENERO(id_genero)

);

--- INSERTAR DATOS PAIS

INSERT INTO PAIS (nombre) VALUES ('Chile');
INSERT INTO PAIS (nombre) VALUES ('Uruguay');
INSERT INTO PAIS (nombre) VALUES ('Estados Unidos');
COMMIT;


--- INSERTAR DATOS ALBUM

INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('La voz de los 80s', DATE '1984-12-13');
INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('Hoy estoy raro', DATE '2006-05-20');
INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('Nevermind', DATE '1991-09-24');
COMMIT;


--- INSERTAR DATOS GENERO

INSERT INTO GENERO (nombre) VALUES ('Rock');
INSERT INTO GENERO (nombre) VALUES ('Grunge');
INSERT INTO GENERO (nombre) VALUES ('Pop');
INSERT INTO GENERO (nombre) VALUES ('Rock Alternativo');
INSERT INTO GENERO (nombre) VALUES ('Hard Rock');
INSERT INTO GENERO (nombre) VALUES ('Pop Punk');
INSERT INTO GENERO (nombre) VALUES ('Punk Rock');
COMMIT;


--- INSERTAR DATOS ARTISTA

INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('Los prisioneros', 'S', 1);
INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('El Cuarteto de Nos', 'S', 2);
INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('Nirvana', 'S', 3);
COMMIT;


--- INSERTAR DATOS CANCION

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('La voz de los 80s', 1, 1, 248, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Brigada de Negro', 1, 1, 226, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Latinoamérica es un Pueblo al Sur de Estados Unidos', 1, 1, 242, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Eve-Evelyn', 1, 1, 264, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Sexo', 1, 1, 288, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('¿Quién Mató a Marilyn?', 1, 1, 188, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Paramar', 1, 1, 225, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('No Necesitamos Banderas', 1, 1, 309, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Mentalidad Televisiva', 1, 1, 256, DATE '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Nunca Quedas Mal Con Nadie', 1, 1, 251, DATE '1984-12-13');

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Nada Es Gratis En La Vida', 2, 2, 228, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Hoy Estoy Raro', 2, 2, 281, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Así Soy Yo', 2, 2, 227, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Yendo A La Casa De Damián', 2, 2, 256, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Pobre Papá', 2, 2, 179, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Ya No Sé Qué Hacer Conmigo', 2, 2, 241, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Natural', 2, 2, 159, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Invierno Del 92', 2, 2, 241, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('El Karaoke De Mi Noviecita', 2, 2, 262, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Me Hace Bien, Me Hace Mal', 2, 2, 235, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Pueblo Podrido', 2, 2, 152, DATE '2006-10-23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Autos Nuevos', 2, 2, 253, DATE '2006-10-23');

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Smells Like Teen Spirit', 3, 3, 301, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('In Bloom', 3, 3, 254, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Come as you are', 3, 3, 219, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Breed', 3, 3, 183, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Lithium', 3, 3, 257, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Polly', 3, 3, 177, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Territorial Pissings', 3, 3, 142, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Drain You', 3, 3, 223, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Lounge Act', 3, 3, 156, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Stay Away', 3, 3, 212, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('On A Plain', 3, 3, 196, DATE '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Something In The Way', 3, 3, 232, DATE '1991-09-24');
COMMIT;


--- INSERTAR DATOS CANCION_GENERO

INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (1, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (2, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (3, 1); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (4, 3);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (5, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (6, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (7, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (8, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (9, 3); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (10, 1);

INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (11, 1); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (12, 4); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (13, 4); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (14, 4); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (15, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (16, 4);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (17, 4);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (18, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (19, 4);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (20, 4);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (21, 1);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (22, 1);



INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (23, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (23, 4);

INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (24, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (25, 2); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (26, 2); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (27, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (28, 2); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (29, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (30, 2); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (31, 2); 
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (32, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (33, 2);
INSERT INTO CANCION_GENERO (id_cancion, id_genero) VALUES (34, 2);

COMMIT;