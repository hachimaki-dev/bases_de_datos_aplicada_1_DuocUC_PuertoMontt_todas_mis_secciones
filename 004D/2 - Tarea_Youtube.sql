-- Videos, usuarios, suscripcion, canales, comentarios, play_list, miembros, shorts, e_vivo, publicacion, membresia, facturacion,
CREATE TABLE CANAL


CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_canal,
    titulo VARCHAR2(100),
    fecha_lanzamiento DATE,
    like NUMBER,
    dislike NUMBER,
    me_gusta_activados CHAR(1),
    comentario_activados CHAR(1),
    duracion_segundos NUMBER
);

CREATE TABLE COMENTARIO(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    contenido VARCHAR2(100),
    me_gusta NUMBER,
    fecha_publicacion DATE,
    id_video
);