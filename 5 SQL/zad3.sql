--3    Korzystając ze schematu firma.sql przedstawionego wcześniej:
--3a   wyświetlą wszystkie wiersze i kolumny z tabeli Pracownicy
SELECT * FROM Pracownicy;



--3b   z tabeli Pracownicy wyświetlą kolumny: imię, nazwisko i obliczone 19% podatku od pensji 
SELECT imie,nazwisko,(pensja*0.19) FROM Pracownicy;



--3c   z tabeli Pracownicy wyświetlą wszystkie kolumny dla pracowników o id_dzialu równym 5
SELECT * from Pracownicy where id_dzialu = 5;



--3d    z tabeli Klienci wyświetlą wszystkie kolumny dla klientów, nie posiadających przypisanego pracownika kontaktowego (którychprac_kontaktowy ma wartość NULL)
SELECT * from Klienci where prac_kontaktowy = NULL;



--3e    z tabeli Pracownicy wyświetlą wszystkie kolumny dla pracowników, których imię zaczyna się na literę J
SELECT * from Pracownicy where imie like "A%";



--3f    z tabeli Klienci wyświetlą kolumny nazwa, prac_kontaktowy a wyniki posortują malejąco według nazwy
SELECT nazwa, prac_kontaktowy from Klienci ORDER BY nazwa DESC, prac_kontaktowy DESC;

