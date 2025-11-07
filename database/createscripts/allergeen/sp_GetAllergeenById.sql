USE BE_Opdracht_1;

DROP PROCEDURE IF EXISTS sp_GetAllergeenByProductId;

DELIMITER $$

CREATE PROCEDURE sp_GetAllergeenByProductId(
    IN p_productid INT
)
BEGIN
    SELECT DISTINCT 
        ALGE.Id,
        ALGE.Naam,
        ALGE.Omschrijving

    FROM Allergeen AS ALGE

    INNER JOIN ProductPerAllergeen AS PPA ON PPA.AllergeenId = ALGE.Id

    WHERE PPA.ProductId = p_productid
    ORDER BY ALGE.Naam ASC;
    
END$$

DELIMITER ;
