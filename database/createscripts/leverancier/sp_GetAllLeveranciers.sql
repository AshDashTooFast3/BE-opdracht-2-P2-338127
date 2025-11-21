USE BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetAllLeveranciers;

DELIMITER $$

CREATE PROCEDURE sp_GetAllLeveranciers()
BEGIN
    
    SELECT LEV.Id
          ,LEV.Naam
          ,LEV.ContactPersoon
          ,LEV.LeverancierNummer
          ,LEV.Mobiel
          ,LEV.AantalVerschillendeProducten AS VerschillendeProducten
          
    FROM Leverancier AS LEV
    ORDER BY LEV.AantalVerschillendeProducten ASC;

END$$

DELIMITER ;
