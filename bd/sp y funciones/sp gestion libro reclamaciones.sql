USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_libro_reclamaciones//
CREATE PROCEDURE gestion_libro_reclamaciones(
    IN accion VARCHAR(10),
    IN l_codigo_libro CHAR(10))
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO libro_reclamaciones (codigo_libro)
        VALUES (l_codigo_libro);
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM libro_reclamaciones
        WHERE codigo_libro = l_codigo_libro;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
