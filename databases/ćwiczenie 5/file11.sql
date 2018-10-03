SELECT MIN(CenaJednostkowa) AS [Cena najniższa], MAX(CenaJednostkowa) AS [Cena najwyższa], (SUM(CenaJednostkowa)/COUNT(*)) AS [Cena Średnia]
FROM Rowery;
