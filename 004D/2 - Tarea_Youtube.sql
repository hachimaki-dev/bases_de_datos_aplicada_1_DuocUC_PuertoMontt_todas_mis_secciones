-- Videos, usuarios, suscripcion, canales, comentarios, play_list, miembros, shorts, e_vivo, publicacion, membresia, facturacion,
CREATE TABLE CUENTA(
    id_cuenta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(50),
    correo_asociado VARCHAR2(200),
    fecha_creacion DATE
    -- listas de reproduccion
);
CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cuenta NUMBER REFERENCES CUENTA(id_cuenta)
    -- nombre_identificador, publicaciones, videos, suscriptores
);

CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_canal,
    titulo VARCHAR2(50),
    fecha_lanzamiento DATE,
    like NUMBER,
    dislike NUMBER,
    me_gusta_activados CHAR(1),
    comentario_activados CHAR(1),
    duracion_segundos NUMBER
);

CREATE TABLE COMENTARIO(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    contenido VARCHAR2(2000),
    me_gusta NUMBER,
    fecha_publicacion DATE,
    id_video
);