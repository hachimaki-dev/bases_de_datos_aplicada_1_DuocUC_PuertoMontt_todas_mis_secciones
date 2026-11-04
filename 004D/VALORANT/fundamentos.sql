SELECT * FROM agentes WHERE rol IN ('Duelista', 'Centinela', 'Controlador');
SELECT * FROM agentes WHERE rol = 'Duelista' OR rol = 'Centinela' OR rol = 'Controlador';

SELECT * FROM jugadores WHERE UPPER(nickname) LIKE '%Z%';

DROP TABLE chanchitos_clever CASCADE CONSTRAINTS;

CREATE TABLE chanchitos_clever (
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100)
);

INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Panchito', 'Moena');
INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Pankito', 'Dierter');
INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Benjita', NULL);
INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Gabusita', NULL);
INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Amaro', 'Neutron');
INSERT INTO chanchitos_clever (nombre, apellido) VALUES ('Charly', NULL);

SELECT * FROM chanchitos_clever WHERE apellido IS NULL;
SELECT * FROM chanchitos_clever WHERE apellido IS NOT NULL;

SELECT * FROM jugadores ORDER BY edad;
SELECT * FROM jugadores ORDER BY edad DESC;
SELECT * FROM jugadores ORDER BY nickname;
SELECT * FROM jugadores ORDER BY pais_natal;
SELECT * FROM jugadores ORDER BY pais_natal, edad;

SELECT COUNT(*) AS cantidad_jugadores FROM jugadores;
SELECT MIN(edad) FROM jugadores;
SELECT MAX(edad) FROM jugadores;
SELECT AVG(edad) AS promedio_edad FROM jugadores;
SELECT ROUND(AVG(edad), 2) AS promedio_edad FROM jugadores;

COMMIT;