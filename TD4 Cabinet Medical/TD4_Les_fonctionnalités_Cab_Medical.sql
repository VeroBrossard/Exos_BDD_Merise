USE CAB_MEDICAL;
-- Étude de cas 4  // Cabinet médical
-- Les fonctionnalités
-- 1. Afficher tous les rendez-vous du cabinet médical (date et créneau horaire du rendez-vous, 
-- 		nom et prénom du patient, nom et spécialité du médecin).
SELECT rdv_date AS Date, crh_creneau AS 'Creneau Horaire', CONCAT (p_lastname,' ', p_firstname) AS Patient , 
CONCAT(m_firstname, ' ', m_lastname) AS Medecin, sp_name AS Spécialités
from rdv
natural join creneaux_horaire
natural join patients
natural join medecins
natural join specialites


order by rdv_date, crh_id;

-- 2. Afficher tous les rendez-vous d'un médecin (nom du médecin, date et 
-- créneau horaire du rendez-vous, nom et prénom du patient).
SELECT rdv_date AS Date, CONCAT(m_firstname, ' ', m_lastname) AS Medecin, sp_name AS Spécialités, 
crh_creneau AS 'Creneau Horaire', CONCAT (p_lastname,' ', p_firstname) AS Patient
from rdv
natural join creneaux_horaire
natural join patients
natural join medecins
natural join specialites
WHERE m_id = 2
order by rdv_date, crh_id;


-- 3. Afficher le rendez-vous d'un patient (nom et prénom du patient, 
-- spécialité du médecin, nom et prénom du médecin, date et créneau horaire du rendez-vous).
SELECT rdv_date AS Date, CONCAT (p_lastname,' ', p_firstname) AS Patient,  
sp_name AS Spécialités,CONCAT(m_firstname, ' ', m_lastname) AS Medecin,
crh_creneau AS 'Creneau Horaire'
from rdv
natural join creneaux_horaire
natural join patients
natural join medecins
natural join specialites
WHERE p_id = 13
-- WHERE p_lastname = 'Boucher'  fonctionne aussi, mais il faut connaitre le nom du patient
order by rdv_date, crh_id;

-- Question Bonus : afficher les medecins traitant de chaque patients
-- (dans mon choix de structure , plusieurs médecins possibles)
-- !! il faut passer par la table d'association "concerner"
select p_id, p_lastname, p_firstname, m_lastname AS MEDECIN, sp_name AS Spécialité
from patients
join concerner USING (p_id)
JOIN medecins USING (m_id)
JOIN specialites USING (sp_id)
order by p_id, sp_id;

