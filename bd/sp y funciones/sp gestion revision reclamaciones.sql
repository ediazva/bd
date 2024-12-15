USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_revision_reclamaciones//
CREATE PROCEDURE gestion_revision_reclamaciones(
    IN accion VARCHAR(20),
	IN l_DNI_jefe CHAR(8),
    IN l_codigo_libro CHAR(10)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO revision_reclamaciones (DNI_jefe, codigo_libro)
        VALUES (l_DNI_jefe, l_codigo_libro);
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM revision_reclamaciones
        WHERE codigo_libro = l_codigo_libro AND DNI_jefe = l_DNI_jefe;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
