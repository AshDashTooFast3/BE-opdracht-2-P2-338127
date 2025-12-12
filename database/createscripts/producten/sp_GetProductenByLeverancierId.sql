USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetProductenByLeverancierId;
DELIMITER $$

CREATE PROCEDURE sp_GetProductenByLeverancierId(
    IN p_leverancierid INT
)
BEGIN
  
    SELECT
        PPL.ProductId,
        PROD.Naam AS ProductNaam,
        MAG.AantalAanwezig,
        FLOOR(MAG.VerpakkingsEenheid) AS VerpakkingsEenheid,
        DATE_FORMAT(MAX(PPL.DatumLevering), '%d-%m-%Y') AS DatumLevering
    FROM ProductPerLeverancier AS PPL
    INNER JOIN Magazijn AS MAG 
    ON MAG.ProductId = PPL.ProductId
    INNER JOIN Product AS PROD
    ON PPL.ProductId = PROD.Id
    WHERE PPL.LeverancierId = p_leverancierid
    GROUP BY PPL.ProductId;


END$$

DELIMITER ;
