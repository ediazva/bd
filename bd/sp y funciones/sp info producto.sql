DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_producto//
CREATE PROCEDURE mostrar_producto(IN p_codigo CHAR(20))
BEGIN
	IF p_codigo IS NULL OR p_codigo = '' THEN
		SELECT p.codigo, p.nombre, p.precio, p.destino, p.marca, p.tipo
		FROM producto p
        ORDER BY p.nombre;
	ELSE
		SELECT p.codigo, p.nombre, p.precio, p.destino, p.marca, p.tipo
		FROM producto p
		WHERE p.codigo = p_codigo;
	END IF;
END;
//

DELIMITER ;
