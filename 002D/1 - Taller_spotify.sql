DROP TABLE CANCION_GENERO CASCADE CONSTRAINTS;

DROP TABLE CANCION CASCADE CONSTRAINTS;

DROP TABLE ARTISTA CASCADE CONSTRAINTS;

DROP TABLE GENERO CASCADE CONSTRAINTS;

DROP TABLE ALBUM CASCADE CONSTRAINTS;

DROP TABLE PAIS CASCADE CONSTRAINTS;



CREATE TABLE PAIS(

  id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL

);

INSERT INTO PAIS (nombre) VALUES ('Chile');
INSERT INTO PAIS (nombre) VALUES ('Uruguay');
INSERT INTO PAIS (nombre) VALUES ('Estados Unidos');


CREATE TABLE ALBUM(

  id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL,

  fecha_lanzamiento DATE

);

INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('La voz de los 80s', '1984-12-13');
INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('Hoy estoy raro', '2006-05-20');
INSERT INTO ALBUM (nombre, fecha_lanzamiento) VALUES ('Nevermind', '1991-09-24');

CREATE TABLE GENERO(

  id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(50) NOT NULL

);

INSERT INTO GENERO (nombre) VALUES ('Rock');
INSERT INTO GENERO (nombre) VALUES ('Grunge');
INSERT INTO GENERO (nombre) VALUES ('Pop');
INSERT INTO GENERO (nombre) VALUES ('Rock Alternativo');
INSERT INTO GENERO (nombre) VALUES ('Hard Rock');
INSERT INTO GENERO (nombre) VALUES ('Pop Punk');
INSERT INTO GENERO (nombre) VALUES ('Punk Rock');



CREATE TABLE ARTISTA(

  id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  nombre VARCHAR2(100) NOT NULL,

  esta_verificado CHAR(1),

  id_pais NUMBER REFERENCES PAIS(id_pais)

);

INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('Los prisioneros', 'S', 1);
INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('El Cuarteto de Nos', 'S', 2);
INSERT INTO ARTISTA (nombre, esta_verificado, id_pais) VALUES ('Nirvana', 'S', 3);



CREATE TABLE CANCION(

  id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

  titulo VARCHAR2(200) NOT NULL,

  id_artista NUMBER REFERENCES ARTISTA(id_artista),

  id_album NUMBER REFERENCES ALBUM(id_album),

  duracion_segundos NUMBER NOT NULL,

  fecha_lanzamiento DATE

);

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('La voz de los 80s', 1, 1, 248, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Brigada de Negro', 1, 1, 226, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Latinoamérica es un Pueblo al Sur de Estados Unidos', 1, 1, 242, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Eve-Evelyn', 1, 1, 264, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Sexo', 1, 1, 288, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('¿Quién Mató a Marilyn?', 1, 1, 188, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Paramar', 1, 1, 225, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('No Necesitamos Banderas', 1, 1, 309, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Mentalidad Televisiva', 1, 1, 256, '1984-12-13');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Nunca Quedas Mal Con Nadie', 1, 1, 251, '1984-12-13');

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Nada Es Gratis En La Vida', 2, 2, 228, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Hoy Estoy Raro', 2, 2, 281, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Así Soy Yo', 2, 2, 227, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Yendo A La Casa De Damián', 2, 2, 256, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Pobre Papá', 2, 2, 179, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Ya No Sé Qué Hacer Conmigo', 2, 2, 241, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Natural', 2, 2, 159, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Invierno Del 92', 2, 2, 241, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('El Karaoke De Mi Noviecita', 2, 2, 262, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Me Hace Bien, Me Hace Mal', 2, 2, 235, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Pueblo Podrido', 2, 2, 152, '2006-10,23');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Autos Nuevos', 2, 2, 253, '2006-10,23');

INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Smells Like Teen Spirit', 3, 3, 301, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('In Bloom', 3, 3, 254, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Come as you are', 3, 3, 219, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Breed', 3, 3, 183, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Lithium', 3, 3, 257, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Polly', 3, 3, 177, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Territorial Pissings', 3, 3, 142, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Drain You', 3, 3, 223, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Lounge Act', 3, 3, 156, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Stay Away', 3, 3, 212, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('On A Plain', 3, 3, 196, '1991-09-24');
INSERT INTO CANCION (titulo, id_artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Something In The Way', 3, 3, 232, '1991-09-24');


CREATE TABLE CANCION_GENERO(

  id_cancion NUMBER REFERENCES CANCION(id_cancion),

  id_genero NUMBER REFERENCES GENERO(id_genero)

);


COMMIT;


--INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('31 mintos', 'S', 1);

--INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('Los bunkers', 'S', 1);