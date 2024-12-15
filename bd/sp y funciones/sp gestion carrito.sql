USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS gestion_carrito//
CREATE PROCEDURE gestion_carrito(
    IN accion VARCHAR(10),
    IN c_DNI_cliente CHAR(8),
    IN c_codigo_producto CHAR(20)
)
BEGIN
    IF accion = 'AGREGAR' THEN
        INSERT INTO cliente_carrito (DNI_cliente, codigo_producto)
        VALUES (c_DNI_cliente, c_codigo_producto);
        
    ELSEIF accion = 'ELIMINAR' THEN
        DELETE FROM cliente_carrito
        WHERE DNI_cliente = c_DNI_cliente AND codigo_producto = c_codigo_producto;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acción no válida. Use AGREGAR, MODIFICAR o ELIMINAR.';
    END IF;
END;
//

DELIMITER ;
