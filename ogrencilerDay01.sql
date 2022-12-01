 -- 
 CREATE TABLE ogrenciler1
 (
	ogrenci_no char(7),
	isim varchar(20), 
	soyisim varchar(25), 
	not_ortalamasi real,  -- ondalikli sayilar kullanilir doube gibi
	kayit_tarihi date
 );
 
 --VAROLAN Tablodan yeni bir tablo ousturma
 CREATE TABLE ogrenci_notlari
 as -- benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin 
 		-- -normal tablo oluştururken ki parantezler yerine AS kullanıp 
		--Select komutuyla almak istediğimiz verileri alırız 
		--SELECT isim,soyisim,not_ort FROM ogrenciler		
 select isim,soyisim,not_ortalamasi from ogrenciler;
 
 
 --DML - DATA MANIPULATION LANG --
 -- INSERT (DATABASE VERI EKLEME) --
 INSERT INTO ogrenciler VALUES ('1234567', 'Said', 'Ilhan', 85.5,now());
 INSERT INTO ogrenciler VALUES ('1234568', 'Said', 'Ilhan', 85.5,'2022-12-02');
 
 -- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK --
 INSERT INTO ogrenciler(isim, soyisim) VALUES ('Erol', 'Evren')
 
 
 -- DQL -- DATA QUERY LANG -- 
 --- SELECT 
 
 select * from ogrenciler;