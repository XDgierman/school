USE [Hurtownia]

GO
CREATE TABLE [dbo].[KategorieRowerow](
	[IDkategorii] [int] IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[NazwaKategorii] [nvarchar](100) NOT NULL,
);

GO
INSERT INTO [dbo].[KategorieRowerow] (NazwaKategorii) VALUES 
  ('Rower górski'),
  ('Rower wyczynowy'),
  ('Rower wyścigowy'),
  ('Rower treningowy'),
  ('Rower dziecięcy');


GO
CREATE TABLE [dbo].[Klienci](
	[IDklienta] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ImieKlienta] [nvarchar](50) NOT NULL,
	[NazwiskoKlienta] [nvarchar](50) NOT NULL,
	[IDwojewodztwa] [int] NOT NULL,
	[KodPocztowyKlienta] [nvarchar](20) NULL,
	[MiastoKlienta] [nvarchar](50) NOT NULL,
	[UlicaKlienta] [nvarchar](50) NOT NULL,
	[NrDomuKlienta] [nvarchar](10) NOT NULL
);
 
GO
INSERT INTO [dbo].[klienci] (ImieKlienta, NazwiskoKlienta, IDwojewodztwa, KodPocztowyKlienta, MiastoKlienta, UlicaKlienta, NrDomuKlienta) VALUES 
  ('Jan','Kowalski',12,'43-190','Mikołów','Rybnicka','44'),
  ('Piotr','Nowak',12,'40-265','Katowice','Mikołowska','150'),
  ('Marek','Niedzielan',12,'43-190','Mikołów','Krakowksa','100'),
  ('Katarzyna','Więcek',6,'30-200','Kraków','Smocza','3/10'),
  ('Maria','Karolczak',1,'45-678','Wrocław','Katowicka','24'),
  ('Adam','Maliniak',12,'40-710','Katowice','Słupska','35'),
  ('Andrzej','Nowak',12,'43-190','Tychy','Dębowa','20'),
  ('Antonina','Kowalczyk',12,'44-500','Katowice','Kopernika','50/21'),
  ('Leszek','Pusz',7,'02-770','Warszawa','Wiejska','50'),
  ('Kunegunda','Piszczak',12,'44-521','Katowice','Andrzeja','56'),
  ('Jan','Jankowski',12,'43-190','Mikołów','Jasna','12');


GO
CREATE TABLE [dbo].[Pracownicy](
	[IDpracownika] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ImiePracownika] [nvarchar](50) NOT NULL,
	[NazwiskoPracownika] [nvarchar](50) NOT NULL,
	[IDwojewodztwa] [int] NOT NULL,
	[KodPocztowyPracownika] [nvarchar](6) NULL,
	[MiastoPracownika] [nvarchar](50) NOT NULL,
	[UlicaPracownika] [nvarchar](100) NOT NULL,
	[NrDomuPracownika] [nvarchar](10) NULL,
	[DataUrodzeniaPracownika] [datetime2](0) NOT NULL,
	[DataZatrudnieniaPracownika] [datetime2](0) NOT NULL,
	[TelefonPracownika] [nvarchar](12) NULL,
	[PlacaPracownika] [money] NOT NULL
);

GO
INSERT INTO [dbo].[Pracownicy] (ImiePracownika, NazwiskoPracownika, IDwojewodztwa, KodPocztowyPracownika, MiastoPracownika, UlicaPracownika, NrDomuPracownika, DataUrodzeniaPracownika, DataZatrudnieniaPracownika, TelefonPracownika, PlacaPracownika) VALUES 
  ('Barbara','Brzozowska',7,'00-950','Warszawa','Wspólna','5','1984-03-20 00:00:00','2010-04-20 00:00:00','665-58-57',2700.0000),
  ('Alicja','Nowak',7,'00-120','Warszawa','Traugutta','80','1988-03-20 00:00:00','2011-01-02 00:00:00','665-35-87',2300.0000),
  ('Antoni','Polke',7,'00-450','Warszawa','Zwycięstwa','21/40','1986-03-20 00:00:00','2012-05-10 00:00:00','662-62-62',1780.0000),
  ('Franciszka','Kowalska',12,'40-720','Katowice','Mikołowska','15','1990-03-20 00:00:00','2013-06-01 00:00:00','221-58-79',1500.0000),
  ('Adebe','Makulebe',6,'30-200','Kraków','Lwowska','10a/14','1991-03-20 00:00:00','2014-01-01 00:00:00','221-58-79',1100.0000);


GO
CREATE TABLE [dbo].[Producenci](
	[IDproducenta] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[NazwaProducenta] [nvarchar](50) NOT NULL,
	[IDwojewodztwa] [int] NOT NULL,
	[KodPocztowyProducenta] [nvarchar](6) NULL,
	[MiastoProducenta] [nvarchar](50) NOT NULL,
	[UlicaProducenta] [nvarchar](50) NOT NULL,
	[NrDomuProducenta] [nvarchar](10) NOT NULL,
	[TelefonProducenta] [nvarchar](12) NULL
);

GO
INSERT INTO [dbo].[Producenci] (NazwaProducenta, IDwojewodztwa, KodPocztowyProducenta, MiastoProducenta, UlicaProducenta, NrDomuProducenta, TelefonProducenta) VALUES 
  ('Wigry',7,'00-750','Warszawa','Starowiejska','10','222-55-88'),
  ('BMW',12,'55-999','Sosnowiec','Katowicka','20','666-44-87'),
  ('CrossAction',6,'01-761','Oświęcim','Tarnobrzeska','15','579-15-76'),
  ('BMX',7,'02-469','Warszawa','Kopernika','5',NULL),
  ('Geant',12,'40-700','Katowice','Kujawska','110','252-76-66');
  
  
GO
CREATE TABLE [dbo].[Rowery](
	[IDroweru] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[NazwaRoweru] [nvarchar](100) NOT NULL,
	[OpisRoweru] [nvarchar](max) NULL,
	[IDkategorii] [int] NOT NULL,
	[IDproducenta] [int] NOT NULL,
	[CenaJednostkowa] [money] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL
);

GO
INSERT INTO [dbo].[Rowery] (NazwaRoweru, OpisRoweru, IDkategorii, IDproducenta, CenaJednostkowa) VALUES 
  ('Magnum','Rower ze stali tytanowej, odpornej na korozję',2,1,1600.0000),
  ('Enigma','Rower roku 2013',4,3,700.00),
  ('Relaks','Rower treningowy z możliwością regulacji oporu koła',4,2,1200.0000),
  ('Bobo','Lekki rower ze stali aluminiowej',5,1,360.00),
  ('Huragan','Rower wyścigowy 30 biegowy',3,5,3300.00),
  ('Junak','Idealny rower na górskie wycieczki',1,4,1000.00),
  ('Mirage','Wysokiej klasy rower wyczynowy dla profesjonalistów',1,4,900.00);

GO
CREATE TABLE [dbo].[Sprzedaze](
	[IDsprzedazy] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DataSprzedazy] [date] NOT NULL,
	[IDpracownika] [int] NOT NULL,
	[IDklienta] [int] NOT NULL
);

GO
INSERT INTO [dbo].[Sprzedaze] (DataSprzedazy, IDpracownika, IDklienta) VALUES 
  ('2013-10-25',3,6),
  ('2013-11-10',5,5),
  ('2013-11-20',4,7),
  ('2013-12-15',3,6),
  ('2014-01-10',4,7),
  ('2014-01-20',1,8),
  ('2014-02-15',2,10),
  ('2014-03-01',2,9);

GO
CREATE TABLE [dbo].[SzczegolySprzedazy](
	[IDsprzedazy] [int] NOT NULL,
	[IDroweru] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
	[CenaJednostkowa] [money] NOT NULL
);

GO
INSERT INTO [dbo].[SzczegolySprzedazy] (IDsprzedazy, IDroweru, Ilosc, CenaJednostkowa) VALUES 
  (1,1,2,360.0000),
  (1,3,2,980.0000),
  (2,2,1,600.0000),
  (3,6,2,1450.0000),
  (3,7,2,3300.0000),
  (4,5,1,2200.0000),
  (5,4,3,1000.0000),
  (6,1,2,360.0000),
  (7,5,2,2200.0000),
  (8,3,2,980.0000),
  (8,4,3,1000.0000);
  
GO
CREATE TABLE [dbo].[Wojewodztwa](
	[IDwojewodztwa]  [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[NazwaWojewodztwa] [nvarchar](50) NOT NULL
);

GO
INSERT INTO [dbo].[Wojewodztwa] (NazwaWojewodztwa) VALUES 
  ('dolnośląskie'),
  ('kujawsko-pomorskie'),
  ('lubelskie'),
  ('lubuskie'),
  ('łódzkie'),
  ('małopolskie'),
  ('mazowieckie'),
  ('opolskie'),
  ('podkarpackie'),
  ('podlaskie'),
  ('pomorskie'),
  ('śląskie'),
  ('świętokrzyskie'),
  ('warmińsko-mazurskie'),
  ('wielkopolskie'),
  ('zachodnio-pomorskie');
