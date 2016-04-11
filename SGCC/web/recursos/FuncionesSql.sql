DROP FUNCTION IF EXISTS NUEVO_INGRESO;
DELIMITER $$
CREATE FUNCTION NUEVO_INGRESO(FECHA_P DATE, EMPRESA_P VARCHAR(200), CANTIDAD_P INTEGER, VALORUNITARIO_P INTEGER, 
VALORTOTAL_P INTEGER, IDCONCEPTO_P INTEGER, IDFUENTE_P INTEGER, IDUSUARIO_P INTEGER)
RETURNS INTEGER
BEGIN
	DECLARE RETORNO INTEGER;
    INSERT INTO INGRESO VALUES(DEFAULT,FECHA_P, EMPRESA_P, CANTIDAD_P, VALORUNITARIO_P, VALORTOTAL_P, IDFUENTE_P, IDCONCEPTO_P,IDUSUARIO_P);
    SELECT IDENTIFICADOR INTO RETORNO FROM INGRESO WHERE FECHA=FECHA_P AND EMPRESA=EMPRESA_P AND IDCONCEPTO=IDCONCEPTO_P AND IDFUENTE=IDFUENTE_P AND IDUSUARIO=IDUSUARIO_P;
    RETURN RETORNO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS NUEVO_SOPORTE_INGRESO;
DELIMITER $$
CREATE FUNCTION NUEVO_SOPORTE_INGRESO(IDINGRESO_P INTEGER, IDSOPORTE_P VARCHAR(200), SOPORTE_P BLOB)
RETURNS VARCHAR(200)
BEGIN	
    INSERT INTO SOPORTE_INGRESO VALUES(DEFAULT,IDSOPORTE_P,SOPORTE_P, IDINGRESO_P);
    RETURN "Se ha insertado correctamente el ingreso";
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS MODIFICAR_INGRESO;
DELIMITER $$
CREATE FUNCTION MODIFICAR_INGRESO(IDENTIFICADOR_P INTEGER, FECHA_P DATE, EMPRESA_P VARCHAR(200), CANTIDAD_P INTEGER, VALORUNITARIO_P INTEGER,
VALORTOTAL_P INTEGER, IDCONCEPTO_P INTEGER, IDFUENTE_P INTEGER, IDUSUARIO_P INTEGER)
RETURNS VARCHAR(200)
BEGIN
	UPDATE INGRESO SET FECHA=FECHA_P, EMPRESA=EMPRESA_P, CANTIDAD=CANTIDAD_P, VALORUNITARIO=VALORUNITARIO_P, VALORTOTAL=VALORTOTAL_P,
    IDCONCEPTO=IDCONCEPTO_P, IDFUENTE=IDFUENTE_P, IDUSUARIO=IDUSUARIO_P WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN "Se modifico exitosamente el ingreso";
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS BUSCAR_INGRESO;
DELIMITER $$
CREATE PROCEDURE BUSCAR_INGRESO(IDENTIFICADOR_P INTEGER)
BEGIN
    SELECT * FROM INGRESO WHERE IDENTIFICADOR=IDENTIFICADOR_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_CONCEPTOS_INGRESO;
DELIMITER $$
CREATE PROCEDURE LEER_CONCEPTOS_INGRESO()
BEGIN
	SELECT * FROM CONCEPTO_INGRESO;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_SOPORTES_INGRESO;
DELIMITER $$
CREATE PROCEDURE LEER_SOPORTES_INGRESO(IDINGRESO_P INTEGER)
BEGIN
	SELECT * FROM SOPORTE_INGRESO WHERE IDINGRESO=IDINGRESO_P;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS NOMBRE_CONCEPTO_INGRESO;
DELIMITER $$
CREATE FUNCTION NOMBRE_CONCEPTO_INGRESO(IDCONCEPTO INTEGER)
RETURNS VARCHAR(200)
BEGIN
	DECLARE RETORNO VARCHAR(200);
	SELECT NOMBRE INTO RETORNO FROM CONCEPTO_INGRESO WHERE IDENTIFICADOR=IDCONCEPTO;
    RETURN RETORNO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS ELIMINAR_INGRESO;
DELIMITER $$
CREATE FUNCTION ELIMINAR_INGRESO(IDENTIFICADOR_P INTEGER)
RETURNS VARCHAR(200)
BEGIN
	DELETE FROM INGRESO WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN "Se ha eliminado correctamente el ingreso";
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_INGRESOS;
DELIMITER $$
CREATE PROCEDURE LEER_INGRESOS()
BEGIN
	SELECT * FROM INGRESO;
END$$
DELIMITER ;

/*
	LO SIGUIENTE SON LAS FUNCIONES Y PROCEDIMIENTOS PARA EL CASO DE USO GESTIONAR GASTOS
*/

DROP FUNCTION IF EXISTS NUEVO_GASTO;
DELIMITER $$
CREATE FUNCTION NUEVO_GASTO(FECHA_P DATE, EMPRESA_P VARCHAR(200), VALORTOTAL_P INTEGER, IDCONCEPTO_P INTEGER, IDFUENTE_P INTEGER, IDUSUARIO_P INTEGER)
RETURNS INTEGER
BEGIN
	DECLARE RETORNO INTEGER;
	INSERT INTO GASTO VALUES(DEFAULT, FECHA_P, EMPRESA_P, VALORTOTAL_P, IDCONCEPTO_P, IDFUENTE_P, IDUSUARIO_P);
    SELECT IDENTIFICADOR INTO RETORNO FROM GASTO WHERE FECHA=FECHA_P AND EMPRESA_P=EMPRESA AND VALORTOTAL_P=VALORTOTAL;
	RETURN RETORNO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS NUEVO_SOPORTE_GASTO;
DELIMITER $$
CREATE FUNCTION NUEVO_SOPORTE_GASTO(IDGASTO_P INTEGER, IDSOPORTE_P VARCHAR(200), SOPORTE_P BLOB)
RETURNS VARCHAR(200)
BEGIN	
    INSERT INTO SOPORTE_GASTO VALUES(DEFAULT,IDSOPORTE_P,SOPORTE_P, IDGASTO_P);
    RETURN "Se ha insertado correctamente el gasto";
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_GASTOS;
DELIMITER $$
CREATE PROCEDURE LEER_GASTOS()
BEGIN
	SELECT * FROM GASTO;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_CONCEPTOS_GASTO;
DELIMITER $$
CREATE PROCEDURE LEER_CONCEPTOS_GASTO()
BEGIN
	SELECT * FROM CONCEPTO_GASTO;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_SOPORTES_GASTO;
DELIMITER $$
CREATE PROCEDURE LEER_SOPORTES_GASTO(IDGASTO INTEGER)
BEGIN
	SELECT * FROM SOPORTE_GASTO WHERE IDENTIFICADOR=IDGASTO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS NOMBRE_CONCEPTO_GASTO;
DELIMITER $$
CREATE FUNCTION NOMBRE_CONCEPTO_GASTO(IDCONCEPTO INTEGER)
RETURNS VARCHAR(200)
BEGIN
	DECLARE RETORNO VARCHAR(200);
    SELECT NOMBRE INTO RETORNO FROM CONCEPTO_GASTO WHERE IDENTIFICADOR=IDCONCEPTO;
    RETURN RETORNO;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS BUSCAR_GASTO;
DELIMITER $$
CREATE PROCEDURE BUSCAR_GASTO(IDENTIFICADOR_P INTEGER)
BEGIN
    SELECT * FROM GASTO WHERE IDENTIFICADOR=IDENTIFICADOR_P;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS MODIFICAR_GASTO;
DELIMITER $$
CREATE FUNCTION MODIFICAR_GASTO(IDENTIFICADOR_P INTEGER, FECHA_P DATE, EMPRESA_P VARCHAR(200), VALORTOTAL_P INTEGER, IDCONCEPTO_P INTEGER, IDFUENTE_P INTEGER, IDUSUARIO_P INTEGER)
RETURNS VARCHAR(200)
BEGIN
	UPDATE GASTO SET FECHA=FECHA_P, EMPRESA=EMPRESA_P, VALORTOTAL=VALORTOTAL_P,
    IDCONCEPTO=IDCONCEPTO_P, IDFUENTE=IDFUENTE_P, IDUSUARIO=IDUSUARIO_P WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN "Se modifico exitosamente el gasto";
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS ELIMINAR_GASTO;
DELIMITER $$
CREATE FUNCTION ELIMINAR_GASTO(IDENTIFICADOR_P INTEGER)
RETURNS VARCHAR(200)
BEGIN
	DELETE FROM GASTO WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN "Se elimino exitosamente el gasto";
END$$
DELIMITER ;

/*DE AQUI EN ADELANTE FUNCIONES Y PROCEDIMIENTOS VARIOS.*/

DROP PROCEDURE IF EXISTS LEER_FUENTES;
DELIMITER $$
CREATE PROCEDURE LEER_FUENTES()
BEGIN
	SELECT * FROM FUENTE;
END $$
DELIMITER ;

DROP FUNCTION IF EXISTS NOMBRE_FUENTE;
DELIMITER $$
CREATE FUNCTION NOMBRE_FUENTE(IDFUENTE INTEGER)
RETURNS VARCHAR(200)
BEGIN
	DECLARE RETORNO VARCHAR(200);
	SELECT NOMBRE INTO RETORNO FROM FUENTE WHERE IDENTIFICADOR=IDFUENTE;
    RETURN RETORNO;
END$$
DELIMITER ;

 
    
