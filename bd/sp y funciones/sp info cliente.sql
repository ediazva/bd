USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_cliente//
CREATE PROCEDURE mostrar_cliente(IN p_dni CHAR(8))
BEGIN
	IF p_dni IS NULL OR p_dni = '' THEN
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email
		FROM persona p
        JOIN cliente c ON p.DNI = c.DNI;
		
	ELSE
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email
		FROM persona p
        JOIN cliente c ON p.DNI = c.DNI
		WHERE p.DNI = p_dni;
	END IF;
END;
//

DELIMITER ;