USE BE_Opdracht_2;
DROP PROCEDURE IF EXISTS sp_UpdateProductPerLeverancier;

DELIMITER $$

CREATE PROCEDURE sp_UpdateProductPerLeverancier(
    IN p_id INT,
    IN p_aantal INT,
    IN p_datumlevering DATE
)
BEGIN
    UPDATE Magazijn
    SET
        AantalAanwezig = AantalAanwezig + p_aantal,
        DatumGewijzigd = SYSDATE(6)
    WHERE ProductId = p_id;

    SELECT ROW_COUNT() AS affected;

    

END$$

DELIMITER ;
