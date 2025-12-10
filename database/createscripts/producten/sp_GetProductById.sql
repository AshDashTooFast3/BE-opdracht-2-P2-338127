USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetProductById;
DELIMITER $$

CREATE PROCEDURE sp_GetProductById(IN p_productid INT)
BEGIN
    SELECT 
        P.Id AS ProductId,
        P.Naam AS ProductNaam,
        L.Naam AS LeverancierNaam,
        L.ContactPersoon,
        L.Mobiel,
         IF(MAG.VerpakkingsEenheid = FLOOR(MAG.VerpakkingsEenheid),
           FLOOR(MAG.VerpakkingsEenheid),
           MAG.VerpakkingsEenheid
        ) AS VerpakkingsEenheid,
        PROPL.Id AS ProductPerLeverancierId,
        PROPL.LeverancierId,
        PROPL.Aantal,
        PROPL.DatumLevering,
        PROPL.DatumEerstVolgendeLevering,
        P.IsActief
    FROM Product AS P
    LEFT JOIN ProductPerLeverancier AS PROPL ON PROPL.ProductId = P.Id
    LEFT JOIN Leverancier AS L ON L.Id = PROPL.LeverancierId
    LEFT JOIN Magazijn AS MAG ON MAG.ProductId = P.Id
    WHERE P.Id = p_productid;
END$$


DELIMITER ;
