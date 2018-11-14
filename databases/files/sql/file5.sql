SELECT Producenci.NazwaProducenta, Rowery.NazwaRoweru, Rowery.CenaJednostkowa
FROM Producenci, Rowery, KategorieRowerow
WHERE Producenci.IDproducenta = Rowery.IDproducenta
AND Rowery.IDkategorii = KategorieRowerow.IDkategorii
AND KategorieRowerow.NazwaKategorii = "Rower górski";
