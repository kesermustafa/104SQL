--HAVING CLAUSE

/*  WHERE                                           HAVING
              FİLTRELEME YAPAR
ON FİLRE                                        SON FILTRE
SATIRLARI FILTRELER                             GRUPLRI FILTRELER
AGGREGATE FONK İLE KULLANILMAZ-                 KULLANILIR
GROUP BY İF.DEN ONCE KULLANILIR                 GROUP BY IF.SONRA KULLANILIR  
SELECT, UPDATE, DELETE +                        SADECE SELECT ILE KULLANILIR
                                                1- GROUP BY  2- AGGREGATE FONK
												
												*/
												
CREATE table KISILER(
id int,
isim varchar(30),
soyisim varchar(30),
yas int,
sehir varchar(20),
cinsiyet char(1),
ulke varchar(30),
maas int)

insert into kisiler values(1, 'Ahmet', 'Yilmaz', 20, 'Ankara', 'E', 'Turkiye',  2000);
insert into kisiler values(2, 'Mehmet', 'Efe', 22, 'Bolu', 'E', 'Turkiye',  2000);
insert into kisiler values(3, 'Ayse', 'Can', 23, 'Istanbul', 'K', 'Turkiye',  3500);
insert into kisiler values(4, 'Fatma', 'Ak', 35, 'Ankara', 'K', 'Turkiye',  3200);
insert into kisiler values(5, 'John', 'Smith', 45, 'New York', 'E', 'USA',  3500);
insert into kisiler values(6, 'Ellen', 'Smith', 40, 'New York', 'K', 'USA',  3500);
insert into kisiler values(7, 'Hans', 'Muller', 30, 'Berlin', 'E', 'Almanya',  4000);
insert into kisiler values(8, 'Frank', 'Cesanne', 35, 'Paris', 'E', 'Fransa',  3700);
insert into kisiler values(9, 'Abbas', 'Demir', 26, 'Adana', 'E', 'Turkiye',  2000);
insert into kisiler values(10, 'Hatice', 'Topcu', 26, 'Hatay', 'K', 'Turkiye',  2200);
insert into kisiler values(11, 'Gulsum', 'Demir', 35, 'Adana', 'K', 'Turkiye',  2000);


SELECT ulke, AVG(maas) FROM kisiler GROUP BY ulke

--1.YASI 30dan buyuk olan kısılerın ulkelere gore maas ort
SELECT ulke, AVG(maas) FROM kisiler WHERE yas > 30 GROUP BY ulke

--2.YAS ort 30dan buyuk olan ulkeler
SELECT ulke FROM kisiler GROUP BY ulke HAVING AVG(yas) > 30

--3.turkiyede olanların sehirlere gore toplam yas
select ulke, sehir, sum(yas) from kisiler group by ulke, sehir having ulke='Turkiye'
select ulke, sehir, sum(yas) from kisiler where ulke='Turkiye' group by ulke, sehir

--4.sehırlere gore yas ort 30dan cok olan sehırler
select sehir, avg(yas) from kisiler group by sehir having avg(yas)>30

--5.toplam maası 5000den fazla olan sehırler
select sehir, sum(maaas) from kisiler group by sehir having sum(maas)>10000

--6.sehir ve cinsiyete gore gruplandırıp yas ort 30dan cok olan gruplar
select sehir, cinsiyet from kisiler group by sehir, cinsiyet having avg(yas)>30

-7.cinsiyet ve ulkelere gore maas ort 3500den cok olanlar
select avg(maas), ulke, cinsiyet from kisiler group by ulke, cinsiyet having avg(maas)>3500

--8.yas ort 30dan buyuk ulkelerın ulke isimlerini WWW yap
UPDATE kisiler SET ulke='WWW'
where ulke in (select ulke from kisiler group by ulke HAVING avg(yas)<30 )

select * from kisiler
--tabloyu esk haline donduruyoruz

--9.çalışan sayısı 1’den fazla olan şehirleri ve çalışan sayılarını getiren sorguyu yazalım

select sehir, count (*) as calısan from kisiler group by sehir having count(*)>1;
--burada count icine herhangı bır sutunu koyabılırız

--10.Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.

select ulke, avg(maas) from kisiler where cinsiyet='E'
group by ulke having avg(maas)>3000

--11.Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu:
SELECT ulke, AVG(maaş) FROM kisiler WHERE Cinsiyet='E' GROUP BY ulke HAVING COUNT(*) > 1




/*JOINS
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Except sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir


join islemleri, farklı Tablolari birlestirmek icin kullanilir. Diger bir ifade ile farkli tablolardaki
secilen sutunlar ile yeni bir tablo olusturmak icin kullanilabilir.
    

5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk tabloda olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur.*/

create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);




create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select * from qa_dersler;

select * from developer_dersler;

--SORU: join kullanarak ortak dersleri sorgulayınız 

select A.ders_id, A.ders_ismi, A.ders_saati
from qa_dersler A
inner join developer_dersler B
on A.ders_id=B.ders_id

--intersect  ->2 tane sorgu
select ders_id, ders_ismi, ders_saati from qa_dersler
intersect
select ders_id, ders_ismi, ders_saati from developer_dersler


create table filmler
(film_id int,
film_ismi varchar(30),
kategori varchar(30)
);

insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');


create table aktorler
(id int,
aktor_ismi varchar(30),
film_id int
);

insert into aktorler values (101, 'Ata Demirer', 1);
insert into aktorler values (102, 'Necati Sasmaz', 2);
insert into aktorler values (103, 'Gupse Ozay', 3);
insert into aktorler values (104, 'Engin Gunaydin', 4);
insert into aktorler values (105, 'Cem Yilmaz', 5);
insert into aktorler values (107, 'Tarik Akan', 8);
insert into aktorler values (108, 'Turkan Soray', 9);



select * from filmler;
select * from aktorler;



-- SORU1: Tüm film_ismi'leri, kategori'lerini ve 
--filmlerde oynayan aktor_ismi'leri listeleyiniz.

--esas tablom filmler

select film_ismi, kategori, aktor_ismi
from filmler A
left join aktorler B
on A.film_id=B.film_id

select film_ismi, kategori, aktor_ismi
from aktorler B
right join filmler A
on A.film_id=B.film_id

-- SORU2: Tüm aktor_ismi'leri ve bu aktorlerin oynadıgı 
--film_ismi'lerini listeleyiniz.--esas tablo aktorler

select aktor_ismi, film_ismi
from aktorler A
left join filmler B
on A.film_id=B.film_id

select aktor_ismi, film_ismi
from filmler B
right join aktorler A
on A.film_id=B.film_id

-- SORU3: Tüm film_ismi'lerini ve tüm aktor_ismi'lerini listeleyiniz
-- Aktoru olmasa bile film, filmi olmasa bile aktor listelenmelidir,

--full join

select film_ismi, aktor_ismi
from filmler A
full join aktorler B
on A.film_id=B.film_id

--====================SELF JOIN========================

CREATE TABLE personel
(
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);


--Her personelin yanina yonetici 
--ismini yazdiran bir tablo olusturun

select personeller.isim as personel_isim, 
yoneticiler.isim as yonetici_isim
from personel as personeller
inner join personel as yoneticiler
on personeller.yonetici_id=yoneticiler.id

