CREATE TABLE consola(
    id_consola NUMBER(4) PRIMARY KEY,
    nombre_consola VARCHAR2(60) NOT NULL UNIQUE,
    tipo_consola VARCHAR2(20) NOT NULL CHECK (tipo_consola IN ('SOBREMESA', 'PORTATIL', 'HIBRIDA')),
    anio_lanzamiento NUMBER(4) NOT NULL CHECK (anio_lanzamiento BETWEEN 1983 AND 2030),
    precio_referencia_usd NUMBER(6,2) NOT NULL CHECK (precio_referencia_usd > 0),
    estado_fabricacion VARCHAR2(15)DEFAULT 'ACTIVA' NOT NULL CHECK (estado_fabricacion IN ('ACTIVA', 'DESCONTINUADA'))
);

SELECT * FROM CONSOLA;

CREATE TABLE franquicia(
    id_franquicia NUMBER(4) PRIMARY KEY,
    nombre_franquicia VARCHAR2(60) NOT NULL UNIQUE,
    creador_principal VARCHAR2(60),
    estudio_princial VARCHAR2(60) DEFAULT 'Nintendo EPD' NOT NULL,
    anio_debut NUMBER(4) NOT NULL CHECK (anio_debut >= 1080)
);

SELECT * FROM FRANQUICIA;

CREATE TABLE videojuego(
    id_juego NUMBER(4) PRIMARY KEY,
    codigo_catalogo VARCHAR2(30) NOT NULL UNIQUE,
    
);