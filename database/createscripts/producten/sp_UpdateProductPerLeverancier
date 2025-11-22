USE BE_Opdracht_2;
DROP PROCEDURE IF EXISTS sp_UpdateProductPerLeverancier;

DELIMITER $$

CREATE PROCEDURE sp_UpdateProductPerLeverancier(
    IN p_id INT,
    IN p_aantal INT,
    IN p_datumlevering DATE
)
BEGIN
    UPDATE ProductPerLeverancier
    SET
        Aantal = p_aantal,
        DatumLevering = p_datumlevering,
        DatumGewijzigd = SYSDATE(6)
    WHERE Id = p_id;

    SELECT ROW_COUNT() AS affected;
END$$

DELIMITER ;
