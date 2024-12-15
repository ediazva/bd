USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_departamento//
CREATE PROCEDURE mostrar_departamento(in d_codigo CHAR(10))
BEGIN
    IF d_codigo IS NULL OR d_codigo = '' THEN
        SELECT d.codigo, d.nombre_departamento, d.numero_empleados, d.DNI_gerente, d.DNI_jefe,
		CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido)
		FROM departamento d
		JOIN persona p ON d.DNI_jefe = p.DNI;
        
    ELSE
		SELECT d.codigo, d.nombre_departamento, d.numero_empleados, d.DNI_gerente, d.DNI_jefe,
		CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido)
		FROM departamento d
		JOIN persona p ON d.DNI_jefe = p.DNI
		WHERE d.codigo = d_codigo;
	END IF;
END;
//

DELIMITER ;