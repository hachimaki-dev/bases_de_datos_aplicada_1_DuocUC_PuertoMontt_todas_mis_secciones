DROP TABLE USUARIOS CASCADE CONSTRAINTS;
DROP TABLE TIPO_CUENTA CASCADE CONSTRAINTS;
DROP TABLE MEJORES_AMIGOS CASCADE CONSTRAINTS;

--Esto esta en 1FN
CREATE TABLE USUARIOS (
    id_usuarios NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seguidores NUMBER DEFAULT 0,
    nombre VARCHAR2(100) NOT NULL,
    id_tipo_cuenta VARCHAR2(200),
    fecha_nacimiento DATE,
    esta_verificado CHAR(1),
    id_mejores_amigos VARCHAR2(200)
);

CREATE TABLE TIPO_CUENTA (
    id_cuenta NUMBER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cuenta_publica VARCHAR2(1),
    cuenta_privada VARCHAR2(1)

);

CREATE TABLE MEJORES_AMIGOS (
    id_amigos NUMBER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    amigo_comun VARCHAR2(1),
    mejor_amigo VARCHAR2(1)

);

CREATE TABLE PUBLICACIONES (
    id_publicacion NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    tipo VARCHAR2(20),
    contenido_url VARCHAR2(500),
    fecha_creacion DATE 
);

INSERT INTO USUARIOS (nombre, fecha_nacimiento, esta_verificado) 
VALUES ("Carlos Pérez", '1995-05-12', "S");

INSERT INTO USUARIOS (nombre, fecha_nacimiento, esta_verificado) 
VALUES ("María Gómez", '2000-09-22', "N");

INSERT INTO USUARIOS (nombre, fecha_nacimiento, esta_verificado) 
VALUES ("Sofía Ruiz", '1998-03-15', "S");
COMMIT;

SELECT * FROM USUARIOS;

INSERT INTO TIPO_CUENTA (cuenta_publica, cuenta_privada) 
VALUES ("S", "N");

INSERT INTO TIPO_CUENTA (cuenta_publica, cuenta_privada) 
VALUES ("N", "S");

INSERT INTO TIPO_CUENTA (cuenta_publica, cuenta_privada) 
VALUES ("S", "N");
COMMIT;

SELECT * FROM TIPO_CUENTA;

INSERT INTO MEJORES_AMIGOS(amigo_comun, mejor_amigo)
VALUES ("S", "N");

INSERT INTO MEJORES_AMIGOS(amigo_comun, mejor_amigo)
VALUES ("N", "S");

INSERT INTO MEJORES_AMIGOS(amigo_comun, mejor_amigo)
VALUES ("S", "N");
COMMIT;

SELECT * FROM MEJORES_AMIGOS;