-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 01 Paź 2015, 18:19
-- Wersja serwera: 5.6.24
-- Wersja PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hurtownia`
--
CREATE DATABASE IF NOT EXISTS `hurtownia4ti1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hurtownia4ti1`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorierowerow`
--

CREATE TABLE `kategorierowerow` (
  `IDkategorii` int(11) NOT NULL,
  `NazwaKategorii` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `kategorierowerow`
--

INSERT INTO `kategorierowerow` (`IDkategorii`, `NazwaKategorii`) VALUES
(1, 'Rower górski'),
(2, 'Rower wyczynowy'),
(3, 'Rower wyścigowy'),
(4, 'Rower treningowy'),
(5, 'Rower dziecięcy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `IDklienta` int(11) NOT NULL,
  `ImieKlienta` varchar(50) NOT NULL,
  `NazwiskoKlienta` varchar(50) NOT NULL,
  `IDwojewodztwa` int(2) NOT NULL,
  `KodPocztowyKlienta` varchar(6) DEFAULT NULL,
  `MiastoKlienta` varchar(50) NOT NULL,
  `UlicaKlienta` varchar(50) NOT NULL,
  `NrDomuKlienta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`IDklienta`, `ImieKlienta`, `NazwiskoKlienta`, `IDwojewodztwa`, `KodPocztowyKlienta`, `MiastoKlienta`, `UlicaKlienta`, `NrDomuKlienta`) VALUES
(1, 'Jan', 'Kowalski', 12, '43-190', 'Mikołów', 'Rybnicka', '44'),
(2, 'Piotr', 'Nowak', 12, '40-265', 'Katowice', 'Mikołowska', '150'),
(3, 'Marek', 'Niedzielan', 12, '43-190', 'Mikołów', 'Krakowksa', '100'),
(4, 'Katarzyna', 'Więcek', 6, '30-200', 'Kraków', 'Smocza', '3/10'),
(5, 'Maria', 'Karolczak', 1, '45-678', 'Wrocław', 'Katowicka', '24'),
(6, 'Adam', 'Maliniak', 12, '40-710', 'Katowice', 'Słupska', '35'),
(7, 'Andrzej', 'Nowak', 12, '43-190', 'Tychy', 'Dębowa', '20'),
(8, 'Antonina', 'Kowalczyk', 12, '44-500', 'Katowice', 'Kopernika', '50/21'),
(9, 'Leszek', 'Pusz', 7, '02-770', 'Warszawa', 'Wiejska', '50'),
(10, 'Kunegunda', 'Piszczak', 12, '44-521', 'Katowice', 'Andrzeja', '56'),
(11, 'Jan', 'Jankowski', 12, '43-190', 'Mikołów', 'Jasna', '12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `IDpracownika` int(11) NOT NULL,
  `ImiePracownika` varchar(50) NOT NULL,
  `NazwiskoPracownika` varchar(50) NOT NULL,
  `IDwojewodztwa` int(2) NOT NULL,
  `KodPocztowyPracownika` varchar(6) DEFAULT NULL,
  `MiastoPracownika` varchar(50) NOT NULL,
  `UlicaPracownika` varchar(100) NOT NULL,
  `NrDomuPracownika` varchar(10) DEFAULT NULL,
  `DataUrodzeniaPracownika` date NOT NULL,
  `DataZatrudnieniaPracownika` date NOT NULL,
  `TelefonPracownika` varchar(12) DEFAULT NULL,
  `PlacaPracownika` decimal(19,4) NOT NULL,
  `ZdjeciePracownika` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`IDpracownika`, `ImiePracownika`, `NazwiskoPracownika`, `IDwojewodztwa`, `KodPocztowyPracownika`, `MiastoPracownika`, `UlicaPracownika`, `NrDomuPracownika`, `DataUrodzeniaPracownika`, `DataZatrudnieniaPracownika`, `TelefonPracownika`, `PlacaPracownika`, `ZdjeciePracownika`) VALUES
(1, 'Barbara', 'Brzozowska', 7, '00-950', 'Warszawa', 'Wspólna', '5', '1984-03-20', '2010-04-20', '665-58-57', '2700.0000', NULL),
(2, 'Alicja', 'Nowak', 7, '00-120', 'Warszawa', 'Traugutta', '80', '1988-03-20', '2011-01-02', '665-35-87', '2300.0000', NULL),
(3, 'Antoni', 'Polke', 7, '00-450', 'Warszawa', 'Zwycięstwa', '21/40', '1986-03-20', '2012-05-10', '662-62-62', '1780.0000', NULL),
(4, 'Franciszka', 'Kowalska', 12, '40-720', 'Katowice', 'Mikołowska', '15', '1990-03-20', '2013-06-01', '221-58-79', '1500.0000', NULL),
(5, 'Adebe', 'Makulebe', 6, '30-200', 'Kraków', 'Lwowska', '10a/14', '1991-03-20', '2014-01-01', '221-58-79', '1100.0000', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producenci`
--

CREATE TABLE `producenci` (
  `IDproducenta` int(11) NOT NULL,
  `NazwaProducenta` varchar(50) NOT NULL,
  `IDwojewodztwa` int(2) NOT NULL,
  `KodPocztowyProducenta` varchar(6) DEFAULT NULL,
  `MiastoProducenta` varchar(50) NOT NULL,
  `UlicaProducenta` varchar(50) NOT NULL,
  `NrDomuProducenta` varchar(10) NOT NULL,
  `TelefonProducenta` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `producenci`
--

INSERT INTO `producenci` (`IDproducenta`, `NazwaProducenta`, `IDwojewodztwa`, `KodPocztowyProducenta`, `MiastoProducenta`, `UlicaProducenta`, `NrDomuProducenta`, `TelefonProducenta`) VALUES
(1, 'Wigry', 7, '00-750', 'Warszawa', 'Starowiejska', '10', '222-55-88'),
(2, 'BMW', 12, '55-999', 'Sosnowiec', 'Katowicka', '20', '666-44-87'),
(3, 'CrossAction', 6, '01-761', 'Oświęcim', 'Tarnobrzeska', '15', '579-15-76'),
(4, 'BMX', 7, '02-469', 'Warszawa', 'Kopernika', '5', NULL),
(5, 'Geant', 12, '40-700', 'Katowice', 'Kujawska', '110', '252-76-66');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rowery`
--

CREATE TABLE `rowery` (
  `IDroweru` int(11) NOT NULL,
  `NazwaRoweru` varchar(100) NOT NULL,
  `OpisRoweru` longtext,
  `IDkategorii` int(11) NOT NULL,
  `IDproducenta` int(11) NOT NULL,
  `CenaJednostkowa` decimal(8,2) NOT NULL,
  `ZdjecieRoweru` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `rowery`
--

INSERT INTO `rowery` (`IDroweru`, `NazwaRoweru`, `OpisRoweru`, `IDkategorii`, `IDproducenta`, `CenaJednostkowa`, `ZdjecieRoweru`) VALUES
(1, 'Magnum', 'Rower ze stali tytanowej, odpornej na korozję', 2, 1, '1600.00', NULL),
(2, 'Enigma', 'Rower roku 2013', 4, 3, '700.00', NULL),
(3, 'Relaks', 'Rower treningowy z możliwością regulacji oporu koła', 4, 2, '1200.00', NULL),
(4, 'Bobo', 'Lekki rower ze stali aluminiowej', 5, 1, '360.00', NULL),
(5, 'Huragan', 'Rower wyścigowy 30 biegowy', 3, 5, '3300.00', NULL),
(6, 'Junak', 'Idealny rower na górskie wycieczki', 1, 4, '1000.00', NULL),
(7, 'Mirage', 'Wysokiej klasy rower wyczynowy dla profesjonalistów', 1, 4, '900.00', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaze`
--

CREATE TABLE `sprzedaze` (
  `IDsprzedazy` int(11) NOT NULL,
  `DataSprzedazy` date NOT NULL,
  `IDpracownika` int(11) NOT NULL,
  `IDklienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `sprzedaze`
--

INSERT INTO `sprzedaze` (`IDsprzedazy`, `DataSprzedazy`, `IDpracownika`, `IDklienta`) VALUES
(1, '2013-10-25', 3, 6),
(2, '2013-11-10', 5, 5),
(3, '2013-11-20', 4, 7),
(4, '2013-12-15', 3, 6),
(5, '2014-01-10', 4, 7),
(6, '2014-01-20', 1, 8),
(7, '2014-02-15', 2, 10),
(8, '2014-03-01', 2, 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegolysprzedazy`
--

CREATE TABLE `szczegolysprzedazy` (
  `IDsprzedazy` int(11) NOT NULL,
  `idroweru` int(11) NOT NULL,
  `Ilosc` int(11) NOT NULL,
  `CenaJednostkowa` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `szczegolysprzedazy`
--

INSERT INTO `szczegolysprzedazy` (`IDsprzedazy`, `idroweru`, `Ilosc`, `CenaJednostkowa`) VALUES
(1, 1, 2, '360.00'),
(1, 3, 2, '980.00'),
(2, 2, 1, '600.00'),
(3, 6, 2, '1450.00'),
(3, 7, 2, '3300.00'),
(4, 5, 1, '2200.00'),
(5, 4, 3, '1000.00'),
(6, 1, 2, '360.00'),
(7, 5, 2, '2200.00'),
(8, 3, 2, '980.00'),
(8, 4, 3, '1000.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wojewodztwa`
--

CREATE TABLE `wojewodztwa` (
  `IDwojewodztwa` int(2) NOT NULL,
  `NazwaWojewodztwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `wojewodztwa`
--

INSERT INTO `wojewodztwa` (`IDwojewodztwa`, `NazwaWojewodztwa`) VALUES
(1, 'dolnośląskie'),
(2, 'kujawsko-pomorskie'),
(3, 'lubelskie'),
(4, 'lubuskie'),
(5, 'łódzkie'),
(6, 'małopolskie'),
(7, 'mazowieckie'),
(8, 'opolskie'),
(9, 'podkarpackie'),
(10, 'podlaskie'),
(11, 'pomorskie'),
(12, 'śląskie'),
(13, 'świętokrzyskie'),
(14, 'warmińsko-mazurskie'),
(15, 'wielkopolskie'),
(16, 'zachodnio-pomorskie');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `kategorierowerow`
--
ALTER TABLE `kategorierowerow`
  ADD PRIMARY KEY (`IDkategorii`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`IDklienta`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`IDpracownika`);

--
-- Indexes for table `producenci`
--
ALTER TABLE `producenci`
  ADD PRIMARY KEY (`IDproducenta`);

--
-- Indexes for table `rowery`
--
ALTER TABLE `rowery`
  ADD PRIMARY KEY (`IDroweru`);

--
-- Indexes for table `sprzedaze`
--
ALTER TABLE `sprzedaze`
  ADD PRIMARY KEY (`IDsprzedazy`);

--
-- Indexes for table `szczegolysprzedazy`
--
ALTER TABLE `szczegolysprzedazy`
  ADD PRIMARY KEY (`IDsprzedazy`,`idroweru`);

--
-- Indexes for table `wojewodztwa`
--
ALTER TABLE `wojewodztwa`
  ADD PRIMARY KEY (`IDwojewodztwa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategorierowerow`
--
ALTER TABLE `kategorierowerow`
  MODIFY `IDkategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `IDklienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `IDpracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `producenci`
--
ALTER TABLE `producenci`
  MODIFY `IDproducenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `rowery`
--
ALTER TABLE `rowery`
  MODIFY `IDroweru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `sprzedaze`
--
ALTER TABLE `sprzedaze`
  MODIFY `IDsprzedazy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT dla tabeli `wojewodztwa`
--
ALTER TABLE `wojewodztwa`
  MODIFY `IDwojewodztwa` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
