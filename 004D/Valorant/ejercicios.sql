-- 1 Mostrar todas las columnas y filas de la tabla regiones.
SELECT * FROM REGIONES;

-- 2 Mostrar únicamente el nombre, el rol y el origen_lore de todos los agentes.
SELECT NOMBRE, ROL, ORIGEN_LORE FROM AGENTES;

-- 3 Mostrar el nickname, nombre_real y sueldo_mensual de los jugadores con los alias jugador, nombre_completo y salario_usd.
SELECT NICKNAME AS JUGADOR, NOMBRE_REAL AS NOMBRE_COMPLETO, SUELDO_MENSUAL AS SALARIO_USD FROM JUGADORES;

-- 4 Mostrar el nickname, el sueldo_mensual y una columna calculada llamada sueldo_anual (sueldo_mensual * 12).
SELECT NICKNAME, SUELDO_MENSUAL, SUELDO_MENSUAL*12 AS SUELDO_ANUAL FROM JUGADORES;

-- 5 Mostrar el nombre del equipo, su tag y su presupuesto_anual dividido entre 1000000 con el alias presupuesto_millones.
SELECT NOMBRE, TAG, PRESUPUESTO_ANUAL/1000000 AS PRESUPUESTO_MILLONES FROM EQUIPOS;

-- 6 En participaciones, mostrar id, kills, assists, deaths y la suma de kills + assists bajo el alias participacion_ofensiva.
SELECT ID, KILLS, ASSISTS, DEATHS, KILLS+ASSISTS AS PARTICIPACION_OFENSIVA FROM PARTICIPACIONES;

--  7 Mostrar el nickname, pais_natal y sueldo_mensual de los jugadores de 'Chile'.
SELECT NICKNAME, PAIS_NATAL, SUELDO_MENSUAL FROM JUGADORES WHERE PAIS_NATAL = 'Chile';
 
--  8 Mostrar el nickname, edad y sueldo_mensual de los jugadores que ganen más de 25000 mensuales.
SELECT NICKNAME, EDAD, SUELDO_MENSUAL FROM JUGADORES WHERE SUELDO_MENSUAL > 25000;
 
--  9 Mostrar el nombre y ambientacion de los mapas que tengan 3 sitios de bomba.
SELECT NOMBRE, AMBIENTACION FROM MAPAS WHERE SITIOS_BOMBA = 3;
 
--  10 Mostrar el nickname, edad y sueldo_mensual de los jugadores que tengan entre 19 y 22 años inclusive.
SELECT NICKNAME, EDAD, SUELDO_MENSUAL FROM JUGADORES WHERE EDAD >= 19 AND EDAD <= 22;

--  11 Mostrar el nickname y pais_natal de los jugadores de 'Brasil', 'Canada' o 'Rusia'.
SELECT NICKNAME, PAIS_NATAL FROM JUGADORES WHERE PAIS_NATAL = 'Brasil' OR PAIS_NATAL = 'Canada' OR PAIS_NATAL = 'Rusia';
 
--  12 Mostrar los agentes cuyo rol sea 'Duelista' o 'Iniciador' y cuyo origen_lore sea distinto de 'Desconocido'.
SELECT * FROM AGENTES WHERE ROL = 'Duelista' OR ROL = 'Iniciador' AND ORIGEN_LORE <> 'Desconocido';
 
--  13 Mostrar las partidas cuya fase contenga la palabra 'Final' y tengan una asistencia_publico superior a 10000.
SELECT * FROM PARTIDAS WHERE FASE LIKE '%Final%' AND asistencia_publico > 10000;

--  Mostrar el nombre, tag y presupuesto_anual de los equipos, del mayor al menor presupuesto.
SELECT NOMBRE, TAG, PRESUPUESTO_ANUAL FROM EQUIPOS ORDER BY PRESUPUESTO_ANUAL DESC;

-- Mostrar el nickname, edad y nombre_real de los jugadores, desde el más joven al de mayor edad.
SELECT NICKNAME, EDAD, NOMBRE_REAL FROM JUGADORES ORDER BY EDAD;

-- Mostrar pais_natal, nickname y sueldo_mensual de los jugadores, ordenados por país natal (A–Z) y, en caso de empate, por sueldo de mayor a menor.
SELECT PAIS_NATAL, NICKNAME, SUELDO_MENSUAL FROM JUGADORES ORDER BY PAIS_NATAL, SUELDO_MENSUAL DESC;

-- Mostrar todas las partidas ordenadas desde la fecha más reciente a la más antigua.
SELECT * FROM PARTIDAS ORDER BY fecha_partida DESC;

-- #18 Mostrar las participaciones ganadas (gano = 'S'), proyectando jugador_id, partida_id, kills y puntaje_combate, ordenadas por puntaje_combate de mayor a menor.
-- SELECT jugador_id