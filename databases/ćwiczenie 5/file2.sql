SELECT Klienci.NazwiskoKlienta, Klienci.ImieKlienta, Klienci.MiastoKlienta, Wojewodztwa.NazwaWojewodztwa
FROM Wojewodztwa INNER JOIN Klienci ON Wojewodztwa.IDwojewodztwa = Klienci.IDwojewodztwa;
