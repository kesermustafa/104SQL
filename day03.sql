 CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);
  
    select * from ogrenciler6;
  	
  
  --ismi Mustafa Bak ve Nesibe Yilmaz olan kayitlaru silelim
  
  DELETE FROM ogrenciler6 where isim='Mustafa Bak' or isim='Nesibe Yilmaz';
  
  -- Veli ismi Hasan olan datayi silelim
  DELETE FROM ogrenciler6 where veli_isim='Hasan';
  
  
  /*
  TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
	Ancak, seçmeli silme yapamaz.
	TRUNCATE TABLE where ...... OLMAZ
	TRUNCATE TABLE ogrenciler;
	-- tablodaki verileri siler
  */
  
  TRUNCATE TABLE ogrenciler6;
  
    select * from ogrenciler6;
	
	
	DROP TABLE if exists notlar -- Eger tablo varsa tabloyu siler
  
   -- ON DELETE CASCADE --
   /*
- Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
	silme özelliğini aktif hale getirebiliriz.
	Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
	
	-- on delete cascade sayesinde parent taki silinen bir kayıt ile ilişkili olan tüm 
	child kayıtlarını silebiliriz
	-- cascade yoksa önce child temizlenir sonra parent

  */
  
  
  CREATE TABLE talebeler (
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
  
  
  select * from talebeler;
  select * from notlar;
  
  --NOTLAR tablosundan ID si 123 olan datayi silelim
  
DELETE from notlar where talebe_id='123'; -- child tablo
	-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri 
		--silinir. parent taki veri silinmez.
		
DELETE from talebeler where id='126';  -- parent tablo
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.

DELETE FROM talebeler; -- Parent tablo ile birlikte child tablo 
						--daki verileride siler
												
DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent 
								--olan talebeler tablosunu siler

  
  
  CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);



  /*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
	silme özelliği ile parent tablo dan da veri silebiliriz. 
	Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
	data child tablo dan da silinir
*/
  
  
  
 		--- IN CONDITION
/*
IN Condition birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
(Condition) tek komutla yazabilme imkani verir
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir.*/

  CREATE TABLE musteriler(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);


INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

  select * from musteriler;

--musteriler tablosundan urun ismi Orange, apple ve Apricot olanlari listele
--1
SELECT * FROM musteriler WHERE urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim ='Apricot';

--2
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apricot', 'Apple');


SELECT * FROM musteriler WHERE urun_id =20 AND urun_isim ='Apple';
  
  -- NOT IN degimizde yazilanini disindaki verileri listeler.....
  SELECT * FROM musteriler WHERE urun_isim not IN ('Orange','Apricot', 'Apple');
  
  
  /*   				BETWEEN CONDITION
  BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek 
  komutla yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir (INCLUSIVE)
  */
  
  --- eski yontem 
  SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;
  
  -- BETWEEN CONDITION Iile listeleme 
  SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40 ;

  -- NOT BETWEEN 20 - 40 arasinda olmayanlari listeler...
  SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40 ;
  
  
  -- 		SUBQUERIES
--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur

CREATE TABLE calisanlar2 (
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

CREATE TABLE markalar (
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
  
  
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(123456711, 'Mustafa', 'Ankara', null,  'Vakko');
  
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);
  
  select * from calisanlar2;
  select * from markalar;
  
  -- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada c
  --alisanlarin isimlerini ve maaşlarini listeleyin.
  
  select maas, isim, isyeri From calisanlar2
  where isyeri IN (select marka_isim from markalar where calisan_sayisi>15000);
  
  -- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
  
  select isim, maas, sehir from calisanlar2 
  		where isyeri IN (select marka_isim from markalar where marka_id>101 );
  
  
  -- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
Select marka_id,calisan_sayisi from markalar
Where marka_isim in (Select isyeri from calisanlar2 where sehir='Ankara')
  
  select isim, isyeri, maas from calisanlar2 where isyeri in (select marka_isim from markalar where calisan_sayisi>10000 );
  
  -- calisan sayiyi 10000 den fazla olan sirketlerde maasi 1000 uzeri olan personelin isim isyeri maas bilgisi listele
  select isim, isyeri, maas from calisanlar2 where maas>1000 and isyeri in (select marka_isim from markalar where calisan_sayisi>10000 );
  
  
  
  
  
  -- 			AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı

select max(maas) from calisanlar
select sum(maas) from calisanlar
select avg(maas) from calisanlar
select round(avg(maas),2) from calisanlar  19000/7 = 2714,29
select min(maas) from calisanlar
select count(maas) from calisanlar
*/  

  -- calisanlar tablosundan maximum maasi listele
  select max(maas) from calisanlar2;  
  select max(maas) AS maximum_maas from calisanlar2;
                     
  /*Eger bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdiktan sonra
vermek istedigimiz ismi yazariz */
  
  -- calisanlar tablosundan minimum maasi listele
  select min(maas) from calisanlar2; 
  select min(maas) AS minimum_maas from calisanlar2;
  
  -- calisanlar tablosundaki maaslarin toplamini listele
  select sum(maas) from calisanlar2;
    
  -- calisanlar tablosundaki maaslarin toplaminin ortalamasini listele
  select avg(maas) from calisanlar2;
  
  select round (avg(maas),2 )from calisanlar2;  // ondalikli sayida virgulden sonra 2 rakam icin
    
	-- calisanlar tablosundaki maas alanlarin sayisi listele
  select count(maas) from calisanlar2  -- 7   - maas alanlarin sayisini verdi
  select count(*) from calisanlar2  -- 8   null satirinida saydi 8 verdi
  
  /*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

 select * from calisanlar2;
  select * from markalar;
  
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir 
	--SORGU yaziniz.
  
  SELECT marka_id, marka_isim, 
(SELECT count(sehir) FROM calisanlar2 where marka_isim=isyeri) as sehir_sayisi
FROM markalar;
  
  
 -- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim, calisan_sayisi, 
(SELECT sum(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as toplam_maas 
FROM markalar;
  
  -- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  -- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim, calisan_sayisi, 
(SELECT max(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as max_maas,
(SELECT min(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as min_maas
FROM markalar;
  
  --VIEW Kullanimi
  
  CREATE VIEW maxminmaas
  AS 
	SELECT marka_isim, calisan_sayisi, 
	(SELECT max(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as max_maas,
	(SELECT min(maas) FROM calisanlar2 WHERE marka_isim = isyeri) as min_maas
	FROM markalar;
  
  select * from maxminmaas;
  
  
  
  	/*					EXISTS CONDITION
	EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.*/
  
  
  CREATE TABLE mart (
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan (
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

  select * from mart;
  select * from nisan;
  
  
  /*--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin URUN_ID’lerini listeleyen 
  ve aynı zamanda bu ürünleri MART ayında alan MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.*/
  
  select urun_id, musteri_isim from mart where exists
  (select urun_id from nisan where mart.urun_id = nisan.urun_id);
  
  
 /* --Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
		NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.*/
		
	select urun_id, musteri_isim from nisan where exists
  (select urun_id from mart where mart.urun_id = nisan.urun_id);

  
 /* --Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.*/

	select urun_isim, musteri_isim from mart where not exists
	(select urun_isim from nisan where mart.urun_id = nisan.urun_id);

  
 --		 Tablodaki Data Nasil Update Edilir (UPDATE SET)?
 -- DML --> UPDATE
 
 
 CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

DROP TABLE if exists urunler -- Eger tablo varsa tabloyu siler

select * from tedarikciler;
select * from urunler;

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikciler SET firma_ismi = 'Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler SET firma_ismi = 'casper' WHERE vergi_no=101;
UPDATE tedarikciler SET irtibat_ismi = 'Ali Veli' WHERE vergi_no=101;

UPDATE tedarikciler SET firma_ismi = 'casper', irtibat_ismi='Ali Veli' WHERE vergi_no=101;


-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler SET urun_isim = 'Telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler set urun_id = urun_id+1 where urun_id>1004;


-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri
-- ile toplayarak güncelleyiniz
update urunler set urun_id = urun_id + ted_vergino;

/* urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
-- Bu update işlemini yapmadan önce, tabloları eski haline getirmeliyiz.*/

UPDATE urunler 
SET urun_isim = (select firma_ismi from tedarikciler WHERE irtibat_ismi = 'Adam Eve')
WHERE musteri_isim='Ali Bak';


--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in 
--irtibat_isim'i ile degistirin.

UPDATE urunler
SET musteri_isim = (select irtibat_ismi from tedarikciler WHERE firma_ismi = 'Apple')
WHERE urun_isim = 'Laptop'





 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
  
  
  
  
  
  
  