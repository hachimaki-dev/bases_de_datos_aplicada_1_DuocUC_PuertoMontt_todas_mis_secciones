--usuario, publicaciones, comentarios, me gusta, seguidores, historias, reels,
DROP TABLE USUARIO;
DROP TABLE PUBLICACIONES;
DROP TABLE COMENTARIOS;
DROP TABLE ME_GUSTA;
DROP TABLE SEGUIDORES;
DROP TABLE CHATS;
DROP TABLE PARTICIPANTES_CHAT;
DROP TABLE MENSAJES;
DROP TABLE BLOQUEOS;

CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(100) UNIQUE NOT NULL,
    correo_electronico VARCHAR2(100) UNIQUE NOT NULL,
    contraseña_usuario VARCHAR2(50) NOT NULL,
    nombre_completo VARCHAR2(100),
    biografia VARCHAR2(100),
    fecha_creacion DATE
);

CREATE TABLE PUBLICACIONES(
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    tipo_publicacion VARCHAR2(20) CHECK (tipo_publicacion IN ('POST', 'REEL', 'HISTORIA')),
    url_contenido VARCHAR2(255) NOT NULL,
    descripcion VARCHAR2(255),
    fecha_publicacion DATE DEFAULT SYSDATE,
    fecha_expiracion DATE
);

CREATE TABLE COMENTARIOS(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_publicacion NUMBER REFERENCES PUBLICACIONES(id_publicacion),
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    texto VARCHAR2(100),
    fecha_comentario DATE
);

CREATE TABLE ME_GUSTA(
    id_meGusta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    id_publicacion NUMBER REFERENCES PUBLICACIONES(id_publicacion),
    UNIQUE (id_usuario, id_publicacion)
);

CREATE TABLE SEGUIDORES(
    id_seguimiento NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_seguidor NUMBER REFERENCES USUARIO(id_usuario),
    id_seguido NUMBER REFERENCES USUARIO(id_usuario),
    es_mejor_amigo CHAR(1) DEFAULT 'N' CHECK (es_mejor_amigo IN ('S', 'N')),
    fecha_seguimiento DATE DEFAULT SYSDATE,
    UNIQUE (id_seguidor, id_seguido),
    CHECK (id_seguidor != id_seguido)
);

CREATE TABLE CHATS(
    id_chat NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    es_grupo CHAR(1) CHECK (es_grupo IN ('S', 'N')),
    nombre_grupo VARCHAR2(100),
    fecha_creacion DATE DEFAULT SYSDATE
);

CREATE TABLE PARTICIPANTES_CHAT(
    id_chat NUMBER REFERENCES CHATS(id_chat),
    id_usuario NUMBER REFERENCES USUARIO(id_usuario),
    fecha_ingreso DATE DEFAULT SYSDATE,
    PRIMARY KEY (id_chat, id_usuario)
);

CREATE TABLE MENSAJES(
    id_mensaje NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_chat NUMBER REFERENCES CHATS(id_chat),
    id_usuario_remitente NUMBER REFERENCES USUARIO(id_usuario),
    texto_mensaje VARCHAR2(500) NOT NULL,
    fecha_envio DATE DEFAULT SYSDATE
);

CREATE TABLE BLOQUEOS(
    id_bloqueo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario_bloqueador NUMBER REFERENCES USUARIO(id_usuario),
    id_usuario_bloqueado NUMBER REFERENCES USUARIO(id_usuario),
    fecha_bloqueo DATE DEFAULT SYSDATE,
    UNIQUE (id_usuario_bloqueador, id_usuario_bloqueado),
    CHECK (id_usuario_bloqueador != id_usuario_bloqueado) 
);

INSERT INTO USUARIO (nombre_usuario, correo_electronico, contraseña_usuario, nombre_completo, biografia) 
VALUES ('eve_vidal', 'evelin@email.com', 'pwd123', 'Evelin Vidal', 'ESTUDIANTE DUOC UC');

INSERT INTO USUARIO (nombre_usuario, correo_electronico, contraseña_usuario, nombre_completo, biografia) 
VALUES ('bot_spam', 'spam@email.com', 'bot000', 'Gana Dinero', 'Entra a mi link para ganar dinero fácil');

INSERT INTO PUBLICACIONES (id_usuario, tipo_publicacion, url_contenido, descripcion) 
VALUES (1, 'POST', 'https://servidor.com/img/bd_model.jpg', 'Terminando el modelo de datos para instagram');

INSERT INTO PUBLICACIONES (id_usuario, tipo_publicacion, url_contenido, descripcion) 
VALUES (1, 'REEL', 'https://servidor.com/vid/gym.mp4', 'BASE DE DATOS');

INSERT INTO PUBLICACIONES (id_usuario, tipo_publicacion, url_contenido, descripcion, fecha_expiracion) 
VALUES (1, 'HISTORIA', 'https://servidor.com/img/atun.jpg', 'caminando...', SYSDATE + 1);

INSERT INTO BLOQUEOS (id_usuario_bloqueador, id_usuario_bloqueado) VALUES (1, 2);
COMMIT; 