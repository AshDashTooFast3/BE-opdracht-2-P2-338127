USE `BE_Opdracht_2`;

-- Tabellen droppen in juiste volgorde
DROP TABLE IF EXISTS ProductPerLeverancier;
DROP TABLE IF EXISTS ProductPerAllergeen;
DROP TABLE IF EXISTS Magazijn;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Allergeen;
DROP TABLE IF EXISTS Leverancier;

-- Tabel: Leverancier
CREATE TABLE Leverancier (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(50) NOT NULL,
    ContactPersoon VARCHAR(50) NOT NULL,
    LeverancierNummer VARCHAR(20) NOT NULL,
    Mobiel VARCHAR(15) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6)
) ENGINE = InnoDB;

INSERT INTO Leverancier (Id, Naam, ContactPersoon, LeverancierNummer, Mobiel, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1, NULL, NOW(6), NOW(6)),
(2, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 1, NULL, NOW(6), NOW(6)),
(3, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 1, NULL, NOW(6), NOW(6)),
(4, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 1, NULL, NOW(6), NOW(6)),
(5, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 1, NULL, NOW(6), NOW(6)),
(6, 'Quality Street', 'Johan Nooij', 'L1029234586', '06-23458456', 1, NULL, NOW(6), NOW(6));

-- Tabel: Product
CREATE TABLE Product (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(50) NOT NULL,
    Barcode VARCHAR(30) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6)
) ENGINE = InnoDB;

INSERT INTO Product (Id, Naam, Barcode, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 'Mintnopjes', '8719587231278', 1, NULL, NOW(6), NOW(6)),
(2, 'Schoolkrijt', '8719587326713', 1, NULL, NOW(6), NOW(6)),
(3, 'Honingdrop', '8719587327836', 1, NULL, NOW(6), NOW(6)),
(4, 'Zure Beren', '8719587321441', 1, NULL, NOW(6), NOW(6)),
(5, 'Cola Flesjes', '8719587321237', 1, NULL, NOW(6), NOW(6)),
(6, 'Turtles', '8719587322245', 1, NULL, NOW(6), NOW(6)),
(7, 'Witte Muizen', '8719587328256', 1, NULL, NOW(6), NOW(6)),
(8, 'Reuzen Slangen', '8719587325641', 1, NULL, NOW(6), NOW(6)),
(9, 'Zoute Rijen', '8719587322739', 1, NULL, NOW(6), NOW(6)),
(10, 'Winegums', '8719587327527', 1, NULL, NOW(6), NOW(6)),
(11, 'Drop Munten', '8719587322345', 1, NULL, NOW(6), NOW(6)),
(12, 'Kruis Drop', '8719587322265', 1, NULL, NOW(6), NOW(6)),
(13, 'Zoute Ruitjes', '8719587323256', 1, NULL, NOW(6), NOW(6));

-- Tabel: Allergeen
CREATE TABLE Allergeen (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(30) NOT NULL,
    Omschrijving VARCHAR(60) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6)
) ENGINE = InnoDB;

INSERT INTO Allergeen (Id, Naam, Omschrijving, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 'Gluten', 'Dit product bevat gluten', 1, NULL, NOW(6), NOW(6)),
(2, 'Gelatine', 'Dit product bevat gelatine', 1, NULL, NOW(6), NOW(6)),
(3, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstoffen', 1, NULL, NOW(6), NOW(6)),
(4, 'Lactose', 'Dit product bevat lactose', 1, NULL, NOW(6), NOW(6)),
(5, 'Soja', 'Dit product bevat soja', 1, NULL, NOW(6), NOW(6));

-- Tabel: Magazijn
CREATE TABLE Magazijn (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductId INT UNSIGNED NOT NULL,
    VerpakkingsEenheid DECIMAL(4,1) NOT NULL,
    AantalAanwezig INT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO Magazijn (Id, ProductId, VerpakkingsEenheid, AantalAanwezig, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 1, 5, 453, 1, NULL, NOW(6), NOW(6)),
(2, 2, 2.5, 400, 1, NULL, NOW(6), NOW(6)),
(3, 3, 5, 1, 1, NULL, NOW(6), NOW(6)),
(4, 4, 1, 800, 1, NULL, NOW(6), NOW(6)),
(5, 5, 3, 234, 1, NULL, NOW(6), NOW(6)),
(6, 6, 2, 345, 1, NULL, NOW(6), NOW(6)),
(7, 7, 1, 795, 1, NULL, NOW(6), NOW(6)),
(8, 8, 10, 233, 1, NULL, NOW(6), NOW(6)),
(9, 9, 2.5, 123, 1, NULL, NOW(6), NOW(6)),
(10, 10, 3, NULL, 1, NULL, NOW(6), NOW(6)),
(11, 11, 2, 367, 1, NULL, NOW(6), NOW(6)),
(12, 12, 1, 467, 1, NULL, NOW(6), NOW(6)),
(13, 13, 5, 20, 1, NULL, NOW(6), NOW(6));

-- Tabel: ProductPerAllergeen
CREATE TABLE ProductPerAllergeen (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductId INT UNSIGNED NOT NULL,
    AllergeenId INT UNSIGNED NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AllergeenId) REFERENCES Allergeen(Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO ProductPerAllergeen (Id, ProductId, AllergeenId, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 1, 2, 1, NULL, NOW(6), NOW(6)),
(2, 1, 1, 1, NULL, NOW(6), NOW(6)),
(3, 1, 3, 1, NULL, NOW(6), NOW(6)),
(4, 3, 4, 1, NULL, NOW(6), NOW(6)),
(5, 6, 5, 1, NULL, NOW(6), NOW(6)),
(6, 9, 2, 1, NULL, NOW(6), NOW(6)),
(7, 9, 5, 1, NULL, NOW(6), NOW(6)),
(8, 10, 2, 1, NULL, NOW(6), NOW(6)),
(9, 12, 4, 1, NULL, NOW(6), NOW(6)),
(10, 13, 1, 1, NULL, NOW(6), NOW(6)),
(11, 13, 4, 1, NULL, NOW(6), NOW(6)),
(12, 13, 5, 1, NULL, NOW(6), NOW(6));

-- Tabel: ProductPerLeverancier
CREATE TABLE ProductPerLeverancier (
    Id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LeverancierId INT UNSIGNED NOT NULL,
    ProductId INT UNSIGNED NOT NULL,
    DatumLevering DATE NOT NULL,
    Aantal INT NOT NULL,
    DatumEerstVolgendeLevering DATE NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    FOREIGN KEY (LeverancierId) REFERENCES Leverancier(Id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ProductId) REFERENCES Product(Id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO ProductPerLeverancier (Id, LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering, IsActief, Opmerkingen, DatumAangemaakt, DatumGewijzigd) VALUES
(1, 1, 1, '2024-11-09', 23, '2024-11-16', 1, NULL, NOW(6), NOW(6)),
(2, 1, 1, '2024-11-18', 21, '2024-11-25', 1, NULL, NOW(6), NOW(6)),
(3, 1, 2, '2024-11-09', 12, '2024-11-16', 1, NULL, NOW(6), NOW(6)),
(4, 1, 3, '2024-11-10', 11, '2024-11-17', 1, NULL, NOW(6), NOW(6)),
(5, 2, 4, '2024-11-14', 16, '2024-11-21', 1, NULL, NOW(6), NOW(6)),
(6, 2, 4, '2024-11-21', 23, '2024-11-28', 1, NULL, NOW(6), NOW(6)),
(7, 2, 5, '2024-11-14', 45, '2024-11-21', 1, NULL, NOW(6), NOW(6)),
(8, 2, 6, '2024-11-14', 30, '2024-11-21', 1, NULL, NOW(6), NOW(6)),
(9, 3, 7, '2024-11-12', 12, '2024-11-19', 1, NULL, NOW(6), NOW(6)),
(10, 3, 7, '2024-11-19', 23, '2024-11-26', 1, NULL, NOW(6), NOW(6)),
(11, 3, 8, '2024-11-10', 12, '2024-11-17', 1, NULL, NOW(6), NOW(6)),
(12, 3, 9, '2024-11-11', 1, '2024-11-18', 1, NULL, NOW(6), NOW(6)),
(13, 4, 10, '2024-11-16', 24, '2024-11-30', 1, NULL, NOW(6), NOW(6)),
(14, 5, 11, '2024-11-10', 47, '2024-11-17', 1, NULL, NOW(6), NOW(6)),
(15, 5, 11, '2024-11-19', 60, '2024-11-26', 1, NULL, NOW(6), NOW(6)),
(16, 5, 12, '2024-11-11', 45, NULL, 1, NULL, NOW(6), NOW(6)),
(17, 5, 13, '2024-11-12', 23, NULL, 1, NULL, NOW(6), NOW(6));
