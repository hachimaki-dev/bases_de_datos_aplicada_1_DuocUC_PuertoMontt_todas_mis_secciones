DROP TABLE USUARIOS;
DROP TABLE CANALES;
DROP TABLE VIDEOS;

CREATE TABLE USUARIOS(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL UNIQUE,
    correo VARCHAR2(100) NOT NULL UNIQUE
)

CREATE TABLE CANALES(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_usuario REFERENCES USUARIOS(id),
    nombre VARCHAR2(100) NOT NULL UNIQUE,
    suscriptores NUMBER NOT NULL
)

CREATE TABLE VIDEOS(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100) NOT NULL,
    vistas NUMBER,
    id_canales REFERENCES CANALES(id),
    comentarios VARCHAR2(250),
    likes NUMBER
)

INSERT INTO USUARIOS(nombre, correo) VALUES('Benjamin', 'ben.miranda@gmail.com');
INSERT INTO USUARIOS(nombre, correo) VALUES('Beto', 'albe.cardenas@gmail.com');
INSERT INTO USUARIOS(nombre, correo) VALUES('Brayan', 'bra.vasquez@gmail.com');
INSERT INTO USUARIOS(nombre, correo) VALUES('Francisco', 'fr.españa@gmail.com');
INSERT INTO USUARIOS(nombre, correo) VALUES('Matias', 'mat.moena@gmail.com');

INSERT INTO CANALES(id_usuario, nombre, suscriptores) VALUES(5, 'Futbol y màs', 500000);
INSERT INTO CANALES(id_usuario, nombre, suscriptores) VALUES(2, 'Valo x la tarde', 1);
INSERT INTO CANALES(id_usuario, nombre, suscriptores) VALUES(1, 'HolaSoyFerran', 9999999);

COMMIT;