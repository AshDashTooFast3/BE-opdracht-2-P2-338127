use BE_Opdracht_1;

DROP PROCEDURE IF EXISTS sp_GetLeverantieInfo;

DELIMITER $$

CREATE PROCEDURE sp_GetLeverantieInfo (
    IN p_productId INT 
)
BEGIN
    SELECT PROD.Naam
           ,DATE_FORMAT(PPLE.DatumLevering, '%d-%m-%Y') AS DatumLevering
           ,PPLE.Aantal
           ,DATE_FORMAT(PPLE.DatumEerstVolgendeLevering, '%d-%m-%Y') AS DatumEerstVolgendeLevering
           ,MAGA.AantalAanwezig

    FROM Product AS PROD
    
    INNER JOIN ProductPerLeverancier AS PPLE ON PPLE.ProductId = PROD.Id

    INNER JOIN Magazijn AS MAGA ON MAGA.ProductId = PROD.Id

    WHERE PROD.Id = p_productId
    ORDER BY DatumLevering ASC;
    
END$$

DELIMITER ;