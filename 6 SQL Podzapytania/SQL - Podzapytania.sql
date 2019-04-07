--1)Z tabeli Pracownicy wyświetl wszystkich pracowników pracujących przy projekcie o nazwie "Statistica". 
SELECT * FROM Pracownicy
WHERE projekt = (SELECT p_id FROM Projekty 
			     WHERE nazwa='Statistica');	
	


--2)Wyświetl nazwiska i pensje pracowników pracujących w tym samym dziale (kolumna id_dzialu tabeli Pracownicy) co Ian Cook
SELECT nazwisko, pensja FROM Pracownicy 
WHERE id_dzialu = (SELECT id_dzialu FROM Pracownicy 
		   WHERE name='Ian' AND nazwisko='Cook');
	

	
--3)Wyświetl nazwyprojektów przy których pracują pracownicy z działu o nazwie "Programisci". Użyj trzech poziomów zapytań.
SELECT nazwa FROM Projekty 
WHERE p_id IN (SELECT projekt FROM Pracownicy
	      WHERE id_dzialu=(SELECT id_dzialu FROM Dzialy 
			       WHERE nazwa = 'Programisci'));



--4)Wyświetl nazwy działów w jakich pracują osoby przypisane do projektu o nazwie "Inwentaryzacja". Użyj trzech poziomów zapytań.
SELECT id_dzialu FROM Pracownicy 
WHERE projekt = (SELECT p_id FROM Projekty WHERE nazwa = 'Inwentaryzacja');

--4)v2 distinct usuwa duplikaty
SELECT nazwa FROM Dzialy
WHERE id_dzialu IN (SELECT DISTINCT id_dzialu FROM Pracownicy
		    WHERE projekt = (SELECT p_id FROM Projekty
				     WHERE nazwa = 'Inwentaryzacja'));



--where uzywamy przed grupowaniem, having po grupowaniu
--5)Wyświetl najmniej zarabiających pracowników każdego działu. Podpowiedź: należy wykorzystać zapytania grupujące
SELECT * FROM Pracownicy AS p 
WHERE pensja IN	(SELECT MIN(pensja) FROM pracownicy AS sub_p
		 GROUP BY id_dzialu 
		 HAVING sub_p.id_dzialu = p.id_dzialu);
		 


--6)Wyświetl wszystkie kolumny dla tych pracowników, którzy nie mają przypisanych klientów (kolumna prac_kontaktowy w tabeliKlienci)
SELECT * FROM Pracownicy 
WHERE id NOT IN (SELECT DISTINCT prac_kontaktowy FROM Klienci 
		 WHERE prac_kontaktowy IS NOT NULL);



--7)Wyświetl nazwiska i imiona pracowników zarabiających więcej niż 50% maksymalnej pensji wypłacanej pracownikom zatrudnionym w tym samym dziale. (Zapytanie główne i podzapytanie korzystają z tabeli Pracownicy) 
SELECT Imie, Nazwisko FROM Pracownicy AS p 
WHERE pensja > 0.5*(SELECT MAX(pensja) FROM pracownicy AS sub_p
		    GROUP BY id_dzialu 
		    HAVING sub_p.id_dzialu = p.id_dzialu);



--8)Z tabeli Działy wyświetl wszystkie kolumny dla działów nie zatrudniającym żadnych pracowników z projektu "p1" (kolumna projektw tabeli Pracownicy). 
SELECT * FROM Dzialy 
WHERE id_dzialu NOT IN (SELECT DISTINCT id_dzialu FROM Pracownicy 
			WHERE projekt NOT IN (SELECT p_id FROM Projekty 
					      WHERE nazwa='p1'));
--8)v2
SELECT * FROM Dzialy
WHERE id_dzialu NOT IN (SELECT DISTINCT id_dzialu FROM Pracownicy 
		        WHERE projekt = 'p1' AND projekt IS NOT null);
		


--9)Z tabeli Pracownicy wyświetl nazwiska i pensje trzech najlepiej zarabiających pracowników. Nie można używać konstrukcji typu TOP, LIMIT itp. Podpowiedź: przepisz to zadanie na: "znajdź tych ludzi, dla których ilość osób o wyższej pensji jest mniejsza od 3" Może zaistnieć sytuacja, że będzie większa ilość pracowników zarabiających po tyle samo pieniędzy, co plasuje ich w czołówce. Wówczas może się wyświetlić większa liczba ludzi
SELECT nazwisko, pensja FROM pracownicy AS p
WHERE (select COUNT(*) FROM pracownicy 
WHERE pensja > p.pensja) < 3;
	


--10)Z tabeli Pracownicy wyświetl wszystkie kolumny dla tych pracowników, dla których termin ich projektu (tabela Projekty) jest mniejszy od daty systemowej.
SELECT * FROM Pracownicy 
WHERE projekt IN (SELECT p_id FROM Projekty 
		  WHERE termin_oddania < getdate());
