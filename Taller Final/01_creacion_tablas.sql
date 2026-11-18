-- ============================================================================
-- ANEXO 1: SCRIPT BASE INCOMPLETO — CASO TIENDA AKIBASUR
-- Importante: Corrija los tipos de datos y restricciones de las 4 tablas base
-- y agregue las sentencias CREATE TABLE faltantes.
-- ============================================================================

DROP TABLE detalle_factura CASCADE CONSTRAINTS;
DROP TABLE facturas CASCADE CONSTRAINTS;
DROP TABLE vendedores CASCADE CONSTRAINTS;
DROP TABLE articulos CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE zonas CASCADE CONSTRAINTS;
DROP TABLE categorias CASCADE CONSTRAINTS;
DROP TABLE marcas CASCADE CONSTRAINTS;
DROP TABLE comunas CASCADE CONSTRAINTS;

CREATE TABLE comunas (
    id          NUMBER  GENERATED ALWAYS as IDENTITY(start with 1000 increment by 10) PRIMARY KEY,
    nom_comuna  VARCHAR2(40) NOT NULL
);

CREATE TABLE marcas (
    id          NUMBER  GENERATED ALWAYS as IDENTITY PRIMARY KEY,
    nom_marca   VARCHAR2(40) NOT NULL
);

CREATE TABLE categorias (
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(5,2)    NOT NULL
);

CREATE TABLE zonas (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona  VARCHAR2(40)  NOT NULL,
    porc      NUMBER(5,2)    NOT NULL
);

CREATE TABLE CLIENTES (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_cliente  VARCHAR2(60) NOT NULL,
    direccion varchar2(60) not null,
    telefono varchar2(15) not NULL,
    comuna_id NUMBER not null REFERENCES comunas(ID)
);

CREATE TABLE ARTICULOS (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_articulo  VARCHAR2(50) NOT NULL,
    precio NUMBER(8) not null check(precio>0),
    stock_actual NUMBER(5) not null check(stock_actual > 10),
    stock_minimo number(5) not null check(stock_minimo > 0),
    marca_id number not null REFERENCES marcas(id)
);

create table vendedores (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut_vendedor varchar2(12) not null UNIQUE,
    nombres VARCHAR2(30) not null,
    paterno VARCHAR2(30) not null,
    materno VARCHAR2(30) ,
    fec_nac date not null,
    fec_contrato date not null,
    sueldo number(8) not null,
    comision number(4,2) not null,
    zona_id number REFERENCES zonas(id),
    categoria_id number not null REFERENCES categorias(id)
);

create table facturas (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id number not null REFERENCES clientes(id),
    vendedor_id number not null REFERENCES vendedores(id),
    fecha_factura date default SYSDATE not null 
);

create table detalle_factura(
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura_id number not null REFERENCES facturas(id),
    articulo_id number not null REFERENCES articulos(id),
    cantidad number(8) not null
);

commit;

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
-- Y LA TABLA FALTANTE DETALLE_FACTURA: