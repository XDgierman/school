SELECT MiastoKlienta, COUNT(MiastoKlienta) AS [Liczba klientów]
FROM Klienci
GROUP BY MiastoKlienta
HAVING MiastoKlienta LIKE ("K*");
