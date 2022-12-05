-- ALIASES


CREATE TABLE calisanlar3 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM calisanlar3;

-- eger  iki sutun bilgisini birlestirmek istersk concat sembolu || kullaniriz
select calisan_id as id, calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3;

--2,YOL 
select calisan_id as id, concat (calisan_isim, ' ', ' * ',' ', calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar3;


CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar;

-- isim sutunundan null olan degerleri listeleyelim,
select isim from insanlar where isim is null; 

-- isim sutunundan null olmayan degerleri listeleyelim,
select isim from insanlar where isim is not null; 

UPDATE insanlar SET isim = 'No name' WHERE isim is null;

select * from insanlar;

			-- ORDER BY komutu 
/* ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir 
ORDER BY komutu sadece SELECT komutu Ile kullanilir  

Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

-- DESC = Büyükten Küçüğe Doğru.
-- ASC= Küçükten Büyüğe Doğru.

CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali', 'Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli', 'Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1;

--Insanlar tablosundaki datalari adres’e gore siralayin
SELECT * FROM insanlar1 ORDER BY adres;
SELECT * FROM insanlar1 ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar1 where isim='Mine' order by ssn;

-- Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin 

SELECT * FROM insanlar1 WHERE soyisim = 'Bulut' ORDER BY 4;


--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar1 ORDER BY ssn DESC;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar1 ORDER BY isim ASC, soyisim DESC;

/*
Eger sutun uzunluguna gore siralamak istersek length komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz.
 */
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim FROM insanlar1 ORDER BY LENGTH (soyisim) desc;

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim || ' '|| soyisim as isim_soyisim FROM insanlar1 ORDER BY LENGTH (isim || soyisim);  --1
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim) --2
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)  --3
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))  --4



					--GROUP BY CLAUSE
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT 
-- komutuyla birlikte kullanılır

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav; 


-- 1) Isme gore alinan toplam urunleri bulun 
select isim, sum (urun_miktar) as alidigi_toplam_urun from manav group by isim; 

-- 2) Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge siralayiniz..
select isim, sum (urun_miktar) as alidigi_toplam_urun from manav 
group by isim order by alidigi_toplam_urun desc;

--3) Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi,  count(isim) from manav group by urun_adi;

select isim, count (urun_adi) from manav group by isim;

select 'Ayse',count (urun_adi) from manav group by urun_adi;

-- Ayse nin aldigi urunler ve toplami listeleyebilir miyiz.
select 'Ayse', urun_adi, count (urun_adi) from manav group by urun_adi;
















