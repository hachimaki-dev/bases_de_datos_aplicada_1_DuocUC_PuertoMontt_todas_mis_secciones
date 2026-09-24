DROP TABLE CANCION_GENERO CASCADE CONSTRAINT;
DROP TABLE GENERO CASCADE CONSTRAINT;
DROP TABLE ARTISTA CASCADE CONSTRAINT;
DROP TABLE CANCION CASCADE CONSTRAINT;
DROP TABLE ALBUM CASCADE CONSTRAINT;
DROP TABLE PAIS CASCADE CONSTRAINT;

CREATE TABLE PAIS(
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_pais VARCHAR2(100) NOT NULL

);

    INSERT INTO PAIS(nombre) VALUES ('Perú');
    INSERT INTO PAIS(nombre) VALUES ('Colombia');
    INSERT INTO PAIS(nombre) VALUES ('México');
    INSERT INTO PAIS(nombre) VALUES ('Chile');
    INSERT INTO PAIS(nombre) VALUES ('Rusia');
    

CREATE TABLE ALBUM(
    id_album NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_album VARCHAR2(100) NOT NULL,
    fecha_lanzamiento DATE
);

    INSERT INTO CANCION(nombre, fecha_lanzamiento) VALUES ('Brutal Fantasies', '2026-1-16'); 
    INSERT INTO CANCION(nombre, fecha_lanzamiento) VALUES ("Rotten in Loneliness", '2024-4-19'); 
    INSERT INTO CANCION(nombre, fecha_lanzamiento) VALUES ("Dehimanizing Loneliness", '2023-10-12'); 
    INSERT INTO CANCION(nombre, fecha_lanzamiento) VALUES ("Ma'am your son is dead", '2024-10-27'); 


CREATE TABLE CANCION(
    id_cancion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(200) NOT NULL,
    id_Artista NUMBER REFERENCES ARTISTA(id_Artista),
    id_album NUMBER REFERENCES ALBUM(id_album),
    duracion_segundos NUMBER NOT NULL,
    fecha_lanzamiento DATE
);

    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Violence', ''); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Parasites'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Absolute Hatred'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Alienated'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('The Mirror Man'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Time Bomb'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Plague'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('In my Mind'); 
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Paralyzed');
    INSERT INTO CANCION(titulo, id_Artista, id_album, duracion_segundos, fecha_lanzamiento) VALUES ('Aftermath'); 


CREATE TABLE ARTISTA(
    id_Artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    esta_vereficado CHAR(1),
    id_pais NUMBER REFERENCES PAIS(id_pais)

);

    INSERT INTO ARTISTA(nombre, esta_vereficado, ) VALUES ('');



CREATE TABLE GENERO(
    id_genero NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_genero VARCHAR2(50) NOT NULL
);

CREATE TABLE CANCION_GENERO(
    id_cancion NUMBER REFERENCES CANCION(id_cancion),
    id_genero NUMBER REFERENCES GENERO(id_genero)
);

