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
    correo VARCHAR2(200) NOT NULL UNIQUE,
    fecha_registro TIMESTAMP
);

CREATE TABLE SEGUIDORES (
    id_seguidores NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    id_usuario_seguido NUMBER REFERENCES USUARIO(id_usuario)
);

CREATE TABLE PUBLICACIONES (
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    titulo VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    fecha_publicacion TIMESTAMP
);

CREATE TABLE HISTORIA (
    id_historia NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    esMejoresAmigos CHAR(1),
    vistas NUMBER
);

CREATE TABLE REEL (
    id_reel NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    titulo VARCHAR2(50),
    descripcion VARCHAR2(100) NOT NULL,
    fecha_publicacion TIMESTAMP,
    reproducciones NUMBER,
    audio_nombre VARCHAR2(100),
    duracion NUMBER NOT NULL
);

CREATE TABLE COMENTARIOS (
    id_comentarios NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    id_publicacion NUMBER REFERENCES PUBLICACIONES(id_publicacion),
    contenido VARCHAR2(50) NOT NULL
);

CREATE TABLE LIKES (
    id_likes NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_publicacion NUMBER NOT NULL REFERENCES PUBLICACIONES(id_publicacion)
);


INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('juan.perez', 'juan.perez@gmail.com', TIMESTAMP '2026-01-10 00:00:00');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('maria.gonzalez','maria.gonzalez@gmail.com', TIMESTAMP '2026-01-15 00:00:00');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('carlos.soto','carlos.soto@gmail.com', TIMESTAMP '2026-02-01 00:00:00');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('ana.lopez','ana.lopez@gmail.com', TIMESTAMP '2026-02-10 00:00:00');
INSERT INTO USUARIO (nombre_usuario, correo, fecha_registro) VALUES ('pedro.rojas','pedro.rojas@gmail.com', TIMESTAMP '2026-02-20 00:00:00');
COMMIT;


INSERT INTO PUBLICACIONES (titulo, descripcion, fecha_publicacion) VALUES ('Mi primer viaje', 'Un increíble viaje al sur de Chile', TIMESTAMP '2026-03-01 00:00:00');
INSERT INTO PUBLICACIONES (titulo, descripcion, fecha_publicacion) VALUES ('Día de playa', 'Disfrutando el verano con amigos', TIMESTAMP '2026-03-05 00:00:00');
INSERT INTO PUBLICACIONES (titulo, descripcion, fecha_publicacion) VALUES ('Nueva receta', 'Preparando una deliciosa pasta', TIMESTAMP '2026-03-08 00:00:00');
INSERT INTO PUBLICACIONES (titulo, descripcion, fecha_publicacion) VALUES ('Atardecer', 'Un hermoso atardecer desde mi casa', TIMESTAMP '2026-03-10 00:00:00');
INSERT INTO PUBLICACIONES (titulo, descripcion, fecha_publicacion) VALUES ('Fin de semana', 'Disfrutando el fin de semana', TIMESTAMP '2026-03-12 00:00:00');
COMMIT;

INSERT INTO HISTORIA (esMejoresAmigos, vistas) VALUES ('N', 125);
INSERT INTO HISTORIA (esMejoresAmigos, vistas) VALUES ('S', 87);
INSERT INTO HISTORIA (esMejoresAmigos, vistas) VALUES ('N', 240);
INSERT INTO HISTORIA (esMejoresAmigos, vistas) VALUES ('S', 56);
INSERT INTO HISTORIA (esMejoresAmigos, vistas) VALUES ('N', 312);
COMMIT;


INSERT INTO REEL (titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES ('Mi viaje', 'Video de mi viaje al sur', TIMESTAMP '2026-03-02 00:00:00', 1250, 'Summer Vibes', 30);
INSERT INTO REEL (titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES ('Receta rápida', 'Una receta fácil y deliciosa', TIMESTAMP '2026-03-06 00:00:00', 3450, 'Cooking Beat', 45);
INSERT INTO REEL (titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES ('Pasta italiana', 'Preparando pasta desde cero', TIMESTAMP '2026-03-09 00:00:00', 2180, 'Italian Music', 60);
INSERT INTO REEL (titulo, descripcion, fecha_publicacion, reproducciones, audio_nombre, duracion) VALUES ('Atardecer', 'Un hermoso paisaje', TIMESTAMP '2026-03-11 00:00:00', 980, 'Relaxing Music', 20);
COMMIT;


INSERT INTO COMENTARIOS (contenido) VALUES ('Qué hermoso lugar');
INSERT INTO COMENTARIOS (contenido) VALUES ('Me encanta ese paisaje');
INSERT INTO COMENTARIOS (contenido) VALUES ('Excelente foto');
INSERT INTO COMENTARIOS (contenido) VALUES ('Qué ganas de estar ahí');
INSERT INTO COMENTARIOS (contenido) VALUES ('Se ve delicioso');
INSERT INTO COMENTARIOS (contenido) VALUES ('Muy bonito');
INSERT INTO COMENTARIOS (contenido) VALUES ('Buen panorama');
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