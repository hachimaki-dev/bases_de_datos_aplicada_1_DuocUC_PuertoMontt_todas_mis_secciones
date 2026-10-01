CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    contrasenia VARCHAR(100) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pais_origen VARCHAR(2) NOT NULL
);

CREATE TABLE canales (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    identificador VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE categorias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE videos (
    id SERIAL PRIMARY KEY,
    canal_id INT NOT NULL,
    categoria_id INT,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos >0),
    url_archivo VARCHAR(255) NOT NULL,
    url_miniatura VARCHAR(255) NOT NULL,
    visibilidad VARCHAR(10) NOT NULL DEFAULT 'publico' CHECK (visibilidad IN ('publico', 'privado', 'oculto')),
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (canal_id) REFERENCES canales(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL
);

CREATE TABLE suscripciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    canal_id INT NOT NULL,
    fecha_suscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notificaciones_activadas BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (usuario_id, canal_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (canal_id) REFERENCES canales(id)  ON DELETE CASCADE
);

CREATE TABLE comentarios (
    id SERIAL PRIMARY KEY,
    video_id INT NOT NULL,
    usuario_id INT NOT NULL,
    comentario_padre_id INT NULL,
    comentario TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (comentario_padre_id) REFERENCES comentarios(id) ON DELETE CASCADE
);

CREATE TABLE valoraciones (
    video_id INT NOT NULL,
    usuario_id INT NOT NULL,
    es_positivo BOOLEAN NOT NULL,
    fecha_valoracion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (video_id, usuario_id),
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE etiquetas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE video_etiquetas (
    video_id INT NOT NULL,
    etiqueta_id INT NOT NULL,
    PRIMARY KEY (video_id, etiqueta_id),
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id) ON DELETE CASCADE
);

CREATE TABLE lista_reproduccion (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    visibilidad VARCHAR(50) NOT NULL CHECK (visibilidad IN ('publico', 'privado', 'oculto')),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE lista_videos (
    lista_id INT NOT NULL,
    video_id INT NOT NULL,
    orden INT NOT NULL,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (lista_id, video_id),
    FOREIGN KEY (lista_id) REFERENCES lista_reproduccion(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE
);

CREATE TABLE historial_visitas (
    id BIGSERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    video_id INT NOT NULL,
    segundos_vistos INT NOT NULL DEFAULT 0,
    fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE
);

CREATE VIEW vista_videos as 
SELECT
    v.id AS video_id,
    v.canal_id,
    v.titulo,
    v.duracion_segundos,
    v.visibilidad,
    v.fecha_publicacion,
    COUNT(DISTINCT h.id) as total_visitas,
    COUNT(DISTINCT CASE WHEN val.es_positivo = TRUE THEN val.usuario_id END) AS total_me_gusta,
    COUNT(DISTINCT CASE WHEN val.es_positivo = FALSE THEN val.usuario_id END) AS total_no_me_gusta
FROM videos v
LEFT JOIN historial_visitas h ON v.id = h.video_id
LEFT JOIN valoraciones val ON v.id = val.video_id
GROUP BY v.id;
