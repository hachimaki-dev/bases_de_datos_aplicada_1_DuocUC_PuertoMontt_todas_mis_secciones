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
    id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_comuna  VARCHAR2(40) UNIQUE NOT NULL 
);

CREATE TABLE marcas (
    id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_marca   VARCHAR2(40) UNIQUE  NOT NULL
);

CREATE TABLE categorias (
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(4,1)   NOT NULL CHECK (porcentaje > 0)
);

CREATE TABLE zonas (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona  VARCHAR2(40)  UNIQUE  NOT NULL,
    porc      NUMBER(4,2)    NOT NULL CHECK (porc > 0)
);

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
CREATE TABLE clientes (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    nombre_cliente VARCHAR2(60) NOT NULL ,
    direccion VARCHAR2(60) NOT NULL ,
    telefono VARCHAR2(15) NOT NULL , 
    id_comunaNOT NUMBER NOT NULL REFERENCES comunas(id)
);

CREATE TABLE articulos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    nom_articulo VARCHAR2(50) NOT NULL,
    precio NUMBER(8) NOT NULL ,
    stock_mensual NUMBER(5) NOT NULL ,
    stock_minimo NUMBER(5) NOT NULL ,
    id_marca NUMBER NOT NULL REFERENCES marcas(id)
);

CREATE TABLE vendedores (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    rut_vendedor VARCHAR2(12) NOT NULL ,
    nombres VARCHAR2(30) NOT NULL ,
    apellido_paterno VARCHAR2(30) NOT NULL ,
    apellido_materno VARCHAR2(30) ,
    fec_nac DATE NOT NULL , 
    fec_contrato DATE NOT NULL , 
    sueldo NUMBER(8) NOT NULL ,
    comision NUMBER(4,2) NOT NULL , 
    id_zona  NUMBER REFERENCES zonas(id) ,
    id_categoria NUMBER NOT NULL REFERENCES categorias(id)
);

CREATE TABLE facturas(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    id_cliente NUMBER  NOT NULL REFERENCES clientes(id) , 
    id_vendedor NUMBER NOT NULL REFERENCES vendedores(id) ,
    fec_factura DATE NOT NULL    
);

CREATE TABLE detalle_factura(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    id_factura NUMBER NOT NULL REFERENCES facturas(id) ,
    id_articulos NUMBER NOT NULL REFERENCES articulos(id) ,
    cantidad NUMBER(4) NOT NULL CHECK (cantidad > 0)
);