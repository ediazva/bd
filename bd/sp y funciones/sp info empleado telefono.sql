USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_telefonos//
CREATE PROCEDURE mostrar_telefonos(IN p_dni CHAR(8))
BEGIN
	IF p_dni IS NULL OR p_dni = '' THEN
		SELECT p.DNI, CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido), d.nombre_departamento,
        e.telefono
		FROM empleado_telefono e
        JOIN empleado em ON em.DNI = e.DNI
        JOIN persona p ON em.DNI = p.DNI
        JOIN no_jefe nj ON em.DNI = nj.DNI
        JOIN departamento d ON nj.codigo_departamento = d.codigo;
	ELSE
		SELECT e.telefono
		FROM empleado_telefono e
		WHERE e.DNI = p_dni;
	END IF;
END;
//

DELIMITER ;