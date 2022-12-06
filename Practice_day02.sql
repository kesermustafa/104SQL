-- Practice 2
/*
1.Data Query Language (Veri Sorgulama Dili - DQL)
SELECT: veritabanındaki verileri alır.

2.Data Manipulation Language (Veri Kullanma Dili - DML)
INSERT:Veritabanına yeni veri ekler.
DELETE:Veritabanındaki verileri siler
UPDATE:Veritabanındaki verileri günceller.

3.Data Definition Language (Veri Tanimlama Dili - DDL)
DROP: Bir veritabanını veya veritabanı içindeki tabloyu siler.
ALTER: Bir veritabanı veya veritabanı içindeki tabloyu günceller.
CREATE:Bir veritabanı veya veritabanı içinde tablo oluşturur.
*/


CREATE TABLE parent(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO parent VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO parent VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO parent VALUES (104, 'Apple', 'Adam Eve');

select * from parent;


CREATE TABLE child(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
);

INSERT INTO child VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO child VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO child VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO child VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO child VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO child VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO child VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from child;

--SORU 1: child tablosuna ted_verginosu 101 olan veri girişi yapınız
INSERT INTO child VALUES(101, 1009,'PC', 'Mustafa Keser');

delete from child where musteri_isim= 'Mustafa Keser'; 

--SORU 2: .child tablosuna ted_verginosu 105 olan veri girişi yapınız.
-- Parent tabloda primay key degeri 105 olan veri bulunmadigi icin child tabloya boyle bir veri eklenemez.

--EDİT :
--Parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz.
--İstisnai olarak "null" eklenebilir

--SORU 3: child tablosuna ted_vergino null olan veri girişi yapınız
INSERT INTO child VALUES(null, 1009,'PC', 'Beyza Keser');


--SORU 4: .parent tablosundaki vergi_no 101 olan veriyi siliniz.
			
delete from parent where vergi_no=101;  -- child tablodaki veri silinmeden parent tablodaki veri silinemez.

--SORU 5: child tablosundaki ted_vergino 101 olan verileri siliniz

delete from child where ted_vergino=101;  

--SORU 6: .parent tablosundaki vergi_no 101 olan veriyi siliniz
delete from parent where vergi_no=101;  

select * from parent;
select * from child;

delete from child where ted_vergino=null;

--SORU 7: .parent tablosunu siliniz. // child tablo silinmeden parent tablo silinemez..

--SORU 8: child tablosunu siliniz
drop table child

drop table if exists parent -- 


CREATE TABLE parent2(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson');

select * from parent2;

CREATE TABLE child2(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE
);

INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from child2;






























