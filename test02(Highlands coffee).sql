-- Tạo database Highlandscoffee
create database HighlandsCoffee
go
use HighlandsCoffee
go
-- Tạo bảng các tỉnh, thành phố , mã tỉnh
create table Provinces (
	ProvinceID int primary key,
	ProvinceName nvarchar(200)
)
go
-- Tạo bảng các huyện 
create table District(
	DistrictID int primary key,
	DistrictName nvarchar(300),
	ProvinceID int foreign key references Provinces(ProvinceID)
)
go
-- Tạo bảng tiện ích
create table Utilities (
	UtilitiesID int primary key,
	UtilitiesName nvarchar(200)
)
go
-- Tạo bảng lưu tên , địa chỉ quán
create table HighLandsCoffeeStore (
	StoreName nvarchar(400) primary key,
	ProvincesID int foreign key references Provinces(ProvinceID),
	DistrictID int foreign key references District(DistrictID),
	Address nvarchar(400),
	UtilitiesID　int foreign key references Utilities
)
-- Thêm dữ liệu
insert into Provinces
	values
		(29, N'Hà Nội'),
		(49, N'Lâm Đồng'),
		(43, N'Đà Nẵng')
select * from Provinces
insert into District
	values
		(29, N'Hà Đông',01),
		(29,  N'Thanh Xuân',02),
		(29, N'Cầu Giấy', 03),
		(49, N'Đà Lạt', 04),
		(43, N'Sơn Trà', 05),
		(43, N'Cẩm Lệ', 06),
		(43, N'Hoàng Sa', 07)
select * from District
insert into  Utilities
	values
		(1, N'Wifi miễn phí'),
		(2, N'Thanh toán bằng thẻ'),
		(3, N'Wifi miễn phí, Thanh toán bằng thẻ ')
select * from Utilities
insert into HighLandsCoffeeStore
	values
		(N'Highlands Coffee HYUNDAI HILLSMALL HÀ NỘI', 29, 01, N'281 Hà Trì', 1),
		(N'Highlands Coffee MACHINCO', 29, 02, N'10 Trần Phú', 2),
		(N'Highlands Coffee 17T4 HOANG DAO THUY',29,03,N'17T4 Hoàng Đạo Thúy',2),
		(N'Highlands Coffee 01 HAI BA TRUNG',49,04,N'01 Hai Bà Trưng, Phường 6',2),
		(N'Highlands Coffee AZURA DA NANG',43,05,N'339 Trần Hưng Đạo',2),
		(N'Highlands Coffee Nguyễn Hữu Thọ',43,06,N'363 Nguyễn Hữu Thọ',2),
		(N'Highlands Coffee VINCOM DA NANG',43,05,N'Tòa Nhà VINCOM',2)

select * from HighlandsCoffeeStore

	-- Truy vấn tới các quán ở Hà Nội
	select StoreName, Address from HighLandsCoffeeStore
	where ProvincesID = 29
	-- Truy vấn tới các quán ở Lâm Đồng
	select StoreName, Address from HighLandsCoffeeStore
	where ProvincesID = 49 
	-- Truy vấn tới các quán có wifi miễn phí
	select StoreName, Address from HighLandsCoffeeStore
	where UtilitiesID = 1 or UtilitiesID = 3