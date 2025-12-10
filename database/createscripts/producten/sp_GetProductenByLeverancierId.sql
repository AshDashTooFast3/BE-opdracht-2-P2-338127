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
        SUM(PROPL.Aantal) AS Aantal,
        IF(MAG.VerpakkingsEenheid = FLOOR(MAG.VerpakkingsEenheid),
            FLOOR(MAG.VerpakkingsEenheid),
            MAG.VerpakkingsEenheid
        ) AS VerpakkingsEenheid,
        DATE_FORMAT(MAX(PROPL.DatumLevering), '%d-%m-%Y') AS DatumLevering,
        DATE_FORMAT(MAX(NOW(6)), '%d-%m-%Y') AS DatumEerstVolgendeLevering,
        MAX(PROPL.IsActief) AS IsActief,
        MAX(PROPL.Opmerkingen) AS Opmerkingen,
        MAX(PROPL.DatumAangemaakt) AS DatumAangemaakt,
        MAX(PROPL.DatumGewijzigd) AS DatumGewijzigd
    FROM ProductPerLeverancier AS PROPL
    LEFT JOIN Product AS P ON P.Id = PROPL.ProductId
    LEFT JOIN Magazijn AS MAG ON MAG.ProductId = P.Id
    WHERE PROPL.LeverancierId = p_leverancierid
    GROUP BY PROPL.ProductId
    ORDER BY MAX(PROPL.DatumLevering) DESC;


END$$

DELIMITER ;
