USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_jefe//
CREATE PROCEDURE mostrar_jefe(IN p_dni CHAR(8))
BEGIN
	IF p_dni IS NULL OR p_dni = '' THEN
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email, e.inicio_contrato,
        e.fin_contrato, e.hora_comienzo, e.hora_fin, e.direccion, e.salario, d.nombre_departamento
		FROM persona p
        JOIN empleado e ON p.DNI = e.DNI
        JOIN jefe j ON e.DNI = j.DNI
        JOIN departamento d ON j.DNI = d.DNI_jefe;
        
	ELSE
		SELECT p.DNI, p.primer_nombre, p.primer_apellido, p.segundo_apellido, p.email, e.inicio_contrato,
        e.fin_contrato, e.hora_comienzo, e.hora_fin, e.direccion, e.salario, d.nombre_departamento
		FROM persona p
        JOIN empleado e ON p.DNI = e.DNI
        JOIN jefe j ON e.DNI = j.DNI
        JOIN departamento d ON j.DNI = d.DNI_jefe
		WHERE p.DNI = p_dni;
	END IF;
END;
//

DELIMITER ;