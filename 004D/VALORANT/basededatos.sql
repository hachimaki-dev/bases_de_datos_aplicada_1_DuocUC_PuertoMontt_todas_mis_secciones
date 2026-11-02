SELECT * FROM regiones;
SELECT nombre, rol, origen_lore FROM agentes;
SELECT nickname AS jugador, nombre_real AS nombre_completo, sueldo_mensual AS salario_usd FROM jugadores;
SELECT nickname, sueldo_mensual, (sueldo_mensual * 12) AS sueldo_anual FROM jugadores;
SELECT nombre, tag, (presupuesto_anual / 1000000) AS presupuesto_millones FROM equipos;
