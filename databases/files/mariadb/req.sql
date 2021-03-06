select klienci.NazwiskoKlienta, sprzedaze.DataSprzedazy
from klienci,sprzedaze
where klienci.IDklienta = sprzedaze.IDklienta;

select klienci.NazwiskoKlienta, sprzedaze.DataSprzedazy, pracownicy.NazwiskoPracownika
from klienci,sprzedaze,pracownicy
where klienci.IDklienta = sprzedaze.IDklienta and pracownicy.IDpracownika = sprzedaze.IDpracownika;

select klienci.NazwiskoKlienta, sprzedaze.DataSprzedazy, pracownicy.NazwiskoPracownika
from klienci,sprzedaze,pracownicy
where klienci.IDklienta = sprzedaze.IDklienta
and pracownicy.IDpracownika = sprzedaze.IDpracownika
and sprzedaze.DataSprzedazy between '2013-01-10' and '2013-12-31';

select producenci.NazwaProducenta, rowery.NazwaRoweru, sprzedaze.DataSprzedazy
from producenci,rowery,sprzedaze,szczegolysprzedazy
where producenci.IDproducenta = rowery.IDproducenta
and rowery.IDroweru = szczegolysprzedazy.IDroweru
and szczegolysprzedazy.IDsprzedazy = sprzedaze.IDsprzedazy;

select klienci.NazwiskoKlienta, sprzedaze.DataSprzedazy
from klienci join sprzedaze
where klienci.IDklienta = sprzedaze.IDklienta;

select pracownicy.ImiePracownika, pracownicy.NazwiskoPracownika, pracownicy.MiastoPracownika, wojewodztwa.NazwaWojewodztwa
from pracownicy, wojewodztwa
where pracownicy.IDwojewodztwa = wojewodztwa.IDwojewodztwa;

select klienci.NazwiskoKlienta, klienci.ImieKlienta, sprzedaze.DataSprzedazy
from ((klienci join sprzedaze) join szczegolysprzedazy) join rowery
where klienci.IDklienta = sprzedaze.IDklienta
and sprzedaze.IDsprzedazy = szczegolysprzedazy.IDsprzedazy
and rowery.IDroweru = szczegolysprzedazy.IDroweru
and rowery.NazwaRoweru = 'Bobo';

select klienci.NazwiskoKlienta, sprzedaze.DataSprzedazy, pracownicy.NazwiskoPracownika
from klienci inner join sprzedaze on klienci.IDklienta = sprzedaze.IDklienta
inner join pracownicy on pracownicy.IDpracownika = sprzedaze.IDpracownika;

select rowery.NazwaRoweru, sprzedaze.DataSprzedazy
from rowery inner join szczegolysprzedazy on rowery.IDroweru = szczegolysprzedazy.IDroweru
inner join sprzedaze on sprzedaze.IDsprzedazy = szczegolysprzedazy.IDsprzedazy
order by rowery.NazwaRoweru;

select rowery.NazwaRoweru, sprzedaze.DataSprzedazy
from rowery inner join szczegolysprzedazy using (IDroweru)
inner join sprzedaze using (IDsprzedazy)
where sprzedaze.DataSprzedazy between '2013-01-01' and '2013-12-31'
order by rowery.NazwaRoweru;

select distinct klienci.NazwiskoKlienta, klienci.MiastoKlienta, rowery.NazwaRoweru
from rowery inner join szczegolysprzedazy using (IDroweru)
inner join sprzedaze using (IDsprzedazy)
inner join klienci using (IDklienta)
where klienci.MiastoKlienta like 'K%';

select count(*) as "Liczba klientów"
from klienci;

select count(MiastoKlienta) as "Liczba rekordów",
count(distinct(MiastoKlienta)) as "Rzeczywista ilość miast"
from klienci;

select count(*) as "Liczba sprzedarzy"
from sprzedaze
where DataSprzedazy > '2013-01-01';

select sum(Ilosc) as "Sprzedano rowerów"
from szczegolysprzedazy;

select sum(Ilosc*CenaJednostkowa) as "Całkowity przychód"
from szczegolysprzedazy;

select sum(szczegolysprzedazy.Ilosc*szczegolysprzedazy.CenaJednostkowa)
as "Całkowity przychód za rower"
from szczegolysprzedazy inner join rowery
using (IDroweru)
where rowery.NazwaRoweru = 'Bobo';

select avg(PlacaPracownika) as "Średnia płaca"
from pracownicy;

select avg(rowery.CenaJednostkowa) - avg(szczegolysprzedazy.CenaJednostkowa)
as "Różnica w cenie"
from rowery inner join szczegolysprzedazy using (IDroweru)
where rowery.NazwaRoweru = 'Enigma';

select min(DataSprzedazy)
from sprzedaze;

select max(PlacaPracownika) - min(PlacaPracownika)
from pracownicy;

select group_concat(NazwiskoKlienta," ",ImieKlienta)
from klienci;

select MiastoKlienta, count(MiastoKlienta) as "Liczba klientów"
from klienci
group by MiastoKlienta;

select rowery.NazwaRoweru, count(szczegolysprzedazy.IDroweru)
as "Ile razy kupiono"
from rowery inner join szczegolysprzedazy
using (IDroweru)
group by rowery.NazwaRoweru;

select sprzedaze.DataSprzedazy as "Data sprzedaży",
group_concat(klienci.NazwiskoKlienta," ",klienci.ImieKlienta) as "Kupujący",
sum(szczegolysprzedazy.Ilosc*szczegolysprzedazy.CenaJednostkowa)
as "Wartość sprzedaży"
from (klienci inner join sprzedaze using (IDklienta))
inner join szczegolysprzedazy using (IDsprzedazy)
group by sprzedaze.DataSprzedazy;

select group_concat(klienci.NazwiskoKlienta," ",klienci.ImieKlienta) as "Klient",
count(sprzedaze.IDklienta) as "Ile razy kupował"
from klienci inner join sprzedaze using (IDklienta)
group by klienci.IDklienta;

select kategorierowerow.NazwaKategorii as "Nazwa Kategorii",
avg(rowery.CenaJednostkowa) as "Średnia cena"
from kategorierowerow inner join rowery using(IDkategorii)
group by kategorierowerow.IDkategorii;

select rowery.NazwaRoweru, count(szczegolysprzedazy.IDroweru)
as "Ile razy kupiono"
from rowery inner join szczegolysprzedazy using(IDroweru)
group by rowery.NazwaRoweru
order by count(szczegolysprzedazy.IDroweru);

select rowery.NazwaRoweru, count(szczegolysprzedazy.IDroweru)
as Ile_razy_kupiono
from rowery inner join szczegolysprzedazy using(IDroweru)
group by rowery.NazwaRoweru
order by Ile_razy_kupiono;

select group_concat(distinct(pracownicy.ImiePracownika)," ",pracownicy.NazwiskoPracownika)
as "Pracownik",
sum(szczegolysprzedazy.CenaJednostkowa*szczegolysprzedazy.Ilosc) as Zarobek
from pracownicy inner join sprzedaze using(IDpracownika)
inner join szczegolysprzedazy using(IDsprzedazy)
group by pracownicy.IDpracownika
order by Zarobek;

select MiastoKlienta, count(MiastoKlienta) as "Liczba klientów"
from klienci
where MiastoKlienta like 'K%'
group by MiastoKlienta;

select MiastoKlienta, count(MiastoKlienta) as "Liczba klientów"
from klienci
group by MiastoKlienta
having count(MiastoKlienta) > 1;

select rowery.NazwaRoweru, count(szczegolysprzedazy.IDroweru)
as "Ile razy kupowano"
from rowery inner join szczegolysprzedazy using(IDroweru)
group by rowery.NazwaRoweru
having count(szczegolysprzedazy.IDroweru)>1;

select MiastoKlienta, count(MiastoKlienta) as "Liczba klientów"
from klienci
group by MiastoKlienta
having MiastoKlienta like 'K%';

select klienci.NazwiskoKlienta,
sum(szczegolysprzedazy.Ilosc*szczegolysprzedazy.CenaJednostkowa)
as "Wartość zakupów"
from (klienci inner join sprzedaze using(IDklienta))
inner join szczegolysprzedazy using(IDsprzedazy)
group by klienci.NazwiskoKlienta
having sum(szczegolysprzedazy.Ilosc*szczegolysprzedazy.CenaJednostkowa)>2000;

select klienci.NazwiskoKlienta,
sum(szczegolysprzedazy.Ilosc*szczegolysprzedazy.CenaJednostkowa)
as WartoscZ
from (klienci inner join sprzedaze using(IDklienta))
inner join szczegolysprzedazy using(IDsprzedazy)
group by klienci.NazwiskoKlienta
having WartoscZ>2000;

select MiastoKlienta, count(MiastoKlienta) as "Liczba klientów"
from klienci
group by MiastoKlienta
having MiastoKlienta like 'K%' and count(MiastoKlienta)>1;

select kategorierowerow.NazwaKategorii as "Kateoria",
avg(rowery.CenaJednostkowa) as "Średnia"
from kategorierowerow inner join rowery using(IDkategorii)
group by kategorierowerow.IDkategorii
having avg(rowery.CenaJednostkowa)<2000;

select NazwiskoPracownika, ImiePracownika, PlacaPracownika
from pracownicy
where PlacaPracownika = (select min(PlacaPracownika) from pracownicy);

select *
from (select NazwiskoPracownika, ImiePracownika, PlacaPracownika
from pracownicy
where DataZatrudnieniaPracownika between '2013-01-01' and '2013-12-31')
as wynik
where NazwiskoPracownika = 'Kowalska';

select NazwaRoweru, CenaJednostkowa,
(select avg(CenaJednostkowa) from rowery) as "Średnia cena"
from rowery;

select NazwaRoweru, CenaJednostkowa,
CenaJednostkowa - (select avg(CenaJednostkowa) from rowery) as "Różnica"
from rowery;

select NazwiskoKlienta, ImieKlienta
from klienci
where IDklienta not in (select IDklienta from sprzedaze);

select klienci.NazwiskoKlienta, klienci.ImieKlienta
from klienci left join sprzedaze on klienci.IDklienta = sprzedaze.IDklienta
where sprzedaze.DataSprzedazy is NULL;

select NazwaRoweru
from rowery
where IDroweru in (select IDroweru
from szczegolysprzedazy where CenaJednostkowa < 500);

select distinct rowery.NazwaRoweru
from rowery inner join szczegolysprzedazy using (IDroweru)
where szczegolysprzedazy.CenaJednostkowa < 500;

select NazwaRoweru from rowery
where CenaJednostkowa < (select avg(CenaJednostkowa)-100 from szczegolysprzedazy);

select ImiePracownika, NazwiskoPracownika from pracownicy
where DataZatrudnieniaPracownika =
(select min(DataZatrudnieniaPracownika) from pracownicy);

select * from rowery
where CenaJednostkowa = (select max(CenaJednostkowa) from rowery);

select *
from sprzedaze
where IDklienta in
(select IDklienta from klienci where NazwiskoKlienta ='Nowak');

select NazwiskoKlienta, ImieKlienta
from klienci
where IDklienta not in (select IDklienta from sprzedaze);

select *
from klienci
where exists
(select * from sprzedaze where klienci.IDklienta = sprzedaze.IDklienta);

select *
from klienci
where not exists
(select * from sprzedaze where klienci.IDklienta = sprzedaze.IDklienta);

select NazwiskoPracownika, ImiePracownika
from pracownicy
where PlacaPracownika > any(select PlacaPracownika
from pracownicy
where MiastoPracownika = "Warszawa");

select NazwiskoPracownika, ImiePracownika
from pracownicy as p
where PlacaPracownika > any(select PlacaPracownika
from pracownicy
where MiastoPracownika = p.MiastoPracownika);

select NazwaRoweru
from rowery as r
where r.CenaJednostkowa > any(select CenaJednostkowa
from rowery);

select NazwiskoPracownika, ImiePracownika
from pracownicy
where PlacaPracownika > all(select PlacaPracownika
from pracownicy
where MiastoPracownika = "Warszawa");

select NazwiskoPracownika, ImiePracownika,
if(PlacaPracownika>2000,'Zarabia dobrze','Zarabia źle') as "Płaca"
from pracownicy;

select NazwiskoPracownika, ImiePracownika,
if(PlacaPracownika>2000,PlacaPracownika*1.2,PlacaPracownika)
as "Płaca po podwyżce"
from pracownicy;

select NazwaProducenta,
ifnull(TelefonProducenta, 'Numer nieznany') as Telefon
from producenci;

select NazwiskoKlienta, nullif(MiastoKlienta,'Katowice') as "Miasta Klientów"
from klienci;

update pracownicy
	set PlacaPracownika = if(PlacaPracownika < 2000,PlacaPracownika*1.2,PlacaPracownika);

select NazwiskoPracownika, ImiePracownika, DataZatrudnieniaPracownika,
case
	when DataZatrudnieniaPracownika <'2013-01-01' then 'Starszy asystent'
	when DataZatrudnieniaPracownika <'2014-01-01' then 'Asystent'
	else 'Kontraktowy'
end as "Status pracownika"
from pracownicy;

update pracownicy
set PlacaPracownika =
case
	when PlacaPracownika < 2000 then PlacaPracownika*1.3
	when PlacaPracownika > 2000 then PlacaPracownika*1.1
end;

select concat(klienci.ImieKlienta,' ',klienci.NazwiskoKlienta) as Klient,
sprzedaze.DataSprzedazy
from klienci inner join sprzedaze using (IDklienta);

select concat_ws('~',producenci.NazwaProducenta,rowery.NazwaRoweru) as Rowery
from producenci inner join rowery using (IDproducenta);

select upper(NazwiskoKlienta), lower(ImieKlienta)
from klienci;

select concat(left(ImiePracownika,1),left(NazwiskoPracownika,1))
as "Inicjały pracowników", ImiePracownika, NazwiskoPracownika
from pracownicy;

select ImieKlienta, NazwiskoKlienta
from klienci
where right(IDklienta,1)=1;

select replace(NazwaProducenta,'BMX','Romet')
as "nowe nazwy", MiastoProducenta, UlicaProducenta, NrDomuProducenta
from producenci;

select substring(NazwaWojewodztwa,1,3) as "Skróty nazw województw"
from wojewodztwa;

select concat(ImieKlienta, space(5), NazwiskoKlienta) as Klient
from klienci;

update user set password=password('haslo')
where user = 'root';

select NazwaRoweru
from rowery
where length(NazwaRoweru)<=5;

select NazwiskoKlienta, instr(NazwiskoKlienta,'ski') as Wynik
from klienci;

select NazwiskoKlienta, strcmp(NazwiskoKlienta,'Nowak') as Wynik
from klienci;

select NazwaRoweru, CenaJednostkowa as "Stara cena",
ceiling(CenaJednostkowa/3) as "Nowa cena"
from rowery;

select degrees(asin(0.5));

select *
from klienci
where IDklienta=truncate(rand()*10,0);

select curdate(), curtime();

select now() as "Dzisiejsza data",
date_add(curdate(),interval 4 month) as "Data wyliczona";

select rowery.NazwaRoweru,
concat(klienci.ImieKlienta," ",klienci.NazwiskoKlienta) as Kupujący,
sprzedaze.DataSprzedazy as "Data sprzedaży",
date_add(sprzedaze.DataSprzedazy,interval 12 month) as "Data końca gwarancji"
from klienci inner join sprzedaze using (IDklienta) inner join
szczegolysprzedazy using(IDsprzedazy) inner join rowery using(IDroweru);

select datediff('2020-05-05',now());

select DataSprzedazy as "Data sprzedaży",
curdate() as "Dzisiejsza data",
datediff(curdate(), DataSprzedazy) as "Do dziś upłyneło dni"
from sprzedaze;

select date_format(now(),'%W %e %M %Y');

select ascii(ImieKlienta) as "Imię", ascii(NazwiskoKlienta) as "Nazwisko"
from klienci;

select chr(IDklienta) as "Indentyfikator", NazwiskoKlienta
from klienci; /* tylko mariaDB 10.3.1+ */

select char(IDklienta+64) as "Indentyfikator", NazwiskoKlienta
from klienci;

select bin(IDklienta) as "ID binarny", NazwiskoKlienta
from klienci;

select cast(DataSprzedazy as date)
from sprzedaze;

select encode(UlicaKlienta,'1234')
from klienci;

create view vDaneKlienta as
	select klienci.IDklienta, Klienci.ImieKlienta, klienci.NazwiskoKLienta,
	wojewodztwa.NazwaWojewodztwa, klienci.MiastoKlienta
	from klienci inner join wojewodztwa using(IDwojewodztwa);

select *
from vDaneKlienta
limit 4;

create view vliczbaklientówwgmiast as
	select MiastoKlienta, count(IDklienta)
	from vdaneklienta
	group by MiastoKlienta;

select *
from vliczbaklientówwgmiast;

drop view if exists vliczbaklientówwgmiast;

create database if not exists szkola
character set utf8 collate utf8_general_ci /*lub utf8_unicode_ci lub utf8_polish_ci*/;

drop database if exists szkola;

create table wojewodztwa(
	IDwojewodztwa integer(2) not null auto_increment,
	NazwaWojewodztwa varchar(30) not null,
	PRIMARY KEY(IDwojewodztwa)
)
engine=InnoDB charset utf8 collate utf8_polish_ci;

create table klienci(
	IDklienta integer(6) not null auto_increment,
	ImieKlienta varchar(30) not null,
	NazwiskoKlienta varchar(30) not null,
	IDwojewodztwa int(2),
	KodPocztowyKlienta varchar(6),
	MiastoKlienta varchar(30) not null,
	UlicaKlienta varchar(30) not null,
	NrDomuKlienta varchar(6) not null,
	primary key(IDklienta),
	foreign key(IDwojewodztwa) references wojewodztwa(IDwojewodztwa)
)
engine=InnoDB charset utf8 collate utf8_polish_ci;

create table szczegolysprzedazy(
	IDsprzedazy integer(11) not null,
	IDroweru integer(11) not null,
	Ilosc integer(11) not null,
	CenaJednostkowa decimal(19,4) not null,
	primary key (IDsprzedazy,IDroweru),
	constraint klucz_O1 foreign key(IDsprzedazy)
	references sprzedaze(IDsprzedazy) on delete cascade on update no action,
	constraint klucz_O2 foreign key(IDroweru)
	references rowery(IDroweru)
)
engine=InnoDB charset utf8 collate utf8_polish_ci;

create table przedstawiciele (
	IDprzedstawiciela integer(2) not null auto_increment,
	NazwiskoPrzedstawiciela varchar(50) not null,
	ImiePrzedstawiciela varchar(50) not null,
	WyksztalceniePrzedstawiciela varchar(10) default 'wyższe',
	primary key(IDprzedstawiciela)
)
engine=InnoDB charset utf8 collate utf8_polish_ci;

create table przedstawiciele (
	IDprzedstawiciela integer(2) not null auto_increment,
	NazwiskoPrzedstawiciela varchar(50) not null,
	ImiePrzedstawiciela varchar(50) not null,
	PlecPrzedstawiciela enum ('M','K'),
	PrawoJazdyPrzedstawiciela set ('A','B','C','D') default 'B',
	primary key(IDprzedstawiciela)
)
engine=InnoDB charset utf8 collate utf8_polish_ci;

create table producenciTelefony
	as select IDproducenta, NazwaProducenta, TelefonProducenta
from producenci;

create table pracownicyPlace
	as select IDpracownika, ImiePracownika, NazwiskoPracownika, PlacaPracownika
from pracownicy;

create table roweryPracownikow
	as select producenci.NazwaProducenta, rowery.NazwaRoweru, rowery.CenaJednostkowa
from producenci inner join rowery on producenci.IDproducenta = rowery.IDproducenta;

create index nazwisko on klienci(NazwiskoKlienta);

create unique index wojewodztwo on wojewodztwa(NazwaWojewodztwa);

create index daneKlienta on klienci(NazwiskoKlienta, MiastoKlienta);

show index from klienci;

drop index daneKlienta on klienci;

alter table klienci add AdresEmail varchar(30) after NazwiskoKlienta;

alter table rowery add index(NazwaRoweru);

alter table wojewodztwa add unique(NazwaWojewodztwa);

alter table rowery add index rowerInx(NazwaRoweru);

alter table klienci change AdresEmail EmailKlienta varchar(30);

alter table klienci modify EmailKlienta varchar(40);

alter table pracownicy change PlacaPracownika PensjaPracownika decimal(6,2);

alter table rowery add primary key (IDroweru);

alter table rowery change IDroweru IDroweru int(3) not null auto_increment;

alter table rowery change IDroweru IDroweru int(3) not null;

alter table rowery drop primary key;

alter table klienci drop EmailKlienta;

alter table rowery drop index produkt_inx;

alter table rowery disable keys; --lub enable keys

alter table szczegolysprzedazy alter Ilosc set default 1;

alter table szczegolysprzedazy alter Ilosc drop default;

alter table rowery rename /*to lub as*/ produkty;

truncate table sprzedaze;

create procedure nazwaProcedury (/*IN argument1 TYP*/)
	begin
		--kod procedury
	end

delimiter //
create procedure klienci()
	begin
		select * from klienci;
	end
//
delimiter ;

delimiter //
create procedure klienciMiasto (in miasto varchar(50))
	begin
		select * from klienci where MiastoKlienta=miasto;
	end
//
delimiter ;

delimiter //
create procedure duzeNazwisko (in nazwisko varchar(50))
	begin
		select upper(NazwiskoKlienta) from klienci where NazwiskoKlienta=nazwisko;
	end
//
delimiter ;

delimiter //
create procedure podniesienieCeny (in procent int)
	begin
		declare wspolczynnik decimal(2,2);
		set wspolczynnik = procent / 100;
		select NazwaRoweru, CenaJednostkowa as "Stara Cena",
		round(CenaJednostkowa + CenaJednostkowa * wspolczynnik,2)
		as "Nowa Cena" from rowery;
	end
//
delimiter ;

call podniesienieCeny(10);

call klienciMiasto('Katowice');

delimiter //
create procedure dodajKlienta(in Imie varchar(50), in Nazwisko varchar(50),
in IDwojewodztwa int(2),in KodPocztowy varchar(6),in Miasto varchar(50),
in Ulica varchar(50),in NrDomu int(10))
	begin
		insert into klienci(ImieKlienta, NazwiskoKlienta, IDwojewodztwa,
		KodPocztowyKlienta, MiastoKlienta, UlicaKlienta, NrDomuKlienta) values
		(Imie, Nazwisko, IDwojewodztwa, KodPocztowy, Miasto, Ulica, NrDomu);
	end
//
delimiter ;

call dodajKlienta('Jane','Doe','12','45-123','Podlesie','Krakowska','32');

delimiter //
create procedure liczbaKlientow(out wynik int(5))
	begin
	select count(IDklienta) into wynik from klienci;
	end
//
delimiter ;

call liczbaKlientow(@wynik);
select @wynik as 'Liczba klientów';

delimiter //
create procedure najtanszyRower(out nazwa varchar(20))
	begin
		select NazwaRoweru into nazwa from rowery where CenaJednostkowa=
		(select min(CenaJednostkowa) from rowery);
	end
//
delimiter ;

call najtanszyRower(@nazwa);
select @nazwa as 'Nazwa najtańszego roweru';


delimiter //
create procedure tworzTabele()
	begin
		create table producenciTelefony
			as select IDproducenta, NazwaProducenta, TelefonProducenta from producenci;
	end
//
delimiter ;

drop procedure /*if exists*/ duzeNazwisko;

delimiter //
create function formatCeny(pole char(10)) returns char(15) reads sql data
	begin
		return concat(cast(pole as char(10)), 'zł');
	end
//
delimiter ;

delimiter //
create function koniecGwarancji (data date, liczbaMiesiecy int(2))
	returns date reads sql data
	begin
	return date_add(data, interval liczbaMiesiecy month);
	end
	//
delimiter ;

select NazwaRoweru, formatCeny(CenaJednostkowa) as "Cena Jednostkowa"
from rowery;

select rowery.NazwaRoweru, sprzedaze.DataSprzedazy,
koniecGwarancji(sprzedaze.DataSprzedazy, 24)
from sprzedaze inner join szczegolysprzedazy using (IDsprzedazy)
inner join rowery using(IDroweru);

delimiter //
create function wartoscSprzedazy(ilosc int(3), cena decimal(6,2))
	returns char(15) reads sql data
	begin
	declare wynik decimal(10,2);
	set wynik = ilosc * cena;
	return concat(wynik, 'zł');
	end
	//
delimiter ;

select rowery.NazwaRoweru, szczegolysprzedazy.Ilosc,
szczegolysprzedazy.CenaJednostkowa,
wartoscSprzedazy(szczegolysprzedazy.ilosc,szczegolysprzedazy.CenaJednostkowa)
as 'Wartość sprzedaży'
from rowery inner join szczegolysprzedazy using(IDroweru);

set @zmienna = wartoscSprzedazy(2,360);
select @zmienna;

set @nazwisko = (select NazwiskoKlienta from klienci where MiastoKlienta='Tychy');
select @nazwisko;

delimiter //
create procedure licznikKlientow (in miasto varchar(30))
begin
	declare licznik int(3);
	set licznik = (select count(IDklienta) from klienci where MiastoKlienta = miasto);
	if licznik = 0 then
		select 'Nie ma klientów z tego miasta';
	else
		select licznik;
	end if;
end
//
delimiter ;

delimiter //
create procedure licznikKlientowCASE (in miasto varchar(30))
begin
	declare licznik int(3);
	set licznik = (select count(IDklienta) from klienci where MiastoKlienta = miasto);
	case
		when licznik = 0 then
		select "Nie ma klientów z tego miasta";
	else
		select licznik;
	end case;
end
//
delimiter ;

delimiter //
create procedure pokazNazwiska()
begin
	declare i int(2);
	set i=1;
	while i <=3 do
		select NazwiskoKlienta from klienci where IDklienta = i;
		set i = i+1;
	end while;
end
//
delimiter ;

delimiter //
create procedure pokazNazwiskaREPEAT()
begin
declare i int(2);
set i=1;
repeat
	select NazwiskoKlienta from klienci where IDklienta = i;
	set i = i+1;
until i > 4
end repeat;
end
//
delimiter ;

delimiter //
create function ilerazykupil(indentyfikator int(11))
	returns int(11) reads sql data
	begin
	return (select count(*) from klienci inner join sprzedaze using(IDklienta)
where sprzedaze.IDklienta = indentyfikator);
end
//
delimiter ;

select NazwiskoKlienta, ilerazykupil(IDklienta)
from klienci;

delimiter //
create trigger zliczajRowery after insert on rowery
	for each row begin
		update liczbaRowerow set ileRowerow = (select count(*) from rowery);
end
//
delimiter ;

delimiter //
create trigger aktualizujRowery after delete on rowery
for each row begin
	update liczbaRowerow set ileRowerow = (select count(*) from rowery);
end
//
delimiter ;

delimiter //
create trigger usunRoweryWgKategorii after delete on kategorierowerow
for each row begin
delete from rowery where IDkategorii = old.IDkategorii;
end
//
delimiter ;

delimiter //
create trigger dataDodaniaRekordu
before insert on rowery
for each row begin
	set new.DataDodania = now();
end
//
delimiter ;

insert into rowery (NazwaRoweru, OpisRoweru, IDkategorii, IDproducenta, CenaJednostkowa)
	values ('Tornado','Rower wyścigowy 30 biegowy',2,1,1270);

create temporary table pracownicyLiderzy(
	IDlidera integer(2) not null,
	ImiePracownika varchar(30) not null,
	NazwiskoPracownika varchar(30) not null,
	primary key(IDlidera)
);

insert into pracownicyLiderzy values (1,'Alicja','Nowak');

select * from pracownicyLiderzy;

create temporary table drogieRowery as
	select NazwaRoweru, CenaJednostkowa
	from rowery
	where CenaJednostkowa > 1500;

insert into rowery values
	(11,'Sigma','Rower niemiecki ze stali chromowej',3,2,700,NULL);

insert into rowery (NazwaRoweru, OpisRoweru,IDkategorii,IDproducenta,CenaJednostkowa)
	values ('Sigma','Rower niemiecki ze stali chromowej',3,2,700);

insert into rowery (NazwaRoweru, OpisRoweru,IDkategorii,IDproducenta,CenaJednostkowa)
	values ('Delta','Rower niemiecki ze stali chromowej',2,2,800),
	('Theta','Rower niemiecki ze stali chromowej',4,2,900);

insert into rowery set
NazwaRoweru = 'Berta',
OpisRoweru = 'Rower niemiecki ze stali chromowej',
IDkategorii = 4,
IDproducenta = 2,
CenaJednostkowa = 450;

insert into producencitelefony values
(1,'Wigry',222-55-88),
(2,'BMW',666-44-87),
(3,'CrossAction',579-15-76),
(4,'BMX',NULL),
(5,'Geant',252-76-66);

replace into rowery values
(9,'Pi','Rower niemiecki ze stali chromowej',3,2,700,NULL);

load data local infile 'C:\Users\\***\\Downloads\\producenciTelefony.txt' into table
producencitelefony;

load data local infile 'C:\\Users\\***\\Downloads\\producenciTelefony.txt' into table
producencitelefony fields terminated by '\,' lines terminated by '\r\n';

update rowery
set OpisRoweru = 'Rower polski ze stali molibdenowej', CenaJednostkowa = 1200
where NazwaRoweru = 'Junak';

delete from rowery
where NazwaRoweru = 'Sigma';

select nazwisko,PESEL
from uczen;

select imie, nazwisko
from uczen
where id=1;

select ocena.ocena
from ocena
where uczen_id = 1 and przedmiot_id = 4
order by ocena.ocena desc
limit 1;

select count(ocena.ocena)
from ocena
where uczen_id = 1 and przedmiot_id = 4;

select ocena.ocena
from ocena
where uczen_id = 2 and przedmiot_id = 1;

select avg(ocena.ocena)
from ocena
where uczen_id = 2 and przedmiot_id = 1;

/*creating users and granting root access*/

CREATE USER 'nazwauzytkownika'@'host' INDENTIFIED BY 'haslo'; /*must be all caps*/

show grants for 'nazwauzytkownika'@'host';

grant all on *.* to 'nazwauzytkownika'@'host';

CREATE USER 'nazwauzytkownika'@'%' INDENTIFIED BY 'haslo'; /*connection from any host*/

/*setting up root password*/
--command line
mysqladmin --user = root password haslo;
--sql editor
set password = PASSWORD(nowehaslo);

/*changing root password*/
mysqladmin --user = root password starehaslo password nowehaslo;

/* setting privledges */
grant select
on database.table to 'user'@'host';

grant select(ImieKlienta, NazwiskoKlienta, MiastoKlienta)
on hurtownia4ti1.klienci to 'pracownik4ti1'@'%';

grant select, update on hurtownia4ti1.rowery to 'pracownik4ti1'@'%';

grant all on kurtownia4ti1.* to 'kierownik4ti1'@'%';

--checking privileges
show grants for 'pracownik4ti1'@'%';

--making user able to grant privileges

grant select, insert
on hurtownia4ti1.pracownicy to 'pracownik4ti1'@'%'
with grant option;

--revoking privileges / grant options / all privileges
revoke priveleges[columns]
on obiect from 'user'@'host';

revoke grant option
on obiect from 'user'@'host';

revoke all privileges, grant option
from 'user'@'host';

flush privileges; --alvays after revoking

--making roles
create role if not exists 'rolename';

--showing roles
select * from mysql.roles_mapping;

--granting privileges to role
grant privilege on obiect to rolename;

--adding users to roles
grant rolename to 'user'@'host';

--making user use role privileges / activating user role
set role rolename;

--revoking privileges from role

revoke privilege[columns],[GRANT OPTIONS]
from rolename;

--removing user from role

revoke rolename from 'user'@'host';

--droping role from server

drop role rolename;

--mysqladmin usage
--creating database
mysqladmin -u root -p create BaseName

--removing database
mysqladmin -u root -p drop BaseName

--refreshing privileges, reloading grants
mysqladmin -u root -p refresh
mysqladmin -u root -p reload

--checking server version
mysqladmin -u root -p version

--checking current server status
mysqladmin -u root -p status

--showing all active processes
mysqladmin -u root -p processlist

--killing server processes
mysqladmin -u root -p kill id1, id2 ...

--checking if server is active
mysqladmin -u root ping -p

--safe shutdown
mysqladmin -u root -p shutdown

--connecting to remote server
mysqladmin -h hostadress -u root -p

--changing password of user that uses mysqladmin
mysqladmin -u root password newPassword -p

--flushing:
--temporary memory of hosts
mysqladmin -u root -p flush-hosts
--temporary memory of tables
mysqladmin -u root -p flush-tables
--temporary memory of threads/processes
mysqladmin -u root -p flush-threads

--help
mysqladmin --help

--mysqlshow usage
--showing available databases
mysqlshow -u root -p

--showing available tables in database
mysqlshow -u root -p databaseName

--showing table project in chosen database
mysqlshow -u root -p databaseName tableName

--showing column project in chosen table
mysqlshow -u root -p databaseName tableName columnName

--administrating from sql
--checking active processes
show processlist;

--killing active processes
kill processID;

--server status data
show status;

--checking server version
show variables like "%version%"

--checking server variables
show variables;

--checking database tables
--analyze
ANALYZE TABLE tableName;
--check works too
CHECK TABLE tableName;

--repairing table
REPAIR TABLE tableName;

--for InnoDB tables we can use optimize command
OPTIMIZE TABLE tableName;

--we can optimize all databases through mysqlcheck through command line
mysqlcheck -u root -p databaseName
--forcing automatic optimalization
mysqlcheck -u root -p databaseName --auto-repair

--locking tables
LOCK TABLES tableName [READ/WRITE];
--unlocking tables
UNLOCK TABLES;

--performing full database dump/backup
mysqldump -u userName -p databaseName > file.sql

--dumping multiple databases to one file
mysqldump -u userName -p --databases databaseName1 databaseNameN > file.sql

--dumping all databases
mysqldump -u userName -p --all-databases > file.sql

--dumping database with CREATE database
mysqldump -u userName -p --add-drop-database -databases databaseName > file.sql

--recovering database from dump
mysql -u userName -p databaseName < file.sql

--creating dump of chosen table
mysqldump -u userName -p databaseName tableName > file.sql

--restoring table from dump
mysql -u userName -p databaseName < tablefile.sql

--creating database structure dump
mysqldump -u userName - p databaseName --no-data > file.sql

--exporting data from sql side
SELECT field1, field2... fieldN
FROM tableName
INTO OUTFILE 'fileLocation'
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
[WHERE condition];

--checking if server has active binary log
show variables like 'log_bin';

--checking binary logs through sql
SHOW binlog events in 'mysql-bin.000001';

--checking binary logs through command line
mysqlbinlog mysql-bin.000001

mysqlbinlog mysql-bin.000001 --short-form

--recovering database content basing on binary log

mysqlbinlog logFile | mysql -u userName -p

--excercise

SELECT filmy.Tytul
FROM filmy
WHERE (filmy.Gatunek = "SF");

select filmy.*, rezyserzy.Nazwisko
from filmy, rezyserzy
where filmy.RezyserID = rezyserzy.IDRezyser

SELECT filmy.Tytul
from filmy,recenzje
where filmy.RecenzjaID = recenzje.IDRecenzja
and recenzje.Ocena >= '4';

INSERT INTO `rezyserzy` (`IDRezyser`, `Imie`, `Nazwisko`) VALUES ('4', 'Andrzej', 'Wajda');

SELECT Model, Typ
FROM artykuly
ORDER BY Cena ASC;

--transactions
╔══════════════════════════════════════════════════╦═════════════════════════════════════════╗
║ SET AUTOCOMMIT = 0;                              ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ USE databaseName;                                ║ use databaseName;                       ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;          ║ select * from table where IDcolumn = 2; ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ update table set data = 1000 where IDcolumn = 2; ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;          ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ commit;                                          ║ select * from table where IDcolumn = 2; ║
╚══════════════════════════════════════════════════╩═════════════════════════════════════════╝
╔══════════════════════════════════════════════════╦═════════════════════════════════════════╗
║ SET AUTOCOMMIT = 0;                              ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ USE databaseName;                                ║ use databaseName;                       ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;          ║ select * from table where IDcolumn = 2; ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ update table set data = 1000 where IDcolumn = 2; ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;          ║                                         ║
╠══════════════════════════════════════════════════╬═════════════════════════════════════════╣
║ rollback;                                        ║ select * from table where IDcolumn = 2; ║
╚══════════════════════════════════════════════════╩═════════════════════════════════════════╝

--setting up sesion transaction isolation levels
set session transaction isolation level read committed;
set session transaction isolation level read uncommitted;

╔═════════════════════════════════════════════════════╦══════════════════════════════════════════════════════════╗
║ SET AUTOCOMMIT = 0;                                 ║                                                          ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ USE databaseName;                                   ║ set session transaction isolation level read uncommited; ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ START TRANSACTION;                                  ║ USE databaseName;                                        ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ select * from table;                                ║                                                          ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ update table set datavalue = 1150 where IDcollumn=2 ║                                                          ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;             ║ select * from table where IDcolumn = 2;                  ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ rollback;                                           ║                                                          ║
╠═════════════════════════════════════════════════════╬══════════════════════════════════════════════════════════╣
║ select * from table where IDcolumn = 2;             ║ select * from table where IDcolumn = 2;                  ║
╚═════════════════════════════════════════════════════╩══════════════════════════════════════════════════════════╝

set session transaction isolation level repeatable read;
set session transaction isolation level serializable;

╔═════════════════════════════════════════════════════╦═══════════════════════════════════════════════════════╗
║                                                     ║ set session transaction isolation level serializable; ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║ USE databaseName;                                   ║ USE databaseName;                                     ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║                                                     ║ START TRANSACTION;                                    ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║ START TRANSACTION;                                  ║ update table set datavalue = 3000 where IDcollumn=5;  ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║ select * from table;                                ║                                                       ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║ update table set datavalue = 700 where IDcollumn=2; ║ select * from table;                                  ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║ commit;                                             ║                                                       ║
╠═════════════════════════════════════════════════════╬═══════════════════════════════════════════════════════╣
║                                                     ║ commit;                                               ║
╚═════════════════════════════════════════════════════╩═══════════════════════════════════════════════════════╝

SAVEPOINT pointName;
ROLLBACK TO SAVEPOINT pointName;

SET AUTOCOMMIT = 0;
START TRANSACTION;
DROP TABLE IF EXISTS sprzedaze;
SAVEPOINT punkt1;
UPDATE rowery SET CenaJednostkowa = 700
WHERE IDroweru = 2;
SAVEPOINT punkt2;
ROLLBACK TO SAVEPOINT punkt1;