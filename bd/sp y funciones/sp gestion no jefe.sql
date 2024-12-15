USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_no_jefe//
CREATE PROCEDURE gestion_no_jefe(
    IN accion VARCHAR(10),
    IN p_dni CHAR(8),
    IN p_primer_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_email VARCHAR(50),
    IN e_inicio_contrato DATE,
    IN e_fin_contrato DATE,
    IN e_hora_comienzo DATETIME,
    IN e_hora_fin DATETIME,
    IN e_direccion VARCHAR(50),
    IN e_salario DECIMAL(10,2),
    IN c_codigo_departamento CHAR(10)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO persona (DNI, primer_nombre, primer_apellido, segundo_apellido, email)
        VALUES (p_dni, p_primer_nombre, p_primer_apellido, p_segundo_apellido, p_email);
        
        INSERT INTO empleado (DNI, inicio_contrato, fin_contrato, hora_comienzo, hora_fin, direccion, salario)
        VALUES (p_dni, e_inicio_contrato, e_fin_contrato, e_hora_comienzo, e_hora_fin, e_direccion, e_salario);
        
        INSERT INTO no_jefe (DNI, codigo_departamento)
        VALUES (p_dni, c_codigo_departamento);
        
        IF TIMESTAMPDIFF(HOUR, e_hora_comienzo, e_hora_fin) >= 10 THEN
			INSERT INTO tiempo_completo (DNI)
			VALUES (p_dni);
		ELSE
			INSERT INTO medio_tiempo (DNI)
			VALUES (p_dni);
		END IF;
        
    ELSEIF accion = 'MODIFICAR' THEN
        UPDATE persona
        SET primer_nombre = p_primer_nombre,
            primer_apellido = p_primer_apellido,
            segundo_apellido = p_segundo_apellido,
            email = p_email
        WHERE DNI = p_dni;
        
        UPDATE empleado
        SET inicio_contrato = e_inicio_contrato,
			fin_contrato = e_fin_contrato,
            hora_comienzo = e_hora_comienzo,
            hora_fin = e_hora_fin,
            direccion = e_direccion,
            salario = e_salario
		WHERE DNI = p_dni;
        
        UPDATE no_jefe
        SET codigo_departamento = c_codigo_departamento
        WHERE DNI = p_dni;
        
    ELSEIF accion = 'ELIMINAR' THEN
		DELETE FROM tiempo_completo WHERE DNI = p_dni;
        DELETE FROM medio_tiempo WHERE DNI = p_dni;
		DELETE FROM no_jefe WHERE DNI = p_dni AND codigo_departamento = c_codigo_departamento;
        DELETE FROM empleado WHERE DNI = p_dni;
        DELETE FROM persona WHERE DNI = p_dni;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
