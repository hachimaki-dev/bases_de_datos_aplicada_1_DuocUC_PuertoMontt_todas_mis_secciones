DROP TABLE  usuario CASCADE CONSTRAINTS;
DROP TABLE  contenido CASCADE CONSTRAINTS;
DROP TABLE  tipo_contenido CASCADE CONSTRAINTS;
DROP TABLE  bloqueos CASCADE CONSTRAINTS;
DROP TABLE  comentarios CASCADE CONSTRAINTS;
DROP TABLE  amigos CASCADE CONSTRAINTS;


CREATE TABLE usuario (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(20),
    gmail VARCHAR2(20),
    Verificado CHAR(1),
    Fecha_de_registro DATE

)

CREATE TABLE contenido (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(20),

    id_tipo NUMBER REFERENCES tipo_contenido(id)

)

CREATE TABLE tipo_contenido (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tipo VARCHAR2(20)
    
)

CREATE TABLE amigos (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(20),

    amigo_de NUMBER REFERENCES usuario(id)
    
)

CREATE TABLE bloqueos (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_del_bloqueado VARCHAR2(20),

    quien_bloqueo NUMBER REFERENCES usuario(id)
    
)

CREATE TABLE  comentarios (

    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    comentario VARCHAR2(20)
    
)


INSERT INTO  usuario (nombre, gmail, Verificado, Fecha_de_registro) VALUES ('Carlos Orellana Soto', 'carlos.orellana@mail.com', DATE '2025-03-10' );
INSERT INTO  usuario (nombre, gmail, Verificado, Fecha_de_registro) VALUES ('Amaro Lopez',          'amaro.lopez@mail.com',      DATE '2025-04-02' );
INSERT INTO  usuario (nombre, gmail, Verificado, Fecha_de_registro) VALUES ('', '', '', );
INSERT INTO  usuario (nombre, gmail, Verificado, Fecha_de_registro) VALUES ('', '', '', );
INSERT INTO  usuario (nombre, gmail, Verificado, Fecha_de_registro) VALUES ('', '', '', );

INSERT INTO amigos  (nombre, amigo_de) VALUES ('', );
INSERT INTO amigos  (nombre, amigo_de) VALUES ('', );
INSERT INTO amigos  (nombre, amigo_de) VALUES ('', );
INSERT INTO amigos  (nombre, amigo_de) VALUES ('', );
INSERT INTO amigos  (nombre, amigo_de) VALUES ('', );

INSERT INTO  bloqueos (nombre_del_bloqueado, quien_bloqueo) VALUES ('Juanito Perez', );
INSERT INTO  bloqueos (nombre_del_bloqueado, quien_bloqueo) VALUES ('Jhonny Texas', );
INSERT INTO  bloqueos (nombre_del_bloqueado, quien_bloqueo) VALUES ('nosupequenombreponerme', );
INSERT INTO  bloqueos (nombre_del_bloqueado, quien_bloqueo) VALUES ('', );
INSERT INTO  bloqueos (nombre_del_bloqueado, quien_bloqueo) VALUES ('', );

INSERT INTO  contenido (nombre, id_tipo) VALUES ('', );
INSERT INTO  contenido (nombre, id_tipo) VALUES ('', );
INSERT INTO  contenido (nombre, id_tipo) VALUES ('', );
INSERT INTO  contenido (nombre, id_tipo) VALUES ('', );
INSERT INTO  contenido (nombre, id_tipo) VALUES ('', );

INSERT INTO  tipo_contenido (nombre) VALUES ('reel');
INSERT INTO  tipo_contenido (nombre) VALUES ('historia');
INSERT INTO  tipo_contenido (nombre) VALUES ('publicacion');
INSERT INTO  tipo_contenido (nombre) VALUES ('instantanea');
INSERT INTO  tipo_contenido (nombre) VALUES ('nota');

INSERT INTO comentarios  (comentario) VALUES ('hola soy un hacker jejeje');
INSERT INTO comentarios  (comentario) VALUES ('los ingenieros junior no tienen trabajo hoy en dia');
INSERT INTO comentarios  (comentario) VALUES ('mentiroso si tienen');
INSERT INTO comentarios  (comentario) VALUES ('no tu mentiroso, callate');
INSERT INTO comentarios  (comentario) VALUES ('no tu callate');



COMMIT;

SELECT * FROM usuario;
SELECT * FROM amigos;
SELECT * FROM contenido;
SELECT * FROM tipo_contenido;
SELECT * FROM bloqueos;
SELECT * FROM comentarios;

