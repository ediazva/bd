USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_gerente//
CREATE PROCEDURE mostrar_gerente(IN p_dni CHAR(8))
BEGIN
	IF p_dni IS NULL OR p_dni = '' THEN
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email
		FROM persona p
        JOIN gerente g ON p.DNI = g.DNI;
        
	ELSE
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email
		FROM persona p
        JOIN gerente g ON p.DNI = g.DNI
		WHERE p.DNI = p_dni;
	END IF;
END;
//

DELIMITER ;