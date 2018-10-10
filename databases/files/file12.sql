SELECT MiastoKlienta, COUNT(IDklienta) AS [Liczba klientów]
FROM Klienci
GROUP BY MiastoKlienta;
