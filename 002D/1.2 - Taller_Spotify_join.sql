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

--INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('31 mintos', 'S', 1);
--INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('Los bunkers', 'S', 1);

--insertar paises
INSERT INTO PAIS(nombre) VALUES ('Chile');
INSERT INTO PAIS(nombre) VALUES ('EE.UU');
INSERT INTO PAIS(nombre) VALUES ('Argentina');
INSERT INTO PAIS(nombre) VALUES ('Venezuela');
INSERT INTO PAIS(nombre) VALUES ('Chile');
INSERT INTO PAIS(nombre) VALUES ('Venezuela');
INSERT INTO PAIS(nombre) VALUES ('Perú');
COMMIT;

--Insertamos un par de albums
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Pateando Piedras', DATE '1986-09-15' );
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES('Fuerza Natural', DATE '2009-09-01');
INSERT INTO ALBUM(nombre, fecha_lanzamiento) VALUES ('Duelo de Gigantes', DATE '2007-01-01');
COMMIT;

--Artistas
INSERT INTO GENERO(nombre) VALUES ('Rock');
INSERT INTO GENERO(nombre) VALUES ('Pop');
INSERT INTO GENERO(nombre) VALUES ('Metal');
INSERT INTO GENERO(nombre) VALUES ('Andina');
INSERT INTO GENERO(nombre) VALUES ('K-pop');
INSERT INTO GENERO(nombre) VALUES ('Hardcore');
INSERT INTO GENERO(nombre) VALUES ('Nu Metal');
INSERT INTO GENERO(nombre) VALUES ('Doom Metal');
INSERT INTO GENERO(nombre) VALUES ('Trash Metal');
INSERT INTO GENERO(nombre) VALUES ('Hip-Hop');
INSERT INTO GENERO(nombre) VALUES ('Rap');
INSERT INTO GENERO(nombre) VALUES ('J-rock');
COMMIT;

--Artsita
INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('Los Prisioneros', 'S', 1);
INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('Gustavo Cerati', 'S', 3);
INSERT INTO ARTISTA(nombre, esta_verificado, id_pais) VALUES ('La Tigresa del Oriente', 'S', 7);
COMMIT;

--Cancionnes
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('Muevan las industrias', 1, 1, 320);
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('¿Por qué no se van?', 1, 1, 456);
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('Estar solo', 1, 1, 245);
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('¿Por qué los ricos?', 1, 1 , 412);
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('Convoy', 2, 2 , 458);
INSERT INTO CANCION(titulo, id_artista, id_album, duracion_segundos ) VALUES ('Nuevo amanecer', 3, 3 , 200);
COMMIT;

--Pivote de genero con canciones
INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES (1, 1);
INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES (1, 2);
INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES (5, 1);
INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES (6, 2);
INSERT INTO CANCION_GENERO(id_cancion, id_genero) VALUES (6, 4);
COMMIT;

--Objetivo, hacer que el '1' del album no sea un nùmero, sino su nombre
SELECT TITULO,ID_ALBUM FROM CANCION;

SELECT * FROM ALBUM;

--Construir la interseccion

SELECT * FROM CANCION 
JOIN ALBUM ON CANCION.ID_ALBUM = ALBUM.ID_ALBUM;

