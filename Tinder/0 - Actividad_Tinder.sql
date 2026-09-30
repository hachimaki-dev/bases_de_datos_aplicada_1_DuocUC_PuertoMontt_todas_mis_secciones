DROP TABLE USUARIOS CASCADE CONSTRAINTS;
DROP TABLE SEGUIDOR CASCADE CONSTRAINTS;

CREATE TABLE USUARIOS(
    id_artista NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre varchar2(100),
    esta_verificado CHAR(1),
    nacionalidad varchar2(100),
    fecha_nacimiento NUMBER
);
CREATE TABLE SEGUIDOR(
    
);

INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Diego', 'S', 'Chile', 2002)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Alan', 'S', 'Chile', 2000)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Carla', 'S', 'Chile', 1999)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Mari', 'S', 'Argentina', 2004)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Camila', 'S', 'Argentina', 2002)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Gustabo', 'S', 'Chile', 2005)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Jose', 'S', 'Chile', 2002)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Daniela', 'S', 'Chile', 2002)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Martina', 'S', 'Chile', 2002)
INSERT INTO USUARIOS(nombre, esta_verificado, nacionalidad, fecha_nacimiento) VALUES ('Venja', 'S', 'Chile', 2000)