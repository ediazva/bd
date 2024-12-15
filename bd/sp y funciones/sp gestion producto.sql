USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_producto//
CREATE PROCEDURE gestion_producto(
    IN accion VARCHAR(10),
    IN p_codigo CHAR(20),
    IN p_nombre VARCHAR(50),
    IN p_precio DECIMAL(10,2),
    IN p_destino VARCHAR(50),
    IN p_marca VARCHAR(50),
    IN p_tipo VARCHAR(50)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO producto (codigo, nombre, precio, destino, marca, tipo)
        VALUES (p_codigo, p_nombre, p_precio, p_destino, p_marca, p_tipo);
        
    ELSEIF accion = 'MODIFICAR' THEN
        UPDATE producto
        SET nombre = p_nombre,
            precio = p_precio,
            destino = p_destino,
            marca = p_marca,
            tipo = p_tipo
        WHERE codigo = p_codigo;
        
    ELSEIF accion = 'ELIMINAR' THEN
		DELETE FROM producto
        WHERE codigo = p_codigo;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
