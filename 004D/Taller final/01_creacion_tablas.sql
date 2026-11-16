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
    nom_comuna  VARCHAR2(40) NOT NULL
);

CREATE TABLE marcas (
    id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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

CREATE TABLE clientes(
    id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_cliente VARCHAR2(60), 
    direccion VARCHAR2(60),
    telefono VARCHAR2(15),
    comuna_id NUMBER NOT NULL REFERENCES comunas(id)
);

CREATE TABLE articulos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_articulo VARCHAR2(50),
    precio NUMBER(8),
    stock_actual NUMBER(5),
    stock_minimo NUMBER(5),
    marca_id NUMBER NOT NULL REFERENCES marcas(id)
);

CREATE TABLE vendedores(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut_vendedor VARCHAR2(12),
    nombres VARCHAR2(30),
    paterno VARCHAR2(30),
    matrno VARCHAR2(30),
    fecha_nacimiento DATE NOT NULL,
    fecha_contrato DATE NOT NULL,
    sueldo NUMBER(8) NOT NULL CHECK (sueldo >= 0),
    comision NUMBER(4,2),
    zona_id NUMBER NOT NULL REFERENCES zonas(id),
    categoria_id NUMBER NOT NULL REFERENCES categorias(id)
);

CREATE TABLE facturas(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER NOT NULL REFERENCES clientes(id),
    vendedor_id NUMBER NOT NULL REFERENCES vendedores(id),
    fecha_factura DATE NOT NULL,
    numero_de_factura NUMBER(9) NOT NULL UNIQUE
);
