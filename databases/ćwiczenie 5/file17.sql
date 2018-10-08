SELECT NazwaRoweru, COUNT(SzczegolySprzedazy.IDroweru) AS [Ile razy kupiono]
FROM Rowery INNER JOIN SzczegolySprzedazy ON Rowery.IDroweru = SzczegolySprzedazy.IDroweru
GROUP BY Rowery.NazwaRoweru
HAVING COUNT(SzczegolySprzedazy.IDroweru)>1;
