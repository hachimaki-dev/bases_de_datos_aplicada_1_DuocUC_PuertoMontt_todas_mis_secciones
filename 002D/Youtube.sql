DROP TABLE paises
DROP TABLE CORREO
DROP TABLE usuario
DROP TABLE videos
DROP TABLE historial

CREATE TABLE paises(
    id_paises NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE CORREO(
    id_correo number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    correo_nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE usuario(
    id_usuario number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) not NULL,
    esta_verificado CHAR(1),
    monetizacion CHAR(1),
    fecha_creacion DATE,
    musico CHAR(1),
    suscriptores NUMBER,
    id_paises NUMBER REFERENCES paises(id_paises),
    striike NUMBER
);

CREATE TABLE videos(
    id_videos number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100) not NULL,
    fecha_publicacion date, 
    descripcion VARCHAR2(100),
    shadowban CHAR(1),
    restriccion_edad CHAR(1) not NULL,
    id_usuario NUMBER REFERENCES usuario(id_usuario),
    duracion_segundos NUMBER not NULL
);



CREATE TABLE shorts(
    id_short number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100),
    id_usuario NUMBER REFERENCES usuario(id_usuario)
);


CREATE TABLE STREAM(
    id_directo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) not null,
    id_usuario NUMBER REFERENCES usuario(id_usuario)
);






























































CREATE TABLE historial(
    id_historial number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_videos  number REFERENCES videos(id_videos)
);