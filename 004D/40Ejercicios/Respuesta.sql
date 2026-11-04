--1
SELECT * FROM regiones;
--2
SELECT nombre, ROL, origen_lore from AGENTES;
--3
SELECT nickname, nombre_real, sueldo_mensual AS alias from JUGADORES;
--4
SELECT nickname, sueldo_mensual, sueldo_mensual * 12 AS sueldo_anual FROM JUGADORES;
--5
SELECT NOMBRE, TAG, presupuesto_anual / 1000000 as presupuesto_millones FROM EQUIPOS;
--6
SELECT ID, KILLS, assists, deaths, kills + assists AS participacioN_OFENSIVA FROM PARTICIPACIONES;
--7
SELECT NICKNAME, PAIS_NATAL, sueldo_mensual FROM JUGADORES WHERE PAIS_NATAL = 'Chile';
--8

--9

--10

--11

--12

--13

--14
SELECT * FROM EQUIPOS ORDER BY presupuesto_anual DESC;
--15
SELECT * FROM JUGADORES ORDER BY EDAD;
--16
SELECT * FROM JUGADORES ORDER BY PAIS_NATAL ASC, SUELDO_MENSUAL DESC;
--17
SELECT * FROM PARTIDAS ORDER BY FECHA_PARTIDA DESC;
--18
SELECT * FROM PARTICIPACIONES ORDER BY PUNTAJE_COMBATE DESC;
--19
SELECT * FROM PATROCINIOS ORDER BY tipo_contrato ASC, monto_anual DESC;
--20