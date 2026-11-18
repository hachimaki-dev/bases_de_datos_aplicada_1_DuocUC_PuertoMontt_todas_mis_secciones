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
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL
);

CREATE TABLE marcas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre   VARCHAR2(40) NOT NULL
);

CREATE TABLE categorias (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    porcentaje NUMBER(4, 1) NOT NULL CHECK (porcentaje > 0)
);

CREATE TABLE zonas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL UNIQUE,
    porc NUMBER(4, 2) NOT NULL CHECK (porc > 0)
);

CREATE TABLE  clientes (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(60) NOT NULL,
    direccion VARCHAR2(60) NOT NULL,
    telefono VARCHAR2(15) NOT NULL UNIQUE,
    id_comuna REFERENCES comunas(id) NOT NULL
);

CREATE TABLE articulos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(60) NOT NULL,
    precio NUMBER(8) NOT NULL CHECK (precio > 0),
    stock_actual NUMBER(5) NOT NULL,
    stock_minimo NUMBER(5) NOT NULL,
    id_marca REFERENCES marcas(id) NOT NULL
);

CREATE TABLE vendedores (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut VARCHAR2(12) NOT NULL,
    nombres VARCHAR2(30) NOT NULL,
    apellido_p VARCHAR2(30) NOT NULL,
    apellido_m VARCHAR2(30),
    fecha_nacimiento DATE NOT NULL,
    fecha_contrato DATE NOT NULL,
    sueldo NUMBER(8) NOT NULL, 
    comision NUMBER(4, 2) NOT NULL,
    id_zona REFERENCES zonas(id),
    id_categorias REFERENCES categorias(id) NOT NULL
);

CREATE TABLE facturas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente REFERENCES clientes(id) NOT NULL,
    id_vendedor REFERENCES vendedores(id) NOT NULL,
    fecha_factura DATE NOT NULL
);

CREATE TABLE detalle_factura (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_factura REFERENCES facturas(id) NOT NULL,
    id_articulo REFERENCES articulos(id) NOT NULL,
    cantidad NUMBER(4) NOT NULL CHECK (cantidad > 0)
);

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
-- Y LA TABLA FALTANTE DETALLE_FACTURA: