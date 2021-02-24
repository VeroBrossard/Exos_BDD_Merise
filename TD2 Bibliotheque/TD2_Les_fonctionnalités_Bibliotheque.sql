-- Les fonctionnalités
USE bibliotheque;
-- 1. Afficher les lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre).
SELECT 
b_titre AS Titre ,  r_loanDate AS 'Emprunté le ' , 
CONCAT(u_lastname,' ', u_firstname) AS par , r_returnDate As 'rendu le ',
IF (b_dispo, "Oui", "Non") AS Disponible 
FROM registre 
natural join books 
join users  USING (u_id)
ORDER by TItre;

-- 2.  Pouvoir lister tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité).
select b_titre AS Titre, g_name AS Genre, a_authorName As Auteur , IF (b_dispo, "Oui", "Non") AS Disponible from books 
natural join genres
natural join authors
ORDER BY Titre;

-- 3. Afficher le nombre total de livres par genre (nom du genre, total de livres correspondants).
select g_name AS Genre,  count(g_id) AS NOmbre 
from books 
natural join genres
GROUP BY g_name;
    
 -- 4 . (my option )  livres non dispo (pas rendus )   
SELECT 
b_titre AS Titre ,  r_loanDate AS 'Emprunté le ' , CONCAT(u_lastname,' ', u_firstname) AS par FROM books 
natural join registre 
join users  USING (u_id)
WHERE r_returnDate LIKE '9999%'
ORDER by r_returnDate DESC;
