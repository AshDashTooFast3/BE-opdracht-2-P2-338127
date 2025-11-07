use BE_Opdracht_1;

DROP PROCEDURE IF EXISTS sp_GetAllProducts;

DELIMITER $$

CREATE PROCEDURE sp_GetAllProducts()
BEGIN
	
    SELECT PROD.Id
		  ,PROD.Naam
          ,PROD.Barcode
          ,IF(MOD(MAGA.VerpakkingsEenheid, 1) = 0, FLOOR(MAGA.VerpakkingsEenheid), MAGA.VerpakkingsEenheid) AS VerpakkingsEenheid
          ,MAGA.AantalAanwezig
          
	FROM Product AS PROD
    
    INNER JOIN Magazijn AS MAGA
    
    ON PROD.Id = MAGA.ProductId
    ORDER BY PROD.Barcode ASC;

END$$

DELIMITER ;