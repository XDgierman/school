SELECT SzczegolySprzedazy.IDsprzedazy, Rowery.NazwaRoweru, SzczegolySprzedazy.Ilosc, SzczegolySprzedazy.CenaJednostkowa, (SzczegolySprzedazy.Ilosc*SzczegolySprzedazy.CenaJednostkowa) AS [Wartość Sprzedaży]
FROM Rowery INNER JOIN SzczegolySprzedazy ON Rowery.IDroweru=SzczegolySprzedazy.IDroweru;
