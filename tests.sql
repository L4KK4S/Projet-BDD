 -- Utilisation de la table
 USE miniprojetbddbd;

-- Commandes pour vérifer le bon déroulement du peuplement de la base
SELECT * FROM Adresse;
SELECT * FROM MaisonEdition;
SELECT * FROM Genre;
SELECT * FROM Auteur;
SELECT * FROM Preférer;
SELECT * FROM Livre;

-- On affiche les livres triés pas Id croissant
SELECT * FROM Livre ORDER BY IdLivre ASC;

-- On affiche le Nom et Prénom d'un auteur et ses livres
SELECT A.Nom, A.Prénom, L.Titre from Auteur A join Livre L using(IdAuteur) order by IdLivre asc;

-- On affiche le titre des livres qui ont étés publiés en Suisse
SELECT L.Titre FROM Livre L JOIN MaisonEdition M USING(IdMaisonEdition) JOIN Adresse Ad USING(IdAdresse) WHERE Ad.Pays = "Suisse";

-- On affiche le nom du genre et les livres qui ont un IdGenre égal à 3
SELECT G.NomGenre, L.Titre FROM Livre L JOIN Genre G USING(IdGenre) WHERE L.IdGenre = 2;

-- On affiche les livres pas pour adultes
SELECT * FROM Livre WHERE Public <> "Adulte";

-- On affiche les tires et les années de publication des livres qui sont sortis avant 1950
SELECT Titre, AnnéeDePublication FROM Livre WHERE AnnéeDePublication < 1950 ORDER BY AnnéeDePublication ASC;

-- On affiche les auteurs qui ont comme genre préféré l'humour (id = 2)
SELECT  A.Prénom, A.Nom FROM Auteur A JOIN Preférer P ON A.IdAuteur = P.IdAuteur WHERE P.IdGenre = 2;
