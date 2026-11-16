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
    id          NUMBER,
    nom_comuna  VARCHAR2(40) NOT NULL
);

CREATE TABLE marcas (
    id          NUMBER,
    nom_marca   VARCHAR2(40) NOT NULL
);

CREATE TABLE categorias (
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(2)    NOT NULL
);

CREATE TABLE zonas (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona  VARCHAR2(4)  NOT NULL,
    porc      NUMBER(2)    NOT NULL
);

CREATE TABLE CLIENTES (
    id NUMBER,
    nombre_cliente VARCHAR2 (60),
    direccion VARCHAR(60),
    telefono VARCHAR2(15),

    comuna_id NUMBER REFERENCES COMUNA(id)
);

CREATE TABLE ARTICULOS (
    id NUMBER,
    nom_articulo VARCHAR2(50),
    precio NUMBER(8),
    stock_actual NUMBER(5),
    stock_minimo NUMBER(5),

    marca_id NUMBER REFERENCES marcas (id)
);

CREATE TABLE VENDEDORES (
    id NUMBER,
    rut_vendedor VARCHAR2(12),
    nombres VARCHAR2(30),
    materno VARCHAR2(30),
    paterno VARCHAR2(30),
    fec_nacimiento DATE,
    fec_contrato DATE,
    sueldo NUMBER(8),
    comision NUMBER(4,2),

    zona_id NUMBER REFERENCES zonas(id),
    categoria_id NUMBER REFERENCES categorias(id)
);

CREATE TABLE FACTURAS (

    id NUMBER,

    cliente_id NUMBER REFERENCES CLIENTES(id),
    vendedor_id NUMBER REFERENCES VENDEDORES(id),
    fecha_factura DATE

);

CREATE TABLE DETALLE_FACTURA (

    id NUMBER,


    FACTURA_ID NUMBER REFERENCES FACTURAS(id),
    ARTICULO_ID NUMBER REFERENCES ARTICULOS(id),
    cantidad NUMBER(3)
);

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
-- Y LA TABLA FALTANTE DETALLE_FACTURA: