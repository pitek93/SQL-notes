--1)Łącząc trzykrotnie tabelę Klienci wyświetl wszystkie kombinacje nazw, telefonów i identyfikatorów pracowników kontaktowych
SELECT k1.nazwa, k2.telefon, k3.prac_kontaktowy 
FROM Klienci k1, Klienci k2, Klienci k3


--2)Dla każdego działu wyświetl jego nazwę oraz ilość zatrudnionych w nim pracowników. Musisz połączyć tabele Działy i Pracownicy oraz zastosować klauzulę GROUP BY
SELECT Dzialy.nazwa, COUNT(*) AS 'Ilosc' 
FROM Dzialy, Pracownicy 
WHERE Pracownicy.id_dzialu = Dzialy.id_dzialu
GROUP BY Dzialy.nazwa


--3)Dla każdego programisty wyświetl jego nazwisko, płacę i nazwę projektu. Jeżeli dana osoba nie ma przypisanego projektu, niech wyświetlą się wartości null w miejscu na nazwę
SELECT nazwisko, pensja, Projekty.nazwa 
FROM Pracownicy
LEFT JOIN Dzialy ON Pracownicy.id_dzialu = Dzialy.id_dzialu
LEFT JOIN Projekty ON Pracownicy.projekt = p_id
WHERE Dzialy.id_dzialu=(SELECT id_dzialu FROM Dzialy
 			WHERE nazwa='Programisci');


--4)Dla każdego pracownika zatrudnionego w dziale o nazwie "Programisci" wyświetl jego imię i nazwisko oraz nazwę jego projektu. Należy połączyć 3 tabele: Działy, P`racownicy i Projekty
SELECT Pracownicy.nazwisko, Pracownicy.pensja, Projekty.nazwa 
FROM Dzialy
LEFT JOIN Pracownicy ON Dzialy.id_dzialu =Pracownicy.id_dzialu
RIGHT JOIN Projekty ON Pracownicy.projekt = Projekty.p_id
WHERE Dzialy.id_dzialu = (SELECT id_dzialu FROM Dzialy 
					   WHERE nazwa='Programisci')


--5)Dla danego klienta wyświetl jego nazwę oraz imię, nazwisko pracownika kontaktowego oraz nazwę jego działu. Napisz odpowiedź w dwóch wersjach: notacji Join On oraz notacji przecinkowej
SELECT Klienci.nazwa, Pracownicy.imie, Pracownicy.nazwisko, Dzialy.nazwa 
FROM Klienci
LEFT JOIN Pracownicy ON Klienci.prac_kontaktowy = Pracownicy.id
LEFT JOIN Dzialy ON Pracownicy.id_dzialu = Dzialy.id_dzialu


--6)Dla danego projektu wyświetl jego nazwę, nazwisko szefa (tabela Pracownicy), oraz ilość działów w jakich zatrudnieni są pracownicy przypisani do tego projektu (ponowne wykorzystanie tabeli Pracownicy)
SELECT nazwa, a.nazwisko, COUNT(DISTINCT b.id_dzialu) AS 'Ilosc_dzialow' 
FROM Projekty
INNER JOIN Pracownicy a ON a.id=szef_projektu
INNER JOIN Pracownicy b ON p_id=b.projekt
GROUP BY nazwa, a.nazwisko
