DROP TABLE VIDEO CASCADE CONSTRAINTS;
DROP TABLE TIPO CASCADE CONSTRAINTS;
DROP TABLE CUENTA CASCADE CONSTRAINTS;
DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE CANAL CASCADE CONSTRAINTS;
DROP TABLE LISTA_REPRODUCCION CASCADE CONSTRAINTS;
DROP TABLE COMENTARIO CASCADE CONSTRAINTS;

DROP TABLE TIPO_VIDEO CASCADE CONSTRAINTS;


CREATE TABLE VIDEO (
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_video VARCHAR2(100),
    descripcion VARCHAR2(200),
    me_gusta NUMBER,
    me_gusta_activo CHAR(1),
    comentario_activo CHAR(1),
    duracion_segundos NUMBER,
    fecha_publicacion DATE
);
CREATE TABLE TIPO(
    id_tipo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_tipo VARCHAR2(100)
);
CREATE TABLE CUENTA(
    id_cuenta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR2(200) NOT NULL,
    passwd VARCHAR2(14) NOT NULL
);
CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(100),
    id_cuenta NUMBER REFERENCES CUENTA(id_cuenta)
);
CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_canal VARCHAR2(100),
    id_usuario NUMBER REFERENCES USUARIO(id_usuario)
);
CREATE TABLE LISTA_REPRODUCCION(
    id_lista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nomnbre_lista VARCHAR2(100),
    id_video NUMBER REFERENCES VIDEO(id_video)
);
CREATE TABLE COMENTARIO(
    id_comentario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    comentario VARCHAR2(200),
    id_canal NUMBER REFERENCES CANAL(id_canal)
);


CREATE TABLE TIPO_VIDEO(
    id_tipo NUMBER NOT NULL,
    id_video NUMBER NOT NULL,
    CONSTRAINT pk_tipo_video PRIMARY KEY(id_tipo, id_video),
    CONSTRAINT fk_tv_tipo FOREIGN KEY (id_tipo) REFERENCES TIPO (id_tipo),
    CONSTRAINT fk_tv_video FOREIGN KEY (id_video) REFERENCES VIDEO (id_video)
);


INSERT INTO VIDEO(id_video, nombre_video, descripcion, me_gusta, me_gusta_activo, comentario_activo, duracion_segundos, fecha_publicacion) VALUES (1, 'Cocinando rollos de canela', 'Paso a paso de cómo preparar rollos de canela para cenar', 7, 'S', 'S', 120, DATE '2008-12-14');
INSERT INTO VIDEO(id_video, nombre_video, descripcion, me_gusta, me_gusta_activo, comentario_activo, duracion_segundos, fecha_publicacion) VALUES (2, 'Superar Minecraft en 5 minutos', 'Speedrun Minecraft sin morir', 13, 'N', 'S', 300, DATE '2023-09-29');

INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(1, 'Educativo');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(2, 'Informativo');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(3, 'Cocina');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(4, 'Gameplays');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(5, 'Constructivo');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(6, 'Salud médico');
INSERT INTO TIPO(id_tipo, nombre_tipo) VALUES(7, 'Diversión');

INSERT INTO CUENTA(id_cuenta, email, passwd) VALUES(1, 'am.lopez@gmal.com', 'amlop1234');
INSERT INTO CUENTA(id_cuenta, email, passwd) VALUES(2, 'mar.san@gmail.com', 'masan1234');
INSERT INTO CUENTA(id_cuenta, email, passwd) VALUES(3, 'bast.soto@gmail.com', 'baso1234');
INSERT INTO CUENTA(id_cuenta, email, passwd) VALUES(4, 'vic.mart@gmail.com', 'vma1234');
INSERT INTO CUENTA(id_cuenta, email, passwd) VALUES(5, 'cam.pard@gmail.com', 'capa1234');

INSERT INTO USUARIO(id_usuario, nombre_usuario, id_cuenta) VALUES(1, 'Amareku', 1);
INSERT INTO USUARIO(id_usuario, nombre_usuario, id_cuenta) VALUES(2, 'MrV456', 4);
INSERT INTO USUARIO(id_usuario, nombre_usuario, id_cuenta) VALUES(3, 'BasterFaster', 3);

INSERT INTO TIPO_VIDEO(pk_tipo_video, fk_tv_tipo, fk_tv_video) VALUES(1, 1, 1);
INSERT INTO TIPO_VIDEO(pk_tipo_video, fk_tv_tipo, fk_tv_video) VALUES(2, 1, 3);
INSERT INTO TIPO_VIDEO(pk_tipo_video, fk_tv_tipo, fk_tv_video) VALUES(3, 2, 4);
INSERT INTO TIPO_VIDEO(pk_tipo_video, fk_tv_tipo, fk_tv_video) VALUES(4, 2, 7);

SELECT * FROM VIDEO;
SELECT * FROM TIPO;
SELECT * FROM USUARIO;
SELECT * FROM CUENTA;
SELECT * FROM CANAL;
SELECT * FROM LISTA_REPRODUCCION;
SELECT * FROM COMENTARIO;


COMMIT;