SELECT Klienci.NazwiskoKlienta, Klienci.ImieKlienta, Sprzedaze.DataSprzedazy, Pracownicy.ImiePracownika, Pracownicy.NazwiskoPracownika, Rowery.NazwaRoweru
FROM (((Klienci INNER JOIN Sprzedaze ON Klienci.IDklienta = Sprzedaze.IDklienta)
INNER JOIN Pracownicy ON Pracownicy.IDpracownika = Sprzedaze.IDpracownika)
INNER JOIN SzczegolySprzedazy ON Sprzedaze.IDsprzedazy = SzczegolySprzedazy.IDsprzedazy)
INNER JOIN Rowery ON Rowery.IDroweru = SzczegolySprzedazy.IDroweru
WHERE Sprzedaze.DataSprzedazy BETWEEN #2013-01-01# AND #2013-12-31#;
