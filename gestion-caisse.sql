-- 
CREATE DATABASE gestion_fonds;
USE gestion_fonds;
-- CREATE LEARNERS TABLE
    CREATE TABLE apprenants (
        id INTEGER AUTO_INCREMENT PRIMARY KEY,
        nom VARCHAR(45),
        prenom VARCHAR(45),
        birth_date DATE,
        sexe ENUM('f','m'),
        email VARCHAR(45),
        created_at TIMESTAMP,
        updated_at TIMESTAMP
    );

-- CREATION DE LA TABLE DES SANCTIONS
    CREATE TABLE sanctions (
        id INTEGER AUTO_INCREMENT PRIMARY KEY,
        types_sanction ENUM('retard1', 'retard2', 'retard3', 'absence', 'trouble'),
        descriptions VARCHAR (255),
        prix FLOAT,
        created_at TIMESTAMP
    );

      INSERT INTO `sanctions`(`types_sanction`, `descriptions`, `prix`, `created_at`)
  VALUES
  ('retard1', '07h-07h15', '50', NOW()),
  ('retard2', '07h15-07h30', '100', NOW()),
  ('retard3', 'Au dela de 07h30', '200', NOW()),
  ('absence', 'absent(e)', '1000', NOW()),
  ('trouble', 'trouble_cours', '2000', NOW());

    -- TABLE INTERMEDIAIRE
    CREATE TABLE sanction_apprenant(
        idsanction_apprenant INTEGER AUTO_INCREMENT PRIMARY KEY,
        id_apprenant INTEGER,
        id_sanction INTEGER,
        descriptions VARCHAR (255),
        FOREIGN KEY (id_apprenant) REFERENCES apprenants (id) ON DELETE RESTRICT ON UPDATE CASCADE,
        FOREIGN KEY (id_sanction) REFERENCES sanctions (id) ON DELETE RESTRICT ON UPDATE CASCADE,
        prix FLOAT,
        created_at TIMESTAMP
    );

-- Insertion des informations des apprenants dans la table "apprenants"
    INSERT INTO `apprenants` (`nom`, `prenom`, `birth_date`,`sexe`,`email`, `created_at`, `updated_at`)
VALUES     
('ANANI', 'Kossigan', '1885-06-07', 'm', 'ko6g@an.org', NOW(), NOW()),
('AGBODRA', 'Emmanuel', '1995-02-02', 'm', 'emma@nuel.com', NOW(), NOW()),
('AKAKPO', 'Godwin', '2004-07-22', 'm', 'win@kpo.com', NOW(), NOW()),
('DIABATE', 'Tronka', '2001-05-31', 'f', 'dia@dt.com', NOW(), NOW()),
('TRAORE', 'Fadilah', '1997-10-17', 'f', 'fad@bin.com', NOW(), NOW()),
('LABABORE', 'Grace', '1998-07-22', 'f', 'bore@ce.com', NOW(), NOW()),
('ESSO', 'Gilbert', '1994-04-20', 'm', 'lbert@gmail.com', NOW(), NOW()),
('EZOULA', 'Albert', '1992-09-12', 'm', 'ezo@gmail.com', NOW(), NOW()),
('AMEGNAGLO', 'Franck', '1882-05-17', 'm', 'fran@ame.fr', NOW(), NOW()),
('ELENEKOU', 'Eric', '2000-09-12', 'm', 'eric@gmail.com', NOW(), NOW()),
('AMOUZOUGAN', 'Juvanio', '2001-05-30', 'm', 'juv@gmail.com', NOW(), NOW()),
('KOTOKLO', 'Adjo', '2000-07-06', 'f', 'adjo@gmail.com', NOW(), NOW()),
('MEDETOGNO', 'Essenam', '1993-03-20', 'f', 'etogno@gmail.com', NOW(), NOW()),
('BUCKNER', 'Rebeka', '1997-11-09', 'm', 'rbk@nuel.com', NOW(), NOW()),
('LELEDA', 'Mabelle', '2005-07-18', 'f', 'lelida@gmail.com', NOW(), NOW()),
('BONSOA', 'Henoc', '2003-03-03', 'm', 'henoc@nuel.com', NOW(), NOW());

   -- Insertion des informations dans la table intermediaire "sanction_apprenant"
INSERT INTO `sanction_apprenant`(`id_apprenant`, `id_sanction`,`descriptions`, `prix`,`created_at`)
VALUES
('1','1','07h-07h15','50', NOW()),
('9','3','Au dela de 07h30','200', NOW()),
('3','2','07h15-07h30','100', NOW()),
('8','4','trouble_cours','2000', NOW()),
('5','2','07h15-07h30','100', NOW()),
('15','3','Au dela de 07h30','200', NOW()),
('7','1','07h-07h15','50', NOW()),
('4','4','trouble_cours','2000', NOW()),
('2','1','07h-07h15','50', NOW()),
('12','3','Au dela de 07h30','200', NOW()),
('14','4','trouble_cours','2000', NOW()),
('10','4','trouble_cours','2000', NOW()),
('1','1','absent','1000', NOW()),
('11','3','07h-07h15','50', NOW()),
('16','3','07h-07h15','50', NOW()),
('6','2','07h15-07h30','100', NOW());