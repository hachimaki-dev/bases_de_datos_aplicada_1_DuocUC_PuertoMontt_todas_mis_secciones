CREATE TABLE Usuario (
    id_usuario NUMBER PRIMARY KEY,
    nombre_usuario VARCHAR2(50) NOT NULL,
    nombre_completo VARCHAR2(100),
    correo VARCHAR2(100) UNIQUE,
    fecha_registro DATE DEFAULT SYSDATE

);CREATE TABLE Publicacion (
    id_publicacion NUMBER PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    descripcion VARCHAR2(500),
    fecha_publicacion DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)


);CREATE TABLE Seguidores (
    id_seguidor NUMBER,
    id_seguido NUMBER,
    fecha_seguimiento DATE DEFAULT SYSDATE,
    PRIMARY KEY (id_seguidor, id_seguido),
    FOREIGN KEY (id_seguidor) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_seguido) REFERENCES Usuario(id_usuario)


);CREATE TABLE Comentario (
    id_comentario NUMBER PRIMARY KEY,
    id_publicacion NUMBER NOT NULL,
    id_usuario NUMBER NOT NULL,
    texto VARCHAR2(300) NOT NULL,
    fecha_comentario DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
    
);CREATE TABLE Like_Publicacion (
    id_usuario NUMBER,
    id_publicacion NUMBER,
    fecha_like DATE DEFAULT SYSDATE,
    PRIMARY KEY (id_usuario, id_publicacion),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
);