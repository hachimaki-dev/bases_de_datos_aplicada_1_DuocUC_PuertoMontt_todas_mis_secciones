SELECT *
FROM jugadores;



SELECT nickname, NOMBRE_REAL
FROM jugadores;



SELECT nickname, edad * sueldo_mensual from JUGADORES;

SELECT nickname, 12 * sueldo_mensual AS SUELDO_ANUAL FROM JUGADORES;


[
    {
        'nickname' : 'keznit',
        'sueldo_anual' : 174000
    },
    {
        'nickname' : 'Mazino',
        'sueldo_anual' : 168000
    }
];


SELECT * FROM JUGADORES WHERE PAIS_NATAL = 'Chile';
SELECT * FROM JUGADORES WHERE EDAD = 23;
SELECT * FROM JUGADORES WHERE EDAD > 23;

SELECT * FROM JUGADORES WHERE EDAD <= 23 AND PAIS_NATAL = 'Chile';

SELECT nickname, NOMBRE_REAL FROM JUGADORES WHERE EDAD <= 23 AND PAIS_NATAL = 'Brazil';

SELECT * FROM JUGADORES WHERE EDAD >= 19 AND PAIS_NATAL = 'Chile';