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






























