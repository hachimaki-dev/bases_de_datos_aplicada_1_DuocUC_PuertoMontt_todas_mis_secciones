DROP TABLE nombrecito CASCADE CONSTRAINTS; --Por si acaso cmo plantilla, obvio

-- FUERTOTOTOTOTOTOTOTOTOTOOTOTAS (creo :P)
CREATE TABLE TIPO_CUENTA(
    id_type_account NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type_acc VARCHAR(1) NOT NULL UNIQUE
);
CREATE TABLE EMPRESAS(
    id_empresa NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_empresa VARCHAR2(200) NOT NULL UNIQUE
);
CREATE TABLE CATEGORIAS(
    id_category NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_categoria VARCHAR2(200) NOT NULL UNIQUE
);
CREATE TABLE PANTALLA(
    id_pantalla NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_pantalla VARCHAR2(100) NOT NULL UNIQUE     -- Modo teatro, pantalla main, mini pantallita petit
);

-- Debiles iuk (creox2)
CREATE TABLE VIDEOS(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_video VARCHAR2(250) NOT NULL,
    id_canal NUMBER REFERENCES CANALES(id_channel),
    fecha_publicacion DATE,
    visualizaciones NUMBER NOT NULL,
    portada VARCHAR2(255) NOT NULL,
    duracion_segundos NUMBER NOT NULL UNIQUE,
    cantidad_capitulos NUMBER

    );

CREATE TABLE COMENTARIOS(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_user NUMBER REFERENCES USUARIOS(id_user),
    comentario_vio BLOB,
    fecha_publicacion DATE NOT NULL
);
CREATE TABLE USUARIOS(
    id_user NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_user VARCHAR2(250) NOT NULL UNIQUE,
    correo_usuario VARCHAR2(200),
    pfp VARCHAR2(255),
    id_type_account NUMBER REFERENCES TIPO_CUENTA(id_type_account)
);
CREATE TABLE CANALES(
    id_channel NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_canal VARCHAR2(200) NOT NULL UNIQUE,
    verificacion CHAR(1) NOT NULL UNIQUE
);

CREATE TABLE CANALES_USUARIOS(  --Suscripciones
    id_channel NUMBER REFERENCES CANALES(id_channel),
    id_user NUMBER REFERENCES USUARIOS(id_user)
);

CREATE TABLE ANUNCIOS(
    id_anuncio NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     --faltan cositas
    id_empresa NUMBER REFERENCES EMPRESAS(id_empresa),
    descripcion VARCHAR2(255)
);

CREATE TABLE PLAYLISTS(
    id_playlist NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,    -- no di pa mas
    nombre_playlist VARCHAR2(100) NOT NULL UNIQUE,
    id_user NUMBER REFERENCES USUARIOS(id_user),
    fecha_creacion DATE
);