Drop table Consola cascade constraint;
Drop table Franquicia cascade constraint;
drop table Videojuego cascade constraint;
drop table Jugador cascade constraint; 

create table Consola(
    id_consola number(4) primary key,
    nombre_consola varchar2(60) not null unique,
    tipo_consola varchar2(20) not null check(tipo_consola in ('SOBREMESA' , 'PORTATIL' , 'HIBRIDO')),
    anio_lanzamiento number(4) not null check(anio_lanzamiento Between 1983 and 2030),
    precio_referencia_usd number(6,2) not null check(precio_referencia_usd > 0),
    estado_fabricacion varchar2(15) default not null check(estado_fabricacion in('ACTIVA' , 'DESCONTINUADO'))
);

create table Franquicia(
    id_franquicia number(4) primary key,
    nombre_franquicia varchar2(60) not null unique,
    creador_princiapal varchar2(80) null,
    anio_debut number(4) not null check(anio_debut > 1980 and 2030),
    estudio_principal varchar2(60) default not null check ('Nintendo EPD')   
);

create table Videojuego(
    id_juego number(4) primary key,
    codigo_catalogo varchar2(10) not null unique,
    titulo varchar2(100) not null,
    if_francquicia number(4) references Franquicia(id_franquicia) not null,
    id_consola number(4) references Consola(id_consola) not null,
    clasificacion_esrb varchar2(25) not null check(clasificacion_esrb in ('E' , 'E10+', 'T', 'M')),
    precio_clp number(8) not null check(precio_clp > 0),
    puntaje_metacritic number(3) null check(puntaje_metacritic between 0 and 100),
    stock_fisico number(5) default not null check(stock_fisico > 0),
    fecha_lanzamaniento date not null 
); 

Alter table Videojuego ADD(
    descuento_procentaje number(3) default 0 not null check(descuento_procentaje between 0 and 80)
);

alter table Jugador ADD ( 
    fecha_registro date default SYSDATE NOT NULL
);

alter table Jugador ADD(
    nivel_cuenta number(3) default 1 not null check(nivel_cuenta between 1 and 99)
);

create table Jugador(
    id_jugador number(6) primary key,
    nickname varchar2(30) not null unique,
    email varchar(100) not null unique,
    pais varchar2(40) default not null,
    monedas_oro number(4) default not null check(monedas_oro > 0),
    suscipcion_online varchar2(15) default not null check(suscipcion_online in ('Gratuita' , 'Individual' , 'Familiar', 'Expansion')),
    id_juego_favorito number(6) references Videojuego(id_juego) null
);

ALTER TABLE accesorio_prueba
MODIFY nombre_accesorio VARCHAR2(100);

ALTER TABLE accesorio_prueba
ADD color_edicion VARCHAR2(25);

ALTER TABLE accesorio_prueba
DROP COLUMN color_edicion;

drop table accesorio_prueba;

create table accesorios_prueba(
    id_accesorios number(4) primary key,
    nombre_accesrios varchar2(20) not null unique,
    precios_usd number(5,2) not null check(precios_usd > 0),
    id_consola number(4) references Consola(id_consola) not null
);

select * from Jugador;
select * from Videojuego;
select * from Franquicia;
select * from Consola;