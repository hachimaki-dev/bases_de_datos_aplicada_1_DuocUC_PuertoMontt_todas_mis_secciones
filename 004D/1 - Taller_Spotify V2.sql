-- 1. ELIMINACIÓN DE TABLAS
DROP TABLE CANCION CASCADE CONSTRAINTS;
DROP TABLE ARTISTA CASCADE CONSTRAINTS;
DROP TABLE ALBUM CASCADE CONSTRAINTS;
DROP TABLE GENERO CASCADE CONSTRAINTS;

-- 2. CREACIÓN DE TABLAS
CREATE TABLE ARTISTA(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_artista VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    nacionalidad VARCHAR2(100)
);

CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_album VARCHAR2(100) NOT NULL
);

CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_genero VARCHAR2(100) NOT NULL
);

CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id_artista),
    id_album NUMBER REFERENCES ALBUM(id_album),
    id_genero NUMBER REFERENCES GENERO(id_genero),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

-- 3. INSERCIÓN DE DATOS
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Los Bunkers', 's', 'Chilena');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Pink Floyd', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Eric Clapton', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('BB King', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('David Gilmoure', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Slash', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Guns and Roses', 's', 'EE.UU');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Iron Maiden', 's', 'Ingles');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Bruno Mars', 's', 'Puerto riqueño');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Bad Bunny', 's', 'Chilena');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Kid Voodo', 's', 'Chilena');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('31 minutos', 's', 'Chilena');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('BKN', 's', 'Chilena');
INSERT INTO ARTISTA(nombre_artista, esta_verificado, nacionalidad) VALUES('Los Pulentos', 's', 'Chilena');

INSERT INTO ALBUM(nombre_album) VALUES('La culpa');
INSERT INTO ALBUM(nombre_album) VALUES('Vida de perros');
INSERT INTO ALBUM(nombre_album) VALUES('The Wall');
INSERT INTO ALBUM(nombre_album) VALUES('31 Canciones de Amor y una Canción de Guaripolo');
INSERT INTO ALBUM(nombre_album) VALUES('Ratoncitos');

INSERT INTO GENERO(nombre_genero) VALUES('Rock');
INSERT INTO GENERO(nombre_genero) VALUES('Rock latino');
INSERT INTO GENERO(nombre_genero) VALUES('Opera Rock');

COMMIT;

INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1 , 1, 2, 200, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 1, 2, 240, DATE '2003-09-01');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 2, 2, 186, DATE '2005-09-08');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Confortubly Num', 5, 3, 1, 600, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('The Wall', 5, 3, 1, 420, DATE '1999-12-03');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('La señora interesante', 12, 4, 1, 190, DATE '2004-08-15');
INSERT INTO CANCION(titulo, id_artista, id_album, id_genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 5, 3, 260, DATE '2005-07-01');

COMMIT;

-- 4. CONSULTAS Y JOINS
SELECT * FROM ARTISTA;
SELECT * FROM ALBUM;
SELECT * FROM GENERO;
SELECT * FROM CANCION;

-- JOIN simple entre CANCION y ARTISTA
SELECT * 
FROM CANCION c 
JOIN ARTISTA a ON c.id_artista = a.id_artista;

-- Consulta con columnas específicas
SELECT c.titulo, c.id_genero, a.nombre_artista, a.nacionalidad 
FROM CANCION c 
JOIN ARTISTA a ON c.id_artista = a.id_artista;

-- JOIN completo relacionando las 4 tablas
SELECT c.titulo, ar.nombre_artista, al.nombre_album, g.nombre_genero 
FROM CANCION c
JOIN ARTISTA ar ON c.id_artista = ar.id_artista
JOIN ALBUM al   ON c.id_album = al.id_album
JOIN GENERO g   ON c.id_genero = g.id_genero;