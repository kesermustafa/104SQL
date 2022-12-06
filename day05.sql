-- day 05  SQL

			
			-- grup by
CREATE TABLE personel (
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;

delete from personel;

-- Isme gore toplam maaslari bulun
SELECT isim, SUM(maas) AS toplam_maas FROM personel GROUP BY isim;

-- Personel tabolsundaki isimleri gruplayin 


				--  HAVING CLAUSE   // sadece grub by ile kullaniriz..
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.

--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster

select sirket, MIN(maas) as en_az_maas from personel group by sirket having min(maas)>4000;

select sirket from personel where sehir='Ankara' group by sirket having min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim, sum(maas) as toplam_maas from personel group by isim having sum(maas)>10000;


-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim) as toplam_personel_sayisi from personel group by sehir having count(isim)>1;


-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir, max(maas) as max_maas from personel group by sehir having max(maas)<5000;


						--UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i 
-- ayni olmalidir.

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select sehir, maas from personel where maas>5000 UNION select isim, maas from personel where maas>4000;


-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz

select isim, maas from personel where isim='Mehmet Ozturk'
UNION
select sehir, maas from personel where sehir='Istanbul' ORDER BY maas desc


Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz

-- 3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
		--olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
select sehir, maas from personel where maas>3000
UNION
select isim, maas from personel where maas>5000 order by maas



			--		2 TABLODAN DATA BIRLESTIRME  		---- 

CREATE TABLE personel1(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel1(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

SELECT * from personel1
SELECT * from personel_bilgi

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin


select sehir as sehir_ve_tel, maas from personel1 where id=123456789
UNION
select tel, cocuk_sayisi from personel_bilgi where id=123456789;

/*NOT : Union islemi yaparken
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali*/

/*UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir.
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.

NOT : UNION ALL ile birlestirmelerde de
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali*/


-- 1) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

select isim, maas from personel1 where maas<5000
union all
select isim, maas from personel1 where maas<5000

/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir
*/



       			---    INTERSECT OPERATOR  -----
				--- 	KESISIM  ---- 
	-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir	
	-- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
	
	select id from personel1 where sehir IN ('Istanbul', 'Ankara')
	INTERSECT
	select id from personel_bilgi where cocuk_sayisi IN (2,3);
	
	-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
	SELECT isim FROM personel1 WHERE sirket= 'Honda'
	INTERSECT
	SELECT isim FROM personel1 WHERE sirket= 'Ford'
	INTERSECT
	SELECT isim FROM personel1 WHERE sirket= 'Tofas';

		select * from personel1		
	

			--  EXCEPT OPERATOR  -- 
	/*
	iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir
	 */
 
	-- 5000’den az maas alip Honda’da calismayanlari yazdirin
	select isim, sirket from personel1 where maas<5000
	EXCEPT
	select isim, sirket from personel where sirket = 'Honda';

	--Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
	select isim, sehir from personel1 where isim = 'Mehmet Ozturk'
	EXCEPT	
	select isim, sehir from personel where sirket = 'Honda'; 
	
	
	






















