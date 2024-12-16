USE oechsle;

DELIMITER //

DROP PROCEDURE IF EXISTS mostrar_tarjetas_y_afiliacion//
CREATE PROCEDURE mostrar_tarjetas_y_afiliacion(IN p_dni CHAR(9))
BEGIN
    SELECT t.numero_tarjeta, t.fecha_vencimiento, t.nombre_titular, t.tipo, a.fecha_afiliacion
    FROM tarjeta t
    LEFT JOIN afiliado a ON t.DNI_cliente_afiliado = a.DNI
    WHERE t.DNI_cliente_afiliado = p_dni;
END;
//

DELIMITER ;
