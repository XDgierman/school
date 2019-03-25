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
