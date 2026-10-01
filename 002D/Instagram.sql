


CREATE TABLE pais(
    id_pais             NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2(30) NOT NULL UNIQUE
);

CREATE TABLE usuario(
    id_usuario          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario      VARCHAR2(30) NOT NULL,
    verificado          CHAR(1),
    id_pais             NUMBER REFERENCES pais(id_pais)

);

CREATE TABLE tipo_publicacion(
    id_tipo_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre              VARCHAR2(40) NOT NULL UNIQUE
);


CREATE TABLE publicacion(
    id_publicacion      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario          NUMBER REFERENCES usuario(id_usuario),
    id_tipo_publicacion NUMBER REFERENCES tipo_publicacion(id_tipo_publicacion),
    descripción         VARCHAR2(150),
    fecha_publicacion   DATE

);

CREATE TABLE comentario(
    id_comentario       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_publicacion      NUMBER REFERENCES publicacion(id_publicacion),
    id_usuario          NUMBER REFERENCES usuario(id_usuario)
);




