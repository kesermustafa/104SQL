CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(14),
      konum      VARCHAR(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
    
    select * from bolumler;

    CREATE TABLE personel1 (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(10),
      meslek        VARCHAR(9),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    
  
    INSERT INTO personel1 VALUES (7499,'BAHATTIN','SATISE',1222,1600,30);
    INSERT INTO personel1 VALUES (7521,'NESE','SATISE',1222,1250,30);
    INSERT INTO personel1 VALUES (7654,'MUHAMMET','SATISE',1222,1250,30);
    INSERT INTO personel1 VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel1 VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel1 VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel1 VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel1 VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel1 VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel1 VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel1 VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel1 VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
    
   SELECT * FROM personel1;


/* -----------------------------------------------------------------------------
  SORU1: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini, bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
-- P: personel tablo
-- B: bolumler tablo

-- 1.YOL
select bolum_isim, personel_isim, maas
from bolumler as B left join personel1 as p
on B.bolum_id = P.bolum_id
order by bolum_isim desc, P.maas;

-- 2.YOL
select bolum_isim, personel_isim, maas
from personel1 as p right join bolumler as B
on B.bolum_id = P.bolum_id
order by bolum_isim desc, P.maas;








