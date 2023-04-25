CREATE DATABASE Shop_DB_jaroslav;
USE Shop_DB_jaroslav;

CREATE TABLE Kunden (
    kunden_id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    straße VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(50),
    telefonnummer VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Lieferanten (
    lieferanten_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    straße VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(50),
    telefonnummer VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Artikel (
    artikel_id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(100),
    beschreibung TEXT,
    preis DECIMAL(10,2),
    lagerbestand INT
);

CREATE TABLE Verkauf (
    verkauf_id INT AUTO_INCREMENT PRIMARY KEY,
    kunden_id INT,
    lieferanten_id INT,
    artikel_id INT,
    menge INT,
    datum DATE,
    FOREIGN KEY (kunden_id) REFERENCES Kunden(kunden_id),
    FOREIGN KEY (lieferanten_id) REFERENCES Lieferanten(lieferanten_id),
    FOREIGN KEY (artikel_id) REFERENCES Artikel(artikel_id)
);

INSERT INTO Kunden (vorname, nachname, straße, hausnummer, postleitzahl, stadt, telefonnummer, email) VALUES 
	('Wolfgang', 'Szombath', 'Amadeusstraße', '12', '12345', 'Fohnsdorf', '0123456789', 'wolfgang@szombath.at'),
    ('Elisabeth', 'Pall', 'Mozartstraße', '5', '1245', 'Wien', '008877554', 'elisabeth@pall.at'),
	('Markus', 'Gschaider', 'Altestraße', '1', '5555', 'Graz', '078888774', 'markus@gschaider.at');

INSERT INTO Lieferanten (name, straße, hausnummer, postleitzahl, stadt, telefonnummer, email) VALUES 
	('Cambridge University', 'Queen street', '1', '05555', 'Cambridge', '078844411', 'info@camuni.org'),
    ('SZF', 'Schulestraße', '1', '23456', 'Fohnsdorf', '0987654321', 'info@szf.at');

INSERT INTO Artikel (bezeichnung, beschreibung, preis, lagerbestand) VALUES 
	('Buch', 'Hacking for beginner', 9.99, 5),
	('Buch', 'JAVA for beginner', 19.99, 100);

INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum) VALUES 
	(1, 1, 1, 2, '2023-04-12'),
    (2, 2, 2, 1, '2023-04-13'),
    (1, 2, 2, 1, '2023-04-14');

-- Abfrage aller Kunden
SELECT * FROM Kunden;

-- Abfrage aller Lieferanten
SELECT * FROM Lieferanten;

-- Abfrage aller Artikel
SELECT * FROM Artikel;

-- Abfrage des Lagerbestands eines bestimmten Artikels
SELECT lagerbestand FROM Artikel WHERE artikel_id = 1;

-- Abfrage aller Verkäufe eines bestimmten Kunden
SELECT * FROM Verkauf WHERE kunden_id = 1;

-- Abfrage aller Verkäufe eines bestimmten Lieferanten
SELECT * FROM Verkauf WHERE lieferanten_id = 1;

-- Abfrage aller Artikel, die unter einem bestimmten Preis liegen
SELECT * FROM Artikel WHERE preis < 20;

-- Abfrage des Gesamtumsatzes des Shops
SELECT SUM(preis * menge) as Gesamtumsatz FROM Verkauf JOIN Artikel ON Verkauf.artikel_id = Artikel.artikel_id;

-- Abfrage des durchschnittlichen Verkaufspreises eines bestimmten Artikels
SELECT AVG(preis) as Durchschnittspreis FROM Verkauf JOIN Artikel ON Verkauf.artikel_id = Artikel.artikel_id WHERE Artikel.artikel_id = 1;

-- Abfrage zum Ändern des Lagerbestands eines Artikels um eine bestimmte Menge
UPDATE Artikel SET lagerbestand = lagerbestand - 10 WHERE artikel_id = 2;
SELECT * FROM Artikel;

-- Abfrage zum Löschen eines Kunden und aller zugehörigen Verkäufe
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM Verkauf WHERE kunden_id = 1;
DELETE FROM Kunden WHERE kunden_id = 1;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM kunden;


-- Abfrage zum Löschen eines Artikels und aller zugehörigen Verkäufe
DELETE FROM Artikel WHERE artikel_id = 1;
DELETE FROM Verkauf WHERE artikel_id = 1;

SELECT * FROM Artikel;
SELECT * FROM Verkauf;

-- Abfrage aller Verkäufe mit den Informationen zu Kunde, Lieferant und Artikel
SELECT Verkauf.*, Kunden.vorname, Kunden.nachname, Lieferanten.name as lieferanten_name, Artikel.bezeichnung, Artikel.beschreibung
FROM Verkauf
JOIN Kunden ON Verkauf.kunden_id = Kunden.kunden_id
JOIN Lieferanten ON Verkauf.lieferanten_id = Lieferanten.lieferanten_id
JOIN Artikel ON Verkauf.artikel_id = Artikel.artikel_id;

-- Abfrage aller Artikel und ihrer Lieferanten
SELECT Artikel.*, ANY_VALUE(Lieferanten.name) as lieferanten_name
FROM Artikel
JOIN Verkauf ON Artikel.artikel_id = Verkauf.artikel_id
JOIN Lieferanten ON Verkauf.lieferanten_id = Lieferanten.lieferanten_id
GROUP BY Artikel.artikel_id;



-- Erstellung einer View, die alle Kunden und deren Umsätze listet
CREATE VIEW Kunden_Umsatz AS
SELECT Kunden.*, SUM(Artikel.preis * Verkauf.menge) as Umsatz
FROM Kunden
JOIN Verkauf ON Kunden.kunden_id = Verkauf.kunden_id
JOIN Artikel ON Verkauf.artikel_id = Artikel.artikel_id
GROUP BY Kunden.kunden_id;

SELECT * FROM shop_db_jaroslav.kunden_umsatz;

-- Durchführung einer Transaktion, um den Lagerbestand eines Artikels zu reduzieren und einen Verkauf zu protokollieren
START TRANSACTION;
UPDATE Artikel SET lagerbestand = lagerbestand - 1 WHERE artikel_id = 2;
INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum) VALUES (2, 2, 2, 1, '2023-04-15');
COMMIT;

SELECT * FROM verkauf;
SELECT * FROM artikel;

SELECT * FROM kunden;

-- Durchführung einer Transaktion, um einen neuen Kunden und einen neuen Verkauf hinzuzufügen
START TRANSACTION;
INSERT INTO Kunden (vorname, nachname, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES ('Christian', 'Kaiser', 'Baumstraße', '5', '6466', 'Neustadt', '0246813579', 'christian@kaiser.at');
SET @new_customer_id = LAST_INSERT_ID();

INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES (@new_customer_id, 1, 2, 1, '2023-04-17');
COMMIT;

SELECT * FROM Kunden;
SELECT * FROM Verkauf;

-- Durchführung einer Transaktion, um den Preis eines Artikels zu ändern und den Preis in allen zugehörigen Verkäufen zu aktualisieren
START TRANSACTION;
UPDATE Artikel SET preis = 25.99 WHERE artikel_id = 2;
COMMIT;

SELECT Verkauf.*, Kunden.vorname, Kunden.nachname, Lieferanten.name as lieferanten_name, Artikel.bezeichnung, Artikel.beschreibung, Artikel.preis as aktueller_preis
FROM Verkauf
JOIN Kunden ON Verkauf.kunden_id = Kunden.kunden_id
JOIN Lieferanten ON Verkauf.lieferanten_id = Lieferanten.lieferanten_id
JOIN Artikel ON Verkauf.artikel_id = Artikel.artikel_id
WHERE Artikel.artikel_id = 2;

ALTER TABLE Verkauf ADD INDEX idx_verkauf_kunden_id (kunden_id);
ALTER TABLE Verkauf ADD INDEX idx_verkauf_lieferanten_id (lieferanten_id);
ALTER TABLE Verkauf ADD INDEX idx_verkauf_artikel_id (artikel_id);
SHOW INDEXES FROM Verkauf;



