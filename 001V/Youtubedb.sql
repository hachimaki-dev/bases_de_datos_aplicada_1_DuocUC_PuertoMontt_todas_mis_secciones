CREATE TABLE CANAL(
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_canal VARCHAR2(50) NOT NULL,
    descripcion_canal VARCHAR2(150),
    url_foto_perfil VARCHAR2(100),
    numero_suscriptores NUMBER,
    monetizado CHAR(1)
);

CREATE TABLE USUARIO(
    id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_usuario VARCHAR2(50),
    descripcion_usuario VARCHAR2(100),
    canales_suscritos NUMBER
);

CREATE TABLE VIDEO(
    id_video NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_video VARCHAR2(150) NOT NULL,
    id_canal NUMBER REFERENCES CANAL(id_canal),
    descripcion_video VARCHAR2(250),
    url_miniatura VARCHAR2(100),
    url_video VARCHAR2(100),
    fecha_lanzamiento DATE,
    duracion_segundos NUMBER
);

CREATE TABLE PLAYLIST(
    id_playlist NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_playlist VARCHAR(100),
    id_usuario NUMBER REFERENCES USUARIO(id_usuario) --aqui tengo una duda porque los canales tambien hacen playlist de sus videos mmmmmmmm :T
);

CREATE TABLE PLAYLIST_VIDEO(
    id_playlist NUMBER REFERENCES PLAYLIST(id_playlist),
    id_video NUMBER REFERENCES VIDEO(id_video)
);

INSERT INTO CANAL(nombre_canal, descripcion_canal, url_foto_perfil, numero_suscriptores, monetizado) VALUES ('Hola soy German', 'hago sketches', 'C:\Users\W608-PCXX\Descargas\unnamed.jpg', 10000000, 's');
INSERT INTO CANAL(nombre_canal, descripcion_canal, url_foto_perfil, numero_suscriptores, monetizado) VALUES ();
INSERT INTO CANAL(nombre_canal, descripcion_canal, url_foto_perfil, numero_suscriptores, monetizado) VALUES ();