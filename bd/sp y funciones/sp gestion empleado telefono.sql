USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_empleado_telefono//
CREATE PROCEDURE gestion_empleado_telefono(
    IN accion VARCHAR(10),
    IN e_DNI CHAR(8),
    IN e_telefono CHAR(9)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO empleado_telefono (DNI, telefono)
        VALUES (e_DNI, e_telefono);
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM empleado_telefono
        WHERE DNI = e_dni AND telefono = e_telefono;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
