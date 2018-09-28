SELECT Klienci.NazwiskoKlienta, Klienci.ImieKlienta, Sprzedaze.DataSprzedazy
FROM Klienci LEFT JOIN Sprzedaze ON Klienci.IDklienta = Sprzedaze.IDklienta;

SELECT Klienci.NazwiskoKlienta, Klienci.ImieKlienta, Sprzedaze.DataSprzedazy
FROM Klienci RIGHT JOIN Sprzedaze ON Klienci.IDklienta = Sprzedaze.IDklienta;
