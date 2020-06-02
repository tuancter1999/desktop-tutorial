create database QLPM;
use QLPM;

create table phanmem(
	maphanmem char(5) not null primary key,
    tenphanmem nvarchar(20) not null
);

create table may(
	mamay char(5) not null primary key,
	tenmay nvarchar(20) not null,
    cauhinhmay nvarchar(20) not null,
	tinhtrangmay bool not null,
    maphanmem char(5),
    constraint FK_may_phanmem foreign key (maphanmem) references phanmem(maphanmem)
);

create table phongmay(
	maphongmay char(5) not null primary key,
    vitri nvarchar(20) not null,
    mamay char(5) not null, 
	constraint FK_phongmay_may foreign key (mamay) references may(mamay)
);

create table giaovien(
	magiaovien char(5) not null primary key,
    tengiaovien nvarchar(20) not null,
    hocvi nvarchar(20),
    ngaycong int
);

create table monhoc(
	mamonhoc char(5) not null primary key,
    tenmonhoc nvarchar(20) not null,
    cauhinhmay nvarchar(20),
    maphanmem char(5) not null,
    constraint FK_monhoc_phanmem foreign key (maphanmem) references phanmem(maphanmem)
);
create table lichtruc(
	malichtruc char(5) not null primary key,
	maphongmay char(5) not null,
    magiaovien char(5) not null,
    mamonhoc char(5) not null,
    batdau datetime not null,
    ketthuc datetime not null,
    constraint FK_lichtruc_phongmay foreign key (maphongmay) references phongmay(maphongmay),
    constraint FK_lichtruc_giaovien foreign key (magiaovien) references giaovien(magiaovien),
    constraint FK_lichtrgiaovienuc_monhoc foreign key (mamonhoc) references monhoc(mamonhoc)
);

SET SQL_SAFE_UPDATES = 0;

delete from monhoc where tenmonhoc='Java';

insert into phanmem values('PM01', 'Netbeans');
insert into monhoc values ('MH02', 'Java', 'CAO', 'PM01');
insert into monhoc values ('MH01', 'JavaWeb', 'CAO', 'PM01');

