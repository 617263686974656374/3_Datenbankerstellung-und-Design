CREATE DATABASE bibliotheksdatenbank;
USE bibliotheksdatenbank;

CREATE TABLE verlag (
verlagID SMALLINT PRIMARY KEY,
verlag VARCHAR(200) NOT NULL
) ;
    
    
CREATE TABLE fachbuch (
fachbuchID SMALLINT PRIMARY KEY,
ISBN INT(20) NOT NULL,
titel VARCHAR(200) NOT NULL,
verlagID SMALLINT,
FOREIGN KEY (verlagID) REFERENCES verlag (verlagID)
) ;

CREATE TABLE fachbereich (
fachbereichsID SMALLINT PRIMARY KEY,
fachbereich VARCHAR(200) NOT NULL
) ;

CREATE TABLE fachbereichfachbuch (
fachbereichsID SMALLINT,
fachbuchID SMALLINT,
FOREIGN KEY (fachbereichsID) REFERENCES fachbereich (fachbereichsID),
FOREIGN KEY (fachbuchID) REFERENCES fachbuch (fachbuchID)
) ;


INSERT INTO verlag (verlagID, verlag) VALUES
	(1, 'Programmier Verlag'),
    (2, 'IT Technik Verlag'),
    (3, 'Elektrotechnik Verlag'),
    (4, 'Automatisierung Verlag'),
    (5, 'Medien Verlag');
    
    
INSERT INTO fachbereich (fachbereichsID, fachbereich) VALUES
	(1, 'Applikationsentwicklung'),
    (2, 'IT Technik'),
    (3, 'Elektrotechnik'),
    (4, 'Automatisierungstechnik');
    
INSERT INTO fachbuch (fachbuchID, ISBN, titel, verlagID) VALUES
	(1, 1111, 'Applikationsentwicklung Fundamentals', 1),
    (2, 2222, 'Applikationsentwicklung Advanced', 1),
    (3, 3333, 'IT Technik-Betriebstehnik Fundamentals', 2),
    (4, 4444, 'IT Technik-Betriebstehnik Advanced', 2),
    (5, 5555, 'IT Technik-Systemtechnik Fundamentals', 2),
    (6, 6666, 'IT Technik-Systemtechnik Advanced', 2),
    (7, 7777, 'Elektrotechni I', 3),
    (8, 8888, 'Elektrotechni II', 3),
    (9, 9999, 'IT Technik-Systemtechnik Fundamentals', 4); 
    
INSERT INTO fachbereichfachbuch (fachbereichsID, fachbuchID) VALUES
	(1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (4, 9); 
    
    
-- Punkt 1:
SELECT fachbuch.titel, fachbuch.ISBN, verlag.verlag, fachbuch.verlagID
FROM fachbuch
JOIN verlag ON fachbuch.verlagID = verlag.verlagID;
    
-- Punkt 2: 
 SELECT fachbuch.titel, fachbuch.ISBN, verlag.verlag, fachbuch.verlagID
FROM fachbuch
RIGHT JOIN verlag ON fachbuch.verlagID = verlag.verlagID;

-- Punkt 3:
SELECT fachbuch.titel, fachbuch.ISBN, verlag.verlag, verlag.verlagID
FROM fachbuch, verlag;

-- Punkt 4:  
SELECT fachbuch.titel, fachbereich.fachbereich
FROM fachbuch
JOIN fachbereichfachbuch ON fachbuch.fachbuchID = fachbereichfachbuch.fachbuchID
JOIN fachbereich ON fachbereichfachbuch.fachbereichsID = fachbereich.fachbereichsID;

-- Punkt 5: 
CREATE TABLE ausleihe (
ausleihID SMALLINT,
exemplarID SMALLINT,
von DATE NOT NULL,
bis DATE NOT NULL,
ISBN INT(20) NOT NULL,
titel VARCHAR(50),
fachbuchID SMALLINT,
PRIMARY KEY (ausleihID, exemplarID),
FOREIGN KEY (fachbuchID) REFERENCES fachbuch (fachbuchID)
);

SELECT f.ISBN AS f_ISBN, f.titel AS f_titel, a.fachbuchID AS a_fachbuchID, a.titel AS a_titel, a.von, a.bis
FROM fachbuch f
JOIN ausleihe a ON f.fachbuchID = a.fachbuchID;

INSERT INTO ausleihe (ausleihID, exemplarID, von, bis, ISBN, titel, fachbuchID) VALUES
(1, 1, '2023-04-01', '2023-04-15', 1111, 'Applikationsentwicklung Fundamentals', 1);


DROP TABLE ausleihe;
CREATE TABLE ausleihe (
ausleihID SMALLINT,
exemplarID SMALLINT,
von DATE NOT NULL,
bis DATE NOT NULL,
fachbuchID SMALLINT,
PRIMARY KEY (ausleihID, exemplarID),
FOREIGN KEY (fachbuchID) REFERENCES fachbuch (fachbuchID)
);

INSERT INTO ausleihe (ausleihID, exemplarID, von, bis, fachbuchID) VALUES
(1, 1, '2023-04-01', '2023-04-15', 1);

SELECT f.ISBN AS f_ISBN, f.titel AS f_titel, a.fachbuchID AS a_fachbuchID, f.titel AS a_titel, a.von, a.bis
FROM fachbuch f
JOIN ausleihe a ON f.fachbuchID = a.fachbuchID;


