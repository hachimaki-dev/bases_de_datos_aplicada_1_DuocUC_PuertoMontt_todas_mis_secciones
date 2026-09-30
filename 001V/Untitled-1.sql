



create table usuario(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre varchar2(100) not null,
    apellido_paterno varchar2 (100) not null,
    apellido_materno varchar2 (100) not null,
    gmail varchar2(100) not null,
    password varchar2(100) not null,
    nombre_usuario varchar2(100) not null unique,
    numero_telefono varchar2 (30),
    fecha_de_nacimiento date not null

);


create table publiciones(
    id_publicaciones NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES usuario(id_usuario),
    texto_publicaciones varchar2 (100) not null,
    ubicacion varchar2 (100) not null,
    fecha_de_publicacion date not null
);

create table seguidores(
    id_seguidores NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_seguidor NUMBER REFERENCES usuario(id_usuario),
    id_seguido NUMBER REFERENCES usuario(id_usuario)

);

create table mesajes(
    id_mensajes NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_seguidor NUMBER REFERENCES usuario(id_usuario),
    id_seguido NUMBER REFERENCES usuario(id_usuario),
    mesaje varchar2(100) not null,
    fecha_de_mensaje
);

