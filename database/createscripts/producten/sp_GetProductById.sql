USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetProductById;

DELIMITER $$

CREATE PROCEDURE sp_GetProductById(
    IN p_productid INT
)
BEGIN
    SELECT DISTINCT
        P.Id,
        P.Naam AS ProductNaam,
        MAG.AantalAanwezig AS AantalMagazijn,
        MAG.VerpakkingsEenheid AS Verpakkingseenheid,
        PROPL.LaatsteLevering
    FROM Product AS P
    LEFT JOIN Magazijn AS MAG ON MAG.ProductId = P.Id
    LEFT JOIN ProductPerLeverancier AS PROPL ON PROPL.ProductId = P.Id
    WHERE P.Id = p_productid
    ORDER BY MAG.AantalAanwezig DESC;
    
END$$

DELIMITER ;
