--1. Utworzą tabelę o nazwie Produkty z kolumnami: Kod, Nazwa, CenaNetto, StawkaVat, TerminWazn
DROP TABLE Produkty;
CREATE TABLE [Produkty] (Kod CHAR(20) NOT NULL,
			 Nazwa VARCHAR(100) NOT NULL,
			 Cena_netto FLOAT NOT NULL DEFAULT 0,
			 StawkaVat FLOAT NOT NULL DEFAULT 0,
		         TerminWazn date DEFAULT GETDATE()
			 );
	   



--2	Wprowadzą do tabeli Produkty dane nie zmieniając podanej kolejności pól:
--2a   "5F", "Farba biała 5l", 197.30, 0.22, "13 lutego 2010"
INSERT INTO Produkty VALUES ('5F',
			     'Farba biała 5l',
			      197.30, 0.22,
			     '2010-02-13'
			     );
					
	

--2b   "1F", "Farba biała 1l", 42.50					
INSERT INTO Produkty ([Kod],[Nazwa],[Cena_netto]) VALUES ('1F',
							  'Farba biała 1l',
							   42.50
						          );
						


--2c   "1 grudnia 2010" (termin ważności), "1FB" (kod), "farba burgund 1l" (nazwa)"
INSERT INTO Produkty (TerminWazn, Kod, Nazwa) VALUES ('2010-12-01',
						      '1FB',
						      'farba burgund 11'
						      );



--2d   "1F", "Farba biała 1l", 42.50, z terminem ważności ustawonim na dzisiejszą datę + 2 lata    
INSERT INTO Produkty (Kod, Nazwa, Cena_netto, TerminWazn ) VALUES ('1FB',
								   'Farba biała 1l',
								    42.50,
								    DATEADD(year,2,GETDATE())
								   );
