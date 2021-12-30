create database Baithicuoiki
use Baithicuoiki
create table Khachhang
(
	Makh char(6),
	Hoten nvarchar(30),
	Diachi nvarchar(30),
	Sdt int,
	Ngaysinh date,
	primary key(Makh)
)
go
create table Sanpham 
(
	Masp char(4),
	Tensp nvarchar(30),
	Donvitinh nvarchar(25),
	Nuocsx nvarchar(25),
	Gia numeric(10,1),
	primary key(Masp)
)
go
create table Hoadon
(
	Sohoadon char(3),
	Ngaymuahang date,
	Makh char(6),
	Trigia numeric(11,1),
	primary key(Sohoadon)
)
go
create table CTHD 
(
	SOHD char(3),
	Masp char(4),
	Soluong int,
	primary key(SOHD,Masp)
)
go
ALTER TABLE Hoadon
ADD CONSTRAINT ketnoi
FOREIGN KEY  (Makh)
REFERENCES  Khachhang(Makh)
GO
ALTER TABLE CTHD
ADD CONSTRAINT ketnoi1
FOREIGN KEY  (SOHD)
REFERENCES  Hoadon(Sohoadon)
GO
ALTER TABLE CTHD
ADD CONSTRAINT ketnoi2
FOREIGN KEY  (Masp)
REFERENCES  Sanpham(Masp)
GO
--insert values
insert into Sanpham values
('001',N'Bếp điện',N'Hàng trăm',N'Trung Quốc',500000),
('002',N'Bếp từ',N'Hàng triệu',N'Trung Quốc',1500000),
('003',N'Nồi chiên ko dầu',N'Hàng trăm',N'Trung Quốc',600000),
('004',N'Bếp điện',N'Hàng triệu',N'Thái lan',2000000),
('005',N'Bếp từ',N'Hàng triệu',N'Mỹ',3000000),
('006',N'Máy lạnh',N'Hàng triệu',N'Trung Quốc',5000000),
('007',N'Máy lạnh',N'Hàng triệu',N'Mỹ',10000000),
('008',N'Điện thoại',N'Hàng trăm',N'Trung Quốc',200000),
('009',N'Điện thoại',N'Hàng triệu',N'Hàn Quốc',9000000),
('010',N'Đèn điện',N'Hàng chục',N'Việt Nam',30000),
('011',N'Ổ cắm',N'Hàng chục',N'Việt Nam',70000),
('012',N'Tủ lạnh',N'Hàng triệu',N'Hàn Quốc',100000000),
('013',N'Điện thoại',N'Hàng triệu',N'Việt Nam',5000000)
go
insert into Khachhang values
('10216',N'Nguyễn Văn Tèo',N'Việt Nam',0903204852,'12/5/1960'),
('10217',N'Nguyễn Văn Tí',N'Việt Nam',0901374852,'4/22/1993'),
('10218',N'Huỳnh Văn Thơm',N'Việt Nam',0903578952,'5/22/1998'),
('10219',N'Trần Hương',N'Việt Nam',0903986552,'10/6/1973'),
('10220',N'Nguyễn Hương',N'Việt Nam',0903876852,'10/22/1988'),
('10221',N'Cao Tuấn',N'Việt Nam',0903765852,'2/22/1989'),
('10222',N'Cao A',N'Việt Nam',0905436852,'11/8/1994'),
('10223',N'Anh A',N'Trung Quốc',0325204852,'2/25/1999'),
('10224',N'Chị B',N'Thái Lan',0233204852,'7/29/2000'),
('10225',N'Cô C',N'Mỹ',0303204852,'9/30/1954')
insert into Hoadon values
('1','9/30/2021','10216',1500000),
('2','9/2/2021','10216',3000000),
('3','1/5/2021','10217',6000000),
('4','2/2/2021','10218',10000000),
('5','3/6/2021','10220',15000000),
('6','4/30/2021','10221',20000000),
('7','6/6/2021','10222',2000000),
('8','9/7/2021','10221',18000000),
('9','9/30/2021','10218',200000000),
('10','4/6/2021','10217',6000000),
('11','5/5/2021','10222',1500000),
('12','7/27/2021','10223',20000000),
('13','8/8/2021','10224',2000000),
('14','5/9/2021','10225',18000000),
('15','1/30/2021','10220',100000000),
('16','1/10/2021','10216',90000),
('17','1/10/2021','10217',350000)
insert into CTHD values
('1','001',3),
('2','002',2),
('3','003',10),
('4','004',5),
('5','005',5),
('6','007',2),
('7','008',10),
('8','009',2),
('9','012',2),
('10','004',3),
('11','002',1),
('12','007',2),
('13','001',4),
('14','009',2),
('15','012',1),
('16','010',3),
('17','011',5)
--SELECT
select*from Sanpham
select*from Khachhang
select*from Hoadon
select*from CTHD

--Các câu truy vấn 

--1.In ra danh sách các sản phẩm (mã sản phẩm, tên sản phẩm) được bán ra trong ngày 10/01/2021.
select sp.Masp,sp.Tensp
from Sanpham sp,Hoadon hd,CTHD ct
where sp.Masp=ct.Masp and ct.SOHD=hd.Sohoadon and hd.Ngaymuahang = '01/10/2021'

--2.In ra danh sách các sản phẩm (mã sản phẩm, tên sản phẩm) có giá từ 20000 đến 80000 do Việt Nam sản xuất.
select distinct sp.Masp,sp.Tensp
from Sanpham sp
where sp.Gia between '20000' and '80000' and sp.Nuocsx=N'Việt Nam'

--3.Tìm khách hàng (MAKH, HOTEN) có trị giá trung bình của các hóa đơn đã mua hàng là cao nhất.
select TOP 1 avg(Trigia) as 'Giá trị tb cao nhất', kh.Makh, kh.Hoten
From Hoadon hd, Khachhang kh
Where hd.Makh=kh.Makh
Group by kh.Makh,kh.Hoten
Order by avg(Trigia) desc

--4.In ra danh sách các khách hàng (MAKH, HOTEN) chưa mua bất kỳ hàng hóa nào của nước sản xuất là Trung Quốc.
select distinct kh.Makh,kh.Hoten
from Khachhang kh
where kh.Makh NOT IN
(
	select kh.Makh
	from 
(
	( CTHD ct 
	join Hoadon hd ON ct.SOHD = hd.Sohoadon)
	join Khachhang kh ON hd.Makh=kh.Makh)
	where ct.Masp in 
	(
		select sp.Masp
		from Sanpham sp
		where sp.Nuocsx=N'Trung Quốc'
	)
)

--5. Cho khách hàng có MAKH=’10218’, hãy in ra HOTEN của khách hàng đó, cùng với các thông tin về các hàng hóa 
--mà NUOCSX không là Việt Nam mà khách hàng đó đã mua: TENSP, NUOCSX, và SL, THANHTIEN =SL*GIA.
select distinct kh.Hoten,sp.Tensp,sp.Nuocsx,ct.Soluong,Trigia=ct.Soluong*sp.Gia 
from Khachhang kh,Hoadon hd,CTHD ct,Sanpham sp
where kh.Makh=hd.Makh and kh.Makh='10218' and hd.Sohoadon=ct.SOHD and ct.Masp=sp.Masp and not exists 
(
	select sp1.Masp
	from Sanpham sp1
	where ct.Masp=sp1.Masp and sp1.Nuocsx=N'Việt Nam'
)

--6. In ra danh sách 5 khách hàng đầu tiên có tổng giá trị của các hóa đơn đã mua hàng là cao nhất
--, sắp xếp theo tổng giá trị giảm dần.
select top 5 max(hd.Trigia) as 'Giá hóa đơn',kh.Makh,kh.Hoten
from Khachhang kh,Hoadon hd
where kh.Makh=hd.Makh
group by kh.Makh,kh.Hoten 
order by MAX(hd.Trigia) desc
