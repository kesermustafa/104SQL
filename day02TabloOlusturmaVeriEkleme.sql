CREATE TABLE ogrenciler2
 (
	ogrenci_no char(7),
	isim varchar(20), 
	soyisim varchar(25), 
	not_ortalamasi real,  -- ondalikli sayilar kullanilir doube gibi
	kayit_tarihi date
 );
 
	select * from ogrenciler2;
 
 
 CREATE TABLE NOTLAR
 AS
 SELECT isim, not_ortalamasi from ogrenciler2;
 
 select * from notlar;
 
 -- INSERT -- TABLO ICINE VERI EKLEME
 
 INSERT INTO notlar values ('Sevim', 75.5);
  INSERT INTO notlar values ('Busra', 85.5);
  INSERT INTO notlar values ('Berna', 95.8);
  
  --- CONSTRAINT --- 
  
  -- bir datanin UNIQUE olmasi icin data tipinden sonra UNIQUE yazilir.
  --bir datanin BOS gecilmemesi icin data tipinden sonra NOT NULL yazilir.
  CREATE TABLE ogrenciler3
 (
	ogrenci_no char(7) UNIQUE,
	isim varchar(20) not null, 
	soyisim varchar(25), 
	not_ortalamasi real,  
	kayit_tarihi date
 );
  select * from ogrenciler3;
  
  INSERT INTO ogrenciler3 values ('1234', 'Mustafa', 'Keser', 85.5, now() );
  select * from ogrenciler3;
  
  INSERT INTO ogrenciler3 values ('1235', 'Beyza', 'Keser', 85.5, now() );
  
  -- UNIQUE kisitlamasi oldugu icin BU veri eklenemez..
  INSERT INTO ogrenciler3 values ('1235', 'Beyza', 'Keser', 85.5, now() );
  
  -- NOT NULL kisitlamasi oldugu icin BU veri eklenemez...
  INSERT INTO ogrenciler3 (ogrenci_no, soyisim, not_ortalamasi ) VALUES('1236', 'Keser', 95.8)
  
  -- PRIMARY KEY atamasi
    
   CREATE TABLE ogrenciler4
 (-- bir  primary key atamasi icin data tipinden sonra primary key yazilir.
	ogrenci_no char(7) primary key, 
	isim varchar(20), 
	soyisim varchar(25), 
	not_ortalamasi real,  
	kayit_tarihi date
 );
  
   -- PRIMARY KEY atamasi 2.YOL
  --CONSTRAINT ismini kendimiz vermek istersek kullanalim
   CREATE TABLE ogrenciler5
 (-- bir  primary key atamasi icin data tipinden sonra primary key yazilir.
	ogrenci_no char(7), 
	isim varchar(20), 
	soyisim varchar(25), 
	not_ortalamasi real,  
	kayit_tarihi date,
	CONSTRAINT ogr PRIMARY KEY (ogrenci_no) 	 
 );
  
  
    CREATE TABLE ogrenciler5
 (-- bir  primary key atamasi icin data tipinden sonra primary key yazilir.
	ogrenci_no char(7), 
	isim varchar(20), 
	soyisim varchar(25), 
	not_ortalamasi real,  
	kayit_tarihi date,
	PRIMARY KEY (ogrenci_no) -- Bu sekildede OLUSTURULABILIR..	 
 );
  
  -- FOREING KEY OLUSTURMAK ---- 
  
  CREATE TABLE tedarikciler3
  (tedarikci_id char(5) primary key,
   tedarikci_isim varchar(20),
   iletisim_isim varchar(20)
  );
  
  CREATE TABLE urunler(
  tedarikci_id char(5),
	  urun_id char(5),
	  FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
  );
  
    select * from urunler;
  
  /*
  “calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”
“sokak”
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
  */
  
  CREATE TABLE calisanlar
  (
	  id char(15) primary key,
   isim varchar(30) unique,
	  maas int not null,
   ise_baslama date
  );
  
  
  CREATE TABLE adresler(
  adres_id char(30) ,
	  sokak varchar(30),
	  cadde varchar(350),
	  sehir varchar(30),  
	  FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
  );
  
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--unique oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --maas null olamaz
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- Unique 2 can olmaz
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- syntax int dedin string girecen!!
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- 2.HIClik olmaz unique oldugu icin
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- 2 primary keyden dolayi kabul etmez
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- primay key null kabul etmez..
  
  
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');   -- parint class da id olmadigi icin kabul etmedi

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
  
  select * from calisanlar;
  select * from adresler;
  
  -- CHECK CONSTRAINT --- 
    CREATE TABLE calisanlar1
  (
	  id char(15) primary key,
   isim varchar(30) unique,
	  maas int check (maas>10000) not null,
   ise_baslama date
  );
  
  INSERT INTO calisanlar1 VALUES('10002', 'Mustafa Keser', 9000, '2018-04-12'); -- 9000 kucuk hata verdi
  INSERT INTO calisanlar1 VALUES('10002', 'Mustafa Keser', 19000, '2018-04-12');
  select * from calisanlar1;
  
  -- DQL -- WHERE kULLANIMI
  
  select * from calisanlar;
  
  select isim from calisanlar; -- sadece ismleri  getir....
  
  -- maaasi 5000 den fazla olanlari listeleyin
  select isim, maas from calisanlar WHERE maas>5000;
  
  -- calisanlar tablosundan ismi veli han olan tum verileri listele
  select * from calisanlar WHERE isim='Veli Han'; 
  
   -- maaasi 5000 olanlari listeleyin
  select * from calisanlar WHERE maas=5000;
  
  
  -- DML -  DELETE KOMUTU
  /*
  * DELETE FROM tablo_adı; Tablonun tüm içerğini siler.
	- Veriyi seçerek silmek için WHERE komutu kullanılır
	* DELETE FROM tablo_adı WHERE sutun_adi = veri; 
	Tabloda istediğiniz veriyi siler.
  */
  
  DELETE from calisanlar; -- eger parint table baska bir child tablo ile iliskili ise 
  							-- once child tablo silinmelidir.
							
	Delete from adresler;  -- tablo icinde ki tum verileri siler
	
	-- Adresler tablosundan srhri antep olan verileri silelim
	
	Delete from adresler Where sehir = 'Antep'; 
	
	select * from adresler;
	
	/*
	-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
	*/
	
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
  	select * from urunler;
	select * from ogrenciler5;
	select * from ogrenciler4;
	select * from ogrenciler3;
  
  
  
  
  
  
  
  
  