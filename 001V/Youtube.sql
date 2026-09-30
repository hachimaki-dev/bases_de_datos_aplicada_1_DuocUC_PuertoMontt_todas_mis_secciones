CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    password VARCHAR2(250) NOT NULL,
    fecha_creacion DATE
);
CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(250),
    fecha_creacion DATE
);
CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2 NOT NULL,
    duracion_segundos NUMBER,
    fecha_lanzamiento DATE,
    id_canal REFERENCES CANAL(id_canal),
    url_video VARCHAR2(250)
);
CREATE TABLE SUBSCRIPTOR(
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    id_canal NUMBER REFERENCES CANAL(id_canal)
);
