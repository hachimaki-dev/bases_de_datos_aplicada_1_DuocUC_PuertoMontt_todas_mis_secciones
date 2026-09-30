CREATE TABLE USUARIO(
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE canales(
    canal_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) on DELETE CASCADE


);

CREATE TABLE VIDEOS(
    video_id SERIAL PRIMARY KEY,
    id_usuario SERIAL PRIMARY KEY,
    nombre_video VARCHAR(50) NOT NULL,
    descripcion

    

);