DROP TABLE Canciones_genero CASCADE CONSTRAINT;
DROP TABLE Canciones;
DROP TABLE artista;
DROP TABLE genero;
DROP TABLE album;
DROP TABLE pais;

CREATE TABLE pais(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2 (100) NOT NULL
);
CREATE TABLE album(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2 (100) NOT NULL,
    fecha_lanzamiento DATE 
);
CREATE TABLE genero(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);

CREATE TABLE artista(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2 (100) NOT NULL,
    esta_verificado CHAR(1),
    id_de_pais NUMBER REFERENCES pais(id_pais) 
);
CREATE TABLE Canciones(
id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
titulo VARCHAR2 (200) NOT NULL,
id_artista NUMBER REFERENCES artista(id_artista),
id_album NUMBER REFERENCES album(id_album),
duracion_segundos NUMBER NOT NULL,
fecha_lanzamiento DATE

);

CREATE TABLE Canciones_genero(
    id_cancion NUMBER REFERENCES Canciones (id_cancion),
    id_genero NUMBER REFERENCES genero(id_genero)
);
INSERT INTO pais(nombre) VALUES('chile');
INSERT INTO album(nombre, fecha_lanzamiento) VALUES('Thriller', DATE '1982-11-29');
INSERT INTO genero(nombre) VALUES('Pop');
INSERT INTO artista(nombre, esta_verificado, id_de_pais) VALUES('Michael Jackson','S',1);
INSERT INTO Canciones(titulo, duracion_segundos, fecha_lanzamiento) VALUES('Bad', 360 , DATE '1987-10-20');
COMMIT;



