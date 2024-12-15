USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_reclamo//
CREATE PROCEDURE gestion_reclamo(
    IN accion VARCHAR(10),
    IN r_DNI_cliente CHAR(8),
    IN r_codigo_libro CHAR(10),
    IN r_fecha_reclamo DATE,
    IN r_mensaje VARCHAR(1000)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO reclamo (DNI_cliente, codigo_libro, fecha_reclamo, mensaje)
        VALUES (r_DNI_cliente, r_codigo_libro, r_fecha_reclamo, r_mensaje);
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM reclamo
        WHERE DNI_cliente = r_DNI_cliente AND codigo_libro = r_codigo_libro;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
