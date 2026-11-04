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