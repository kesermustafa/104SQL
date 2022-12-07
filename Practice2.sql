/*
CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA

1-) Child tablo silinmeden Parent tablo silinmeye çalışıldıgında PgAdmin Eror verir.
yani Child tablo silinmeden Parent tablo silinemez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında Pg Admin Eror verir.
yani Child tablodaki veri silinmeden Parent tablodaki veri silinemez

CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
PgAdmin Eror vermez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında PgAdmin Eror vermez
Parent tablodaki veriyi siler.
Fakat bu durumda Child tablodaki veride silinir.
*/

CREATE TABLE toptancilar1     --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO toptancilar1 VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar1 VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar1 VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar1 VALUES (204, 'Apple', 'Adem Coş');

select * from toptancilar1;
    

CREATE TABLE malzemeler1     --> child
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25),

CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar1(vergi_no)
on delete cascade
);    
    
INSERT INTO malzemeler1 VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler1 VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler1 VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler1 VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler1 VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler1 VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler1 VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    
SELECT * FROM malzemeler1;


-- SORU1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.

update toptancilar1 set sirket_ismi = 'VivoBook'
where vergi_no= '202';

select * from toptancilar1;


--  SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.

update toptancilar1 set sirket_ismi = 'NOKIA';

select * from toptancilar1;

-- SORU3: vergi_no’su 201 olan toptancinin 
--sirket_ismi'ni 'nokia' ve irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz.

update toptancilar1 set sirket_ismi='nokia', irtibat_ismi='Canan Can'
where vergi_no=201;

-- SORU4: sirket_ismi nokia olan toptancinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.

update toptancilar1 set irtibat_ismi='Bilal Han'
where sirket_ismi='nokia';

-- SORU5: malzemeler tablosundaki 'Telefon' değerlerini 'Phone' olarak güncelleyiniz.

update malzemeler1 set malzeme_isim='Phone'
where malzeme_isim='Telefon';

select * from malzemeler1;


-- SORU6: malzemeler tablosundaki malzeme_id değeri 1004'ten büyük olanların
 --malzeme_id'lerini 1 artırarak güncelleyiniz.
 
 update malzemeler1 set malzeme_id=malzeme_id+1
 where malzeme_id>1004;
 
 -- SORU7: malzemeler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.
 
 update malzemeler1 set malzeme_id=malzeme_id+ted_vergino;
 
 select * from malzemeler1;
 
 
-- SORU8: Malzemeler tablosundaki musteri_isim'i Ali Can olan malzeme_isim'ini,
--toptancılar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.

update malzemeler1 set malzeme_isim=(select sirket_ismi from toptancilar1 where irtibat_ismi='Adem Coş')
where musteri_isim='Ali Can';

--(select sirket_ismi from toptancılar where irtibat_ismi='Adem Coş')


 select * from malzemeler1;
 
 select * from toptancilar1;


-- SORU9: malzeme_ismi Laptop olan musteri_isim'ini,
 --sirket_ismi Apple’in irtibat_isim'i ile güncelleyiniz.
 
 update malzemeler1 
 set musteri_isim=( select irtibat_ismi from toptancilar1 where sirket_ismi='Apple') 
 where malzeme_isim='Laptop';
 
 select irtibat_ismi from toptancılar1 where sirket_ismi='Apple'
 
 
