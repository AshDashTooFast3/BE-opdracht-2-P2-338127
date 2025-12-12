USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetAllLeveranciers;

DELIMITER $$

CREATE PROCEDURE sp_GetAllLeveranciers()
BEGIN
    
    SELECT LEV.Id
          ,LEV.Naam AS LeverancierNaam
          ,LEV.ContactPersoon
          ,LEV.LeverancierNummer
          ,LEV.Mobiel
          ,COUNT(DISTINCT PPL.ProductId) AS AantalVeschillendeProducten
        
    FROM Leverancier AS LEV
    
    LEFT JOIN ProductPerLeverancier AS PPL
        ON LEV.Id = PPL.LeverancierId
    
    GROUP BY LEV.Id;

END$$

DELIMITER ;

CALL sp_GetAllLeveranciers;