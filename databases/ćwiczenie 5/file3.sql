SELECT Rowery.NazwaRoweru, KategorieRowerow.NazwaKategorii, Rowery.CenaJednostkowa, Producenci.NazwaProducenta
FROM (KategorieRowerow INNER JOIN Rowery ON KategorieRowerow.IDkategorii = Rowery.IDkategorii) INNER JOIN Producenci ON Producenci.IDproducenta = Rowery.IDproducenta;
