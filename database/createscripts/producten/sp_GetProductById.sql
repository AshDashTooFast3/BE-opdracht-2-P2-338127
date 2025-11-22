USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetProductById;
DELIMITER $$

CREATE PROCEDURE sp_GetProductById(IN p_productid INT)
BEGIN
    SELECT 
        P.Id AS ProductId,
        P.Naam AS ProductNaam,
        MAG.Verpakkingseenheid,
        PROPL.Id AS ProductPerLeverancierId,
        PROPL.LeverancierId,
        PROPL.Aantal,
        PROPL.DatumLevering,
        PROPL.DatumEerstVolgendeLevering,
        P.IsActief
    FROM Product AS P
    LEFT JOIN ProductPerLeverancier AS PROPL ON PROPL.ProductId = P.Id
    LEFT JOIN Magazijn AS MAG ON MAG.ProductId = P.Id
    WHERE P.Id = p_productid;
END$$


DELIMITER ;
