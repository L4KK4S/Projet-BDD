use miniprojetbddbd;


select * from auteur;
select * from adresse;
select * from maisonedition;
select IdGenre from genre where NomGenre = "Aventure";
select * from preférer;
select * from livre order by IdLivre DESC;

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE maisonedition MODIFY NumTéléphone BIGINT; 
DELETE FROM genre;
ALTER TABLE Livre DROP COLUMN Type;
ALTER TABLE Livre RENAME COLUMN ID TO IdLivre;
ALTER TABLE Livre DROP COLUMN Genre;
ALTER TABLE Livre ADD Titre VARCHAR(50) NOT NULL;
ALTER TABLE Livre
MODIFY COLUMN Titre VARCHAR(50) NOT NULL AFTER IdLivre;
DELETE FROM livre;