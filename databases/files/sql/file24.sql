PARAMETERS [Podaj nową nazwę miasta:] CHAR,
[Podaj ID producenta:] INTEGER;
UPDATE Producenci SET MiastoProducenta = [Podaj nową nazwę miasta]
WHERE (Producenci.IDproducenta = [Podaj ID producenta]);
