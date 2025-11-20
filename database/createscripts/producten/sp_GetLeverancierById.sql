use BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetLeverancierById;

DELIMITER $$

CREATE PROCEDURE sp_GetLeverancierById(
    IN p_productid INT
)
BEGIN
    SELECT DISTINCT
        LEV.Id,
        LEV.Naam,
        LEV.ContactPersoon,
        LEV.LeverancierNummer,
        LEV.Mobiel,
        LEV.AantalVerschillendeProducten AS VerschillendeProducten
        
    FROM Leverancier AS LEV
    INNER JOIN ProductPerLeverancier AS PPL ON PPL.LeverancierId = LEV.Id
    WHERE PPL.ProductId = p_productid;
END$$

DELIMITER ;
