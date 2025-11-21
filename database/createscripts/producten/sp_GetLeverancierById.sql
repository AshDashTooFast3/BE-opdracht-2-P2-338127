use BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetLeverancierById;

DELIMITER $$

CREATE PROCEDURE sp_GetLeverancierById(
    IN p_leverancierid INT
)
BEGIN
    SELECT DISTINCT
        L.Id,
        L.Naam ,
        L.ContactPersoon,
        L.Mobiel,
        L.LeverancierNummer
    FROM Leverancier AS L
    LEFT JOIN ProductPerLeverancier AS PROPL ON PROPL.LeverancierId = L.Id
    WHERE L.Id = p_leverancierid;
END$$

DELIMITER ;