USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_departamento//
CREATE PROCEDURE gestion_departamento(
    IN accion VARCHAR(10),
    IN d_codigo CHAR(10),
    IN d_nombre_departamento VARCHAR(20),
    IN d_numero_empleados INT,
    IN d_DNI_gerente CHAR(8),
    IN d_DNI_jefe CHAR(8)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO departamento (codigo, nombre_departamento, numero_empleados, DNI_gerente, DNI_jefe)
        VALUES (d_codigo, d_nombre_departamento, d_numero_empleados, d_DNI_gerente, d_DNI_jefe);
        
    ELSEIF accion = 'MODIFICAR' THEN
        UPDATE departamento
        SET nombre_departamento = d_nombre_departamento,
            numero_empleados = d_numero_empleados
        WHERE DNI_gerente = d_DNI_gerente AND DNI_jefe = d_DNI_jefe;
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM departamento
        WHERE DNI_gerente = d_DNI_gerente AND DNI_jefe = d_DNI_jefe;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
