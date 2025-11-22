use BE_Opdracht_2;

DROP PROCEDURE IF EXISTS sp_GetLeverancierById;

DELIMITER $ $ CREATE PROCEDURE sp_GetLeverancierById(IN p_leverancierid INT) BEGIN
SELECT
    L.Id,
    L.Naam AS LeverancierNaam,
    L.ContactPersoon,
    L.LeverancierNummer,
    L.Mobiel
FROM
    Leverancier L
WHERE
    L.Id = p_leverancierid
LIMIT
    1;

END $ $ DELIMITER;

