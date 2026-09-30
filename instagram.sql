DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE TIPO_CONTENIDO CASCADE CONSTRAINTS;

CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname VARCHAR2(100),
    correo VARCHAR2(100),
    clave VARCHAR2(100),
    fecha_de_inicio DATE 
    );

CREATE TABLE TIPO_CONTENIDO(
    id_tipo_contenido NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_contenido VARCHAR2 (200)
    );


INSERT INTO USUARIO(nickname,correo,clave) VALUES('julian lopez', 'jlopez@email.com', 'ClaveSegura123!', DATE '2020-07-23');
INSERT INTO USUARIO(nickname,correo,clave) VALUES('mgarcia', 'mgarcia@email.com', 'Pass456#Word', DATE '2018-10-09');
INSERT INTO USUARIO(nickname,correo,clave) VALUES('carlos rodriguez', 'crodriguez@email.com', 'Admin2026*', DATE '2010-01-06');
INSERT INTO USUARIO(nickname,correo,clave) VALUES('ana luisa', 'analuisa@email.com', 'MiPassword789', DATE '2024-09-31');
INSERT INTO USUARIO(nickname,correo,clave) VALUES('wilton wilson', 'wwilson@email.com', 'SecurePass!2026', DATE '2025-04-19');
COMMIT;

SELECT * FROM USUARIO;

INSERT INTO TIPO_CONTENIDO(nombre_contenido) VALUES('stories','reels','live','grupos_de_chat');

COMMIT;

SELECT * FROM TIPO_CONTENIDO;