-- Host: 127.0.0.1    Database: hurtownia
-- ------------------------------------------------------
-- Server version	5.5.21-log

USE hurtownia3ti1;

--
-- Table structure for table `wojewodztwa`
--

DROP TABLE IF EXISTS `wojewodztwa`;
CREATE TABLE `wojewodztwa` (
  `IDwojewodztwa` int(2) NOT NULL AUTO_INCREMENT,
  `NazwaWojewodztwa` varchar(30) NOT NULL,
  PRIMARY KEY (`IDwojewodztwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `klienci`
--

DROP TABLE IF EXISTS `klienci`;
CREATE TABLE `klienci` (
  `IDklienta` int(6) NOT NULL AUTO_INCREMENT,
  `ImieKlienta` varchar(30) NOT NULL,
  `NazwiskoKlienta` varchar(30) NOT NULL,
  `IDwojewodztwa` int(2) DEFAULT NULL,
  `KodPocztowyKlienta` varchar(6) DEFAULT NULL,
  `MiastoKlienta` varchar(30) NOT NULL,
  `UlicaKlienta` varchar(30) NOT NULL,
  `NrDomuKlienta` varchar(6) NOT NULL,
   PRIMARY KEY (`IDklienta`),
   FOREIGN KEY (`IDwojewodztwa`) REFERENCES `wojewodztwa` (`IDwojewodztwa`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `kategorierowerow`
--



DROP TABLE IF EXISTS `kategorierowerow`;
CREATE TABLE `kategorierowerow` (
  `IDkategorii` int(11) NOT NULL AUTO_INCREMENT,
  `NazwaKategorii` varchar(100) NOT NULL,
  PRIMARY KEY (`IDkategorii`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
CREATE TABLE `pracownicy` (
  `IDpracownika` int(3) NOT NULL AUTO_INCREMENT,
  `ImiePracownika` varchar(30) NOT NULL,
  `NazwiskoPracownika` varchar(30) NOT NULL,
  `IDwojewodztwa` int(2) NOT NULL,
  `KodPocztowyPracownika` varchar(6) DEFAULT NULL,
  `MiastoPracownika` varchar(30) NOT NULL,
  `UlicaPracownika` varchar(30) NOT NULL,
  `NrDomuPracownika` varchar(6) DEFAULT NULL,
  `DataUrodzeniaPracownika` date NOT NULL,
  `DataZatrudnieniaPracownika` date NOT NULL,
  `TelefonPracownika` varchar(12) DEFAULT NULL,
  `PlacaPracownika` decimal(19,4) NOT NULL,
  `ZdjeciePracownika` longblob,
  PRIMARY KEY (`IDpracownika`),
  FOREIGN KEY (`IDwojewodztwa`) REFERENCES `wojewodztwa` (`IDwojewodztwa`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `producenci`
--

DROP TABLE IF EXISTS `producenci`;
CREATE TABLE `producenci` (
  `IDproducenta` int(3) NOT NULL AUTO_INCREMENT,
  `NazwaProducenta` varchar(50) NOT NULL,
  `IDwojewodztwa` int(2) NOT NULL,
  `KodPocztowyProducenta` varchar(6) DEFAULT NULL,
  `MiastoProducenta` varchar(50) NOT NULL,
  `UlicaProducenta` varchar(50) NOT NULL,
  `NrDomuProducenta` varchar(10) NOT NULL,
  `TelefonProducenta` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`IDproducenta`),
  FOREIGN KEY (`IDwojewodztwa`) REFERENCES `wojewodztwa` (`IDwojewodztwa`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `rowery`
--

DROP TABLE IF EXISTS `rowery`;
CREATE TABLE `rowery` (
  `IDroweru` int(11) NOT NULL AUTO_INCREMENT,
  `NazwaRoweru` varchar(100) NOT NULL,
  `OpisRoweru` longtext,
  `IDkategorii` int(11) NOT NULL,
  `IDproducenta` int(11) NOT NULL,
  `CenaJednostkowa` decimal(19,4) NOT NULL,
  `ZdjecieRoweru` longblob,
  PRIMARY KEY (`IDroweru`),
  FOREIGN KEY (`IDkategorii`) REFERENCES `kategorierowerow` (`IDkategorii`),
  FOREIGN KEY (`IDproducenta`) REFERENCES `producenci` (`IDproducenta`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sprzedaze`
--

DROP TABLE IF EXISTS `sprzedaze`;
CREATE TABLE `sprzedaze` (
  `IDsprzedazy` int(11) NOT NULL AUTO_INCREMENT,
  `DataSprzedazy` date NOT NULL,
  `IDpracownika` int(3) NOT NULL,
  `IDklienta` int(6) NOT NULL,
  PRIMARY KEY (`IDsprzedazy`),
  FOREIGN KEY (`IDpracownika`) REFERENCES `pracownicy` (`IDpracownika`),
  FOREIGN KEY (`IDklienta`) REFERENCES `klienci` (`IDklienta`))
ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `szczegolysprzedazy`
--

DROP TABLE IF EXISTS `szczegolysprzedazy`;
CREATE TABLE `szczegolysprzedazy` (
  `IDsprzedazy` int(11) NOT NULL,
  `IDroweru` int(11) NOT NULL,
  `Ilosc` int(11) NOT NULL,
  `CenaJednostkowa` decimal(19,4) NOT NULL,
  PRIMARY KEY (`IDsprzedazy`,`IDroweru`),
  CONSTRAINT `klucz_O1` FOREIGN KEY (`IDsprzedazy`) REFERENCES `sprzedaze` (`IDsprzedazy`) ON DELETE CASCADE,
  CONSTRAINT `klucz_O2` FOREIGN KEY (`IDroweru`) REFERENCES `rowery` (`IDroweru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
