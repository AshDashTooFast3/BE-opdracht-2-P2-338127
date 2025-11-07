use BE_Opdracht_1;

DROP PROCEDURE IF EXISTS sp_GetLeverancierInfo;

DELIMITER $$

CREATE PROCEDURE sp_GetLeverancierInfo (
    IN p_Id INT
)
BEGIN

    SELECT DISTINCT LEVE.Id
				   ,LEVE.Naam
				   ,LEVE.Contactpersoon
				   ,LEVE.Leveranciernummer
				   ,LEVE.Mobiel

    FROM   			Leverancier AS LEVE
    
    INNER JOIN 		ProductPerLeverancier AS PPLE
    ON 				LEVE.Id = PPLE.LeverancierId
    
    WHERE		    PPLE.ProductId = p_Id;

END$$

DELIMITER ;