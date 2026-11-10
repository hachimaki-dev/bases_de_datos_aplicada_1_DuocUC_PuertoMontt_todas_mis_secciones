-- == PARTE 1: SELECT y AS ==
-- 1. Mostrar todas las columnas y filas de la tabla regiones.
SELECT * FROM regiones;

-- 2. Mostrar únicamente el nombre, el rol y el origen_lore de todos los agentes.
SELECT nombre, rol, origen_lore FROM agentes;

-- 3. Mostrar el nickname, nombre_real y sueldo_mensual de los jugadores con los alias jugador, nombre_completo y salario_usd.
SELECT nickname AS jugador, nombre_real AS nombre_completo, sueldo_mensual AS salario_usd FROM jugadores;

-- 4. Mostrar el nickname, el sueldo_mensual y una columna calculada llamada sueldo_anual (sueldo_mensual * 12).
SELECT nickname, sueldo_mensual, sueldo_mensual * 12 AS sueldo_anual FROM jugadores;

-- 5. Mostrar el nombre del equipo, su tag y su presupuesto_anual dividido entre 1000000 con el alias presupuesto_millones.
SELECT nombre, tag, presupuesto_anual / 1000000 AS presupuesto_millones FROM equipos;

-- 6. En participaciones, mostrar id, kills, assists, deaths y la suma de kills + assists bajo el alias participacion_ofensiva.
SELECT id, kills, assists, deaths, kills + assists AS participacion_ofensiva FROM participaciones;


-- == PARTE 2: WHERE ==
-- 7. Mostrar el nickname, pais_natal y sueldo_mensual de los jugadores de 'Chile'.
SELECT nickname, pais_natal, sueldo_mensual FROM jugadores WHERE pais_natal = 'Chile';

-- 8. Mostrar el nickname, edad y sueldo_mensual de los jugadores que ganen más de 25000 mensuales.
SELECT nickname, edad, sueldo_mensual FROM jugadores WHERE sueldo_mensual >= 25000;

-- 9. Mostrar el nombre y ambientacion de los mapas que tengan 3 sitios de bomba.
SELECT nombre, ambientacion FROM mapas WHERE sitios_bomba = 3;

-- 10. Mostrar el nickname, edad y sueldo_mensual de los jugadores que tengan entre 19 y 22 años inclusive.
SELECT nickname, edad, sueldo_mensual FROM jugadores WHERE edad BETWEEN 19 AND 22;

-- 11. Mostrar el nickname y pais_natal de los jugadores de 'Brasil', 'Canada' o 'Rusia'.
SELECT nickname, pais_natal FROM jugadores WHERE pais_natal = 'Brasil' OR pais_natal = 'Canada' OR pais_natal = 'Rusia';

-- 12. Mostrar los agentes cuyo rol sea 'Duelista' o 'Iniciador' y cuyo origen_lore sea distinto de 'Desconocido'.
SELECT * FROM agentes WHERE rol ='Duelista' OR rol = 'Iniciador' AND origen_lore <> 'Desconocido';

-- 13. Mostrar las partidas cuya fase contenga la palabra 'Final' y tengan una asistencia_publico superior a 10000.
SELECT * FROM partidas WHERE fase = 'Gran Final' AND asistencia_publico > 10000;


-- == PARTE 3: ORDER BY ==
-- 14. Mostrar el nombre, tag y presupuesto_anual de los equipos, del mayor al menor presupuesto.
SELECT nombre, tag, presupuesto_anual FROM equipos ORDER BY presupuesto_anual DESC;

-- 15. Mostrar el nickname, edad y nombre_real de los jugadores, desde el más joven al de mayor edad.
SELECT nickname, edad, nombre_real FROM jugadores ORDER BY edad;

-- 16. Mostrar pais_natal, nickname y sueldo_mensual de los jugadores, ordenados por país natal (A–Z) y, en caso de empate, por sueldo de mayor a menor.
SELECT pais_natal, nickname, sueldo_mensual FROM jugadores ORDER BY pais_natal, sueldo_mensual DESC;

-- 17. Mostrar todas las partidas ordenadas desde la fecha más reciente a la más antigua.
SELECT * FROM partidas ORDER BY fecha_partida DESC;

-- 18. Mostrar las participaciones ganadas (gano = 'S'), proyectando jugador_id, partida_id, kills y puntaje_combate, ordenadas por puntaje_combate de mayor a menor.
SELECT jugador_id, partida_id, kills, puntaje_combate FROM participaciones WHERE gano = 'S' ORDER BY puntaje_combate DESC;

-- 19. Mostrar los registros de patrocinios ordenados por tipo_contrato (A–Z) y luego por monto_anual de mayor a menor.
SELECT * FROM patrocinios ORDER BY tipo_contrato, monto_anual DESC;


-- == PARTE 4: GROUP BY ==
-- 20 Calcular en una sola fila la cantidad total de jugadores, el sueldo promedio, el sueldo mínimo y el sueldo máximo.
SELECT COUNT(*), AVG(sueldo_mensual), MIN(sueldo_mensual), MAX(sueldo_mensual) FROM jugadores;

-- 21 Mostrar cuántos agentes existen por cada rol.
SELECT rol, SUM(rol) FROM agentes ORDER BY rol;

-- 22 Mostrar cuántos jugadores hay por cada pais_natal, ordenando de mayor a menor cantidad.
SELECT COUNT(pais_natal) AS cantidad_registro FROM jugadores ORDER BY pais_natal DESC;

-- 23 Por cada fase en la tabla partidas, mostrar cuántas partidas se jugaron, la duración promedio y el total de público acumulado.


-- 24 Mostrar cuántos patrocinadores existen por cada rubro.


-- 25 En patrocinios, mostrar por cada tipo_contrato la cantidad de contratos y la suma de monto_anual, ordenado de mayor a menor monto total.


-- 26 En participaciones, agrupar por gano (S o N) y mostrar la cantidad de registros, el promedio de kills y el promedio de puntaje_combate.


-- 27 En jugadores, mostrar por cada equipo_id la cantidad de jugadores, el sueldo mínimo, el sueldo máximo y la suma de sueldos.



-- == PARTE 5: JOIN ==
-- 28 Mostrar el nombre del equipo, su tag, su presupuesto_anual y el nombre de la región a la que pertenece.


-- 29 Mostrar el nickname del jugador, su sueldo_mensual y el nombre de su equipo, ordenado por equipo (A–Z) y sueldo de mayor a menor.


-- 30 Mostrar el id de la partida, la fase, la fecha_partida, la duracion_min y el nombre del mapa jugado.


-- 31 Mostrar el nombre del equipo, el nombre del patrocinador, el tipo_contrato y el monto_anual.


-- 32 Mostrar el nickname del jugador, el nombre de su equipo y el nombre de la región a la que pertenece ese equipo.


-- 33 Mostrar el nickname del jugador, el nombre del agente utilizado, su rol, las kills y el puntaje_combate en cada participación, ordenado por kills de mayor a menor.


-- 34 Mostrar el nickname del jugador, la fase de la partida, el nombre del mapa y las kills logradas únicamente en la 'Gran Final'.


-- == PARTE 6: Integradores ==
-- 35 Mostrar el nombre de cada región y la suma de presupuesto_anual de sus equipos, ordenado de mayor a menor presupuesto total.


-- 36 Mostrar el nombre de cada equipo, cuántos patrocinios tiene y el monto total anual que recibe por patrocinios, ordenado de mayor a menor monto.


-- 37 Mostrar el nickname de cada jugador, cuántas partidas jugó, el total de kills acumuladas y su promedio de puntaje_combate, ordenado por total de kills de mayor a menor.


-- 38 Mostrar el nombre de cada agente, su rol, cuántas veces fue elegido y el promedio de kills obtenido con él, ordenado desde el más elegido al menos elegido.


-- 39 Mostrar el nombre de cada mapa, cuántas partidas se jugaron en él y la duración promedio de esas partidas, ordenado de mayor a menor duración promedio.


-- 40 Mostrar el nombre de cada equipo y el total de kills logradas por sus jugadores únicamente en las participaciones ganadas (gano = 'S'), ordenado de mayor a menor.