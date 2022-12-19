create table ogrenciBilgi(
ogrenciNo int,
ogrenciAdi varchar(20) not null,
ogrenciSoyadi varchar(20) not null,
ogrenciSinifi varchar(5) not null,
ogrenciEmail varchar(30) not null,
CONSTRAINT ogr PRIMARY KEY (ogrenciNo)
);


select * from ogrenciBilgi
delete from ogrenciBilgi


create table dersler(
ders_id int primary key,
ders_Kodu varchar(5) not null,
ders_Adi varchar(20) not null
);

create table ogrencinot(
ogrNoFK int not null,
dersKodu varchar(6) not null,
yazili1 real,
yazili2 real,
yazili3 real,
ortalama real null default 0,
FOREIGN KEY (ogrNoFK) REFERENCES ogrenciBilgi(ogrenciNo)
on delete cascade
);

create table ogretmenler(
brans_id int,	
sicilNo int UNIQUE,
brans varchar(20) not null,	
Adi varchar(20) not null,
Soyadi varchar(20) not null,
FOREIGN KEY (brans_id) references dersler (ders_id)	
);












