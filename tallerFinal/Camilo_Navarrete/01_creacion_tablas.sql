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
    nom_comuna VARCHAR2(40) NOT NULL
);

CREATE TABLE marcas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_marca VARCHAR2(40) NOT NULL
);

CREATE TABLE categorias (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria VARCHAR2(30) NOT NULL,
    porcentaje NUMBER(3,1) NOT NULL
);

CREATE TABLE zonas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona VARCHAR2(60) NOT NULL,
    porc NUMBER(4,2) NOT NULL
);

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
-- Y LA TABLA FALTANTE DETALLE_FACTURA:

CREATE TABLE clientes (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_cliente VARCHAR2(60) NOT NULL,
    direccion VARCHAR2(60) NOT NULL,
    --Debiese ser otra tabla // telefono VARCHAR2(15) NOT NULL,
    telefono_id NUMBER NOT NULL REFERENCES telefonos(id),
    comuna_id REFERENCES comunas(id)
)

CREATE TABLE telefonos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    num_telefono VARCHAR2(12) NOT NULL UNIQUE
)

CREATE TABLE articulos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_articulo VARCHAR2(50) NOT NULL,
    precio NUMBER(8) NOT NULL CHECK (precio > 0),
    stock_actual NUMBER(5) NOT NULL CHECK (stock_actual > 10),
    stock_minimo NUMBER(5) NOT NULL CHECK (stock_actual > 0),
    marca_id NUMBER NOT NULL REFERENCES marcas(id)
);

CREATE TABLE vendedores (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut_vendedor VARCHAR2(12) NOT NULL UNIQUE,
    nombres VARCHAR2(30) NOT NULL,
    paterno VARCHAR2(30) NOT NULL,
    materno VARCHAR2(30),
    fec_nac DATE NOT NULL,
    fec_contrato DATE NOT NULL,
    sueldo NUMBER(8) NOT NULL,
    comision NUMBER(4,2) NOT NULL,
    zona_id NUMBER REFERENCES zona(id),
    categoria_id NUMBER NOT NULL REFERENCES categorias(id)
);

CREATE TABLE facturas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER REFERENCES clientes(id),
    vendedor_id NUMBER REFERENCES vendedores(id),
    fecha_factura DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE detalle_factura (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura_id NUMBER NOT NULL REFERENCES facturas(id),
    articulo_id NUMBER NOT NULL REFERENCES articulos(id),
    cantidad NUMBER(4) NOT NULL CHECK (cantidad > 0)
);