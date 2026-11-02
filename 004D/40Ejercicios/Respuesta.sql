SELECT * FROM regiones;

SELECT nombre, ROL, origen_lore from AGENTES;

SELECT nickname, nombre_real, sueldo_mensual AS alias from JUGADORES;

SELECT nickname, sueldo_mensual, sueldo_mensual * 12 AS sueldo_anual;

SELECT NOMBRE, TAG, presupuesto_anual / 1000000 as presupuesto_millones FROM EQUIPOS;

SELECT ID, KILLS, assists, deaths, kills + assists AS participacioN_OFENSIVA FROM PARTICIPACIONES;

SELECT NICKNAME, PAIS_NATAL, sueldo_mensual FROM JUGADORES WHERE PAIS_NATAL = 'Chile';