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