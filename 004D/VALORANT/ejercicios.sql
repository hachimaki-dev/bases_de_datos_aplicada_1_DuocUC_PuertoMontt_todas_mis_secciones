/******  PARTE 1 - SELECT Y ALIAS  ******/
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


/******  PARTE 2 - WHERE  ******/
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


/******  PARTE 3 - ORDER BY  ******/
--  14 Mostrar el nombre, tag y presupuesto_anual de los equipos, del mayor al menor presupuesto.
SELECT NOMBRE, TAG, PRESUPUESTO_ANUAL FROM EQUIPOS ORDER BY PRESUPUESTO_ANUAL DESC;
 
--  15 Mostrar el nickname, edad y nombre_real de los jugadores, desde el más joven al de mayor edad.
SELECT NICKNAME, EDAD, NOMBRE_REAL FROM JUGADORES ORDER BY EDAD;
 
--  16 Mostrar pais_natal, nickname y sueldo_mensual de los jugadores, ordenados por país natal (A–Z) y, en caso de empate, por sueldo de mayor a menor.
SELECT PAIS_NATAL, NICKNAME, SUELDO_MENSUAL FROM JUGADORES ORDER BY PAIS_NATAL, SUELDO_MENSUAL DESC;
 
--  17 Mostrar todas las partidas ordenadas desde la fecha más reciente a la más antigua.
SELECT * FROM PARTIDAS ORDER BY FECHA_PARTIDA DESC;
 
--  18 Mostrar las participaciones ganadas (gano = 'S'), proyectando jugador_id, partida_id, kills y puntaje_combate, ordenadas por puntaje_combate de mayor a menor.
SELECT J.NICKNAME, P.JUGADOR_ID, P.PARTIDA_ID, P.KILLS, P.PUNTAJE_COMBATE 
FROM PARTICIPACIONES P
JOIN JUGADORES J ON J.ID = P.JUGADOR_ID 
WHERE GANO = 'S' ORDER BY PUNTAJE_COMBATE DESC;
 
--  19 Mostrar los registros de patrocinios ordenados por tipo_contrato (A–Z) y luego por monto_anual de mayor a menor.
SELECT * FROM PATROCINIOS ORDER BY TIPO_CONTRATO, MONTO_ANUAL DESC;


/******  PARTE 4 - GROUP BY  ******/
--  20 Calcular en una sola fila la cantidad total de jugadores, el sueldo promedio, el sueldo mínimo y el sueldo máximo.
SELECT COUNT(*) AS TOTAL_JUGADORES, 
       ROUND(AVG(SUELDO_MENSUAL), 2) AS SUELDO_PROMEDIO, 
       MIN(SUELDO_MENSUAL) AS SUELDO_MINIMO, 
       MAX(SUELDO_MENSUAL) AS SUELDO_MAXIMO 
FROM JUGADORES;
 
--  21 Mostrar cuántos agentes existen por cada rol.
SELECT ROL, COUNT(*) AS CANTIDAD_AGENTES FROM AGENTES GROUP BY ROL;
 
--  22 Mostrar cuántos jugadores hay por cada pais_natal, ordenando de mayor a menor cantidad.
SELECT PAIS_NATAL, COUNT(*) AS CANTIDAD_JUGADORES FROM JUGADORES
GROUP BY PAIS_NATAL
ORDER BY CANTIDAD_JUGADORES DESC;
 
--  23 Por cada fase en la tabla partidas, mostrar cuántas partidas se jugaron, la duración promedio y el total de público acumulado.
SELECT FASE,
       COUNT(*) AS CANTIDAD_PARTIDAS,
       ROUND(AVG(DURACION_MIN), 2) AS DURACION_PROMEDIO,
       SUM(ASISTENCIA_PUBLICO) AS PUBLICO_ACUMULADO
FROM PARTIDAS
GROUP BY FASE;
 
--  24 Mostrar cuántos patrocinadores existen por cada rubro.
SELECT RUBRO,
       COUNT(*) AS CANTIDAD_PATROCINADORES
FROM PATROCINADORES
GROUP BY RUBRO;

--  25 En patrocinios, mostrar por cada tipo_contrato la cantidad de contratos y la suma de monto_anual, ordenado de mayor a menor monto total.
SELECT TIPO_CONTRATO,
       COUNT(*) AS CANTIDAD_DE_CONTRATOS,
       SUM(MONTO_ANUAL) AS SUMA_MONTO_ANUAL
FROM PATROCINIOS
GROUP BY TIPO_CONTRATO
ORDER BY SUMA_MONTO_ANUAL DESC;
 
--  26 En participaciones, agrupar por gano (S o N) y mostrar la cantidad de registros, el promedio de kills y el promedio de puntaje_combate.
SELECT GANO,
       COUNT(*) AS CANTIDAD_REGISTROS,
       ROUND(AVG(KILLS), 2) AS PROMEDIO_KILLS,
       ROUND(AVG(PUNTAJE_COMBATE), 2) AS PROMEDIO_PUNTAJE_COMBATE
FROM PARTICIPACIONES
GROUP BY GANO;
 
--  27 En jugadores, mostrar por cada equipo_id la cantidad de jugadores, el sueldo mínimo, el sueldo máximo y la suma de sueldos.
SELECT EQUIPO_ID,
       COUNT(*) AS CANTIDAD_JUGADORES,
       MIN(SUELDO_MENSUAL) AS SUELDO_MINIMO,
       MAX(SUELDO_MENSUAL) AS SUELDO_MAXIMO,
       SUM(SUELDO_MENSUAL) AS TOTAL_SUELDOS
FROM JUGADORES
GROUP BY EQUIPO_ID;

/******  PARTE 5 - JOIN  ******/
--  28 Mostrar el nombre del equipo, su tag, su presupuesto_anual y el nombre de la región a la que pertenece.
SELECT E.NOMBRE AS NOMBRE_EQUIPO, E.TAG, E.PRESUPUESTO_ANUAL, R.NOMBRE AS NOMBRE_REGION
FROM EQUIPOS E
JOIN REGIONES R ON R.ID = E.REGION_ID; 

--  29 Mostrar el nickname del jugador, su sueldo_mensual y el nombre de su equipo, ordenado por equipo (A–Z) y sueldo de mayor a menor.
SELECT J.NICKNAME, J.SUELDO_MENSUAL, E.NOMBRE AS EQUIPO
FROM JUGADORES J
JOIN EQUIPOS E ON E.ID = J.EQUIPO_ID
ORDER BY E.NOMBRE, J.SUELDO_MENSUAL DESC;

--  30 Mostrar el id de la partida, la fase, la fecha_partida, la duracion_min y el nombre del mapa jugado.
SELECT P.ID, P.FASE, P.FECHA_PARTIDA, P.DURACION_MIN, M.NOMBRE AS NOMBRE_MAPA
FROM PARTIDAS P
JOIN MAPAS M ON M.ID = P.MAPA_ID;

--  31 Mostrar el nombre del equipo, el nombre del patrocinador, el tipo_contrato y el monto_anual.

 
--  32 Mostrar el nickname del jugador, el nombre de su equipo y el nombre de la región a la que pertenece ese equipo.

 
--  33 Mostrar el nickname del jugador, el nombre del agente utilizado, su rol, las kills y el puntaje_combate en cada participación, ordenado por kills de mayor a menor.

 
--  34 Mostrar el nickname del jugador, la fase de la partida, el nombre del mapa y las kills logradas únicamente en la 'Gran Final'.


/******  PARTE 6 - INTEGRACIONES  ******/
--  35 Mostrar el nombre de cada región y la suma de presupuesto_anual de sus equipos, ordenado de mayor a menor presupuesto total.


--  36 Mostrar el nombre de cada equipo, cuántos patrocinios tiene y el monto total anual que recibe por patrocinios, ordenado de mayor a menor monto.

 
--  37 Mostrar el nickname de cada jugador, cuántas partidas jugó, el total de kills acumuladas y su promedio de puntaje_combate, ordenado por total de kills de mayor a menor.

 
--  38 Mostrar el nombre de cada agente, su rol, cuántas veces fue elegido y el promedio de kills obtenido con él, ordenado desde el más elegido al menos elegido.

 
--  39 Mostrar el nombre de cada mapa, cuántas partidas se jugaron en él y la duración promedio de esas partidas, ordenado de mayor a menor duración promedio.

 
--  40 Mostrar el nombre de cada equipo y el total de kills logradas por sus jugadores únicamente en las participaciones ganadas (gano = 'S'), ordenado de mayor a menor.