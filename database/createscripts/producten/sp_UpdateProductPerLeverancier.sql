USE BE_Opdracht_2;
DROP PROCEDURE IF EXISTS sp_UpdateProductPerLeverancier;

DELIMITER $$

CREATE PROCEDURE sp_UpdateProductPerLeverancier(
    IN p_id INT,
    IN p_aantal INT,
    IN p_datumlevering DATE
)
BEGIN
    DECLARE affected_rows INT DEFAULT 0;

    UPDATE Magazijn
    SET
        AantalAanwezig = AantalAanwezig + p_aantal
    WHERE ProductId = p_id;
    SET affected_rows = affected_rows + ROW_COUNT();

    UPDATE ProductPerLeverancier
    SET
        DatumLevering = SYSDATE(6)
    WHERE ProductId = p_id;
    SET affected_rows = affected_rows + ROW_COUNT();

    SELECT affected_rows AS affected;

END$$

DELIMITER ;
