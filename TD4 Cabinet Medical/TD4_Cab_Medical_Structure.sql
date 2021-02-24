CREATE DATABASE CAB_MEDICAL;
USE CAB_MEDICAL;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: PATIENTS
#------------------------------------------------------------

CREATE TABLE PATIENTS(
        p_id        Int  Auto_increment  NOT NULL ,
        p_lastname  Varchar (50) NOT NULL ,
        p_firstname Varchar (50) NOT NULL ,
        p_birthDate Date NOT NULL
	,CONSTRAINT PATIENTS_PK PRIMARY KEY (p_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SPECIALITES
#------------------------------------------------------------

CREATE TABLE SPECIALITES(
        sp_id   Int  Auto_increment  NOT NULL ,
        sp_name Varchar (30) NOT NULL
	,CONSTRAINT SPECIALITES_PK PRIMARY KEY (sp_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MEDECINS
#------------------------------------------------------------

CREATE TABLE MEDECINS(
        m_id        Int  Auto_increment  NOT NULL ,
        m_firstname Varchar (50) NOT NULL ,
        m_lastname  Varchar (50) NOT NULL ,
        m_mail      Varchar (50) NOT NULL ,
        sp_id       Int NOT NULL
	,CONSTRAINT MEDECINS_PK PRIMARY KEY (m_id)

	,CONSTRAINT MEDECINS_SPECIALITES_FK FOREIGN KEY (sp_id) REFERENCES SPECIALITES(sp_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CRENEAUX_HORAIRE
#------------------------------------------------------------

CREATE TABLE CRENEAUX_HORAIRE(
        crh_id      Int  Auto_increment  NOT NULL ,
        crh_creneau Varchar (7) NOT NULL
	,CONSTRAINT CRENEAUX_HORAIRE_PK PRIMARY KEY (crh_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RDV
#------------------------------------------------------------

CREATE TABLE RDV(
        rdv_id   Int  Auto_increment  NOT NULL ,
        rdv_date Date NOT NULL ,
        crh_id   Int NOT NULL ,
        p_id     Int NOT NULL ,
        m_id     Int NOT NULL
	,CONSTRAINT RDV_PK PRIMARY KEY (rdv_id)

	,CONSTRAINT RDV_CRENEAUX_HORAIRE_FK FOREIGN KEY (crh_id) REFERENCES CRENEAUX_HORAIRE(crh_id)
	,CONSTRAINT RDV_PATIENTS0_FK FOREIGN KEY (p_id) REFERENCES PATIENTS(p_id)
	,CONSTRAINT RDV_MEDECINS1_FK FOREIGN KEY (m_id) REFERENCES MEDECINS(m_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Concerner
#------------------------------------------------------------

CREATE TABLE Concerner(
        p_id Int NOT NULL ,
        m_id Int NOT NULL
	,CONSTRAINT Concerner_PK PRIMARY KEY (p_id,m_id)

	,CONSTRAINT Concerner_PATIENTS_FK FOREIGN KEY (p_id) REFERENCES PATIENTS(p_id)
	,CONSTRAINT Concerner_MEDECINS0_FK FOREIGN KEY (m_id) REFERENCES MEDECINS(m_id)
)ENGINE=InnoDB;


-- ajout valeur specialites
INSERT INTO specialites (sp_name)
VALUES 
('Généraliste'),
('Neurologue'),
('Onchologue');

--  ajout valeur medecins
INSERT INTO medecins (m_firstname,m_lastname,m_mail,sp_id)
VALUES 
("Simon","Rousseau","eu.accumsan.sed@tellusid.org",1),
("Lou","Pons","hendrerit.Donec@lorem.org",1),
("Anna","Vidal","risus.Morbi@vestibulum.com",2),
("Jasmine","Boyer","libero.Proin@Mauriseu.edu",3),
("Adrien","Lacroix","Vestibulum.ante@loremeget.com",3);


--  ajout valeur creneaux 
-- ( 8 creneaux possibles / rdvd'1 h / de 8 à 11 (fin 12h)  et de 14 à 17 (fin 18h)
INSERT INTO creneaux_horaire (crh_creneau)
VALUES 
(' 8h- 9h'), (' 9h-10'),('10h-11h'),('11h-12h'),('14h-15h'),('15h-16h'),('16h-17h'),('17h-18h');

--  ajout valeurs patients 
INSERT INTO patients (p_firstname,p_lastname,p_birthDate)
VALUES 
("Louise","Faure","2017-12-15"),
("Jules","Poirier","2021-04-02"),
("Léa","Boucher","2020-11-03"),
("Anaëlle","Denis","2015-03-13"),
("Alexia","Rey","2020-07-31"),
 ("Jade","Pasquier","1960-09-10"),
 ("Lorenzo","Roux","2020-04-05"),
("Enzo","Dumas","1972-12-08"),
("Diego","Leclercq","2021-04-07"),
("Mohamed","Barbier","1984-02-26"),
("Ambre","Blanc","2021-09-18"),
 ("Agathe","Fernandez","1993-07-16"),
("Fanny","Roussel","2021-04-21"),
("Maéva","Dupuis","2021-08-01"),
("Fanny","David","2015-11-09"),
("Clara","Adam","2021-05-05"),
("Corentin","Poulain","2020-03-18"),
("Bastien","Charles","2021-12-21"),
("Yasmine","Blanchard","2020-11-03"),
("Éléna","Durand","2021-04-05");

--  ajout valeurs à concerner (table d'association : id patient / id medecin traitant)
INSERT INTO concerner (p_id, m_id)
VALUES 
(1,1),  -- ,generaliste 
(1,3), -- ,neurologue
(1,5), -- ,onchologue 
(2,1), 
(2,3),
(3,5), 
(3,1), 
(4,3),
(5,5), 
(6,1), 
(6,3),
(7,5), 
(8,1), 
(9,3),
(10,5),
(11,1), 
(11,3),
(12,5), 
(13,1), 
(13,5),
(14,5), 
(15,1), 
(16,3),
(17,5), 
(18,1), 
(19,3),
(20,5);

--  ajout valeurs rdv  (rdv_date,crh_id créneau choisi ( 1 à 8),m_id medecin (1 à 5), p_id patient (1 à 20))
INSERT INTO rdv (rdv_date, crh_id, m_id, p_id)
VALUES 
("2021-02-24", 1,1,1),
("2021-02-24", 2,1,13),
("2021-02-24", 2,2,18),
("2021-02-24", 2,5,14),
("2021-02-25", 2,2,19),
("2021-02-25", 2,4,20),
("2021-02-24", 3,1,4),
("2021-02-24", 3,2,2),
("2021-02-24", 3,3,11),
("2021-02-24", 3,5,15),
("2021-02-25", 3,1,5),
("2021-02-25", 3,5,15),
("2021-02-24", 4,2,20),
("2021-02-24", 4,3,12),
("2021-02-25", 4,1,2),
("2021-02-24", 5,2,3),
("2021-02-24", 5,4,13),
("2021-02-25", 5,4,13),
("2021-02-24", 6,1,6),
("2021-02-24", 6,2,8),
("2021-02-25", 6,1,1),
("2021-02-25", 6,3,3),
("2021-02-25", 6,5,19),
("2021-02-24", 7,1,7),
("2021-02-24", 7,2,9),
("2021-02-24", 7,3,17),
("2021-02-24", 7,4,16),
("2021-02-24", 8,2,10),
("2021-02-24", 8,5,17),
("2021-02-25", 8,4,10);