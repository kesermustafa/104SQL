/*============================= GROUP BY =====================================

    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak GRUPLAMAK için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/ 




create table sahislar
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);

insert into sahislar values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into sahislar values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into sahislar values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into sahislar values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into sahislar values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into sahislar values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into sahislar values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into sahislar values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into sahislar values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into sahislar values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into sahislar values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into sahislar values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into sahislar values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into sahislar values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into sahislar values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into sahislar values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into sahislar values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into sahislar values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into sahislar values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into sahislar values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');



select * from sahislar;


-- SORU01: sahisların calıştığı ulkelerden yas ort 35 ten buyuk olanları listeleyiniz

select ulke from sahislar group by ulke having avg(yas)>35;




select * from sahislar group by ulke;

-- yukaridaki kod maclerde hata verdi
-- windowslarda calisti
-- bu sorgulam yaniş olur. group by ile tabloda geçen isimleri aliriz.






-- SORU02: ulke'lere göre ortalama maaşları listeleyiniz

select ulke, round(avg(maas), 2) as ortalama_maas
from sahislar
group by ulke;





-- SORU03: ulke'lere göre kaç çalışan olduğunu sorgulayınız.

select ulke, count(ad) as calisan_sayisi
from sahislar
group by ulke;





select ulke, count(*) as calisan_sayisi
from sahislar
group by ulke;






-- SORU04: Maas ortalamasını cinsiyet'e göre sorgulayınız

select cinsiyet, round(avg(maas)) as ORTALAMA_MAAS
from sahislar
group by cinsiyet;






-- SORU05: ulke'lere göre ve sehir'lere göre gruplayarak sorgulama yapınız

select ulke, sehir from sahislar group by ulke, sehir;






-- SORU06: ulke'lere göre ve sehir'ler göre çalışan sayısını sorgulayın.

select ulke, sehir, count(id) as calisan_sayisi
from sahislar
group by ulke, sehir;






-- SORU07: ulke'lere göre ve cinsiyet'e göre çalışan sayısını ve yas ortalamasını sorgulayınız.

select ulke, cinsiyet, count(id) as calisan_sayisi, round(avg(yas)) as yas_ortalamasi
from sahislar
group by ulke, cinsiyet;







-- SORU08: ulke'lere göre ve cinsiyet'e göre çalışan sayısını, yas ortalamasını ve maas'ı 30000 den büyük olanları sorgulayınız.

select ulke, cinsiyet,count(id) as calisan_sayisi, round(avg(yas)) as yas_ort
from sahislar where maas>30000
group by ulke,cinsiyet;







-- SORU09: ulke'lere göre ve cinsiyet'e göre çalışan sayısını, yaş ortalamasını, maas'ı 30000 den büyük olanları
-- ve yaş ortalamasını büyükten küçüğe doğru sıralayınız.

select ulke,cinsiyet,count(id) as calisan_sayisi, round(avg(yas)) as yas_ort from sahislar
where maas>30000 group by ulke,cinsiyet order by yas_ort desc ;
:pray:
1

1:30


/*======================== SET OPERATORLERI: UNION, UNION ALL==========================
    
    

    UNION: İKİ VEYA DAHA FAZLA SORGU İFADESİNİN SONUC KUMELERİNİ BİRLEŞTİREREK 

	-- TEK BİR SONUC KUMESİ OLUSTURUR.
   
    	   UNION:         SADECE BENZERSİZ VERİLERİ ALIR 

         UNION ALL:     BENZERLİ VERİLERİ DE ALIR
    



    Syntax:
    ----------
    SELECT sutun_adi FROM tablo_adi;
    UNION
    SELECT sutun_adi FROM tablo_adi;
    
   



 NOT:  Birlesik olan olan Sorgu ifadesinin veri türü diger sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalidir.



======================================================================================*/ 


CREATE TABLE personel 
(
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'Istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
select * from personel;
    


/* -----------------------------------------------------------------------------
  SORU1: maas'i 4000’den cok olan personel isim'lerini ve  
--maas'i 5000’den cok olan sehir'leri gosteren tekrarsız sorguyu yaziniz
------------------------------------------------------------------------------*/


select maas, isim from personel where maas>4000

union

select maas, sehir from personel where maas>5000;




/* -----------------------------------------------------------------------------
  SORU2: isim'i 'Mehmet Ozturk' olan kisilerin aldigi maas'lari  ve  
--sehir'i 'Istabul' olan personelin maas'larini tekrarsız
--büyükten küçüge dogru siralayarak bir tabloda gosteren sorguyu yaziniz.    
------------------------------------------------------------------------------*/  


select maas, isim as isim_sehir from personel where isim = 'Mehmet Ozturk'

union

select maas, sehir from personel where sehir = 'Istanbul'

order by maas desc;




/* -----------------------------------------------------------------------------
  SORU3: sirket'i 'Honda', 'Ford' ve 'Tofas' olan personelin isim'ini tekrarsız listeleyin
------------------------------------------------------------------------------*/  


select isim, sirket from personel where sirket='Honda'

union

select isim, sirket from personel where sirket='Ford'

union

select isim, sirket from personel where sirket='Tofas'




select isim, sirket from personel where sirket in ('Honda', 'Tofas', 'Ford');


/* -----------------------------------------------------------------------------
  SORU4: 5000’den az maas alan personelin isim, maas ve sirket bilgileri ile, 
-- 'Honda' calisani olmayan personelin isim, maas, sirket bilgilerini
-- tekrarsız listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 



select isim, maas, sirket from personel where maas<5000

union

select isim, maas, sirket from personel where sirket != 'Honda';





/* -----------------------------------------------------------------------------
  SORU5: isim'i 'Mehmet Ozturk' olanlarin isim'lerini, sehir'lerini ve
-- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini tekrarsız listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/


select isim, sehir from personel where isim ='Mehmet Ozturk'

union

select isim, sehir from personel where sehir != 'Istanbul';

/*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN'a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
	ORDER BY sutun_adı        İNT==>KÜÇÜKTEN BÜYÜGE  STRİNG==>A-Z
	ORDER BY sutun_adı DESC   İNT==>BÜYÜKTEN KÜÇÜGE  STRİNG==>Z-A
==============================================================================*/   



CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50), 
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
    
	
	
	
	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');





select * from meslekler;





-- SORU1: meslekler tablosunu meslek'e göre sıralayarak sorgulayınız.

	select * from meslekler order by meslek;



-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz

	select * from meslekler order by maas desc;



-- SORU3: meslekler tablosunda maas'i kucukten buyuge siralayiniz

	select * from meslekler order by maas;



-- SORU4: meslekler tablosunda isim'i 'Mine' olanları,
-- maas'a göre büyükten küçüge sıralayarak sorgulayınız

	select * from meslekler where isim='Mine' order by maas desc;


-- SORU5: meslekler tablosunda soyisim 'i 'Can' olanları,
-- maas sıralı olarak sorgulayınız.

	select * from meslekler where soyisim='Can' order by maas;



-- SORU6: meslekler tablosunda maası en yüksek 5 kişinin bilgilerini listeleyiniz

	select * from meslekler order by maas desc limit 5;



-- SORU7: meslekler tablosunda en yüksek maaşı alan 3. 4. 5. 6. kişilerin bilgilerini listele

select * from meslekler order by maas desc offset 2 limit 4 ;











CREATE TABLE magaza 
(
    isim varchar(30), 
    urun_adi varchar(20), 
    urun_miktari int 
);
    
	

INSERT INTO magaza VALUES( 'Hasan', 'Terlik', 3);
INSERT INTO magaza VALUES( 'Cihan', 'Kazak', 8);
INSERT INTO magaza VALUES( 'Ahmet', 'Gömlek', 9);
INSERT INTO magaza VALUES( 'Hasan', 'Terlik', 2);
INSERT INTO magaza VALUES( 'Said', 'Kazak', 3);
INSERT INTO magaza VALUES( 'Said', 'Gömlek', 6);


select * from magaza;


--SORU1: Satılan urun_adi'na göre gruplandırarak,
--satılan max urun_miktari'nı ve min urun_miktari'nı, 
--min urun_miktari'na göre sıralayarak listeleyiniz   

select urun_adi, max(urun_miktari) as max, min(urun_miktari) as min from magaza group by urun_adi order by min ;






--SORU2: Kisi isim'ine ve urun_adi' na göre  gruplandırarak,
--satılan urun_miktari'nın toplamını, 
--isim'e göre sıralayan sorguyu yazınız

select isim, urun_adi, sum(urun_miktari) from magaza group by isim, urun_adi order by isim ;
















CREATE TABLE kisiler 
(
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
SELECT * FROM personel;
    



/* -----------------------------------------------------------------------------
  SORU1: isim'i 'Mehmet Ozturk' olan kisinin maas'larini + 
  sehir'i 'Istanbul' olan kisinin maas'larini
  büyükten küçüge dogru siralayarak bir tabloda gosteren sorguyu yaziniz.    
------------------------------------------------------------------------------*/  


select maas, isim as isim_sehir from kisiler where isim = 'Mehmet Ozturk'
union
select maas, sehir from kisiler where sehir = 'Istanbul'
order by maas desc;