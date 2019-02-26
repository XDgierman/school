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
