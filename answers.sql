-- -----------------------------------------------------
-- REPONSES AUX QUESTIONS
-- -----------------------------------------------------

-- Afficher une liste complète des apprenants du Groupe 2,
SELECT * FROM apprenants;

-- Afficher la liste des pénalités pour la salle,
SELECT * FROM sanctions;

-- afficher la somme totale pour les pénalités de la salle
SELECT SUM(prix) FROM sanction_apprenant;

-- Afficher la liste des hommes de la salle,
SELECT * FROM apprenants WHERE sexe = 'm';

-- Afficher la liste des femmes de la salle,
SELECT * FROM apprenants WHERE sexe = 'f';

-- afficher le nombre des pénalités des femmes de la salle et pouvoir en faire la somme
SELECT SUM(prix) FROM sanction_apprenant JOIN apprenants ON sanction_apprenant.id_apprenant = apprenants.id WHERE sexe='f';

-- afficher le nombre des pénalités des hommes de la salle et pouvoir en faire la somme
SELECT SUM(prix) FROM sanction_apprenant JOIN apprenants ON sanction_apprenant.id_apprenant = apprenants.id WHERE sexe='m';

-- afficher les apprenants qui fêtent leur anniversaire ce jour
SELECT * FROM apprenants WHERE DAY(birth_date) = DAY(NOW()) AND MONTH(birth_date) = MONTH(NOW());

-- afficher pour chaque apprenant les pénalités qu’il a eu à payer  
SELECT * FROM sanction_apprenant WHERE id_apprenant = '1';

-- Faire la somme des pénalités d'un apprenant
SELECT SUM(prix) FROM sanction_apprenant WHERE id_apprenant = '1';

-- afficher pour chaque apprenant le nombre de pénalités qu’il a eu à payer
SELECT COUNT(*) FROM sanction_apprenant WHERE id_apprenant = '1';