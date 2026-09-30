-- Videos, usuarios, suscripcion, canales, comentarios, play_list, miembros, shorts, e_vivo, publicacion, membresia, facturacion,
-- MIEMBROS, MEMBRESIA, FACTURACION

DROP TABLE CUENTA CASCADE CONSTRAINTS;
DROP TABLE CANAL CASCADE CONSTRAINTS;
DROP TABLE VISIBILIDAD CASCADE CONSTRAINTS;
DROP TABLE LISTA_REPRODUCCION CASCADE CONSTRAINTS;
DROP TABLE CONTENIDO_CANAL CASCADE CONSTRAINTS;
DROP TABLE PUBLICACION CASCADE CONSTRAINTS;
DROP TABLE VIDEO CASCADE CONSTRAINTS;
DROP TABLE LISTA_REPRODUCCION_VIDEO CASCADE CONSTRAINTS;
DROP TABLE COMENTARIO CASCADE CONSTRAINTS;

-- CREATE TABLE MIEMBRO(
 --   id_miembro NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
--);


CREATE TABLE CUENTA(
    id_cuenta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50),
    correo_asociado VARCHAR2(200),
    fecha_creacion DATE
);

CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cuenta NUMBER REFERENCES CUENTA(id_cuenta),
    nombre_identificador VARCHAR2(100),
    num_suscriptores NUMBER,
    descripcion VARCHAR2(250)
);

CREATE TABLE VISIBILIDAD(
    id_visibilidad NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo VARCHAR2(20)
);

CREATE TABLE LISTA_REPRODUCCION(
    id_lista_reproduccion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cuenta NUMBER REFERENCES CUENTA(id_cuenta),
    nombre VARCHAR2(100),
    descripcion VARCHAR2(250),
    id_visibilidad NUMBER REFERENCES VISIBILIDAD(id_visibilidad)
);

CREATE TABLE CONTENIDO_CANAL(
    id_contenido_canal,
    id_canal NUMBER REFERENCES CANAL(id_canal),
    fecha_lanzamiento DATE,
    like NUMBER,
    dislike NUMBER,
    comentario_activados CHAR(1),
    id_visibilidad NUMBER REFERENCES VISIBILIDAD(id_visibilidad)
);

CREATE TABLE PUBLICACION(
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_contenido_canal NUMBER REFERENCES CONTENIDO_CANAL(id_contenido_canal),
    texto VARCHAR2(250),
    url_imagen VARCHAR2(250),
    id_visibilidad NUMBER REFERENCES VISIBILIDAD(id_visibilidad)
);

CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_contenido_canal REFERENCES CONTENIDO_CANAL(id_contenido_canal),
    titulo VARCHAR2(50),
    descripcion VARCHAR2(250),
    me_gusta_activados CHAR(1),
    duracion_segundos NUMBER,
    url_video VARCHAR2(250),
    es_short CHAR(1),
    en_vivo CHAR(1)
);

CREATE TABLE LISTA_REPRODUCCION_VIDEO(
    id_video REFERENCES VIDEO(id_video),
    id_lista_reproduccion REFERENCES LISTA_REPRODUCCION(id_lista_reproduccion)
);

CREATE TABLE COMENTARIO(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    texto VARCHAR2(250),
    me_gusta NUMBER,
    fecha_publicacion DATE,
    id_contenido_canal NUMBER REFERENCES VIDEO(id_contenido_canal)
);