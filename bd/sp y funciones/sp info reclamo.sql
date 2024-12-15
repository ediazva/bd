USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_reclamo//
CREATE PROCEDURE mostrar_reclamo(IN r_codigo_libro CHAR(10), IN d_DNI_cliente CHAR(8))
BEGIN
	IF (r_codigo_libro IS NULL OR r_codigo_libro = '') AND (d_DNI_cliente IS NULL OR d_DNI_cliente = '') THEN
		SELECT r.DNI_cliente, CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido),
		r.codigo_libro, r.fecha_reclamo, r.mensaje,
        CONCAT(j.primer_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido)
		FROM reclamo r
		JOIN persona p ON r.DNI_cliente = p.DNI
        JOIN libro_reclamaciones lr ON r.codigo_libro = lr.codigo_libro
		JOIN revision_reclamaciones rr ON lr.codigo_libro = rr.codigo_libro
		JOIN persona j ON rr.DNI_jefe = j.DNI
		ORDER BY r.codigo_libro;
	
    ELSEIF (r_codigo_libro IS NULL OR r_codigo_libro = '') AND (d_DNI_cliente IS NOT NULL OR d_DNI_cliente <> '') THEN
		SELECT r.DNI_cliente, CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido),
		r.codigo_libro, r.fecha_reclamo, r.mensaje,
        CONCAT(j.primer_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido)
		FROM reclamo r
		JOIN persona p ON r.DNI_cliente = p.DNI
        JOIN libro_reclamaciones lr ON r.codigo_libro = lr.codigo_libro
		JOIN revision_reclamaciones rr ON lr.codigo_libro = rr.codigo_libro
		JOIN persona j ON rr.DNI_jefe = j.DNI
        WHERE r.DNI_cliente = d_DNI_cliente
		ORDER BY r.codigo_libro;
	
    ELSEIF (r_codigo_libro IS NOT NULL OR r_codigo_libro <> '') AND (d_DNI_cliente IS NULL OR d_DNI_cliente = '') THEN
		SELECT r.DNI_cliente, CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido),
		r.codigo_libro, r.fecha_reclamo, r.mensaje,
        CONCAT(j.primer_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido)
		FROM reclamo r
		JOIN persona p ON r.DNI_cliente = p.DNI
        JOIN libro_reclamaciones lr ON r.codigo_libro = lr.codigo_libro
		JOIN revision_reclamaciones rr ON lr.codigo_libro = rr.codigo_libro
		JOIN persona j ON rr.DNI_jefe = j.DNI
        WHERE r.codigo_libro = r_codigo_libro
		ORDER BY r.codigo_libro;
        
	ELSE
		SELECT r.DNI_cliente, CONCAT(p.primer_nombre,' ',p.primer_apellido,' ',p.segundo_apellido),
		r.codigo_libro, r.fecha_reclamo, r.mensaje,
        CONCAT(j.primer_nombre, ' ', j.primer_apellido, ' ', j.segundo_apellido)
		FROM reclamo r
		JOIN persona p ON r.DNI_cliente = p.DNI
        JOIN libro_reclamaciones lr ON r.codigo_libro = lr.codigo_libro
		JOIN revision_reclamaciones rr ON lr.codigo_libro = rr.codigo_libro
		JOIN persona j ON rr.DNI_jefe = j.DNI
        WHERE r.codigo_libro = r_codigo_libro AND r.DNI_cliente = d_DNI_cliente
		ORDER BY r.codigo_libro;
    END IF;
END;
//

DELIMITER ;