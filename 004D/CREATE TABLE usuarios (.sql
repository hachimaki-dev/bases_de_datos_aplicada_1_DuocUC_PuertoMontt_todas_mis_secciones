CREATE TABLE usuarios (
    usuarios_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(100) NOT NULL,
    gmail_usuario VARCHAR2(100) NOT NULL,
    contrasena VARCHAR2(250) NOT NULL,
    fecha_registro TIMESTAMP default CURRENT_TIMESTAMP NOT NULL
)

CREATE TABLE canales(
    canal_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuarios_id NUMBER NOT NULL UNIQUE,
    nombre_canal VARCHAR2(100),
    descripcion VARCHAR2(150),
    fecha_creacion TIMESTAMP default CURRENT_TIMESTAMP NOT NULL,
)
CREATE TABLE videos(

)
CREATE TABLE suscriptores(

)
CREATE TABLE comentarios(

)