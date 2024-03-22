DROP SCHEMA miniprojetbddbd;
CREATE SCHEMA miniprojetbddbd;
USE miniprojetbddbd;

CREATE TABLE Auteur(
   IdAuteur INT,
   Prénom VARCHAR(20) NOT NULL,
   Nom VARCHAR(20) NOT NULL,
   AnnéeNaissance INT NOT NULL,
   Nationalité VARCHAR(20) NOT NULL,
   PRIMARY KEY(IdAuteur)
);

CREATE TABLE Adresse(
   IdAdresse INT,
   Pays VARCHAR(20) NOT NULL,
   Ville VARCHAR(20) NOT NULL,
   ComplémentAdresse VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdAdresse)
);

CREATE TABLE Genre(
   IdGenre INT,
   NomGenre VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdGenre)
);

CREATE TABLE MaisonEdition(
   IdMaisonEdition INT,
   Nom VARCHAR(20) NOT NULL,
   DateCréation DATE NOT NULL,
   Mail VARCHAR(50) NOT NULL,
   NumTéléphone BIGINT NOT NULL,
   SiteWeb VARCHAR(50) NOT NULL,
   IdAdresse INT NOT NULL,
   PRIMARY KEY(IdMaisonEdition),
   FOREIGN KEY(IdAdresse) REFERENCES Adresse(IdAdresse) ON DELETE CASCADE
);

CREATE TABLE Livre(
   IdLivre INT,
   Titre VARCHAR(100),
   AnnéeDePublication INT NOT NULL,
   Public VARCHAR(30) NOT NULL,
   IdMaisonEdition INT NOT NULL,
   IdGenre INT NOT NULL,
   IdAuteur INT NOT NULL,
   PRIMARY KEY(IdLivre),
   FOREIGN KEY(IdMaisonEdition) REFERENCES MaisonEdition(IdMaisonEdition) ON DELETE CASCADE,
   FOREIGN KEY(IdGenre) REFERENCES Genre(IdGenre),
   FOREIGN KEY(IdAuteur) REFERENCES Auteur(IdAuteur)
);


CREATE TABLE Preférer(
   IdAuteur INT,
   IdGenre INT,
   PRIMARY KEY(IdAuteur, IdGenre),
   FOREIGN KEY(IdAuteur) REFERENCES Auteur(IdAuteur) ON DELETE CASCADE,
   FOREIGN KEY(IdGenre) REFERENCES Genre(IdGenre)
);

