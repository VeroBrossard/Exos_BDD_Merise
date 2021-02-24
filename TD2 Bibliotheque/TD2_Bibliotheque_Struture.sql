#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS BIBLIOTHEQUE;
USE BIBLIOTHEQUE;

#------------------------------------------------------------
# Table: GENRES
#------------------------------------------------------------

CREATE TABLE GENRES(
        g_id   Int  Auto_increment  NOT NULL ,
        g_name Varchar (50) NOT NULL
	,CONSTRAINT GENRES_PK PRIMARY KEY (g_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: USERS
#------------------------------------------------------------

CREATE TABLE USERS(
        u_id        Int  Auto_increment  NOT NULL ,
        u_firstname Varchar (50) NOT NULL ,
        u_lastname  Varchar (50) NOT NULL ,
        u_birthDate Date NOT NULL ,
        u_mail      Varchar (50) NOT NULL ,
        g_id        Int
	,CONSTRAINT USERS_PK PRIMARY KEY (u_id)

	,CONSTRAINT USERS_GENRES_FK FOREIGN KEY (g_id) REFERENCES GENRES(g_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: AUTHORS
#------------------------------------------------------------

CREATE TABLE AUTHORS(
        a_id         Int  Auto_increment  NOT NULL ,
        a_authorName Varchar (50) NOT NULL
	,CONSTRAINT AUTHORS_PK PRIMARY KEY (a_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: BOOKS
#------------------------------------------------------------

CREATE TABLE BOOKS(
        b_id    Int  Auto_increment  NOT NULL ,
        b_titre Varchar (50) NOT NULL ,
        b_dispo Bool NOT NULL ,
        g_id    Int NOT NULL ,
        a_id    Int NOT NULL
	,CONSTRAINT BOOKS_PK PRIMARY KEY (b_id)

	,CONSTRAINT BOOKS_GENRES_FK FOREIGN KEY (g_id) REFERENCES GENRES(g_id)
	,CONSTRAINT BOOKS_AUTHORS0_FK FOREIGN KEY (a_id) REFERENCES AUTHORS(a_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REGISTRE
#------------------------------------------------------------

CREATE TABLE REGISTRE(
        r_id         Int  Auto_increment  NOT NULL ,
        r_loanDate   Date NOT NULL ,
        r_returnDate Date NOT NULL ,
        b_id         Int NOT NULL ,
        u_id         Int NOT NULL
	,CONSTRAINT REGISTRE_PK PRIMARY KEY (r_id)

	,CONSTRAINT REGISTRE_BOOKS_FK FOREIGN KEY (b_id) REFERENCES BOOKS(b_id)
	,CONSTRAINT REGISTRE_USERS0_FK FOREIGN KEY (u_id) REFERENCES USERS(u_id)
)ENGINE=InnoDB;


# remplissage table des genres debut 
 INSERT INTO genres (g_name) VALUES ('Horreur'),('Science-fiction'),('Roman'),('Jeunesse');
select * from genres;

INSERT INTO users ( u_lastname, u_firstname, u_birthDate, u_mail , g_id) 
VALUES 
("Orr","Demetrius","2021-10-10","Sed@diamat.net",2),
("Moody","Caleb","2021-08-07","auctor.velit@augueeu.co.uk",4),
("Ryan","Rosalyn","2021-10-31","at@cursusaenim.net",2),
("Moss","Leroy","2022-02-05","rutrum@sitametconsectetuer.co.uk",4),
("Avery","Olympia","2020-04-25","Pellentesque.ultricies@etmagnis.edu",3),
("Maldonado","Deacon","2021-01-18","et@facilisiSedneque.org",2),
("Hudson","Joel","2021-12-08","tristique.pharetra@nisidictumaugue.net",1),
("Fisher","Octavius","2020-05-16","sit.amet.lorem@rutrumeu.net",4),
("Melendez","Cassandra","2021-05-15","et@mauriselit.org",1),
("Black","Armand","2021-04-22","facilisis.vitae.orci@velitegetlaoreet.ca",3),
("Coffey","Gregory","2021-11-08","aliquet.sem.ut@eueratsemper.org",1),
("West","Roary","2021-02-01","felis.orci.adipiscing@dictum.com",4),
("Kirk","Gretchen","2020-11-16","Integer.tincidunt@afeugiat.co.uk",4),
("Hester","Wendy","2020-05-13","malesuada.vel@Crasdictum.edu",3),
("Delacruz","Madison","2021-07-15","vulputate@quis.co.uk",3),
("White","Yardley","2021-03-20","eget.dictum.placerat@metusurna.edu",4),
("Perez","Burke","2020-06-03","dui.quis.accumsan@metusVivamuseuismod.co.uk",4),
("Mccall","Bree","2020-10-14","ullamcorper.eu@erat.net",3),
("Wagner","Jonah","2021-04-23","diam.Sed@SuspendisseduiFusce.co.uk",2),
("Holland","Quin","2021-04-24","magna@nunc.net",4),
("Mccarthy","Sopoline","2021-02-10","ligula@gravidaAliquamtincidunt.edu",3),
("Griffith","Jocelyn","2021-11-24","pharetra@Donec.ca",4),
("Salinas","Mary","2021-02-18","vel@dolorFuscemi.org",3),
("Fuentes","Dieter","2020-09-10","ligula.Donec@egestasrhoncusProin.org",4),
("Ballard","Charles","2021-01-24","Nunc.ullamcorper.velit@etrisusQuisque.co.uk",4);

select * from users;

-- remplissage table des authors
INSERT INTO authors (a_authorName)
VALUES 
('George Orwell'),
('Ray Bradbury'),
('Frank Herbert'),
('Aldous Huxley'),
('Pierre Boulle'),
('René Barjavel'),
('Isaac Asimov'),
('Philip K. Dick'),
('Orson Scott Card'),
('Clifford D. Simak'),
('Daniel Keyes'),
('H. G. Wells'),
('Mary Shelley'),
('Jules Verne'),
-- 14 auteurs Science fiction
('J. K. Rowling'),
('Antoine de Saint-Exupéry'),
('Roald Dahl'),
('J. R. R. Tolkien'),
('Nadja'),
('Jean-Claude Mourlevat'),
('Daniel Pennac'),
('Marcus Pfister'),
('Lois Lowry'),
('Michel Tournier'),
--  +10 auteurs  Jeunesse  = 24 auteurs 
('Marcel Proust'),
('Alexandre Dumas'),
('Henri Lœvenbruck'),
('Caroline Laurent'),
('Tiffany McDaniel'),
('John Steinbeck'),
('Kathryn Stockett'),
('Mary Lynn Bracht'),
('Margaret Mitchell'),
('Jane Austen'),
('Thomas Keneally'),
('Jojo Moyes'),
('Morgane Moncomble'),
('Lionel Shriver'),
('Thomas Mann'),
--  +15 auteurs  Roman  = 39 auteurs 
('Stephen King'),
('Ira Levin'),
('Robert Louis Stevenson'),
('Guy de Maupassant'),
('Braham Stoker'),
('James Herbert'),
('William Peter Blatty'),
('Shirley Jackson'
--  + 8 auteurs  Horreur  = 47 auteurs 
);
SELECT * FROM authors;

-- remplissage table des books
INSERT INTO books (b_titre, b_dispo, g_id, a_id )
VALUES 
-- SCIENCE FICTION code g_id = 2
('1984', true, 2, 1),
('Fahrenheit 451', true, 2, 2),
('Dune', true, 2, 3),
('Le Meilleur des mondes' , true, 2, 4),
('La Planète des singes' , true, 2, 5),
('Ravage' , true, 2, 6),
('Les Robots' , true, 2, 7),
('Ubik ' , true, 2, 8),
('La Nuit des temps' , true, 2, 6),
('Chroniques martiennes' , true, 2,2),
('Fondation' , true, 2, 7),
('La Stratégie Ender' , true, 2, 9),
('Demain les chiens' , true, 2, 10),
('Des fleurs pour Algernon' , true, 2, 11),
('La Guerre des mondes' , true, 2, 12),
('La Machine à explorer le temps' , true, 2, 12),
('Les Hérétiques de Dune ' , true, 2, 3),
('Frankenstein ou le Prométhée moderne' , true, 2, 13),
('Vingt Mille Lieues sous les mers' , true, 2, 14),
--  JEUNESSE  g_id = 4 
('Harry Potter T.1' , true, 4, 15),
('Harry Potter T.2' , true, 4, 15),
('Harry Potter T.3' , true, 4, 15),
('Harry Potter T.4' , true, 4, 15),
('Harry Potter T.5' , true, 4, 15),
('Harry Potter T.6' , true, 4, 15),
('Harry Potter T.7' , true, 4, 15),
('Le Petit Prince' , true, 4, 16),
('Mathilda' , true, 4, 17),
('Charlie et la chocolaterie' , true, 4, 17),
('Le Hobbit' , true, 4, 18),
('Chien Bleu' , true, 4, 19),
('La rivière de l\'envers', true, 4, 20),
('L\'oeil du loup' , true, 4, 21),
('Arc-en-ciel' , true, 4, 22),
('Sacrées Sorcières', true, 4, 17),
('Le passeur', true, 4, 23),
('Vendredi ou la vie sauvage', true, 4, 24),
 -- ROMAN  g_id = 3 
('À la recherche du temps perdu', true, 3, 25),
('Le comte de Monte-Cristo', true, 3, 26),
('Nous rêvions juste de liberté', true, 3, 27),
('Rivage de la colère ', true, 3, 28),
('Betty', true, 3, 29),
('À l\'est d\'Éden', true, 3, 30),
('J\'irai tuer pour vous', true, 3, 27),
('La couleur des sentiments', true, 3, 31),
('Les Raisins de la colère', true, 3, 30),
('Filles de la mer', true, 3, 32),
('Autant en emporte le vent', true, 3, 33),
('Orgueil et préjugés', true, 3, 34),
('La liste de Schindler', true, 3, 35),
('Avant toi', true, 3, 36),
('Viens, on s\'aime', true, 3, 37),
('Il faut qu\'on parle de Kevin', true, 3, 38),
('L\'élu', true, 3, 39),
 -- HORREUR g_id = 1
('Dôme', true, 1, 40),
('Misery ', true, 1, 40),
('L\'Institut', true, 1, 40),
('Un bébé pour Rosemary', true, 1, 41),
('L\'Étrange Cas du docteur Jekyll et de M. Hyde', true, 1, 42),
('Le Horla ', true, 1, 43),
('Shining, l\'enfant lumière', true, 1, 40),
('Salem', true, 1, 40),
('Dracula', true, 1, 44),
('Le Secret de Crickley Hall', true, 1, 45),
('Ça', true, 1, 40),
('L\'Exorciste', true, 1, 46),
('Carrie', true, 1, 40),
('Le Fléau', true, 1, 40),
('The Haunting of Hill House', true, 1, 47),
('Anatomie de l\'horreur', true, 1, 40
);
SELECT * FROM books;


-- remplissage table des prêts (registre)
--	b_id	u_id	r_loanDate	r_returnDate 	
INSERT INTO registre (b_id, u_id, r_loanDate, r_returnDate) 
VALUES 
(1,20,'2020-12-10','9999-12-31'),
(2,7,'2020-12-11','9999-12-31'),
(3,8,'2020-12-12','9999-12-31'),
(4,9,'2020-12-13','9999-12-31'),
(20,10,'2020-12-14','9999-12-31'),
(21,11,'2020-12-15','9999-12-31'),
(22,12,'2020-12-16','9999-12-31'),
(23,6,'2020-12-17','9999-12-31'),
(38,7,'2020-12-18','9999-12-31'),
(39,8,'2020-12-19','9999-12-31'),
(40,9,'2020-12-20','9999-12-31'),
(55,6,'2020-12-21','9999-12-31'),
(56,7,'2020-12-22','9999-12-31'),
(57,8,'2020-12-23','9999-12-31'),
(1,6,'2020-10-09','2020-10-24'),
(2,7,'2020-10-10','2020-10-25'),
(3,8,'2020-10-11','2020-10-26'),
(4,9,'2020-10-12','2020-10-27'),
(5,10,'2020-10-13','2020-10-28'),
(6,11,'2020-10-14','2020-10-29'),
(7,12,'2020-10-15','2020-10-30'),
(8,13,'2020-10-16','2020-10-31'),
(9,14,'2020-09-04','2020-09-19'),
(10,15,'2020-09-05','2020-09-20'),
(11,16,'2020-09-06','2020-09-21'),
(12,17,'2020-09-07','2020-09-22'),
(13,18,'2020-09-08','2020-09-18'),
(14,19,'2020-09-09','2020-09-19'),
(15,20,'2020-09-10','2020-09-20'),
(16,21,'2020-05-26','2020-06-05'),
(17,22,'2020-05-27','2020-06-06'),
(18,23,'2020-05-28','2020-06-07'),
(19,4,'2020-05-29','2020-06-08'),
(20,5,'2020-05-30','2020-06-09'),
(21,6,'2020-05-31','2020-06-10'),
(22,7,'2020-06-01','2020-06-11'),
(23,6,'2020-10-12','2020-10-27'),
(24,7,'2020-10-13','2020-10-28'),
(25,8,'2020-10-14','2020-10-29'),
(26,9,'2020-10-15','2020-10-30'),
(27,10,'2020-10-16','2020-10-31'),
(28,11,'2020-09-04','2020-09-19'),
(29,12,'2020-09-05','2020-09-20'),
(30,13,'2020-09-06','2020-09-21'),
(31,14,'2020-09-07','2020-09-22'),
(32,15,'2020-09-08','2020-09-18'),
(33,16,'2020-09-09','2020-09-19'),
(34,17,'2020-09-10','2020-09-20'),
(35,18,'2020-05-26','2020-06-05'),
(36,19,'2020-05-27','2020-06-06'),
(37,20,'2020-05-28','2020-06-07'),
(38,21,'2020-05-29','2020-06-08'),
(39,22,'2020-05-30','2020-06-09'),
(40,23,'2020-05-31','2020-06-10'),
(41,4,'2020-06-01','2020-06-11'),
(42,5,'2020-10-12','2020-10-27'),
(43,4,'2020-10-13','2020-10-28'),
(44,5,'2020-10-14','2020-10-29'),
(45,6,'2020-10-15','2020-10-30'),
(46,7,'2020-10-16','2020-10-31'),
(47,8,'2020-09-04','2020-09-19'),
(48,9,'2020-09-05','2020-09-20'),
(49,10,'2020-09-06','2020-09-21'),
(50,11,'2020-09-07','2020-09-22'),
(51,12,'2020-09-08','2020-09-18'),
(52,13,'2020-09-09','2020-09-19'),
(53,14,'2020-09-10','2020-09-20'),
(54,15,'2020-05-26','2020-06-05'),
(55,16,'2020-05-27','2020-06-06'),
(56,17,'2020-05-28','2020-06-07'),
(57,18,'2020-05-29','2020-06-08'),
(58,19,'2020-05-30','2020-06-09'),
(59,13,'2020-05-31','2020-06-10'),
(60,14,'2020-06-01','2020-06-11'),
(61,15,'2020-05-27','2020-06-06'),
(62,16,'2020-05-28','2020-06-07'),
(63,17,'2020-05-29','2020-06-08'),
(64,18,'2020-05-30','2020-06-09'),
(65,19,'2020-05-31','2020-06-10');

select * from registre;

-- mise à jour dispo des livres dans books / table des prêts (registre)
-- livre non rendus (date de retour = 9999-12-31)
UPDATE books
INNER join registre USING (b_id)
SET b_dispo = false
-- WHERE r_returnDate LIKE '9999%'; ne fonctionne pas en Update alors que OK en SELECT!!! 
WHERE r_returnDate = '9999-12-31';

