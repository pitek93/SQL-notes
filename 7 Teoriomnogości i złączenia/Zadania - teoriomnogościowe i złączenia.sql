-- 1. Do tabeli Projekty dodaj wpis o następującym projekcie: id = 'odi', szef = 17, nazwa = 'Inwentaryzacja oddzialu Turzno', termin = '2010-12-30'
INSERT INTO Projekty (p_id,szef_projektu,nazwa,termin_oddania) 
VALUES ('odi',17,'Inwentaryzacja oddzialu Turzno','2010-12-30');


-- 2. Dla każdego pracownika wyświetl jego nazwisko, pensję i informację o tym, czy jego pensja jest mniejsza (słowo "mniejsza"), równa (słowo "równa") lub większa (słowo "większa") od 1800 złotych.
--Przykładowym wierszem może być "Kowalski | 1000 | mniejsza"
SELECT nazwisko, pensja, 
			 CASE 
			  WHEN pensja=1800 THEN 'rowna'
			  WHEN pensja>1800 THEN 'wieksza'
			  WHEN pensja<1800 THEN 'mniejsza'
			 END 
			 AS Czy
FROM Pracownicy;


--3. Dla każdego projektu wyświetl dwie kolumny: nazwę oraz jedno ze słów "ukończony"/"trwający" w zależności czy termin ukończenia wypada przed czy po dacie systemowej
SELECT nazwa,
	      CASE 
	       WHEN termin_oddania>UTC_DATE() THEN 'trwajacy'
	       WHEN termin_oddania<UTC_DATE() THEN 'ukonczony'
	      END 
	      AS Stan
FROM Projekty;


--4. Wyświetl te identyfikatory pracowników zarabiających powyżej 3000, którzy nie są szefami projektów
SELECT id 
FROM Pracownicy 
WHERE pensja>3000
EXCEPT
SELECT DISTINCT id 
FROM Pracownicy 
RIGHT JOIN Projekty ON Pracownicy.id=Projekty.szef_projektu;


--5. Wyświetl te identyfikatory pracowników zarabiających poniżej 2000, którzy są pracownikami kontaktowymi dla Klientów
SELECT id 
FROM Pracownicy 
WHERE pensja < 2000
INTERSECT --common part
SELECT prac_kontaktowy 
FROM Klienci;


--6. Łącząc tabele Pracownicy i Działy wyświetl dla każdego pracownika jego imię, nazwisko i nazwę jego działu
SELECT imie, nazwisko, nazwa 
FROM Pracownicy
LEFT JOIN Dzialy ON Pracownicy.id_dzialu = Dzialy.id_dzialu;
	
	
--7. Łącząc tabele Projekty i Pracownicy wyświetl dla każdego projektu jego nazwę, oraz nazwisko i pensję szefa
SELECT nazwa, nazwisko, pensja 
FROM Projekty
LEFT JOIN Pracownicy ON Projekty.szef_projektu=Pracownicy.id;


--8. Łącząc tabelę Pracownicy z nią samą wyświetl wszystkie możliwe kombinacje imion i nazwisk. Zastosuj operator DISTINCT
SELECT DISTINCT a.imie, b.nazwisko 
FROM Pracownicy a, Pracownicy b;


--9. Łącząc tabele Klienci i Pracownicy wyświetl nazwy klientów, ich telefony oraz imiona i nazwiska ich pracowników kontaktowych 
SELECT nazwa,telefon,imie, nazwisko 
FROM Klienci
LEFT JOIN Pracownicy ON Klienci.prac_kontaktowy=Pracownicy.id;


--10. Łącząc tabele Projekty i Pracownicy wyświetl imiona i nazwiska pracowników oraz nazwy ich projektów
SELECT imie, nazwisko, nazwa 
FROM Pracownicy
LEFT JOIN Projekty ON Pracownicy.projekt=Projekty.p_id;

