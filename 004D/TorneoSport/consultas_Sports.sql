--Mostrar todas las columnas y filas de la tabla regiones
SELECT * FROM REGIONES;

--Mostrar únicamente el nombre, el rol y el origen_lore de todos los agentes

SELECT  NOMBRE, ROL, ORIGEN_LORE FROM  AGENTES;

-- Mostrar el nickname, nombre_real y sueldo_mensual de los jugadores con los alias jugador, nombre_completo y salario_usd.

SELECT NICKNAME, NOMBRE_REAL, SUELDO_MENSUAL AS ALIAS_JUGADOR FROM JUGADORES;