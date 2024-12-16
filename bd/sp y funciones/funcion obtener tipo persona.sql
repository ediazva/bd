USE oechsle;

DELIMITER //

DROP FUNCTION IF EXISTS obtener_tipo_usuario//

CREATE FUNCTION obtener_tipo_usuario(p_dni CHAR(8), p_email VARCHAR(50)) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE tipo_usuario VARCHAR(20);

    IF EXISTS (SELECT 1 FROM gerente g 
               JOIN persona p ON g.DNI = p.DNI AND p.email = p_email 
               WHERE p.DNI = p_dni) THEN
        SET tipo_usuario = 'Gerente';

    ELSEIF EXISTS (SELECT 1 FROM empleado e 
                   JOIN persona p ON e.DNI = p.DNI AND p.email = p_email 
                   WHERE p.DNI = p_dni) THEN
        SET tipo_usuario = 'Empleado';

    ELSEIF EXISTS (SELECT 1 FROM cliente c 
                   JOIN persona p ON c.DNI = p.DNI AND p.email = p_email 
                   WHERE p.DNI = p_dni) THEN
        SET tipo_usuario = 'Cliente';

    ELSE
        SET tipo_usuario = 'Desconocido';
    END IF;

    RETURN tipo_usuario;
END;
//

DELIMITER ;
