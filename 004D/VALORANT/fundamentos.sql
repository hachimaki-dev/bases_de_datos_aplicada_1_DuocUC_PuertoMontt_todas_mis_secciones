SELECT * FROM agentes WHERE rol IN ('Duelista', 'Centinela', 'Controlador');
SELECT * FROM agentes WHERE rol = 'Duelista' OR rol = 'Centinela' OR rol = 'Controlador';