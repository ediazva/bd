USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_tarjeta//
CREATE PROCEDURE gestion_tarjeta(
    IN accion VARCHAR(10),
    IN t_numero_tarjeta CHAR(20),
    IN p_dni CHAR(8),
    IN t_fecha_vencimiento DATE,
    IN t_nombre_titular VARCHAR(20),
    IN t_tipo VARCHAR(20)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO tarjeta (numero_tarjeta, DNI_cliente_afiliado, fecha_vencimiento, nombre_titular, tipo)
        VALUES (t_numero_tarjeta, p_dni, t_fecha_vencimiento, t_nombre_titular, t_tipo);
        
        IF NOT EXISTS (SELECT 1 FROM afiliado WHERE DNI = p_dni) THEN
            DELETE FROM no_afiliado WHERE DNI = p_dni;
            INSERT INTO afiliado (DNI, fecha_afiliacion)
            VALUES (p_dni, CURDATE());
        END IF;
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM tarjeta
        WHERE DNI_cliente_afiliado = p_dni AND numero_tarjeta = t_numero_tarjeta;
        
        IF NOT EXISTS (SELECT 1 FROM tarjeta WHERE DNI_cliente_afiliado = p_dni) THEN
            DELETE FROM afiliado WHERE DNI = p_dni;
            INSERT INTO no_afiliado (DNI)
            VALUES (p_dni);
        END IF;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
