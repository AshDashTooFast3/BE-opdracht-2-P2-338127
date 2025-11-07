use BE_Opdracht_1;

DROP PROCEDURE IF EXISTS sp_GetProductById;

DELIMITER $$

CREATE PROCEDURE sp_GetProductById(
    IN p_productid INT
)
BEGIN

   SELECT DISTINCT
        PROD.Naam AS Productnaam,
        PROD.Barcode AS ProductBarcode
        
        FROM Product AS PROD
        LEFT JOIN ProductPerAllergeen AS PPA ON PPA.ProductId = PROD.Id

    WHERE PROD.Id = p_productid;
    
END$$

DELIMITER ;