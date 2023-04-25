CREATE TABLE Teilnehmer (
  TeilnehmerID INT AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Surname VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Organization VARCHAR(50) NOT NULL,
  PRIMARY KEY (TeilnehmerID)
);

CREATE TABLE Referent (
  ReferentID INT AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Surname VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Organization VARCHAR(50) NOT NULL,
  PRIMARY KEY (ReferentID)
);

CREATE TABLE Themen (
  ThemaID INT AUTO_INCREMENT,
  Beschreibung VARCHAR(100) NOT NULL,
  ReferentID INT NOT NULL,
  PRIMARY KEY (ThemaID),
  FOREIGN KEY (ReferentID) REFERENCES Referent(ReferentID)
);

CREATE TABLE TeilnehmerThema (
  TeilnehmerID INT NOT NULL,
  ThemaID INT NOT NULL,
  FOREIGN KEY (TeilnehmerID) REFERENCES Teilnehmer(TeilnehmerID),
  FOREIGN KEY (ThemaID) REFERENCES Themen(ThemaID)
);

INSERT INTO Teilnehmer (Name, Surname, Email, Organization) VALUES
('John', 'Doe', 'john.doe@email.com', 'XYZ Company'),
('Jane', 'Smith', 'jane.smith@email.com', 'ABC Inc.'),
('Bob', 'Johnson', 'bob.johnson@email.com', '123 Industries');

INSERT INTO Referent (Name, Surname, Email, Organization) VALUES
('Filip', 'Love', 'filip.love@email.com', 'SZF'),
('Mike', 'Smith', 'mike.smith@email.com', 'SZF'),
('Donald', 'Trump', 'donald.trump@email.com', 'SZF');

INSERT INTO Themen (Beschreibung, ReferentID) 
VALUES ('Einführung in SQL', 2), ('Datenbankdesign', 1);

INSERT INTO TeilnehmerThema (TeilnehmerID, ThemaID) 
VALUES (1, 1), (2, 1), (2, 2), (3, 2);

SELECT * FROM Teilnehmer;
SELECT * FROM Referent;
SELECT * FROM TeilnehmerThema;
SELECT * FROM Themen;
