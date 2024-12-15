USE oechsle;

DELIMITER //

DROP FUNCTION IF EXISTS verificar_tarjetas//

CREATE FUNCTION verificar_tarjetas(p_dni CHAR(8)) RETURNS BOOLEAN
BEGIN
    DECLARE tiene_tarjetas BOOLEAN;
    
    SELECT EXISTS (
        SELECT 1 
        FROM tarjeta 
        WHERE DNI_cliente_afiliado = p_dni
    ) INTO tiene_tarjetas;

    RETURN tiene_tarjetas;
END;
//

DELIMITER ;
