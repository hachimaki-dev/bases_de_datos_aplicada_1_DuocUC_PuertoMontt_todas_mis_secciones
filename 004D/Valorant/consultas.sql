SELECT * FROM jugadores;

SELECT nickname, nombre_real FROM JUGADORES;

SELECT nickname, EDAD * sueldo_mensual FROM JUGADORES;
SELECT nickname, EDAD * sueldo_mensual AS SUELDO_ANUAL FROM JUGADORES;

SELECT* FROM JUGADORES;

SELECT* FROM JUGADORES WHERE PAIS_NATAL = 'Chile';

SELECT * from JUGADORES WHERE EDAD > '23';
SELECT * from JUGADORES WHERE EDAD >= '23';
SELECT * from JUGADORES WHERE EDAD < '23';
SELECT * from JUGADORES WHERE EDAD <= '23';

SELECT * from JUGADORES WHERE EDAD < 23 and PAIS_NATAL = 'Chile';

SELECT * from JUGADORES where EDAD >= 19 and pais_natal = 'Chile' or pais_natal = 'Estados Unidos';










