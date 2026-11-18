DROP TABLE detalle_factura CASCADE CONSTRAINTS;
DROP TABLE facturas CASCADE CONSTRAINTS;
DROP TABLE vendedores CASCADE CONSTRAINTS;
DROP TABLE articulos CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE zonas CASCADE CONSTRAINTS;
DROP TABLE categorias CASCADE CONSTRAINTS;
DROP TABLE marcas CASCADE CONSTRAINTS;
DROP TABLE comunas CASCADE CONSTRAINTS;

CREATE TABLE comunas(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_comuna  VARCHAR2(40) NOT NULL UNIQUE
);

CREATE TABLE marcas(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_marca   VARCHAR2(40) NOT NULL UNIQUE
);

CREATE TABLE categorias(
    id             NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categoria  VARCHAR2(30) NOT NULL,
    porcentaje     NUMBER(4, 1) NOT NULL CHECK (porcentaje > 0)
);

CREATE TABLE zonas(
    id        NUMBER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_zona  VARCHAR2(4)  NOT NULL,
    porc      NUMBER(4, 2) NOT NULL CHECK (porc > 0)
);

CREATE TABLE clientes(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_cliente VARCHAR2(60),
    direccion VARCHAR2(60),
    telefono VARCHAR2(15),
    id_comuna NUMBER,
    CONSTRAINT fk_clientes_comunas FOREIGN KEY (id_comuna) REFERENCES comunas(id)
);

CREATE TABLE articulos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_articulo VARCHAR(50) NOT NULL UNIQUE,
    precio NUMBER(8),
    stock_actual NUMBER(5) NOT NULL CHECK (stock_actual > 10),
    stock_minimo NUMBER(5) NOT NULL CHECK (stock_minimo > 0),
    id_marca NUMBER,
    CONSTRAINT fk_marca_articulos FOREIGN KEY (id_marca) REFERENCES marcas(id)
);

CREATE TABLE vendedores(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rut_vendedor VARCHAR2(12) NOT NULL UNIQUE,
    nombres VARCHAR2(30) NOT NULL,
    paterno VARCHAR2(30) NOT NULL,
    materno VARCHAR2(30),
    fec_naci DATE,
    fec_contra DATE,
    sueldo NUMBER(8),
    comision NUMBER(4, 2),
    id_zonas NUMBER,
    id_categorias NUMBER,
    CONSTRAINT fk_vendedores_zonas FOREIGN KEY (id_zonas) REFERENCES zonas(id),
    CONSTRAINT fk_vendedores_categorias FOREIGN KEY (id_categorias) REFERENCES categorias(id)
);

CREATE TABLE facturas(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_clientes NUMBER,
    CONSTRAINT fk_clientes_facturas FOREIGN KEY (id_clientes) REFERENCES clientes(id),
    id_vendedores NUMBER,
    CONSTRAINT fk_vendedores_facturas FOREIGN KEY (id_vendedores) REFERENCES vendedores(id),
    fecha_factura DATE
);

CREATE TABLE detalle_factura(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_factura NUMBER NOT NULL REFERENCES facturas(id),
    id_articulo NUMBER NOT NULL REFERENCES articulos(id),
    cantidad NUMBER(4) NOT NULL CHECK (cantidad > 0)
)