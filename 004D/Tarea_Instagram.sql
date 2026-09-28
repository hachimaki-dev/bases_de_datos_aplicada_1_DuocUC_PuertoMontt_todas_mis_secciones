-- seguidores, like, tipo_contenidos, usuarios, amigos(mejores amigos), comentarios

--Esto esta en 1FN
CREATE TABLE USUARIOS (
    id_usuarios NUMBER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seguidores  number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100)NOT NULL,
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

CREATE TABLE TIPO_PUBLICACION (
    id_publicacion NUMBER  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    post VARCHAR2(1),
    reel VARCHAR2(1),
    historia VARCHAR2(1)

);