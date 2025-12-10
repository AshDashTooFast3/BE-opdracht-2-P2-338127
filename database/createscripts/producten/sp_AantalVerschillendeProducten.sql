USE BE_Opdracht_2;
DROP PROCEDURE IF EXISTS sp_AantalVerschillendeProducten;

DELIMITER $$

CREATE PROCEDURE sp_AantalVerschillendeProducten()
BEGIN
    SELECT COUNT(DISTINCT Id) AS aantalVerschillendeProducten
    FROM Product;
END$$

DELIMITER ;