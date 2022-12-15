/* UNION: iki veya daha fazla sorgu ifadesinin sonuç kümelerini birleştirerek 

teb bir sonuç kümesi oluşturur.

UNION SADECE BENZERSİZ DEGERLERİ ALIR
UNION ALL BENZERLİ DEGERLERİ DE ALIR


Syntax:
-------
select sutun_adi1 from tablo_adi1

UNION

select sutun_adi2 from tablo_adi2


*/


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
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');


/* -----------------------------------------------------------------------------
  SORU1: Maasi 4000’den cok olan personel isim'lerini ve  
--5000 liradan fazla maas alinan sehir'leri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/

select maas, isim as isim_sehir from personel where maas>4000
union
select maas, sehir from personel where maas>5000;



/* -----------------------------------------------------------------------------
  SORU2: isim'i 'Mehmet Ozturk' olan kisilerin aldigi maas'lari  ve  
--sehir'i 'Istabul' olan personelin maas'larini 
--büyükten küçüge dogru siralayarak bir tabloda gosteren sorguyu yaziniz.    
------------------------------------------------------------------------------*/  

select  maas, isim as isim_sehir from personel where isim='Mehmet Ozturk'
union
select maas,sehir from personel where sehir='Istanbul'
order by maas desc;

/* -----------------------------------------------------------------------------
  SORU3: 'Honda', 'Ford' ve 'Tofas'ta calısan bütün personelin isim'ini listeleyin
------------------------------------------------------------------------------*/  

select isim from personel where sirket='Honda'
union all
select isim from personel where sirket='Ford'
union all
select isim from personel where sirket='Tofas'

/* -----------------------------------------------------------------------------
  SORU4: 5000’den az maas alan bütün personelin isim, maas, sirket bilgileri ile, 
-- 'Honda' calisani olmayan bütün personelin isim, maas, sirket bilgilerini
-- listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 
select isim, maas, sirket from personel where maas<5000
union all
select isim, maas, sirket from personel where sirket != 'Honda';


/* -----------------------------------------------------------------------------
  SORU5: isim'i 'Mehmet Ozturk' olanlarin isim'lerini, sehir'lerini ve
-- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/
select isim, sehir from personel where isim ='Mehmet Ozturk'
union
select isim, sehir from personel where sehir <> 'Istanbul';