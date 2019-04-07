--1)Wyświetl średnie pensje dla wszystkich działów (kolumna id_dzialu). Wyniki uporządkuj wg malejącej średniej pensji.
SELECT id_dzialu, AVG(Pensja) AS średniawdziale
FROM Pracownicy 
GROUP BY id_dzialu


--2)Znajdź sumaryczne pensje wypłacane w każdym dziale (kolumna id_dzialu). 
SELECT id_dzialu, SUM(Pensja) as sumawdziale
FROM Pracownicy 
GROUP BY id_dzialu


--3)Wyświetl identyfikatory działów, które zatrudniają więcej niż dwóch pracowników. Wyniki uporządkuj wg malejącej liczby pracowników.
SELECT id_dzialu, COUNT(id_dzialu)
FROM Pracownicy
GROUP BY id_dzialu
ORDER BY COUNT(id_dzialu) DESC


--4)Wyświetl identyfikatory projektów (kolumna projekt), średnie pensje wypłacane w ramach poszczególnych projektów i liczbę pracowników zatrudnionych przy danym projekcie. Pomiń pracowników, którzy mają wpisaną wartość NULL w kolumnie projekt

----------------------nie dokonczone
SELECT projekt,
FROM Pracownicy


EXCEPT

SELECT id
FROM Pracownicy
WHERE projekt=NULL
-------------------------------------
