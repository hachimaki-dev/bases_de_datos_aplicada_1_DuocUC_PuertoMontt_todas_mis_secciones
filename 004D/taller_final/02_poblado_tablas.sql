-- ============================================================================
-- ANEXO 1: SCRIPT BASE INCOMPLETO — CASO TIENDA AKIBASUR (TALLER FINAL)
-- Curso: Bases de Datos Aplicada 1 — Duoc UC Sede Puerto Montt
-- ⚠️ IMPORTANTE: Este script contiene errores intencionales de tipos de datos,
-- restricciones faltantes y tablas por construir según las instrucciones.
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


-- ============================================================================
-- 3. POBLADO INICIAL DE LAS 4 TABLAS BASE (NO INCLUIR LA COLUMNA ID):
-- ============================================================================

INSERT INTO comunas (nom_comuna) VALUES ('Puerto Montt');
INSERT INTO comunas (nom_comuna) VALUES ('Puerto Varas');
INSERT INTO comunas (nom_comuna) VALUES ('Osorno');
INSERT INTO comunas (nom_comuna) VALUES ('Castro');
INSERT INTO comunas (nom_comuna) VALUES ('Valdivia');

INSERT INTO marcas (nom_marca) VALUES ('Bandai Namco');
INSERT INTO marcas (nom_marca) VALUES ('Panini Manga');
INSERT INTO marcas (nom_marca) VALUES ('Editorial Ivrea');
INSERT INTO marcas (nom_marca) VALUES ('Konami TCG');
INSERT INTO marcas (nom_marca) VALUES ('Good Smile');

INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria S', 17.5);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria A', 12.6);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria B', 9.4);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria C', 7.2);
INSERT INTO categorias (nom_categoria, porcentaje) VALUES ('Categoria D', 5.4);

INSERT INTO zonas (nom_zona, porc) VALUES ('Norte Lagos', 8.56);
INSERT INTO zonas (nom_zona, porc) VALUES ('Sur Austral', 10.48);
INSERT INTO zonas (nom_zona, porc) VALUES ('Cordillera', 11.27);
INSERT INTO zonas (nom_zona, porc) VALUES ('Costera', 7.24);
INSERT INTO zonas (nom_zona, porc) VALUES ('Insular Chiloe', 7.24);




INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('ALCARAZ NOVOA MONTSERRAT', 'AV. DIEGO PORTALES 450', '5694522114', 1);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('JIMENEZ LORCA ELENA', 'SAN PEDRO 520 DPTO. K', '5696665443', 2);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('TORRES ROCA MARIA', 'MACKENNA 7421', '5695626134', 4);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('LOPEZ ROJAS THOMAS', 'BLANCO ENCALADA 2007', '5692989233', 5);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '5694343456', 2);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100', '11990', '150', '80' , 2);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('GUNPLA RX-78-2 GUNDAM HG', '24990', '200', '50' , 1);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1', '9990', '50', '20' , 3);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH', '45990', '50', '20' , 4);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('NENDOROID MIKU HATSUNE', '54990', '80', '40' , 5);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, apellido_paterno, apellido_maternal, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, ZONAID, categoria_id) VALUES ('11111112-6', 'BENITO', 'ORDENES', 'ROMERO',  DATE'1983-05-22',  DATE'2018-04-16', 550000, 0.13, 1 , 3);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, apellido_paterno, apellido_maternal, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, ZONAID, categoria_id) VALUES ('13333333-K', 'OSCAR', 'CACERES', 'LAGOS',  DATE'1989-10-09',  DATE'2021-09-03', 567400, 0.13, 1 , 1);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, apellido_paterno, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, ZONAID, categoria_id) VALUES ('12222222-3', 'MARTA', 'VIVEROS', DATE'1988-08-07',  DATE '2020-07-02', 545000, 0.07, 2 , 2);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, apellido_paterno, apellido_maternal, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, ZONAID, categoria_id) VALUES ('14444444-5', 'MILENA', 'MENA', 'CARTE', DATE'1992-12-08', DATE'2019-11-03', 573620, 0.05, 3 , 3);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, apellido_paterno, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, categoria_id) VALUES ('15555555-6', 'ESTEBAN', 'ROMERO', DATE'1995-12-08', DATE'2023-11-03', 573620, 0.08, 3);


INSERT INTO FACTURAS (CLIENTE_ID, VENDEDORID,FECHA_FACTURA) VALUES (1, 2, DATE'2026-01-18');

INSERT INTO FACTURAS (CLIENTE_ID, VENDEDORID,FECHA_FACTURA) VALUES (2, 4, DATE'2026-01-18');

INSERT INTO FACTURAS (CLIENTE_ID, VENDEDORID,FECHA_FACTURA) VALUES (4, 3, DATE'2026-01-18');

INSERT INTO FACTURAS (CLIENTE_ID, VENDEDORID,FECHA_FACTURA) VALUES (3, 5, DATE'2026-01-18');

INSERT INTO FACTURAS (CLIENTE_ID, VENDEDORID,FECHA_FACTURA) VALUES (2, 2, DATE'2026-01-18');

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (1, 1, 20);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (1, 5, 23);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (2, 3, 38);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (2, 4, 43);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (2, 1, 48);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (3, 4, 30);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (3, 2, 20);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (4, 5, 60);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (4, 2, 45);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (4, 3, 35);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (5, 4, 29);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (5, 5, 28);

INSERT INTO DETALLE_FACTURA (FACTURA_ID, ARTICULO_ID, CANTIDAD) VALUES (5, 2, 21);

COMMIT;
-- ============================================================================
-- 4. AQUÍ DEBES AGREGAR LOS INSERT INTO DE CLIENTES, ARTICULOS, VENDEDORES,
--    FACTURAS Y DETALLE_FACTURA SEGÚN LAS GRILLAS DEL ANEXO 1:
-- ============================================================================


