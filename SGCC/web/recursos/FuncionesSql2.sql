/*DROP PROCEDURE IF EXISTS LEER_TIPOS_DEDUCCION;
DELIMITER $$
CREATE PROCEDURE LEER_TIPOS_DEDUCCION()
BEGIN
    SELECT * FROM TIPO_DEDUCCION;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_TIPOS_HORAS_EXTRA;
DELIMITER $$
CREATE PROCEDURE LEER_TIPO_HORAS_EXTRA()
BEGIN
    SELECT * FROM TIPO_HORAS_EXTRA;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_DEDUCCIONES;
DELIMITER $$
CREATE PROCEDURE LEER_DEDUCCIONES(IDLIQUIDACION_P INTEGER)
BEGIN
    SELECT * FROM DEDUCCION WHERE IDLIQUIDACION=IDLIQUIDACION_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_HORAS_EXTRA;
DELIMITER $$
CREATE PROCEDURE LEER_HORAS_EXTRAS(IDLIQUIDACION_P INTEGER)
BEGIN
    SELECT * FROM HORAS_EXTRA WHERE IDLIQUIDACION=IDLIQUIDACION_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_TIPO_HORAS_EXTRA;
DELIMITER $$
CREATE PROCEDURE LEER_TIPO_HORAS_EXTRA(IDTIPO_HORAS_EXTRA_P INTEGER)
BEGIN
    SELECT * FROM TIPO_HORAS_EXTRA WHERE IDENTIFICADOR=IDTIPO_HORAS_EXTRA_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_TIPO_DEDUCCION;
DELIMITER $$
CREATE PROCEDURE LEER_TIPO_DEDUCCION(IDTIPO_DEDUCCION_P INTEGER)
BEGIN
    SELECT * FROM TIPO_DEDUCCION WHERE IDENTIFICADOR=IDTIPO_DEDUCCION_;
END$$
DELIMITER ;
*/

DROP PROCEDURE IF EXISTS LEER_EMPLEADOS;
DELIMITER $$
CREATE PROCEDURE LEER_EMPLEADOS()
BEGIN
    SELECT * FROM EMPLEADO;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_CEDULAS_EMPLEADOS;
DELIMITER $$
CREATE PROCEDURE LEER_CEDULAS_EMPLEADOS()
BEGIN
    SELECT IDENTIFICADOR,NOMBRE,CEDULA FROM EMPLEADO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS NUEVO_EMPLEADO;
DELIMITER $$
CREATE FUNCTION NUEVO_EMPLEADO(NOMBRE_P VARCHAR(100), CEDULA_P VARCHAR(100), CORREO_P VARCHAR(100), CARGO_P VARCHAR(100), SALARIO_BASICO_P INTEGER, CONTRASENA_P VARCHAR(100))
RETURNS BOOLEAN
BEGIN
    INSERT INTO EMPLEADO VALUES(DEFAULT,NOMBRE_P,CEDULA_P,CORREO_P,CARGO_P,SALARIO_BASICO_P,CONTRASENA_P);
    RETURN TRUE;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS MODIFICAR_EMPLEADO;
DELIMITER $$
CREATE FUNCTION MODIFICAR_EMPLEADO(CEDULA_P VARCHAR(100), NOMBRE_P VARCHAR(100), CORREO_P VARCHAR(100), CARGO_P VARCHAR(100), SALARIO_BASICO_P INTEGER, CONTRASENA_P VARCHAR(100))
RETURNS BOOLEAN
BEGIN
    UPDATE EMPLEADO SET NOMBRE=NOMBRE_P, CEDULA=CEDULA_P, CORREO=CORREO_P, CARGO=CARGO_P, SALARIO_BASICO=SALARIO_BASICO_P, CONTRASENA=CONTRASENA_P WHERE CEDULA=CEDULA_P;
    RETURN TRUE;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS ELIMINAR_EMPLEADO;
DELIMITER $$
CREATE FUNCTION ELIMINAR_EMPLEADO(CEDULA_P VARCHAR(100))
RETURNS BOOLEAN
BEGIN
    DELETE FROM EMPLEADO WHERE CEDULA=CEDULA_P;
    RETURN TRUE;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS BUSCAR_EMPLEADO;
DELIMITER $$
CREATE PROCEDURE BUSCAR_EMPLEADO(CEDULA_P VARCHAR(100))
BEGIN
    SELECT * FROM EMPLEADO WHERE CEDULA=CEDULA_P;
END$$
DELIMITER ;


/* FUNCIONES Y PROCEDIMIENTOS PARA EL CASO DE USO GESTION DE NOMINA*/

DROP FUNCTION IF EXISTS NUEVA_LIQUIDACION;
DELIMITER $$
CREATE FUNCTION NUEVA_LIQUIDACION(FECHA_P DATE, COMISIONES_P INTEGER, AUXILIO_TRANSPORTE_P INTEGER, VALOR_HORA_EXTRA_P INTEGER, NUMERO_HORAS_EXTRA_P INTEGER, TOTAL_HORAS_EXTRA_P INTEGER, SALUD_P DOUBLE, PENSION_P DOUBLE, SALARIO_NETO_P DOUBLE, CEDULA_P VARCHAR(200))
RETURNS BOOLEAN
BEGIN
	DECLARE IDEMPLEADO_P INTEGER;
	SELECT IDENTIFICADOR INTO IDEMPLEADO_P FROM EMPLEADO WHERE CEDULA=CEDULA_P;
    INSERT INTO LIQUIDACION VALUES(DEFAULT, FECHA_P, COMISIONES_P, AUXILIO_TRANSPORTE_P, VALOR_HORA_EXTRA_P, NUMERO_HORAS_EXTRA_P, TOTAL_HORAS_EXTRA_P, SALUD_P, PENSION_P, SALARIO_NETO_P, IDEMPLEADO_P);
    RETURN TRUE;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_LIQUIDACIONES;
DELIMITER $$
CREATE PROCEDURE LEER_LIQUIDACIONES()
BEGIN
    SELECT * FROM LIQUIDACION;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS MODIFICAR_LIQUIDACION;
DELIMITER $$
CREATE FUNCTION MODIFICAR_LIQUIDACION(IDENTIFICADOR_P INTEGER, FECHA_P DATE, COMISIONES_P INTEGER, VALOR_HORA_EXTRA_P INTEGER, NUMERO_HORAS_EXTRA_P INTEGER, TOTAL_HORAS_EXTRA_P INTEGER, SALUD_P DOUBLE, PENSION_P DOUBLE, SALARIO_NETO_P DOUBLE)
RETURNS BOOLEAN
BEGIN
    UPDATE LIQUIDACION SET FECHA=FECHA_P, COMISIONES=COMISIONES_P, VALOR_HORA_EXTRA=VALOR_HORA_EXTRA_P, NUMERO_HORAS_EXTRA=NUMERO_HORAS_EXTRA_P, TOTAL_HORAS_EXTRA=TOTAL_HORAS_EXTRA_P, SALUD=SALUD_P, PENSION=PENSION_P, SALARIO_NETO=SALARIO_NETO_P WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN TRUE;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS ELIMINAR_LIQUIDACION;
DELIMITER $$
CREATE FUNCTION ELIMINAR_LIQUIDACION(IDENTIFICADOR_P INTEGER)
RETURNS BOOLEAN
BEGIN
	DELETE FROM LIQUIDACION WHERE IDENTIFICADOR=IDENTIFICADOR_P;
    RETURN TRUE;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_IDENTIFICADORES_LIQUIDACIONES;
DELIMITER $$
CREATE PROCEDURE LEER_IDENTIFICADORES_LIQUIDACIONES()
BEGIN
    SELECT IDENTIFICADOR,FECHA,IDEMPLEADO FROM LIQUIDACION;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_EMPLEADO_LIQUIDACION;
DELIMITER $$
CREATE PROCEDURE LEER_EMPLEADO_LIQUIDACION(IDENTIFICADOR_P INTEGER)
BEGIN
    SELECT * FROM EMPLEADO WHERE IDENTIFICADOR=IDENTIFICADOR_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS BUSCAR_LIQUIDACION;
DELIMITER $$
CREATE PROCEDURE BUSCAR_LIQUIDACION(IDENTIFICADOR_P INTEGER)
BEGIN
    SELECT * FROM LIQUIDACION WHERE IDENTIFICADOR=IDENTIFICADOR_P;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS LEER_EMPLEADOS_LIQUIDACION;
DELIMITER $$
CREATE PROCEDURE LEER_EMPLEADOS_LIQUIDACION()
BEGIN
    SELECT NOMBRE,CEDULA FROM EMPLEADO;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS LEER_SALARIO_BASICO_CEDULA;
DELIMITER $$
CREATE FUNCTION LEER_SALARIO_BASICO_CEDULA(CEDULA_P VARCHAR(200))
RETURNS INTEGER
BEGIN
	DECLARE RETORNO INTEGER;
    SELECT SALARIO_BASICO INTO RETORNO FROM EMPLEADO WHERE CEDULA=CEDULA_P;
    RETURN RETORNO;
END$$
DELIMITER ;

SELECT * FROM EMPLEADO;









