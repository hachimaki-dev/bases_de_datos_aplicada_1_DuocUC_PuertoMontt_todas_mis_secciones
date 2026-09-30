DROP TABLE  usuario CASCADE CONSTRAINTS;
DROP TABLE  contenido CASCADE CONSTRAINTS;
DROP TABLE  tipo_contenido CASCADE CONSTRAINTS;
DROP TABLE  bloqueos CASCADE CONSTRAINTS;
DROP TABLE  comentarios CASCADE CONSTRAINTS;
DROP TABLE  amigos CASCADE CONSTRAINTS;

CREATE TABLE usuario(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    email VARCHAR2(20) NOT NULL UNIQUE ,
    verificado CHAR(1) NOT NULL CHECK (verificado IN ('S' , 'N')) ,
    fecha_de_registro TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE tipo_contenido (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tipo VARCHAR2(20) NOT NULL CHECK ( nombre_tipo IN ('Publicacion', 'Reel', 'Historia', 'Instantanea'))
);

CREATE TABLE contenido (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_tipo NUMBER REFERENCES tipo_contenido(id),
    fecha_publicacion TIMESTAMP DEFAULT SYSTIMESTAMP
);



CREATE TABLE amigos(
    usuario NUMBER REFERENCES usuario(id),
    amigo NUMBER REFERENCES usuario(id)
);

CREATE TABLE bloqueos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario_que_bloquea NUMBER REFERENCES usuario(id),
    id_usuario_bloqueado  NUMBER REFERENCES usuario(id)
);

CREATE TABLE  comentarios (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER REFERENCES usuario(id),
    comentario VARCHAR2(250) NOT NULL,
    id_publicacion NUMBER REFERENCES contenido(id)
);


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

