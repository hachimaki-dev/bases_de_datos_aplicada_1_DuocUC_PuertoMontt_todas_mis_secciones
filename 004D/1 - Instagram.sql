DROP TABLE USUARIO CASCADE CONSTRAINT;
DROP TABLE SEGUIDORES CASCADE CONSTRAINT;
DROP TABLE PUBLICACIONES CASCADE CONSTRAINT;
DROP TABLE HISTORIA CASCADE CONSTRAINT;
DROP TABLE REEL CASCADE CONSTRAINT;
DROP TABLE COMENTARIOS CASCADE CONSTRAINT;
DROP TABLE LIKES CASCADE CONSTRAINT;



CREATE TABLE USUARIO (
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(100) NOT NULL,
    correo VARCHAR2(200) NOT NULL,
    fecha_registro DATE

);

CREATE TABLE SEGUIDORES (
    id_seguidores NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL REFERENCES USUARIO(id_usuario),
    id_usuario_seguido NUMBER NOT NULL REFERENCES USUARIO(id_usuario)
);

CREATE TABLE PUBLICACIONES (
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL REFERENCES USUARIO(id_usuario),
    titulo VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    fecha_publicacion DATE
);

CREATE TABLE HISTORIA (
    id_historia NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL REFERENCES USUARIO(id_usuario),
    esMejoresAmigos CHAR(1),
    vistas NUMBER
);

CREATE TABLE REEL (
    id_reel NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL REFERENCES USUARIO(id_usuario),
    titulo VARCHAR2(50),
    descripcion VARCHAR2(100) NOT NULL,
    fecha_publicacion DATE,
    reproducciones NUMBER,
    audio_nombre VARCHAR2(100),
    duracion NUMBER NOT NULL
);

CREATE TABLE COMENTARIOS (
    id_comentarios NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL REFERENCES USUARIO(id_usuario),
    id_publicacion NUMBER NOT NULL REFERENCES PUBLICACIONES(id_publicacion),
    contenido VARCHAR2(50) NOT NULL
);

CREATE TABLE LIKES (
    id_likes NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_publicacion NUMBER NOT NULL REFERENCES PUBLICACIONES(id_publicacion)
);


INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('juan.perez', 'juan.perez@gmail.com', DATE '2026-01-10');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('maria.gonzalez', 'maria.gonzalez@gmail.com', DATE '2026-01-15');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('carlos.soto', 'carlos.soto@gmail.com', DATE '2026-02-01');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('ana.lopez', 'ana.lopez@gmail.com', DATE '2026-02-10');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('pedro.rojas', 'pedro.rojas@gmail.com', DATE '2026-02-20');
COMMIT;


INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (1, 2);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (1, 3);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (2, 1);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (2, 4);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (3, 1);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (4, 2);
INSERT INTO SEGUIDORES (id_usuario, id_usuario_seguido) VALUES (5, 1);
COMMIT;


INSERT INTO PUBLICACIONES (id_usuario, titulo, descripcion, fecha_publicacion) VALUES (1, 'Mi primer viaje', 'Un increíble viaje al sur de Chile', DATE '2026-03-01');
INSERT INTO PUBLICACIONES (id_usuario, titulo, descripcion, fecha_publicacion) VALUES (2, 'Día de playa', 'Disfrutando el verano con amigos', DATE '2026-03-05');
INSERT INTO PUBLICACIONES (id_usuario, titulo, descripcion, fecha_publicacion) VALUES (3, 'Nueva receta', 'Preparando una deliciosa pasta', DATE '2026-03-08');
INSERT INTO PUBLICACIONES (id_usuario, titulo, descripcion, fecha_publicacion) VALUES (4, 'Atardecer', 'Un hermoso atardecer desde mi casa', DATE '2026-03-10');
INSERT INTO PUBLICACIONES (id_usuario, titulo, descripcion, fecha_publicacion) VALUES (5, 'Fin de semana', 'Disfrutando el fin de semana', DATE '2026-03-12');
COMMIT;


INSERT INTO HISTORIA (id_usuario, esMejoresAmigos, vistas) VALUES (1, 'N', 125);
INSERT INTO HISTORIA (id_usuario, esMejoresAmigos, vistas) VALUES (2, 'S', 87);
INSERT INTO HISTORIA (id_usuario, esMejoresAmigos, vistas) VALUES (3, 'N', 240);
INSERT INTO HISTORIA (id_usuario, esMejoresAmigos, vistas) VALUES (4, 'S', 56);
INSERT INTO HISTORIA (id_usuario, esMejoresAmigos, vistas) VALUES (5, 'N', 312);
COMMIT;


INSERT INTO REEL (id_usuario, titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES (1, 'Mi viaje', 'Video de mi viaje al sur', DATE '2026-03-02', 1250, 'Summer Vibes', 30);
INSERT INTO REEL (id_usuario, titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES (2, 'Receta rápida', 'Una receta fácil y deliciosa', DATE '2026-03-06', 3450, 'Cooking Beat', 45);
INSERT INTO REEL (id_usuario, titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES (3, 'Pasta italiana', 'Preparando pasta desde cero', DATE '2026-03-09', 2180, 'Italian Music', 60);
INSERT INTO REEL (id_usuario, titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES (4, 'Atardecer', 'Un hermoso paisaje', DATE '2026-03-11', 980, 'Relaxing Music', 20);
COMMIT;


INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (2, 1, 'Qué hermoso lugar');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (3, 1, 'Me encanta ese paisaje');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (1, 2, 'Excelente foto');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (4, 2, 'Qué ganas de estar ahí');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (5, 3, 'Se ve delicioso');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (2, 4, 'Muy bonito');
INSERT INTO COMENTARIOS (id_usuario, id_publicacion, contenido) VALUES (3, 5, 'Buen panorama');
COMMIT;


INSERT INTO LIKES (id_publicacion) VALUES (1);
INSERT INTO LIKES (id_publicacion) VALUES (1);
INSERT INTO LIKES (id_publicacion) VALUES (1);
INSERT INTO LIKES (id_publicacion) VALUES (2);
INSERT INTO LIKES (id_publicacion) VALUES (2);
INSERT INTO LIKES (id_publicacion) VALUES (3);
INSERT INTO LIKES (id_publicacion) VALUES (3);
INSERT INTO LIKES (id_publicacion) VALUES (4);
INSERT INTO LIKES (id_publicacion) VALUES (5);
COMMIT;


SELECT * FROM USUARIO;
SELECT * FROM SEGUIDORES;
SELECT * FROM REEL;
SELECT * FROM HISTORIA;
SELECT * FROM PUBLICACIONES;
SELECT * FROM COMENTARIOS;
SELECT * FROM LIKES;


SELECT * FROM SEGUIDORES
JOIN USUARIO ON SEGUIDORES.ID_USUARIO = USUARIO.ID_USUARIO;

SELECT * FROM PUBLICACIONES
JOIN USUARIO ON PUBLICACIONES.ID_USUARIO = USUARIO.ID_USUARIO;

SELECT * FROM HISTORIA
JOIN USUARIO ON HISTOIRA.ID_USUARIO = USUARIO.ID_USUARIO;

SELECT * FROM REEL
JOIN USUARIO ON REEL.ID_USUARIO = USUARIO.ID_USUARIO;

SELECT * FROM COMENTARIOS
JOIN USUARIO ON COMENTARIOS.ID_COMENTARIOS = USUARIO.ID_USUARIO;

SELECT * FROM LIKES
JOIN PUBLICACIONES ON LIKES.ID_PUBLICACION = PUBLICACIONES.ID_PUBLICACION;

SELECT * FROM COMENTARIOS
JOIN PUBLICACIONES ON COMENTARIOS.ID_PUBLICACION = PUBLICACIONES.ID_PUBLICACION;