SELECT KategorieRowerow.NazwaKategorii, AVG(Rowery.CenaJednostkowa) AS [Średnia cena]
FROM KategorieRowerow INNER JOIN Rowery ON KategorieRowerow.IDkategorii = Rowery.IDkategorii
GROUP BY KategorieRowerow.NazwaKategorii;
