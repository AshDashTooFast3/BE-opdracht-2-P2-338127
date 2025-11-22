USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetProductenByLeverancierId;
DELIMITER $$

CREATE PROCEDURE sp_GetProductenByLeverancierId(
    IN p_leverancierid INT
)
BEGIN
    SELECT 
        PROPL.Id,
        PROPL.LeverancierId,
        PROPL.ProductId,
        P.Naam AS ProductNaam,
        PROPL.Aantal,
         IF(MAG.VerpakkingsEenheid = FLOOR(MAG.VerpakkingsEenheid),
           FLOOR(MAG.VerpakkingsEenheid),
           MAG.VerpakkingsEenheid
        ) AS VerpakkingsEenheid,
        PROPL.DatumLevering,
        PROPL.DatumEerstVolgendeLevering,
        PROPL.IsActief,
        PROPL.Opmerkingen,
        PROPL.DatumAangemaakt,
        PROPL.DatumGewijzigd
    FROM ProductPerLeverancier AS PROPL
    LEFT JOIN Product AS P 
        ON P.Id = PROPL.ProductId
    LEFT JOIN Magazijn AS MAG 
        ON MAG.ProductId = P.Id
    WHERE PROPL.LeverancierId = p_leverancierid
    ORDER BY PROPL.DatumLevering DESC;
END$$

DELIMITER ;
