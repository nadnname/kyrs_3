CREATE TABLE organiz (
    id          INTEGER NOT NULL,
    nazvanie    VARCHAR(20),
    kol_vo_sotr INTEGER,
    data_obr    DATE
);
ALTER TABLE organiz ADD CONSTRAINT organiz_pk PRIMARY KEY ( id );


CREATE TABLE sotrydnik (
    id         INTEGER NOT NULL,
    fio        VARCHAR(20),
    doljnost   VARCHAR(20),
    zp         INTEGER,
    data_rod   DATE,
    organiz_id INTEGER NOT NULL
);
ALTER TABLE sotrydnik ADD CONSTRAINT sotrydnik_pk PRIMARY KEY ( id );
ALTER TABLE sotrydnik
    ADD CONSTRAINT sotrydnik_organiz_fk FOREIGN KEY ( organiz_id )
        REFERENCES organiz ( id );
        
        
CREATE TABLE klient (
    id    INTEGER NOT NULL,
    passw varchar(10),
    fio   VARCHAR(20)
);
ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( id );


CREATE TABLE nedviz (
    id            INTEGER NOT NULL,
    plosh         INTEGER,
    kol_vo_komnat varchar(20),
    stoimost      varchar(12),
    adress        VARCHAR(30)
);
ALTER TABLE nedviz ADD CONSTRAINT nedviz_pk PRIMARY KEY ( id );


CREATE TABLE dogovor (
    nomer        INTEGER NOT NULL,
    tip_yslygi   VARCHAR(10),
    data_zakl    DATE,
    cymma        INTEGER,
    klient_id    INTEGER NOT NULL,
    nedviz_id    INTEGER NOT NULL,
    sotrydnik_id INTEGER NOT NULL
);
ALTER TABLE dogovor ADD CONSTRAINT dogovor_pk PRIMARY KEY ( nomer );
ALTER TABLE dogovor
    ADD CONSTRAINT dogovor_klient_fk FOREIGN KEY ( klient_id )
        REFERENCES klient ( id );
ALTER TABLE dogovor
    ADD CONSTRAINT dogovor_nedviz_fk FOREIGN KEY ( nedviz_id )
        REFERENCES nedviz ( id );
ALTER TABLE dogovor
    ADD CONSTRAINT dogovor_sotrydnik_fk FOREIGN KEY ( sotrydnik_id )
        REFERENCES sotrydnik ( id );
        
insert into klient(id,passw,fio) values (1,'12345','Ильина А.И.'),(2,'qwerty','Григорьева В.А.'),(3,'55545','Попов Т.Д.'),
(4,'123789','Акимова В.Н.');
insert into organiz(id,nazvanie,kol_vo_sotr,data_obr) values
(1,'Pick',3,'2023-06-21'),(2,'Brownwill',1,'2023-10-01'),(3,'Whitewill',2,'2022-04-14');
insert into sotrydnik(id,fio,doljnost,zp,data_rod,organiz_id) values
(1,'Федоров А.В.','брокер',35000,'2003-08-05',1),(2,'Тарасов Д.Я.','старший-брокер',50000,'1999-11-28',3),(3,'Поляков И.Г.','брокер',40000,'2000-07-20',2),
(4,'Глушков Д.О.','брокер',35000,'2003-06-24',1),
(5,'Зуев М.М.','стажер',20000,'1998-03-28',1),(6,'Киселев М.С.','брокер',35700,'1997-05-19',3);
insert into nedviz(id,plosh,kol_vo_komnat,stoimost,adress) values
(1,35,'Однокомнатная','8500000','ул.Алтайская, д.12, кв.85'),(2,60,'Двухкомнатная','13000000','ул.Стрэнд, д.4, кв.20'),
(3,22,'Однокомнатная','7800000','ул.Амурская, д.24, кв.333');
insert into dogovor(nomer,tip_yslygi,data_zakl,cymma,klient_id,nedviz_id, sotrydnik_id) values
(1,'Продажа','2023-06-12','10000','3','1','4');