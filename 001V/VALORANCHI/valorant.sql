DROP TABLE participaciones CASCADE CONSTRAINTS;
DROP TABLE patrocinios CASCADE CONSTRAINTS;
DROP TABLE partidas CASCADE CONSTRAINTS;
DROP TABLE jugadores CASCADE CONSTRAINTS;
DROP TABLE equipos CASCADE CONSTRAINTS;
DROP TABLE mapas CASCADE CONSTRAINTS;
DROP TABLE agentes CASCADE CONSTRAINTS;
DROP TABLE patrocinadores CASCADE CONSTRAINTS;
DROP TABLE regiones CASCADE CONSTRAINTS;

CREATE TABLE regiones (
    id                 NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo             VARCHAR2(10)  NOT NULL UNIQUE,
    nombre             VARCHAR2(50)  NOT NULL UNIQUE,
    servidor_principal VARCHAR2(40)  NOT NULL
);

CREATE TABLE patrocinadores (
    id          NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre      VARCHAR2(60)  NOT NULL UNIQUE,
    rubro       VARCHAR2(40)  NOT NULL CHECK (rubro IN ('Hardware', 'Bebidas', 'Mobiliario', 'Telecomunicaciones', 'Ropa Deportiva')),
    pais_origen VARCHAR2(40)  NOT NULL
);

CREATE TABLE agentes (
    id          NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre      VARCHAR2(40)  NOT NULL UNIQUE,
    rol         VARCHAR2(20)  NOT NULL CHECK (rol IN ('Duelista', 'Iniciador', 'Controlador', 'Centinela')),
    origen_lore VARCHAR2(40)  NOT NULL
);

CREATE TABLE mapas (
    id           NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre       VARCHAR2(40)  NOT NULL UNIQUE,
    sitios_bomba NUMBER(1)     NOT NULL CHECK (sitios_bomba IN (2, 3)),
    ambientacion VARCHAR2(50)  NOT NULL
);

CREATE TABLE equipos (
    id                NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre            VARCHAR2(60)  NOT NULL UNIQUE,
    tag               VARCHAR2(6)   NOT NULL UNIQUE,
    presupuesto_anual NUMBER(10)    NOT NULL CHECK (presupuesto_anual > 0),
    anio_fundacion    NUMBER(4)     NOT NULL CHECK (anio_fundacion >= 2000),
    region_id         NUMBER        NOT NULL REFERENCES regiones(id)
);

CREATE TABLE jugadores (
    id             NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nickname       VARCHAR2(40)  NOT NULL UNIQUE,
    nombre_real    VARCHAR2(80)  NOT NULL,
    pais_natal     VARCHAR2(40)  NOT NULL,
    edad           NUMBER(2)     NOT NULL CHECK (edad BETWEEN 16 AND 40),
    sueldo_mensual NUMBER(8)     NOT NULL CHECK (sueldo_mensual >= 0),
    equipo_id      NUMBER        NOT NULL REFERENCES equipos(id)
);

CREATE TABLE partidas (
    id                 NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fase               VARCHAR2(30)  NOT NULL CHECK (fase IN ('Fase de Grupos', 'Cuartos de Final', 'Semifinal', 'Gran Final')),
    fecha_partida      DATE          NOT NULL,
    duracion_min       NUMBER(3)     NOT NULL CHECK (duracion_min > 0),
    asistencia_publico NUMBER(6)     DEFAULT 0 NOT NULL CHECK (asistencia_publico >= 0),
    mapa_id            NUMBER        NOT NULL REFERENCES mapas(id)
);

CREATE TABLE patrocinios (
    id              NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    monto_anual     NUMBER(9)     NOT NULL CHECK (monto_anual > 0),
    tipo_contrato   VARCHAR2(20)  NOT NULL CHECK (tipo_contrato IN ('Principal', 'Secundario', 'Equipamiento')),
    equipo_id       NUMBER        NOT NULL REFERENCES equipos(id),
    patrocinador_id NUMBER        NOT NULL REFERENCES patrocinadores(id)
);

CREATE TABLE participaciones (
    id              NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kills           NUMBER(3)     DEFAULT 0 NOT NULL CHECK (kills >= 0),
    deaths          NUMBER(3)     DEFAULT 0 NOT NULL CHECK (deaths >= 0),
    assists         NUMBER(3)     DEFAULT 0 NOT NULL CHECK (assists >= 0),
    puntaje_combate NUMBER(4)     NOT NULL CHECK (puntaje_combate >= 0),
    gano            CHAR(1)       NOT NULL CHECK (gano IN ('S', 'N')),
    jugador_id      NUMBER        NOT NULL REFERENCES jugadores(id),
    partida_id      NUMBER        NOT NULL REFERENCES partidas(id),
    agente_id       NUMBER        NOT NULL REFERENCES agentes(id)
);

-- POBLAMIENTO DE DATOS (DML - ORACLE GENERA LOS ID AUTOMÁTICAMENTE)
INSERT INTO regiones (codigo, nombre, servidor_principal) VALUES ('LATAM', 'Latinoamerica', 'Santiago');
INSERT INTO regiones (codigo, nombre, servidor_principal) VALUES ('NA', 'Norteamerica', 'Los Angeles');
INSERT INTO regiones (codigo, nombre, servidor_principal) VALUES ('EMEA', 'Europa y Medio Oriente', 'Berlin');
INSERT INTO regiones (codigo, nombre, servidor_principal) VALUES ('APAC', 'Asia Pacifico', 'Seul');

INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Red Bull', 'Bebidas', 'Austria');
INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Razer', 'Hardware', 'Estados Unidos');
INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Secretlab', 'Mobiliario', 'Singapur');
INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Logitech G', 'Hardware', 'Suiza');
INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Monster Energy', 'Bebidas', 'Estados Unidos');
INSERT INTO patrocinadores (nombre, rubro, pais_origen) VALUES ('Nike Gaming', 'Ropa Deportiva', 'Estados Unidos');

INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Jett', 'Duelista', 'Corea del Sur');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Raze', 'Duelista', 'Brasil');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Omen', 'Controlador', 'Desconocido');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Sova', 'Iniciador', 'Rusia');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Killjoy', 'Centinela', 'Alemania');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Viper', 'Controlador', 'Estados Unidos');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Fade', 'Iniciador', 'Turquia');
INSERT INTO agentes (nombre, rol, origen_lore) VALUES ('Cypher', 'Centinela', 'Marruecos');

INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Ascent', 2, 'Venecia, Italia');
INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Bind', 2, 'Rabat, Marruecos');
INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Haven', 3, 'Timbu, Butan');
INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Lotus', 3, 'Ghats Occidentales, India');
INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Split', 2, 'Tokio, Japon');
INSERT INTO mapas (nombre, sitios_bomba, ambientacion) VALUES ('Sunset', 2, 'Los Angeles, Estados Unidos');

INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('KRU Esports', 'KRU', 1800000, 2020, 1);
INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('Leviatan', 'LEV', 2400000, 2020, 1);
INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('Sentinels', 'SEN', 4500000, 2018, 2);
INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('G2 Esports', 'G2', 3800000, 2015, 2);
INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('Fnatic', 'FNC', 4200000, 2004, 3);
INSERT INTO equipos (nombre, tag, presupuesto_anual, anio_fundacion, region_id) VALUES ('Paper Rex', 'PRX', 2900000, 2020, 4);

INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('keznit', 'Angelo Mori', 'Chile', 23, 14500, 1);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Mazino', 'Roberto Rivas', 'Chile', 23, 14000, 1);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Melser', 'Marco Eliot', 'Chile', 24, 12500, 1);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('kiNgg', 'Francisco Aravena', 'Chile', 22, 18000, 2);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('aspas', 'Erick Santos', 'Brasil', 21, 32000, 2);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('tex', 'Ian Botsch', 'Alemania', 25, 15000, 2);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('TenZ', 'Tyson Ngo', 'Canada', 23, 35000, 3);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('zekken', 'Zachary Patrone', 'Estados Unidos', 19, 24000, 3);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Sacy', 'Gustavo Rossi', 'Brasil', 26, 22000, 3);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('valyn', 'Jacob Batio', 'Estados Unidos', 21, 19000, 4);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('trent', 'Trent Cairns', 'Estados Unidos', 19, 17500, 4);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('leaf', 'Nathan Orf', 'Estados Unidos', 20, 18500, 4);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Boaster', 'Jake Howlett', 'Reino Unido', 29, 26000, 5);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Alfajer', 'Emir Beder', 'Turquia', 19, 28000, 5);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('Chronicle', 'Timofey Khromov', 'Rusia', 22, 25000, 5);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('f0rsakeN', 'Jason Susanto', 'Indonesia', 20, 23000, 6);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('something', 'Ilya Petrov', 'Rusia', 22, 24000, 6);
INSERT INTO jugadores (nickname, nombre_real, pais_natal, edad, sueldo_mensual, equipo_id) VALUES ('d4v41', 'Khalish Rusyaidee', 'Malasia', 25, 19500, 6);

INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Fase de Grupos', TO_DATE('2026-08-01', 'YYYY-MM-DD'), 42, 6500, 1);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Fase de Grupos', TO_DATE('2026-08-02', 'YYYY-MM-DD'), 38, 7200, 3);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Fase de Grupos', TO_DATE('2026-08-03', 'YYYY-MM-DD'), 51, 8100, 4);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Cuartos de Final', TO_DATE('2026-08-08', 'YYYY-MM-DD'), 46, 11000, 2);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Cuartos de Final', TO_DATE('2026-08-09', 'YYYY-MM-DD'), 55, 11500, 5);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Semifinal', TO_DATE('2026-08-15', 'YYYY-MM-DD'), 49, 14800, 6);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Semifinal', TO_DATE('2026-08-16', 'YYYY-MM-DD'), 62, 15200, 1);
INSERT INTO partidas (fase, fecha_partida, duracion_min, asistencia_publico, mapa_id) VALUES ('Gran Final', TO_DATE('2026-08-23', 'YYYY-MM-DD'), 58, 19500, 4);

INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (450000, 'Principal', 1, 1);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (180000, 'Equipamiento', 1, 4);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (600000, 'Principal', 2, 5);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (220000, 'Secundario', 2, 3);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (1200000, 'Principal', 3, 2);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (500000, 'Secundario', 3, 1);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (350000, 'Equipamiento', 3, 3);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (950000, 'Principal', 4, 1);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (420000, 'Equipamiento', 4, 4);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (1100000, 'Principal', 5, 6);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (380000, 'Equipamiento', 5, 3);
INSERT INTO patrocinios (monto_anual, tipo_contrato, equipo_id, patrocinador_id) VALUES (780000, 'Principal', 6, 2);

INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (21, 16, 4, 248, 'N', 1, 1, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (15, 17, 11, 195, 'N', 2, 1, 4);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (13, 15, 9, 172, 'N', 3, 1, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (18, 14, 10, 230, 'S', 4, 1, 6);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (26, 12, 5, 312, 'S', 5, 1, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (19, 13, 12, 240, 'S', 7, 2, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (24, 14, 6, 289, 'S', 8, 2, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (14, 12, 14, 198, 'S', 9, 2, 4);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (16, 16, 8, 204, 'N', 10, 2, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (15, 17, 7, 188, 'N', 11, 2, 4);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (12, 16, 15, 168, 'S', 13, 3, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (25, 15, 4, 295, 'S', 14, 3, 5);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (18, 14, 11, 224, 'S', 15, 3, 7);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (22, 18, 6, 260, 'N', 16, 3, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (20, 17, 5, 242, 'N', 17, 3, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (23, 15, 5, 275, 'S', 1, 4, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (17, 14, 9, 215, 'S', 2, 4, 7);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (19, 16, 4, 228, 'N', 12, 4, 6);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (27, 18, 7, 318, 'S', 8, 5, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (21, 16, 13, 254, 'S', 7, 5, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (24, 19, 5, 279, 'N', 17, 5, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (16, 18, 10, 201, 'N', 18, 5, 8);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (28, 13, 4, 330, 'S', 5, 6, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (19, 14, 8, 236, 'S', 6, 6, 8);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (20, 18, 3, 232, 'N', 1, 6, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (22, 19, 15, 258, 'S', 7, 7, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (25, 17, 6, 292, 'S', 8, 7, 1);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (26, 18, 5, 301, 'N', 14, 7, 5);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (30, 15, 6, 345, 'S', 5, 8, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (21, 16, 12, 255, 'S', 4, 8, 3);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (23, 19, 8, 270, 'N', 8, 8, 2);
INSERT INTO participaciones (kills, deaths, assists, puntaje_combate, gano, jugador_id, partida_id, agente_id) VALUES (18, 18, 14, 220, 'N', 7, 8, 3);
COMMIT;

SELECT * FROM JUGADORES;
-- ALIAS (AS 'apodo')
SELECT nickname, sueldo_mensual * 12 AS SUELDO_ANUAL FROM JUGADORES WHERE (edad >= 18);
SELECT * FROM JUGADORES WHERE nickname LIKE '%z%';

-- Actividad en clase (02-11-2026) --
SELECT * FROM REGIONES; -- 1
SELECT nombre, rol, origen_lore FROM AGENTES; -- 2
SELECT nickname, nombre_real AS nombre_completo, sueldo_mensual AS salario_usd FROM JUGADORES; -- 3
SELECT nickname, sueldo_mensual, sueldo_mensual*12 AS sueldo_anual FROM JUGADORES; -- 4
SELECT nombre, tag, presupuesto_anual/1000000 AS presupuesto_millones FROM EQUIPOS; -- 5
SELECT id, kills, assists, deaths, kills+assists AS participacion_ofensiva FROM PARTICIPACIONES; -- 6
SELECT nickname, pais_natal, sueldo_mensual FROM JUGADORES WHERE pais_natal = 'Chile'; -- 7
SELECT nickname, edad, sueldo_mensual FROM JUGADORES WHERE sueldo_mensual > 25000; -- 8
SELECT nombre, ambientacion FROM MAPAS WHERE sitios_bomba = 3; -- 9
SELECT nickname, edad, sueldo_mensual FROM JUGADORES WHERE edad BETWEEN 19 and 22; --10
SELECT nickname, pais_natal FROM JUGADORES WHERE pais_natal IN('Brasil', 'Canada', 'Rusia'); -- 11
SELECT * FROM AGENTES WHERE rol IN('Duelista', 'Iniciador') AND origen_lore != 'Desconocido'; -- 12
SELECT * FROM PARTIDAS WHERE fase LIKE '%Final%' AND asistencia_publico > 10000; -- 13
SELECT nombre, tag, presupuesto_anual FROM EQUIPOS ORDER BY presupuesto_anual DESC; -- 14
SELECT nickname, edad, nombre_real FROM JUGADORES ORDER BY edad ASC; -- 15
SELECT pais_natal, nickname, sueldo_mensual FROM JUGADORES ORDER BY pais_natal DESC, sueldo_mensual DESC; -- 16
SELECT * FROM PARTIDAS ORDER BY fecha_partida DESC; -- 17
SELECT jugador_id, partida_id, kills, puntaje_combate FROM PARTICIPACIONES WHERE gano = 'S' ORDER BY puntaje_combate DESC; -- 18
SELECT * FROM PATROCINIOS ORDER BY tipo_contrato ASC, monto_anual DESC; -- 19
SELECT COUNT(*) AS Total_jugadores, round(AVG(sueldo_mensual*12),0) AS Sueldo_promedio, MIN(sueldo_mensual) AS Sueldo_minimo, MAX(sueldo_mensual) AS Sueldo_maximo FROM JUGADORES; -- 20
SELECT rol, COUNT(*) AS Total_Agentes FROM AGENTES GROUP BY rol; -- 21
SELECT pais_natal, COUNT(*) AS Total_Jugadores FROM JUGADORES GROUP BY pais_natal ORDER BY Total_jugadores DESC; -- 22
SELECT fase, COUNT(*) AS Partidas_jugadas, round(AVG(duracion_min),0) AS Duracion_promedio, SUM(asistencia_publico) AS Publico_acumulado FROM PARTIDAS GROUP BY fase; -- 23
SELECT rubro, COUNT(*) AS Total_patrocinadores FROM PATROCINADORES GROUP BY rubro; -- 24
SELECT tipo_contrato, COUNT(*) AS Cantidad_contratos, SUM(monto_anual) AS Monto_total FROM PATROCINIOS GROUP BY tipo_contrato ORDER BY Monto_total DESC; -- 25
SELECT gano, COUNT(*) AS Cantidad_registros, ROUND(AVG(kills),0) AS Promedio_kills, ROUND(AVG(puntaje_combate),0) AS Promedio_ptjCombate FROM PARTICIPACIONES GROUP BY gano; -- 26
SELECT equipo_id, COUNT(*) AS Cantidad_jugadores, MIN(sueldo_mensual) AS Sueldo_minimo, MAX(sueldo_mensual) AS Sueldo_maximo, SUM(sueldo_mensual) AS Total_sueldos FROM JUGADORES GROUP BY equipo_id ORDER BY Total_sueldos DESC; -- 27
SELECT e.nombre AS NOMBRE_EQUIPO, e.tag, e.presupuesto_anual, r.nombre AS NOMBRE_DE_REGION FROM EQUIPOS e JOIN REGIONES r ON e.id = r.id; -- 28
SELECT j.nickname, j.sueldo_mensual, e.nombre AS Nombre_Equipo FROM JUGADORES j JOIN EQUIPOS e ON j.id = e.id; -- 29
SELECT p.id, p.fase, p.fecha_partida, p.duracion_min, m.nombre AS Nombre_mapa FROM PARTIDAS p JOIN MAPAS m ON p.id = m.id; -- 30
SELECT e.nombre AS Nombre_Equipo, p.nombre AS Nombre_Patrocinador, pt.tipo_contrato, pt.monto_anual FROM PATROCINIOS pt JOIN EQUIPOS e ON pt.equipo_id = e.id JOIN PATROCINADORES p ON pt.patrocinador_id = p.id; -- 31
SELECT j.nickname AS NICKNAME, e.nombre AS NOMBRE_EQUIPO, r.nombre AS NOMBRE_REGION FROM JUGADORES j JOIN EQUIPOS e ON j.equipo_id = e.id JOIN REGIONES r ON e.region_id = r.id; -- 32
SELECT j.nickname AS JUGADOR, a.nombre AS AGENTE, a.rol AS ROL, p.kills AS KILLS, p.puntaje_combate AS PUNTAJE_COMBATE FROM PARTICIPACIONES p JOIN JUGADORES j ON p.jugador_id = j.id JOIN AGENTES a ON p.agente_id = a.id ORDER BY p.kills DESC; -- 33
SELECT j.nickname AS JUGADOR, g.fase AS FASE, m.nombre AS MAPA, p.kills AS KILLS FROM PARTICIPACIONES p JOIN JUGADORES j ON p.jugador_id = j.id JOIN PARTIDAS g ON p.partida_id = g.id JOIN MAPAS m ON g.mapa_id = m.id WHERE g.fase LIKE '%Gran Final%'; -- 34
SELECT r.nombre AS REGION, SUM(e.presupuesto_anual) AS PRESUPUESTO_TOTAL FROM EQUIPOS e JOIN REGIONES r ON e.region_id = r.id GROUP BY r.nombre ORDER BY PRESUPUESTO_TOTAL DESC; -- 35
SELECT e.nombre AS EQUIPO, COUNT(p.equipo_id) AS CANT_PATROCINIOS, SUM(p.monto_anual) AS MONTO_ANUAL_TOTAL FROM PATROCINIOS p JOIN EQUIPOS e ON p.equipo_id = e.id GROUP BY e.nombre ORDER BY MONTO_ANUAL_TOTAL DESC; -- 36
SELECT j.nickname AS JUGADOR, COUNT(p.partida_id) AS PARTIDAS_JUGADAS, SUM(p.kills) AS TOTAL_KILLS, ROUND(AVG(p.puntaje_combate),0) AS PROMEDIO_PTJ_COMBATE FROM PARTICIPACIONES p JOIN JUGADORES j ON p.jugador_id = j.id GROUP BY j.nickname ORDER BY TOTAL_KILLS DESC; -- 37
SELECT ag.nombre AS AGENTE, ag.rol AS ROL, COUNT(p.agente_id) AS VECES_JUGADO, ROUND(AVG(p.kills),0) AS KILLS_PROMEDIO FROM PARTICIPACIONES p JOIN AGENTES ag ON p.agente_id = ag.id GROUP BY ag.nombre ORDER BY VECES_JUGADO DESC; -- 38
SELECT m.nombre AS MAPA, COUNT(p.mapa_id) AS VECES_JUGADO, ROUND(AVG(p.duracion_min),1) AS DURACION_PROMEDIO FROM PARTIDAS p JOIN MAPAS m ON p.mapa_id = m.id GROUP BY m.nombre ORDER BY DURACION_PROMEDIO DESC; -- 39
SELECT e.nombre AS EQUIPO, SUM(p.kills) AS TOTAL_KILLS FROM PARTICIPACIONES p JOIN EQUIPOS e ON ;


SELECT  j.NICKNAME, e.NOMBRE, p.KILLS, pa.fecha_partida FROM PARTICIPACIONES  p 
JOIN JUGADORES j ON p.jugador_id = j.id 
JOIN EQUIPOS e ON e.id = j.equipo_id
JOIN PARTIDAS pa ON pa.id = p.partida_id
WHERE p.GANO = 'S' ORDER BY p.KILLS DESC
; 