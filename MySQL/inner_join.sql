use sqldb;

create table stdtbl
(stdName varchar(10) not null primary key,
addr char(4) not null);

create table clubtbl
(clubName varchar(10) not null primary key,
roomNo char(4) not null);

create table stdclubtbl
(num int auto_increment not null primary key,
stdName varchar(10) not null,
clubName varchar(10) not null,
foreign key(stdName) references stdtbl(stdName),
foreign key(clubName) references clubtbl(clubName));

insert into stdtbl values('김범수','경남'),('성시경','서울'),('조용필','경기'),('은지원','경북'),('바비킴','서울');
insert into clubtbl values('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');
insert into stdclubtbl values(null,'김범수','바둑'),(null,'김범수','축구'),(null,'조용필','축구'),(null,'은지원','축구'),
(null,'은지원','봉사'),(null,'바비킴','봉사');



select S.stdName, S.addr, SC.clubName, C.roomNo
from stdtbl S
inner join stdclubtbl SC
on S.stdName=SC.stdName
inner join clubtbl C
on C.clubName=C.clubName
order by S.stdName;

select C.clubName,C.roomNo,S.stdName, S.addr 
from stdtbl S
inner join stdclubtbl SC
on S.stdName=SC.stdName
inner join clubtbl C
on C.clubName=C.clubName
order by C.clubName;
