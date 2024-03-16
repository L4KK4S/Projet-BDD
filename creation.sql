use miniprojetbddbd;

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
   FOREIGN KEY(IdAdresse) REFERENCES Adresse(IdAdresse)
);

CREATE TABLE Livre(
   ID VARCHAR(20),
   Titre VARCHAR(50) NOT NULL,
   Public VARCHAR(20) NOT NULL,
   AnnéeDePublication INT NOT NULL,
   IdMaisonEdition INT NOT NULL,
   IdGenre INT NOT NULL,
   PRIMARY KEY(ID),
   FOREIGN KEY(IdMaisonEdition) REFERENCES MaisonEdition(IdMaisonEdition),
   FOREIGN KEY(IdGenre) REFERENCES Genre(IdGenre)
);

CREATE TABLE Ecriture(
   ID VARCHAR(20),
   IdAuteur INT,
   PRIMARY KEY(ID, IdAuteur),
   FOREIGN KEY(ID) REFERENCES Livre(ID),
   FOREIGN KEY(IdAuteur) REFERENCES Auteur(IdAuteur)
);

CREATE TABLE Preférer(
   IdAuteur INT,
   IdGenre INT,
   PRIMARY KEY(IdAuteur, IdGenre),
   FOREIGN KEY(IdAuteur) REFERENCES Auteur(IdAuteur),
   FOREIGN KEY(IdGenre) REFERENCES Genre(IdGenre)
);