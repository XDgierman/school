SELECT Klienci.NazwiskoKlienta, Klienci.ImieKlienta, Sprzedaze.DataSprzedazy, Rowery.NazwaRoweru
FROM Klienci, Sprzedaze, SzczegolySprzedazy, Rowery
WHERE Klienci.IDklienta=Sprzedaze.IDklienta AND Sprzedaze.IDsprzedazy=SzczegolySprzedazy.IDsprzedazy AND SzczegolySprzedazy.IDroweru=Rowery.IDroweru;
