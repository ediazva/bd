USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_jefe//
CREATE PROCEDURE gestion_jefe(
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
    IN e_salario DECIMAL(10,2)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO persona (DNI, primer_nombre, primer_apellido, segundo_apellido, email)
        VALUES (p_dni, p_primer_nombre, p_primer_apellido, p_segundo_apellido, p_email);
        
        INSERT INTO empleado (DNI, inicio_contrato, fin_contrato, hora_comienzo, hora_fin, direccion, salario)
        VALUES (p_dni, e_inicio_contrato, e_fin_contrato, e_hora_comienzo, e_hora_fin, e_direccion, e_salario);
        
        INSERT INTO jefe (DNI)
        VALUES (p_dni);
        
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
        
    ELSEIF accion = 'ELIMINAR' THEN
		DELETE FROM jefe WHERE DNI = p_dni;
        DELETE FROM empleado WHERE DNI = p_dni;
        DELETE FROM persona WHERE DNI = p_dni;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
