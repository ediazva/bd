USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_gerente//
CREATE PROCEDURE gestion_gerente(
    IN accion VARCHAR(10),
    IN p_dni CHAR(8),
    IN p_primer_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_email VARCHAR(50)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO persona (DNI, primer_nombre, primer_apellido, segundo_apellido, email)
        VALUES (p_dni, p_primer_nombre, p_primer_apellido, p_segundo_apellido, p_email);
        
        INSERT INTO gerente (DNI)
        VALUES (p_dni);
        
    ELSEIF accion = 'MODIFICAR' THEN
        UPDATE persona
        SET primer_nombre = p_primer_nombre,
            primer_apellido = p_primer_apellido,
            segundo_apellido = p_segundo_apellido,
            email = p_email
        WHERE DNI = p_dni;
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM gerente WHERE DNI = p_dni;
        DELETE FROM persona WHERE DNI = p_dni;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
