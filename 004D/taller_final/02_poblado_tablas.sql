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




INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('Alcaraz Novoa Montserrat', 'AV. DIEGO PORTALES 450', '5694522114', 1);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('Jimenez Lorca Elena', 'SAN PEDRO 520 DPTO. K', '5696665443', 2);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('Torres Roca Maria', 'Mackena 7421', '5695626134', 4);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('Lopez Rojas Thomas', 'BLANCO ENCALADA 2007', '5692989233', 5);

INSERT INTO CLIENTES (nombre_cliente, direccion, telefono, comunaId) VALUES ('ZAMORA MOLINA TOMAS', 'WALKER MARTINEZ 1294', '5694343456', 2);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA ONE PIECE VOL 100', '11990', '150', '80' , 2);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('GUNPLA RX-78-2 GUNDAM HG', '24990', '200', '50' , 1);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('MANGA CHAINSAW MAN VOL 1', '9990', '50', '20' , 3);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('BOOSTER BOX YU-GI-OH', '45990', '50', '20' , 4);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('NENDOROID MIKU HATSUNE', '54990', '80', '40' , 5);

INSERT INTO ARTICULOS (NOMBRE_ARTICULO, precio, stock_actual, stock_minimo, marca_id) VALUES ('', '', '', '' , 2);

INSERT INTO VENDEDORES (RUT_VENDEDOR, NOMBRE1, NOMBRE2, apellido_paterno, apellido_maternal, FECHA_NACIMIENTO, FECHA_CONTATO, SUELDO, COMISION, ZONAID) VALUES ('', '', '', '' , 2);


COMMIT;
-- ============================================================================
-- 4. AQUÍ DEBES AGREGAR LOS INSERT INTO DE CLIENTES, ARTICULOS, VENDEDORES,
--    FACTURAS Y DETALLE_FACTURA SEGÚN LAS GRILLAS DEL ANEXO 1:
-- ============================================================================


