USE oechsle;

DELIMITER //

DROP FUNCTION IF EXISTS calcular_descuento//
CREATE FUNCTION calcular_descuento(p_dni CHAR(8)) RETURNS INT
BEGIN
    DECLARE antiguedad INT;
    DECLARE descuento INT;

    SELECT TIMESTAMPDIFF(YEAR, fecha_afiliacion, CURDATE())
    INTO antiguedad
    FROM afiliado
    WHERE DNI = p_dni;
    
    IF antiguedad < 1 THEN
        SET descuento = 5;
    ELSEIF antiguedad < 2 THEN
        SET descuento = 8;
    ELSEIF antiguedad < 3 THEN
        SET descuento = 15;
    ELSEIF antiguedad < 5 THEN
        SET descuento = 20;
    ELSEIF antiguedad < 10 THEN
        SET descuento = 35;
    ELSE
        SET descuento = 50;
    END IF;

    RETURN descuento;
END;
//

DELIMITER ;