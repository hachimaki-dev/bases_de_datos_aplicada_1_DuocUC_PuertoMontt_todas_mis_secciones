DROP TABLE CANCION CASCADE CONSTRAINTS;
DROP TABLE ARTISTA CASCADE CONSTRAINTS;


CREATE TABLE ARTISTA(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_verificado CHAR(1),
    nacionalidad VARCHAR2(100),
    id_album REFERENCES ALBUM(id)
);

--Esto esta en 1FN
CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200),
    id_artista NUMBER REFERENCES ARTISTA(id),
    id_album REFERENCES ALBUM(id),
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE
);

CREATE TABLE ALBUM(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100)
    
);

CREATE TABLE GENERO(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50)
);


INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Bunkers', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Pink Floyd', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Eric Clapton', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BB King', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('David Gilmoure', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Slash', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Guns and Roses', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Iron Maiden', 'S', 'EE.UU');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bruno Mars', 'S', 'Ingles');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Bad Bunny', 'S', 'Puerto riqueño');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Kid Voodo', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('31 minutos', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('BKN', 'S', 'Chilena');
INSERT INTO ARTISTA(nombre, esta_verificado, nacionalidad) VALUES('Los Pulentos', 'S', 'Chilena');

COMMIT;

SELECT * FROM ARTISTA;

INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('No me hables de sufrir', 1 , 200, DATE '2003-09-01')
INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('La exiliada del sur', 1, 240, DATE '2003-09-01')
INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('Mientele', 1, 186, DATE '2005-09-08')
INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('Confortubly Num', 5, 600, DATE '1999-12-03' )
INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('The Wall', 5, 420, DATE '1999-12-03' )
INSERT INTO CANCION(titulo, id_artista, duracion_segundos, fecha_lanzamiento) VALUES ('La señora interesante', 12, 190, DATE '2004-08-15');
INSERT INTO CANCION(titulo, id_artista, album, genero, duracion_segundos, fecha_lanzamiento) VALUES ('Ratoncitos', 12, 'Ratoncitos', 'Opera Rock', 260, DATE '2005-07-01');

COMMIT;

SELECT * FROM CANCION;
SELECT * FROM ARTISTA;


SELECT * FROM CANCION 
JOIN ARTISTA ON CANCION.id_artista = ARTISTA.id;

SELECT * FROM CANCION c
JOIN ARTISTA a ON c.id_artista = a.id;

SELECT c.titulo, a.nombre, a.nacionalidad FROM CANCION c
JOIN ARTISTA a ON c.id_artista = a.id;


SELECT * FROM CANCION JOIN ARTISTA ON CANCION.id_artista = ARTISTA.id;


SELECT * FROM CANCION c JOIN ARTISTA  a ON c.id_artista = a.id;


SELECT a.NOMBRE, c.TITULO FROM CANCION c JOIN ARTISTA  a ON c.id_artista = a.id;


SELECT * FROM 