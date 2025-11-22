-- Step: 01
-- Goal: Create a new database laravel
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New Database
-- **********************************************************************************/

-- DROP DATABASE IF EXISTS BE_Opdracht_2;

-- CREATE DATABASE BE_Opdracht_2;

-- Use database laravel
USE `BE_Opdracht_2`;

-- Step: 02
-- Goal: Create a new table Allergeen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New table
-- **********************************************************************************/
-- Drop table Instructeur
-- Drop table Magazijn

-- tabbellen droppen
DROP TABLE IF EXISTS Magazijn;
DROP TABLE IF EXISTS ProductPerAllergeen;
DROP TABLE IF EXISTS ProductPerLeverancier;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Leverancier;




CREATE TABLE IF NOT EXISTS Magazijn (
    Id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ProductId TINYINT UNSIGNED NOT NULL,
    VerpakkingsEenheid DECIMAL(3,0) NOT NULL,
    AantalAanwezig INT NULL DEFAULT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Magazijn_Id PRIMARY KEY CLUSTERED(Id)
) ENGINE = InnoDB;


-- Fill table Magazijn with data
INSERT INTO
    Magazijn (
        ProductId,
        VerpakkingsEenheid,
        AantalAanwezig
    )
    
VALUES
(1, 5, 453),
(2, 2.5, 400),
(3, 5, 1),
(4, 1, 800),
(5, 3, 234),
(6, 2, 345),
(7, 1, 795),
(8, 10, 233),
(9, 2.5, 123),
(10, 3, 300),
(11, 2, 367),
(12, 1, 467),
(13, 5, 20);

-- Step: 02b
-- Goal: Create a new table Product
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New table
-- **********************************************************************************/


CREATE TABLE IF NOT EXISTS Product (
    Id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(50) NOT NULL,
    Barcode VARCHAR(30) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Product_Id PRIMARY KEY CLUSTERED(Id)
) ENGINE = InnoDB;

-- Fill table Product with data
INSERT INTO
    Product (
        Id,
        Naam,
        Barcode,
        IsActief
    )
VALUES
(1, 'Mintnopjes', '871123456001', 1),
(2, 'Schoolkrijt', '871123456002', 1),
(3, 'Honingdrop', '871123456003', 1),
(4, 'Zure Beren', '871123456004', 1),
(5, 'Cola Flesjes', '871123456005', 1),
(6, 'Turtles', '871123456006', 1),
(7, 'Witte Muizen', '871123456007', 1),
(8, 'Reuzen Slangen', '871123456008', 1),
(9, 'Zoute Rijen', '871123456009', 1),
(10, 'Winegums', '871123456010', 0),
(11, 'Drop Munten', '871123456011', 1),
(12, 'Kruis Drop', '871123456012', 1),
(13, 'Zoute Ruitjes', '871123456013', 1);

-- Step: 03
-- Goal: Create a new table Allergeen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New table
-- **********************************************************************************/

DROP TABLE IF EXISTS Allergeen;

CREATE TABLE IF NOT EXISTS Allergeen (
    Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(30) NOT NULL,
    Omschrijving VARCHAR(60) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Allergeen_Id PRIMARY KEY CLUSTERED(Id)
) ENGINE = InnoDB;

-- Step: 03
-- Goal: Fill table Allergeen with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New data
-- **********************************************************************************/

INSERT INTO
    Allergeen (
        Naam,
        Omschrijving,
        IsActief,
        Opmerkingen,
        DatumAangemaakt,
        DatumGewijzigd
    )
VALUES
('Pinda', 'Kan sporen van pinda bevatten', 1, 'Let op bij allergieën', SYSDATE(6), SYSDATE(6)),
('Noten', 'Bevat verschillende soorten noten', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Melk', 'Melkbestanddelen aanwezig', 1, 'Geschikt voor vegetariërs', SYSDATE(6), SYSDATE(6)),
('Ei', 'Bevat ei of eipoeder', 1, NULL, SYSDATE(6), SYSDATE(6)),
('Sulfiet', 'Sulfiet als conserveermiddel', 1, 'Kan allergische reacties veroorzaken', SYSDATE(6), SYSDATE(6));




CREATE TABLE IF NOT EXISTS ProductPerAllergeen (
    Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ProductId TINYINT UNSIGNED NOT NULL,
    AllergeenId SMALLINT UNSIGNED NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    PRIMARY KEY CLUSTERED(Id),
    FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AllergeenId) REFERENCES Allergeen(Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Fill table ProductPerAllergeen with data
INSERT INTO
    ProductPerAllergeen (
     Id,
     ProductId,
     AllergeenId
     )

VALUES

(1, 1, 2),
(2, 1, 1),
(4, 3, 4),
(5, 6, 5),
(6, 9, 2),
(7, 9, 5),
(8, 10, 2),
(9, 12, 4),
(10, 13, 1),
(11, 13, 4),
(12, 13, 5);

-- Step: 05
-- Goal: Create a new table Leverancier and fill with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New table
-- **********************************************************************************/



CREATE TABLE IF NOT EXISTS Leverancier (
    Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Naam VARCHAR(50) NOT NULL,
    ContactPersoon VARCHAR(50) NOT NULL,
    LeverancierNummer VARCHAR(20) NOT NULL,
    Mobiel VARCHAR(15) NOT NULL,
    AantalVerschillendeProducten INT NOT NULL DEFAULT 0,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Leverancier_Id PRIMARY KEY CLUSTERED(Id)
) ENGINE = InnoDB;

-- Fill table Leverancier with data
INSERT INTO
    Leverancier (
        Id,
        Naam,
        ContactPersoon,
        LeverancierNummer,
        Mobiel,
        AantalVerschillendeProducten
    )
VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 1),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 3),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 3),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 3);



-- Step: 04
-- Goal: Create a new table ProductPerLeverancier
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            12-09-2025      Arjan de Ruijter            New table
-- **********************************************************************************/

DROP TABLE IF EXISTS ProductPerLeverancier;

CREATE TABLE IF NOT EXISTS ProductPerLeverancier (
Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
LeverancierId SMALLINT UNSIGNED NOT NULL,
ProductId TINYINT UNSIGNED NULL,
DatumLevering DATE NOT NULL,
Aantal INT NOT NULL,
DatumEerstVolgendeLevering DATE NULL DEFAULT NULL,
IsActief BIT NOT NULL DEFAULT 1,
Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
CONSTRAINT PK_ProductPerLeverancier_Id PRIMARY KEY CLUSTERED(Id),
CONSTRAINT FK_ProductPerLeverancier_LeverancierId FOREIGN KEY (LeverancierId) REFERENCES Leverancier(Id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT FK_ProductPerLeverancier_ProductId FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Fill table ProductPerLeverancier with data
INSERT INTO ProductPerLeverancier (
Id,
LeverancierId,
ProductId,
DatumLevering,
Aantal,
DatumEerstVolgendeLevering
)
VALUES
(1, 1, 1, '2024-10-09', 23, '2024-10-16'),
(2, 1, 1, '2024-10-18', 21, '2024-10-25'),
(3, 1, 2, '2024-10-09', 12, '2024-10-16'),
(4, 1, 3, '2024-10-10', 11, '2024-10-17'),
(5, 2, 4, '2024-10-14', 16, '2024-10-21'),
(6, 2, 4, '2024-10-21', 23, '2024-10-28'),
(7, 2, 5, '2024-10-14', 45, '2024-10-21'),
(8, 2, 6, '2024-10-14', 30, '2024-10-21'),
(9, 3, 7, '2024-10-12', 12, '2024-10-19'),
(10, 3, 7, '2024-10-19', 23, '2024-10-26'),
(11, 3, 8, '2024-10-10', 12, '2024-10-17'),
(12, 3, 9, '2024-10-11', 1, '2024-10-18'),
(13, 4, 10, '2024-10-16', 0, '2024-10-30'),
(14, 5, 11, '2024-10-10', 47, '2024-10-17'),
(15, 5, 11, '2024-10-19', 60, '2024-10-26'),
(16, 5, 12, '2024-10-11', 45, '2024-10-28'),
(17, 5, 13, '2024-10-12', 23, '2024-10-27');

