SELECT Klienci.NazwiskoKlienta, SUM(SzczegolySprzedazy.Ilosc*SzczegolySprzedazy.CenaJednostkowa) AS [Wartość zakupów]
FROM (Klienci INNER JOIN Sprzedaze ON Klienci.IDklienta = Sprzedaze.IDklienta) INNER JOIN SzczegolySprzedazy ON Sprzedaze.IDsprzedazy = SzczegolySprzedazy.IDsprzedazy
GROUP BY Klienci.NazwiskoKlienta
HAVING SUM(SzczegolySprzedazy.Ilosc*SzczegolySprzedazy.CenaJednostkowa)>2000;
