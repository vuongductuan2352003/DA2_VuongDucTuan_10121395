CREATE DATABASE DoGoMyNghe
go
use DoGoMyNghe

--Tạo bảng khách hàng
go
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietDanhMuc](
	[MaChiTietDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
	[TenChiTietDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTCategories] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[MoTa] [nvarchar](250) NULL,
 CONSTRAINT [PK_TypeAccounts] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[LoaiTaiKhoan] [int] NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTaiKhoan](
	[MaChitietTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[HoTen] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[DiaChi] [nvarchar](250) NULL,
 CONSTRAINT [PK_InformationAccounts] PRIMARY KEY CLUSTERED 
(
	[MaChitietTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaSanXuat] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Gmail] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[Gia] [decimal](18, 0) NULL,
	[NhaSanXuat]  [nvarchar] (100) NULL,
	[BaoHanh] [nvarchar] (100) NULL,
	
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaChiTietSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaChiTietDanhMuc] [int] Null,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[MoTa] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DetailProducts] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCungCap] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_NhaCungCap](
	[MaSanPham] [int] NOT NULL,
	[MaNhaCungCap] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
	[TongGia] [decimal](18, 0) NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [bit] NOT NULL,
	[Diachi] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DiaChiGiaoHang] [nvarchar](350) NULL,
	[ThoiGianGiaoHang] [datetime] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[TongGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DetailBill] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhaCungCap] [int] NULL,
	[NgayTao] [datetime] NULL,
	[KieuThanhToan] [nvarchar](max) NULL,
	[MaTaiKhoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[GiaNhap] [decimal](18, 0) NULL,
	[TongTien] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

----Thêm dữ liệu vào bảng
---- Thêm bản ghi vào bảng DanhMuc
INSERT INTO [dbo].[DanhMuc] ([TenDanhMuc])
VALUES
    (N'Nội thất phòng ăn'),
    (N'Nội thất phòng khách'),
    (N'Nội thất phòng ngủ'),
    (N'Nội thất trẻ em'),
    (N'Nội thất văn phòng')
SELECT * FROM SanPham
----thêm bản ghi vào bảng sản phẩm
INSERT INTO [dbo].[SanPham] ([MaDanhMuc], [TenSanPham], [AnhDaiDien], [Gia], [NhaSanXuat], [BaoHanh])
VALUES 
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB097', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB097-1-2048x1078.jpg', CAST(45830000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB096', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB096-1.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB095', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB095-1.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB094', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB094-1.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB109', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB109.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB106', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB106-2-600x800.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB105', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB105.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB103', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB103.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'KIỆT TÁC TỦ BẾP GỖ CÔNG NGHIỆP LG-TB101', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB001.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB015', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB015.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB016', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB016.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (1, N'TỦ BẾP GỖ CÔNG NGHIỆP LG-TB017', N'https://dogolegia.vn/wp-content/uploads/2022/09/Mau-tu-bep-dep-hien-dai-go-cong-nghiep-LG-TB017.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),


	   (2, N'TỦ VĂN PHÒNG ĐẸP - KỆ GỖ TRANG TRÍ VĂN PHÒNG LG-KG099', N'https://dogolegia.vn/wp-content/uploads/2023/08/2.-Van-phong-tai-nha-chi-Ngoc-2.jpg', CAST(45830000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU TỦ RƯỢU GỖ CÔNG NGHIỆP PHÒNG KHÁCH HIỆN ĐẠI LG-TR031', N'https://dogolegia.vn/wp-content/uploads/2022/09/mau-tu-ruou-go-cong-nghiep-cho-phong-khach-dep-hien-dai-LG-TR031-1-600x611.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU TỦ RƯỢU GỖ CÔNG NGHIỆP PHÒNG KHÁCH HIỆN ĐẠI LG-TR030', N'https://dogolegia.vn/wp-content/uploads/2022/09/mau-tu-ruou-go-cong-nghiep-cho-phong-khach-dep-hien-dai-LG-TR030-600x600.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'KỆ GỖ TRANG TRÍ PHÒNG KHÁCH ĐẸP LG-KG069', N'https://dogolegia.vn/wp-content/uploads/2022/09/tu-trang-tri-phong-khac-tu-ke-sach-tu-de-do-dep-LG-KG069.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'KỆ GỖ TRANG TRÍ PHÒNG KHÁCH ĐẸP LG-KG029', N'https://dogolegia.vn/wp-content/uploads/2022/09/ke-go-trang-tri-phong-khach-dep-sang-trong-LG-KG023.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'KỆ GỖ TRANG TRÍ PHÒNG KHÁCH ĐẸP LG-KG025', N'https://dogolegia.vn/wp-content/uploads/2022/09/ke-go-trang-tri-phong-khach-dep-sang-trong-LG-KG019-2.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'KỆ GỖ TRANG TRÍ PHÒNG KHÁCH ĐẸP LG-KG013', N'https://dogolegia.vn/wp-content/uploads/2022/09/ke-go-trang-tri-phong-khach-dep-sang-trong-LG-KG010-27.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'KIỆT TÁC SOFA GỖ PHÒNG KHÁCH HIỆN ĐẠI LG-SG245', N'https://dogolegia.vn/wp-content/uploads/2023/05/0.-mau-sofa-go-dep-cho-phong-khach-an-tuong-go-soi-LG-SG245-2.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU KỆ TIVI GỖ CÔNG NGHIỆP LG-KTV218', N'https://dogolegia.vn/wp-content/uploads/2023/06/mau-ke-tivi-phong-khach-dep-hien-dai-LG-KTV218-1.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU KỆ TIVI GỖ HIỆN ĐẠI LG-KTV209', N'https://dogolegia.vn/wp-content/uploads/2022/09/mau-ke-tivi-phong-khach-dep-hien-dai-LG-KTV209.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU SOFA VĂNG PHÒNG KHÁCH ĐẸP LG-SF294-1', N'https://dogolegia.vn/wp-content/uploads/2022/09/mau-sofa-da-ni-vang-phong-khach-dep-hien-dai-ha-noi-sf294-12.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG'),
	   (2, N'MẪU SOFA VĂNG PHÒNG KHÁCH ĐẸP LG-SF312C-1', N'https://dogolegia.vn/wp-content/uploads/2022/09/mau-sofa-da-ni-vang-phong-khach-dep-hien-dai-ha-noi-sf312-1.jpg', CAST(37810000 AS Decimal(18, 0)), N'ĐỒ GỖ LÊ GIA', '24 THÁNG')


--THÊM KHÁCH HÀNG
-- Thêm 10 khách hàng mới vào bảng KhachHang với địa chỉ là các tỉnh thành của Việt Nam và tên thực tế của khách hàng
INSERT INTO [dbo].[KhachHang] ([TenKH], [GioiTinh], [DiaChi], [SDT], [Email])
VALUES
(N'Nguyễn Văn Hải', N'Nam', N'Hà Nội', '0123456789', 'nguyenvanhai@email.com'),
(N'Trần Thị Hương', N'Nữ', N'Hồ Chí Minh', '0987654321', 'tranthihuong@email.com'),
(N'Lê Văn Tùng', N'Nam', N'Đà Nẵng', '0369852147', 'levantung@email.com'),
(N'Phạm Thị Vân', N'Nữ', N'Hải Phòng', '0598741236', 'phamthivan@email.com'),
(N'Hoàng Văn Kì', N'Nam', N'Cần Thơ', '0246135798', 'hoangvanki@email.com'),
(N'Nguyễn Thị Trang', N'Nữ', N'Thừa Thiên Huế', '0765432981', 'nguyenthitrang@email.com'),
(N'Trần Văn Hiệp', N'Nam', N'Hà Tĩnh', '0312745698', 'tranvanhiep@email.com'),
(N'Lê Thị Trâm Anh', N'Nữ', N'Quảng Ninh', '0987612345', 'lethitramanh@email.com'),
(N'Phạm Văn Công', N'Nam', N'Nghệ An', '0123456789', 'phamvancong@email.com'),
(N'Hoàng Thị Thùy Linh', N'Nữ', N'Đắk Lắk', '0987654321', 'hoangthithuylinh@email.com');




SELECT * FROM NhaSanXuat

INSERT INTO [dbo].[NhaSanXuat] ([TenNhaSanXuat], [AnhDaiDien], [SoDienThoai], [DiaChi], [Gmail])
VALUES
(N'ĐỒ GỖ LÊ GIA', 'https://dogolegia.vn/wp-content/uploads/2022/09/LOGO-LE-GIA-01.png', '0866735622', N'Hải Dương', N'dogolegia@email.com');


--bảng chi tiết hóa đơn liên kết bảng hóa đơn qua mã hóa đơn 
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_DetailBill_Bills] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_DetailBill_Bills]

--bảng chi tiết hóa đơn liên kết bảng sản phẩm qua mã sản phẩm

GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_DetailBill_Products] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_DetailBill_Products]

--bảng chi tiết sản phẩm liên kết bảng sản phẩm qua mã sản phẩm 
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_DetailProducts_Products] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_DetailProducts_Products]
--bảng danh mục liên kết bảng sản phẩm qua mã danh mục
GO--lỗi
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Products_Categories]

--bảng tài khoản liên kết bảng loại tài khoản qua mã loại tài khoảnư\
go
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_TypeAccounts] FOREIGN KEY([LoaiTaiKhoan])
REFERENCES [dbo].[LoaiTaiKhoan] ([MaLoai])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_Accounts_TypeAccounts]
--bảng tài khoản liên kế bảng chi tiết tài khoản qua mã tài khoản
go
ALTER TABLE [dbo].[ChiTietTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_InformationAccounts_Accounts] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[ChiTietTaiKhoan] CHECK CONSTRAINT [FK_InformationAccounts_Accounts]
--bảng tài khoản liên kết bảng hóa đơn nhập qua mã tài khoản
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_TaiKhoan]
--bảng chi tiết hóa đơn nhập liên kết bảng hóa đơn nhập qua mã hóa đơn nhập
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
--bảng chi tiết hóa đơn nhập liên kết bảng sản phẩm qua mã sản phẩm
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham]
--bảng nhà cung cấp liên kết bảng hóa đơn nhập qua mã nhà cung cấp
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
--bảng nhà cung cấp liên kết bảng nhà cung cấp sản phẩm qua mã nhà cung cấp 
ALTER TABLE [dbo].[SanPham_NhaCungCap]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[SanPham_NhaCungCap] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
--bảng sản phẩm nhà cung cấp liên kết bảng sản phẩm qua mã sản phẩm
GO
ALTER TABLE [dbo].[SanPham_NhaCungCap]  WITH CHECK ADD  CONSTRAINT [FK_SanPhams_NhaCungCap] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SanPham_NhaCungCap] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]

--bảng nghệ nhân gia công liên kết bảng  sản phẩm qua mã nhà sản xuất
--bảng tài khoản liên kết bảng hóa đơn nhập qua mã tài khoản

GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_ChiTietDanhMuc] FOREIGN KEY([MaChiTietDanhMuc])
REFERENCES [dbo].[ChiTietDanhMuc] ([MaChiTietDanhMuc])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_ChiTietDanhMuc]
GO
ALTER TABLE [dbo].[ChiTietDanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhMuc_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[ChiTietDanhMuc] CHECK CONSTRAINT [FK_ChiTietDanhMuc_DanhMuc]
--ALTER TABLE [dbo].[SanPham] 
--DROP CONSTRAINT [FK_SanPham_NhaSanXuat];

GO
-------PROC GET LIST SANPHAMS
go
CREATE PROCEDURE GetDanhSachSanPham
AS
BEGIN
    SELECT 
        [MaSanPham],
        [MaDanhMuc],
        [TenSanPham],
     	[AnhDaiDien] ,
        [Gia],

	[NhaSanXuat] ,
	[BaoHanh] 
     
 
    FROM SanPham;
END;
EXEC GetDanhSachSanPham
-- thêm sản phẩm
go
create PROCEDURE [dbo].[THEM_SAN_PHAM](
@MaSanPham       int, 
 @MaDanhMuc       int, 
 @TenSanPham      NVARCHAR(150), 
 @AnhDaiDien      NVARCHAR(max),  
 @Gia [decimal](18, 0),
 @NhaSanXuat NVARCHAR(100),
 @BaoHanh    NVARCHAR(100)
)
AS
    BEGIN
       insert into SanPham(MaSanPham,MaDanhMuc,TenSanPham,AnhDaiDien,Gia,NhaSanXuat,BaoHanh)
    values(@MaSanPham,@MaDanhMuc,@TenSanPham,@AnhDaiDien,@Gia,@NhaSanXuat,@BaoHanh);
    END;
--sửa sản phẩm
go
CREATE PROCEDURE [dbo].[CAP_NHAT_SAN_PHAM]
(@MaSanPham       int, 
 @MaDanhMuc       int, 
 @TenSanPham      NVARCHAR(150), 
 @AnhDaiDien      NVARCHAR(max),  
 @Gia [decimal](18, 0),
 @NhaSanXuat NVARCHAR(100),
 @BaoHanh    NVARCHAR(100)
)
AS
    BEGIN
  UPDATE sanpham
  SET
   MaDanhMuc  = @MaDanhMuc ,
   TenSanPham  = @TenSanPham,
   AnhDaiDien  = @AnhDaiDien,
       Gia  =@Gia,
   NhaSanXuat=@NhaSanXuat,
  BaoHanh =@BaoHanh
  WHERE MaSanPham= @MaSanPham;
    END;

--SELECT * FROM danhmuc



--select * from sanpham




-- Tạo thủ tục lưu trữ để sắp xếp sản phẩm theo giá sản phẩm
CREATE PROCEDURE [dbo].[Sap_Xep_SP] 
    @LoaiSapXep NVARCHAR(4) -- 'ASC' hoặc 'DESC'
AS
BEGIN
    IF @LoaiSapXep = 'ASC'
    BEGIN
        SELECT * FROM SanPham
        ORDER BY Gia ASC;
    END
    ELSE IF @LoaiSapXep = 'DESC'
    BEGIN
        SELECT * FROM SanPham
        ORDER BY Gia DESC;
    END
END;
SELECT * FROM SANPHAM
DECLARE @LoaiSapXep NVARCHAR(2);
SET @LoaiSapXep = 'ASC';

EXEC [dbo].[Sap_Xep_SP] @LoaiSapXep;












 --select * from KHACHHANG

-- INSERT INTO KHACHHANG VALUES('KH1',N'VƯƠNG ĐỨC TUẤN','0135451251',N'CẨM GIÀNG-HẢII DƯƠNG','vuongductuan@gmail.com')
--INSERT INTO KHACHHANG VALUES('KH2',N'NGUYỄN VĂN TRƯỜNG','0153541252',N'KHOÁI CHÂU-HƯNG YÊN')
--INSERT INTO KHACHHANG VALUES('KH3',N'ĐINH QUỐC TRUNG','0135541254',N'THÀNH PHỐ HƯNG YÊN')
--INSERT INTO KHACHHANG VALUES('KH4',N'PHẠM TIẾN THÀNH','0135454251',N'ÂN THI-HƯNG YÊN')
--INSERT INTO KHACHHANG VALUES('KH5',N'HOÀNG NGUYỆT NHI','0135541251',N'ÂN THI-HƯNG YÊN')
--INSERT INTO KHACHHANG VALUES('KH6',N'VŨ MINH HIẾU','0130012551',N'PHÚ THỌ')
--INSERT INTO KHACHHANG VALUES('KH7',N'DƯƠNG ĐỨC NGUYÊN','0135541111',N'THÀNH PHỐ HƯNG YÊN')
--INSERT INTO KHACHHANG VALUES('KH8',N'VƯƠNG ĐỨC DŨNG','0135415251',N'CẨM GIÀNG-HẢI DƯƠNG')
--INSERT INTO KHACHHANG VALUES('KH9',N'PHẠM THỊ ÁNH NGỌC','0135441251',N'NINH BÌNH')
--INSERT INTO KHACHHANG VALUES('KH10',N'NGUYỂN THÚY HIỀN','0134541231',N'KHOÁI CHÂU-HƯNG YÊN')