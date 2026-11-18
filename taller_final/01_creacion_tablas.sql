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
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_comuna  VARCHAR2(40) NOT NULL unique
);

CREATE TABLE marcas (
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    nom_marca   VARCHAR2(40) NOT NULL UNIQUE
);

CREATE TABLE categorias (
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(4,2)    NOT NULL check (porcentaje > 0)
);

CREATE TABLE zonas (
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona  VARCHAR2(40)  NOT NULL UNIQUE,
    porc      NUMBER(4,2)    NOT NULL check (porc > 0)
);

-- IMPLEMENTE AQUÍ LAS TABLAS CLIENTES, ARTICULOS, VENDEDORES, FACTURAS
-- Y LA TABLA FALTANTE DETALLE_FACTURA:

CREATE TABLE clientes (
    id            NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_cliente VARCHAR2(50) NOT null,
    direccion varchar2(60) NOT null,
    telefono VARCHAR2 NOT null,
    comuna_id number NOT null REFERENCES comunas(id)
);
CREATE TABLE articulos (
    id            NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_articulo  VARCHAR2(50)  NOT NULL UNIQUE,
    precio        NUMBER(8)     NOT NULL CHECK (precio > 0),
    stock_actual  NUMBER(5)     NOT NULL CHECK (stock_actual > 10),
    stock_minimo  NUMBER(5)     NOT NULL CHECK (stock_minimo > 0),
    marca_id      NUMBER        NOT NULL REFERENCES marcas(id)
);
CREATE TABLE vendedores (
    id            NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut_vendedor varchar2 NOT null UNIQUE,
    nombres varchar2(30) NOT null,
    paterno varchar2(30) not null,
    materno varchar2(30),
    fecha_nacimiento date not null,
    fecha_contrato date not null,
    sueldo number(8) not null,
    comision number(4,2) not null,
    zona_id  number references zonas(id),
    categoria_id number not null references categorias(id)  

);
CREATE TABLE facturas (
    id            NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id not null references clientes(id),
    vendedor_id not null references vendedores(id),
    fecha_factura default SYSDATE not null

 
);
CREATE TABLE detalle_factura (
    id            NUMBER        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura_id number not null references facturas(id),
    articulo_id number not null references articulos(id),
    cantidad number(4) not null check (cantidad > 0)

);