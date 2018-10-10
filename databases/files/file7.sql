SELECT K.NazwiskoKlienta, K.ImieKlienta, S.DataSprzedazy
FROM Klienci AS K INNER JOIN Sprzedaze AS S ON K.IDklienta = S.IDklienta;
