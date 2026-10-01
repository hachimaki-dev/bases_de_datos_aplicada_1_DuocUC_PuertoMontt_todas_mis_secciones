CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(100) NOT NULL,
    apellido_usuario VARCHAR2 (100) NOT NULL,
    correo varchar2(50),
    fecha_nacimiento DATE,
    fecha_registro  DATE,
    contraseña VARCHAR2(100),
    genero VARCHAR(250)
); 

CREATE TABLE PUBLICACIONES(
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descripcion varchar(500),
    url_imagen VARCHAR2(300),
    url_video VARCHAR(300),
    fecha_publicacion DATE,
    id_usuario NUMBER (50) REFERENCES usuario(id_usuario)
);

CREATE TABLE COMENTARIOS(
    id_comentario NUMBER (50)GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    comentario VARCHAR (300),
    id_usuario NUMBER REFERENCES usuario(id_usuario),
    fecha_comentario DATE
    
    
);
CREATE TABLE LIKES(
    id_like NUMBER (50) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES usuario(id_usuario),
    fecha_like DATE, 
    id_publicacion NUMBER REFERENCES publiaciones(id_publicaciones)

);

CREATE TABLE SEGUIDORES(
    id_seguidor NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_seguidor VARCHAR2(100) NOT NULL,
    fecha_seguimiento DATE
     
    
);
CREATE TABLE MENSAJES(
    
);

CREATE TABLE HASTAGS(
    
);

CREATE TABLE PUBLICACION_HASTAG(

);

CREATE TABLE GUARDADOS(
    
);