import csv
import mysql.connector


def load_auteur():
    # Lecture du fichier CSV et insertion des données dans la base de données
    with open('auteur.csv', 'r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            id_auteur = row['IdAuteur']
            prenom = row['Prénom']
            nom = row['Nom']
            annee_naissance = row['AnnéeNaissance']
            nationalite = row['Nationalité']
            
            # Requête SQL pour insérer les données dans la table
            sql = "INSERT INTO auteur (IdAuteur, Prénom, Nom, AnnéeNaissance, Nationalité) VALUES (%s, %s, %s, %s, %s)"
            values = (id_auteur, prenom, nom, annee_naissance, nationalite)
            
            # Exécution de la requête SQL
            cursor.execute(sql, values)
            conn.commit()

def load_adresse():
    # Lecture du fichier CSV et insertion des données dans la base de données
    with open('adresse.csv', 'r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            id_adresse = row['IdAdresse']
            pays = row['Pays']
            ville = row['Ville']
            complement_adresse = row['ComplémentAdresse']
            
            # Requête SQL pour insérer les données dans la table
            sql = "INSERT INTO adresse (IdAdresse, Pays, Ville, ComplémentAdresse) VALUES (%s, %s, %s, %s)"
            values = (id_adresse, pays, ville, complement_adresse)
            
            # Exécution de la requête SQL
            cursor.execute(sql, values)
            conn.commit()

def load_maisonedition():
    # Lecture du fichier CSV et insertion des données dans la base de données
    with open('maisonedition.csv', 'r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            id_maison_edition = row['IdMaisonEdition']
            nom = row['Nom']
            date_creation = row['DateCréation']
            mail = row['Mail']
            num_telephone = row['NumTéléphone']
            site_web = row['SiteWeb']
            id_adresse = row['IdAdresse']
            
            # Requête SQL pour insérer les données dans la table
            sql = "INSERT INTO maisonedition (IdMaisonEdition, Nom, DateCréation, Mail, NumTéléphone, SiteWeb, IdAdresse) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            values = (id_maison_edition, nom, date_creation, mail, num_telephone, site_web, id_adresse)
            
            # Exécution de la requête SQL
            cursor.execute(sql, values)
            conn.commit()
                
def load_genre():
    # Lecture du fichier CSV et insertion des données dans la base de données
    with open('genre.csv', 'r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            id_genre = row['IdGenre']
            nom = row['NomGenre']

            # Requête SQL pour insérer les données dans la table
            sql = "INSERT INTO genre (IdGenre, NomGenre) VALUES (%s, %s)"
            values = (id_genre, nom)
            
            # Exécution de la requête SQL
            cursor.execute(sql, values)
            conn.commit()


if __name__ == "__main__":

    # Connexion à la base de données MySQL
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="miniprojetbddbd"
    )
    cursor = conn.cursor()

    load_genre()

    # Fermeture de la connexion à la base de données
    cursor.close()
    conn.close()

