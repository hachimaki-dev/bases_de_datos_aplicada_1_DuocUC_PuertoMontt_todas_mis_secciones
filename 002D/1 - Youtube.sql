CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(50) NOT NULL UNIQUE,
    Correo VARCHAR2(100) NOT NULL,
    fecha_de_nacimiento DATE,
    contraseña VARCHAR2(100)
);


CREATE TABLE CANAL(
    id_de_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_canal VARCHAR2(50) NOT NULL,
    fecha_de_creacion DATE,
    id_de_video NUMBER REFERENCES VIDEO(id_de_video),
    id_suscriptores NUMBER REFERENCES SUSCIPTORES(id_suscriptores)
);

CREATE TABLE VIDEO(
    id_de_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    duracion_segundos NUMBER NOT NULL,
    nombre_de_video VARCHAR2(100) NOT NULL,
    fecha_de_publicacion DATE NOT NULL,
    id_like NUMBER REFERENCES LIKES(id_like),
    id_deslikes NUMBER REFERENCES DESLIKES(id_deslike),
    id_de_reproduccion NUMBER REFERENCES REPRODUCCIONES(id_de_reproduccion),
    id_de_campanita NUMBER REFERENCES CAMPANITA(id_de_campanita),
    video_publico CHAR(1)
);

CREATE TABLE LIKES(
    id_like NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cantidad_de_likes NUMBER NOT NULL,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario)
);

CREATE TABLE DESLIKES(
    id_deslike NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cantidad_de_deslikes NUMBER,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario)
);

CREATE TABLE SUSCIPTORES(
    id_suscriptores NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_de_canal NUMBER REFERENCES CANAL(id_de_canal)
    id_usuario NUMBER REFERENCES USUARIO(id_usuario)
);

CREATE TABLE REPRODUCCIONES(
    id_de_reproduccion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    id_de_video NUMBER REFERENCES VIDEO(id_de_video)
);


CREATE TABLE CAMPANITA(
    id_de_campanita NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    activo_campanita CHAR(1),
    id_de_usuario NUMBER REFERENCES USUARIO(id_usuario)
);






