SELECT Klienci.NazwiskoKlienta, COUNT(Sprzedaze.IDklienta) AS [Ilość sprzedaży]
FROM Klienci INNER JOIN Sprzedaze ON Klienci.IDklienta = Sprzedaze.IDklienta
GROUP BY Klienci.NazwiskoKlienta;
