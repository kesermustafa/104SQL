				--			DISTINCT
--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun;

-- Urun isimlerini tekrarsiz listele 
SELECT DISTINCT urun_isim FROM musteri_urun;

SELECT urun_isim FROM musteri_urun group by urun_isim; -- Group by ile cozumu 

-- Musteri isimlerini tekrarsiz listele
SELECT DISTINCT musteri_isim FROM musteri_urun;


-- Tabloda kac farkli meyve vardir ?
SELECT COUNT(DISTINCT urun_isim) AS urun_cesit_sayisi FROM musteri_urun;

SELECT count (urun_isim) FROM musteri_urun group by urun_isim;


		---  FETCH NEXT (SAYI) ROW ONLY- OFFSET
		
-- 1) Tabloyu urun_id ye gore siralayiniz
select * from musteri_urun order by urun_id;

-- 2) Sirali tablodan ilk 3 kaydi listeleyin
SELECT * FROM musteri_urun ORDER BY urun_id FETCH NEXT 3 ROW ONLY;

-- LIMIT ile cozum
SELECT * FROM musteri_urun ORDER BY urun_id limit 3; 


CREATE TABLE maas (
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);


select * from maas order by maas desc limit 1

-- maas tablosunda en yuksek ikinci maasi alani listele 
select * from maas order by maas desc offset 1 limit 1

-- offset satir atlamak istedigimizde kullaniriz...
SELECT * FROM maas ORDER BY maas DESC 
OFFSET 1 FETCH NEXT 1 ROW ONLY

-- Maas tablosundan en düşük dördüncü maası listeleyiniz
SELECT * FROM maas ORDER BY maas offset 3 LIMIT 2


CREATE TABLE personel3  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel3_pk PRIMARY KEY (id)
);
INSERT INTO personel3 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel3 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel3 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel3 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel3 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel3 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel3 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

/*
					ALTER TABLE STATEMENT
	ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns 
islemleri icin kullanilir.
	ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.*/
	
	select * from personel3
	
	
	-- 1) ADD default deger ile tabloya bir field ekleme
ALTER TABLE personel3
ADD ulke_isim varchar(20) DEFAULT 'Turkiye';

	-- 2) Tabloya birden fazla field ekleme
ALTER TABLE personel3
ADD cinsiyet varchar(20) , ADD yas int;

	-- 3) DROP tablodan sutun silme
ALTER TABLE personel3 
DROP COLUMN yas;

	--4) RENAME COLUMN sutun adi degistirme
ALTER TABLE personel3
RENAME COLUMN ulke_isim TO ulke_adi;

	--5) RENAME tablonun ismini degistirme
ALTER TABLE personel3 
RENAME TO isciler;


--6) TYPE/SET sutunlarin ozelliklerini degistirme

ALTER TABLE isciler
ALTER COLUMN ulke_adi TYPE varchar(30), 
ALTER COLUMN ulke_adi SET NOT NULL;

--Not: String data türünü numerik bir data türüne dönüştürmek istersek;
ALTER TABLE isciler
ALTER COLUMN fieldname
TYPE int USING(fieldname::int) --şeklinde yaparız.

/*
Eğer numerik data türüne sahip bir sütunun data türüne string bir data türü atamak istersek
TYPE varchar(30) USING(maas::varchar(30)) bu formatı kullanırız
*/
ALTER COLUMN maas
TYPE int USING(maas::varchar(30))


/*
			TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT
	Transaction veritabani sistemlerinde bir islem basladiginda baslar ve bitince sona erer. Bu
	islemler veritabani olusturma, veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.
 */
 
 /*
	-->	TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT)
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
*/

 CREATE TABLE ogrenciler7(
id serial,				-- Serial data turu otomatik olarak birden baslayarak sirali olarak sayi atamasi yapar
isim VARCHAR(50),		-- INSERT INTO ile tabloya veri eklerken serial data turunu kullandigim 
veli_isim VARCHAR(50),	-- veri degeri yerine DEFAULT yazariz
yazili_notu real 
);

BEGIN;
INSERT INTO ogrenciler7 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler7 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler7 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler7 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler7 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler7 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

select * from ogrenciler7


/*
	Transaction kullaniminda SERIAL data turu kullanimi tercih edilmez. Save pointten sonra ekledigimiz
	veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.
	
NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
	yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden
	sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
	kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu
	kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki
	verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka
	"COMMIT" komutu kullanılır.
 */
 
 
 

