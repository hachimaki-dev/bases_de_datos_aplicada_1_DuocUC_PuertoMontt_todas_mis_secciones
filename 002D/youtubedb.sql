DROP TABLE pais CASCADE CONSTRAINTS;
DROP TABLE usuarios CASCADE CONSTRAINTS;
DROP TABLE canales CASCADE CONSTRAINTS;
DROP TABLE videos CASCADE CONSTRAINTS;
DROP TABLE streamings CASCADE CONSTRAINTS;
DROP TABLE publicaciones CASCADE CONSTRAINTS;
DROP TABLE comentarios CASCADE CONSTRAINTS;
DROP TABLE suscripciones CASCADE CONSTRAINTS;
DROP TABLE likes CASCADE CONSTRAINTS;

CREATE TABLE pais (
    id_pais NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE usuarios(
    id_usuarios NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(200) NOT NULL UNIQUE, -- @, aparece en el url del usuario
    nombre_display VARCHAR2(200), -- nombre que se muestra en el canal
    url_foto_perfil VARCHAR2(200),
    id_pais NUMBER REFERENCES pais(id_pais) NOT NULL,
    fecha_creacion DATE NOT NULL,
    descripcion VARCHAR2(1000)
);

CREATE TABLE canales (
    id_usuarios NUMBER REFERENCES usuarios(id_usuarios)
);

CREATE TABLE videos (
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    url_video VARCHAR2(200) NOT NULL,
    url_miniatura VARCHAR2(200),
    titulo VARCHAR2(200) NOT NULL,
    descripcion VARCHAR2(4000),
    fecha_publicacion DATE NOT NULL,
    canales_id NUMBER REFERENCES canales(id_usuarios) NOT NULL,
    es_short CHAR(1)
);

CREATE TABLE streamings (
    id_stream NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    url_stream VARCHAR2(200) NOT NULL,
    url_miniatura VARCHAR2(200),
    titulo VARCHAR2(200) NOT NULL,
    descripcion VARCHAR2(4000),
    fecha_hora_inicio TIMESTAMP NOT NULL,
    canales_id NUMBER REFERENCES canales(id_usuarios) NOT NULL
);

CREATE TABLE publicaciones (
    id_publicaciones NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    url VARCHAR2(200) NOT NULL,
    canales_id NUMBER REFERENCES canales(id_usuarios) NOT NULL,
    texto VARCHAR2(4000) NOT NULL,
    url_embed VARCHAR2(200)
);

CREATE TABLE comentarios (
    id_usuarios NUMBER REFERENCES usuarios(id_usuarios) NOT NULL,
    id_video NUMBER REFERENCES videos(id_video) NOT NULL,
    texto VARCHAR2(4000) NOT NULL,
    fecha_hora_publicacion TIMESTAMP NOT NULL
);

CREATE TABLE suscripciones (
    id_usuarios NUMBER REFERENCES usuarios(id_usuarios) NOT NULL,
    id_canales NUMBER REFERENCES canales(id_usuarios) NOT NULL
);