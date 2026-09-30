CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2 (50) NOT NULL,
    apellido_paterno VARCHAR2(50) NOT NULL,
    apellido_materno VARCHAR2(50) NOT NULL,
    gmail VARCHAR2(100) NOT NULL,
    numero_telefono VARCHAR2(20),
    fecha_nacimiento DATE NOT NULL,
    fecha_registro DATE NOT NULL,
    password VARCHAR2(50) NOT NULL
);

CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_creacion DATE

);
CREATE TABLE GENERO_VIDEO(
    id_genero_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
);

CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_canal number REFERENCES CANAL(id_canal),
    titulo VARCHAR (50),
    fecha_publicacion DATE,
    descripcion VARCHAR (200)
    duración_segundos NUMBER,
    numero_visitas NUMBER

);

CREATE TABLE VER_MAS_TARDE (
    id_ver_mas_tarde NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_video NUMBER REFERENCES VIDEO (id_video),

);

CREATE TABLE SUSCRIPTORES(
    id_suscripciones NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_canal NUMBER REFERENCES CANAL (id_canal)


);
CREATE TABLE COMENTARIOS(
    id_comentarios NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES COMENTARIOS(id_comentarios)

);
CREATE TABLE LIKE(
    id_like NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario)
    id_video NUMBER REFERENCES VIDEO (id_video)
);
