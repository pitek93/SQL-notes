--zapytania pod spodem



--
-- Table: [Dzialy]
--
CREATE TABLE [Dzialy] (
  [id_dzialu] integer NOT NULL,
  [nazwa] Varchar(20) NULL,
  [adres] Varchar(100) NULL,
  CONSTRAINT [Dzialy_pk] PRIMARY KEY ([id_dzialu])
);


--
-- Table: [Pracownicy]
--
CREATE TABLE [Pracownicy] (
  [id] integer NOT NULL,
  [imie] Varchar(20) NULL,
  [nazwisko] Varchar(30) NULL,
  [id_dzialu] integer NULL,
  [pensja] integer NULL,
  [projekt] Varchar(5) NULL,
  CONSTRAINT [Pracownicy_pk] PRIMARY KEY ([id])
);


--
-- Table: [Projekty]
--
CREATE TABLE [Projekty] (
  [p_id] Varchar(5) NOT NULL,
  [szef_projektu] integer NULL,
  [nazwa] Varchar(50) NULL,
  [termin_oddania] Date NULL,
  CONSTRAINT [Projekty_pk] PRIMARY KEY ([p_id])
);


--
-- Table: [Klienci]
--
CREATE TABLE [Klienci] (
  [k_id] integer NOT NULL,	
  [nazwa] Varchar(100) NULL,
  [telefon] Varchar(25) NULL,
  [prac_kontaktowy] integer NULL,
  CONSTRAINT [Klienci_pk] PRIMARY KEY ([k_id])
);

ALTER TABLE [Pracownicy] ADD CONSTRAINT [Pracownicy_fk] FOREIGN KEY ([id_dzialu]) REFERENCES [Dzialy] ([id_dzialu]);
ALTER TABLE [Projekty] ADD CONSTRAINT [Projekty_fk] FOREIGN KEY ([szef_projektu]) REFERENCES [Pracownicy] ([id]);
ALTER TABLE [Klienci] ADD CONSTRAINT [Klienci_fk] FOREIGN KEY ([prac_kontaktowy]) REFERENCES [Pracownicy] ([id]);

INSERT INTO Dzialy VALUES (1,'Marketing','Warszawa, Sloneczna 3');
INSERT INTO Dzialy VALUES (2, 'Ksiegowosc','Warszawa, Sloneczna 3');
INSERT INTO Dzialy VALUES (3,'Administracja IT','Warszawa, Sloneczna 3a');
INSERT INTO Dzialy VALUES (4,'Programisci','Bydgoszcz, Kwiatowa 16');
INSERT INTO Dzialy VALUES (5,'Oddzial Turzno','Turzno, Torunska 5');


INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (1,'Erich','Rosales',2,2510,'it1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (2,'Lucian','Potter',5,3600,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (3,'Davis','Gregory',1,2200,'it2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (4,'Lewis','Woodard',5,3800,'m1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (5,'Maxwell','Buckley',4,2300,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (6,'Christen','Ballard',1,1800,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (7,'Thane','Miranda',5,1800,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (8,'Kaitlin','Hopkins',4,3600,'p3');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (9,'Risa','Morin',1,3600,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (10,'James','Potter',1,3600,'it2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (11,'Nell','Cervantes',3,3400,'it1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (12,'Cedric','Bryan',1,3100,'it1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (13,'Christen','Sharp',3,2200,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (14,'Erich','Barnett',2,2400,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (15,'Shelley','Watson',3,3800,'p3');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (16,'Shelley','Hurley',2,2700,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (17,'Jona','Wolfe',5,3500,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (18,'Ian','Cook',2,2700,'it2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (19,'Naida','Hampton',1,2200,'it1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (20,'Jon','Richards',2,2700,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (21,'Florence','Lamb',1,1600,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (22,'Grady','Hewitt',1,3100,'m1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (23,'Chloe','Austin',2,3800,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (24,'Hoyt','Potter',2,3800,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (25,'James','Estes',1,2100,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (26,'James','Weiss',1,2500,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (27,'William','Erickson',2,3400,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (28,'Ian','Pearson',1,2700,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (29,'Brett','Newton',2,3400,'p3');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (30,'Rhoda','Mccoy',3,3200,'it2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (31,'Wayne','Fox',1,1600,'p3');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (32,'Juliet','Cohen',2,2800,'m1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (33,'Arden','Sears',1,2700,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (34,'Ian','Fleming',3,1900,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (35,'Ian','Gray',3,3800,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (36,'Davis','Cooley',1,3100,'it1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (37,'Lana','Noel',5,3700,'m1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (38,'Hall','Pittman',4,2400,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (39,'Willian','Stephens',2,3400,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (40,'Risa','Marks',3,2700,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (41,'Maggie','Jones',1,1800,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (42,'Slade','Chen',1,3500,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (43,'Maggie','Mcclain',5,2500,null);
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (44,'Davis','Goodman',3,3100,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (45,'Keane','Chen',1,1600,'p1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (46,'Cecilia','Miranda',5,2300,'p2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (47,'Lucian','Weiss',5,2000,'m1');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (48,'Sean','Allen',2,3400,'p3');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (49,'Cleo','Pruitt',4,2500,'it2');
INSERT INTO Pracownicy (id,imie,nazwisko,id_dzialu,pensja,projekt) VALUES (50,'Morgan','Harvey',5,3000,null);


INSERT INTO Projekty VALUES ('it1',11,'Upgrade sprzetu','2009-01-10');
INSERT INTO Projekty VALUES ('p1',5,'Program magazynowy','2009-08-01');
INSERT INTO Projekty VALUES ('p2',13,'Statistica','2010-02-20');
INSERT INTO Projekty VALUES ('m1',37,'Inwentaryzacja','2010-01-01');
INSERT INTO Projekty VALUES ('it2',49,'Archiwizacja roczna','2007-12-24');
INSERT INTO Projekty VALUES ('p3',8,'Sklep motoryzacyjny','2009-01-13');
INSERT INTO Projekty VALUES ('it3',49,'Archiwizacja roczna','2009-12-24');


INSERT INTO Klienci VALUES( 1,'Acme S.A.','123-456-78-89',17);
INSERT INTO Klienci VALUES( 2,'Spolem S.A.','333-444-55-66',45);
INSERT INTO Klienci VALUES( 3,'Jozef Mialkowski','607-607-60-77',37);
INSERT INTO Klienci VALUES( 4,'Zenon Kruk','(0-89) 545-03-43',null);
INSERT INTO Klienci VALUES( 5,'Statics Sp.z o.o.','(0-22) 213-432-54',8);
INSERT INTO Klienci VALUES( 6,'BitBit','600-700-80-90',10);
INSERT INTO Klienci VALUES( 7,'Ropuszka','303-404-10-00',null);
INSERT INTO Klienci VALUES( 8,'Auto Szyby','701-170-17-01',8);
INSERT INTO Klienci VALUES( 9,'Witold Witkacy','(0-56) 546-15-100',null);
INSERT INTO Klienci VALUES( 10,'Croma',null,28);



#3    Korzystając ze schematu firma.sql przedstawionego wcześniej:
#3a   wyświetlą wszystkie wiersze i kolumny z tabeli Pracownicy
SELECT * FROM Pracownicy;



#3b   z tabeli Pracownicy wyświetlą kolumny: imię, nazwisko i obliczone 19% podatku od pensji 
SELECT imie,nazwisko,(pensja*0.19) FROM Pracownicy;



#3c   z tabeli Pracownicy wyświetlą wszystkie kolumny dla pracowników o id_dzialu równym 5
SELECT * from Pracownicy where id_dzialu = 5;








