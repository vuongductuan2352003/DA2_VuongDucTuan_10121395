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
	[MaChiTietDanhMuc] [int]  Null,
	[MaSanPham] [int] NULL,
	[SoLuong] [int]  NULL,
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

--thêm chi tiết danh mục
-- Thêm các tên sản phẩm vào bảng "ChiTietDanhMuc" với mã danh mục 2
INSERT INTO ChiTietDanhMuc (MaDanhMuc, TenChiTietDanhMuc) VALUES
 (1, N'Mẫu bàn ăn đẹp'),
 (1, N'Mẫu tủ bếp đẹp'),
(2, N'Sofa gỗ hiện đại'),
(2, N'Mẫu sofa da nỉ đẹp'),
(2, N'Mẫu kệ tivi đẹp'),
(2, N'Tủ rượu gỗ công nghiệp'),
(2, N'Kệ gỗ trang trí đẹp'),
(2, N'Mẫu tủ giầy đẹp'),
(2, N'Bàn trà Nhật'),
(2, N'Vách ngăn phòng khách đẹp'),
(3, N'Bộ giường tủ'),
(3, N'Mẫu giường ngủ gỗ đẹp'),
(3, N'Mẫu giường ngủ bọc da nỉ'),
(3, N'Mẫu tủ quần áo đẹp'),
(3, N'Bàn phấn trang điểm'),
 (4, N'Phòng ngủ trẻ em'),
(4, N'Giường ngủ cho bé gái'),
(4, N'Giường ngủ cho bé trai'),
(4, N'Bàn học trẻ em'),
 (5, N'Bàn làm việc'),
(5, N'Tủ đựng tài liệu'),
(5, N'Phụ kiện');



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
alter PROCEDURE GetDanhSachSanPham
AS
BEGIN
    SELECT 
        [MaSanPham],
        [MaDanhMuc],
        [TenSanPham],
     	[AnhDaiDien] ,
        [Gia],

	[NhaSanXuat] ,
	[BaoHanh] ,
  
	 (
        SELECT 
		[MaChiTietSanPham],
		[MaChiTietDanhMuc],
            [MaSanPham],
			[SoLuong],
		[MoTa] 
        FROM ChiTietSanPham ctsp
        WHERE ctsp.MaSanPham = sp.MaSanPham
        FOR JSON PATH
    ) AS list_json_chitietsanpham
FROM SanPham sp;
END;
EXEC GetDanhSachSanPham
-- thêm sản phẩm
go
select * from ChiTietSanPham
select * from SanPham
drop PROCEDURE  [dbo].[THEM_SAN_PHAM]


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[THEM_SAN_PHAM]
(
 @MaDanhMuc       int, 
 @TenSanPham      NVARCHAR(150), 
 @AnhDaiDien      NVARCHAR(max),  
 @Gia [decimal](18, 0),
 @NhaSanXuat NVARCHAR(100),
 @BaoHanh    NVARCHAR(100),
  @list_json_chitietsanpham NVARCHAR(MAX)
)
AS
    BEGIN
  DECLARE @MaSanPham INT;
        insert into SanPham(MaDanhMuc,TenSanPham,AnhDaiDien,Gia,NhaSanXuat,BaoHanh)
    values(@MaDanhMuc,@TenSanPham,@AnhDaiDien,@Gia,@NhaSanXuat,@BaoHanh);

    SET @MaSanPham = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitietsanpham IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietSanPham
						(
						  MaChiTietDanhMuc,
                          MaSanPham, 
						  SoLuong,
                          MoTa                
                        )
                    SELECT 
						JSON_VALUE(p.value, '$.maChiTietDanhMuc'),
						@MaSanPham,
						JSON_VALUE(p.value, '$.soLuong'),
							JSON_VALUE(p.value, '$.moTa')
                    FROM OPENJSON(@list_json_chitietsanpham) AS p;
                END;
        SELECT '';
    END;



GO
select * from  ChiTietSanPham
-- Khai báo các biến để truyền tham số
-- Khai báo các biến để truyền tham số

DECLARE @MaDanhMuc int = 3;
DECLARE @TenSanPham NVARCHAR(150) = N'Sản phẩm ví dụ';
DECLARE @AnhDaiDien NVARCHAR(MAX) = N'/images/example.jpg';
DECLARE @Gia DECIMAL(18, 0) = 500;
DECLARE @NhaSanXuat NVARCHAR(100) = N'Nhà sản xuất ví dụ';
DECLARE @BaoHanh NVARCHAR(100) = N'Bảo hành 1 năm';
DECLARE @list_json_chitietsanpham NVARCHAR(MAX) = N'[{"MaChiTietDanhMuc": 13, "SoLuong": 240, "moTa": "Mô tả sản phẩm ví dụ"}]';


-- Gọi stored procedure để thêm sản phẩm
EXEC THEM_SAN_PHAM   @MaDanhMuc, @TenSanPham, @AnhDaiDien, @Gia, @NhaSanXuat, @BaoHanh, @list_json_chitietsanpham;

-- Xem thông tin sản phẩm
SELECT * FROM SanPham WHERE MaSanPham = SCOPE_IDENTITY();


-- Xem thông tin sản phẩm
SELECT * FROM SanPham WHERE MaSanPham = @MaSanPham;
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







SELECT * FROM ChiTietSanPham
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[THEM](
@MaChiTietDanhMuc INT,
@MaSanPham INT,
@SoLuong INT,
@MoTa NVARCHAR(MAX)
)
AS
SET @MaSanPham = (SELECT SCOPE_IDENTITY());
    BEGIN
       insert into ChiTietSanPham(MaChiTietDanhMuc,MaSanPham,SoLuong,MoTa)
    values(@MaChiTietDanhMuc,@MaSanPham,@SoLuong,@MoTa);
    END;



go
alter PROCEDURE GetDanhSachDanhMuc
AS
BEGIN
SELECT
    [MaDanhMuc],
    [TenDanhMuc],
    (
        SELECT 
            [MaChiTietDanhMuc],
            [TenChiTietDanhMuc]
        FROM ChiTietDanhMuc ctdm
        WHERE ctdm.MaDanhMuc = dm.MaDanhMuc
        FOR JSON PATH
    ) AS list_json_chitietdanhmuc
FROM DanhMuc dm;

end;
-- Gọi stored procedure để lấy danh sách danh mục và chi tiết danh mục cho một mã danh mục cụ thể
EXEC GetDanhSachDanhMuc;

----Lấy sản phẩm theo mã
--Create Procedure GetSanPhamById
--	@Id int
--AS
--BEGIN
--	Select * from sanpham sp 
--	Where sp.MaSanPham = @Id;
--END

--exec GetSanPhamById @Id = 15

----Lấy tất cả danh sách sản phẩm
--Create Procedure GetAllProduct
--AS
--BEGIN
--	Select * from sanpham sp 
--END

----Thêm sản phẩm mới
--Create Procedure ThemMoi
--	@name Nvarchar(300),
--	@maloai int,
--	@mota nvarchar(300),
--	@gia float,
--	@soluong int,
--	@anh Nvarchar(300),
--	@motachitiet nvarchar(300)
--AS
--BEGIN 
--	INSERT INTO SanPham(TenSanPham,Anh,MaLoai,GiaBan,SoLuong,MoTa,ChiTietSanPham) Values(@name,@anh,@maloai,@gia,@soluong,@mota,@motachitiet);
--END

--select *
--from sanpham

----Tìm sản phẩm tương tự theo mã loại
--create PROC sptuongtu
--	@id int
--AS	
--BEGIN
--	select sp.*
--	from sanpham sp inner join loaisanpham lsp on sp.MaLoai = lsp.MaLoai
--	where lsp.MaLoai = @id
--END

--Create Procedure suasanpham
--	@Ma int, 
--	@name Nvarchar(300),
--	@maloai int,
--	@gia float,
--	@soluong int,
--	@mota nvarchar(300),
--	@anh Nvarchar(300),
--	@motachitiet nvarchar(300)
--AS 
--	BEGIN
--		UPDATE SanPham
--		SET 
--			TenSanPham = @name,
--			MaLoai = @maloai,
--			MoTa = @mota,
--			Anh = @anh,
--			ChiTietSanPham = @motachitiet,
--			GiaBan = @gia,
--			SoLuong = @soluong
--		Where @Ma = MaSanPham 
--END



--CREATE Procedure xoasanpham
--	@Id int
--AS
--BEGIN
--	DELETE SanPham
--	where MaSanPham = @Id
--END

----Top những sản phẩm mới nhất
--Select top(4) *
--from SanPham 
--order by MaSanPham desc

--create procedure SanPhamMoi
--	@sl int
--as
--begin 
--	select top(@sl) *
--	from sanpham 
--	order by MaSanPham desc
--end

----Thực thi
--exec SanPhamMoi @sl = 8


----Top Sản phẩm bán chạy nhất
--Select top(2) sum(ct.SoLuong) as[Tổng số lượng] , ct.MaSanPham ,sp.TenSanPham
--from ChiTietHoaDonBan ct inner join SanPham sp on ct.MaSanPham = sp.MaSanPham
--group by ct.MaSanPham,sp.TenSanPham
--order by sum(ct.SoLuong) desc

--create procedure SanPhamBanChay
--	@sl int
--as
--begin 
--	Select top(@sl) sum(ct.SoLuong) as ['số lượng'] , ct.MaSanPham ,sp.TenSanPham,sp.Anh,sp.MaLoai,sp.GiaBan,sp.SoLuong
--	from ChiTietHoaDonBan ct inner join SanPham sp on ct.MaSanPham = sp.MaSanPham 
--	group by ct.MaSanPham,sp.TenSanPham,sp.Anh,sp.MaLoai,sp.GiaBan,sp.SoLuong
--	order by sum(ct.SoLuong) desc
--end

--exec SanPhamBanChay @sl = 3

--exec SanPhamMoi @sl = 10

----Tìm kiếm gần đúng sản phẩm theo tên và loại 
--select sp.*
--from SanPham sp inner join LoaiSanPham ls on sp.MaLoai = ls.MaLoai
--where sp.TenSanPham like N'%Võ Sĩ%' or ls.TenLoai like N'%Game Team Mobie%'

--CREATE PROCEDURE TimKiem
--    @Page INT,
--    @PageSize INT,
--    @Search NVARCHAR(50),	
--    @TotalCount INT = null,
--    @FilterCount INT = null
--AS
--BEGIN
--    SET NOCOUNT ON;

--    DECLARE @Offset INT;
--    DECLARE @Fetch INT;

--    -- Calculate offset and fetch values
--    SET @Offset = (@Page - 1) * @PageSize;
--    SET @Fetch = @Page * @PageSize;

--    -- Lấy tổng số lượng sản phẩm
--    SELECT @TotalCount = COUNT(*) FROM SanPham;

--    -- Nhận số lượng bản ghi được lọc dựa trên tiêu chí tìm kiếm
--    SELECT @FilterCount = COUNT(*)
--        FROM SanPham 
--        WHERE (@Search IS NULL OR TenSanPham LIKE '%' + @Search + '%' OR GiaBan LIKE '%' + @Search + '%' OR MoTa LIKE '%' + @Search + '%' OR ChiTietSanPham LIKE '%' + @Search + '%');

--    -- Nhận các bản ghi được phân trang dựa trên các giá trị bù và tìm nạp
--    SELECT * 
--        FROM SanPham 
--        WHERE (@Search IS NULL OR TenSanPham LIKE '%' + @Search + '%' OR GiaBan LIKE '%' + @Search + '%' OR MoTa LIKE '%' + @Search + '%' OR ChiTietSanPham LIKE '%' + @Search + '%')
--        ORDER BY MaSanPham 
--        OFFSET @Offset ROWS FETCH NEXT @Fetch ROWS ONLY;
--END;

--exec TimKiem @page =1 , @PageSize=5,@Search = 45000

----Thêm vào giỏ hàng
--CREATE PROCEDURE AddToCart
--	@MaKhachHang int,
--	@NgayTao DateTime,
--	@DiaChiNhan Nvarchar(250),
--	@TrangThai int = 0,
--	@MoTa Nvarchar(1000),
--	@TongTien float =0
--AS 
--BEGIN 
--	Insert into HoaDonBan(MaKhachHang,NgayTao,DiaChiNhan,TrangThai,MoTa,TongTien) 
--	values (@MaKhachHang,@NgayTao,@DiaChiNhan,@TrangThai,@MoTa,@TongTien)
--End

----Thêm vào chi tiết đơn hàng
--CREATE PROCEDURE ThemChiTietDonHang
--	@masanpham int,
--	@sl int,
--	@tamtinh float
--as
--	begin 
--	DECLARE @mahd int
--	select top(1) @mahd = MaHoaDon
--	from HoaDonBan
--	order by MaHoaDon desc
--	Insert into ChiTietHoaDonBan(MaSanPham,MaHoaDon,SoLuong,TamTinh) 
--	values(@MaSanPham,@mahd,@sl,@tamtinh)
--end

--CREATE PROCEDURE Check_Login
--	@tk nvarchar(500),
--	@mk nvarchar(500)
--AS
--BEGIN 
--	Select *
--	from Nguoidung
--	where username = @tk and password = @mk
--END


----Lấy loại sản phẩm theo mã loại
--CREATE PROCEDURE get_product_categoryid
--	@id int
--as
--begin
--	select * 
--	from sanpham
--	where maloai = @id
--end
--exec AddToCart @MaKhachHang = 2, @NgayTao = '01-02-2021' , @SoLuong = 5, @MaSanPham = 5,@DiaChiNhan = "Hưng Yên",@MoTa = "Khách vip"

------------------------------------------------Admin---------------------------------------------------

----Người dùng
----Lấy thông tin theo mã
--Create Procedure GetUserById
--	@Id int
--AS
--BEGIN
--	Select * from nguoidung 
--	Where MaNguoiDung = @Id;
--END

--exec GetUserById @Id = 5

----Lấy tất cả danh sách người dùng
--Create Procedure GetAllUsers
--AS
--BEGIN
--	Select * from NguoiDung 
--END

--exec GetAllUsers

----Thêm thông tin người dùng mới
--Create Procedure AddUser
--	@name Nvarchar(300),
--	@username nvarchar(300),
--	@password nvarchar(300),
--	@ngaytao datetime,
--	@dienthoai nvarchar(10),
--	@anh Nvarchar(300),
--	@diachi nvarchar(300),
--	@trangthai bit
--AS
--BEGIN 
--	INSERT INTO NguoiDung(HoTen,Anh,UserName,PassWord,NgayTao,DienThoai,DiaChi,TrangThai) Values(@name,@anh,@username,@password,@ngaytao,@dienthoai,@diachi,@trangthai);
--END

--exec AddUser @name = 'a', @username = 'a' , @password = 'a', @dienthoai = '1',@anh='a',@diachi='a',@trangthai = 'a'

--select *
--from sanpham

----Sửa thông tin người dùng
--Create Procedure suanguoidung
--	@Ma int, 
--	@name Nvarchar(300),
--	@username nvarchar(300),
--	@password nvarchar(300),
--	@ngaytao datetime,
--	@dienthoai nvarchar(10),
--	@anh Nvarchar(300),
--	@diachi nvarchar(300),
--	@trangthai bit
--AS 
--	BEGIN
--		UPDATE NguoiDung
--		SET 
--			HoTen = @name,
--			UserName = @username,
--			Anh = @anh,
--			PassWord = @password,
--			NgayTao = @ngaytao,
--			DienThoai = @dienthoai,
--			DiaChi = @diachi,
--			TrangThai = @trangthai
--		Where @Ma = MaNguoiDung 
--END

----Xóa người dùng
--CREATE Procedure xoanguoidung
--	@Id int
--AS
--BEGIN
--	DELETE NguoiDung
--	where MaNguoiDung = @Id
--END

-------Bảng loại sản phẩm
--create Procedure GetCateById
--	@Id int
--AS
--BEGIN
--	Select * from LoaiSanPham 
--	Where MaLoai = @Id;
--END

--exec GetUserById @Id = 5

----Lấy tất cả loại sản phẩm
--CREATE PROCEDURE get_all_data_category
--as
--begin
--	select *
--	from loaisanpham
--end


----Thêm loại sản phẩm mới
--Create Procedure AddCategory
--	@tenloai Nvarchar(300),
--	@mota nvarchar(1000)
--AS
--BEGIN 
--	INSERT INTO LoaiSanPham(TenLoai,MoTa) Values(@tenloai,@mota);
--END

 

----Sửa thông tin loại
--Create Procedure sualoaisanpham
--	@Ma int, 
--	@tenloai Nvarchar(300),
--	@mota nvarchar(1000)
	
--AS 
--	BEGIN
--		UPDATE LoaiSanPham
--		SET 
--			Tenloai = @tenloai,
--			MoTa = @mota
			
--		Where MaLoai = @Ma 
--END

----Xóa loại sản phẩm
--CREATE Procedure xoaloaisanpham
--	@Id int
--AS
--BEGIN
--	DELETE LoaiSanPham
--	where MaLoai = @Id
--END

-------Bảng nhà cung cấp
----Lấy thông tin nhà cung cấp theo mã
--create Procedure GetSupById
--	@Id int
--AS
--BEGIN
--	Select * from NhaCungCap 
--	Where MaNhaCungCap = @Id;
--END


----Lấy tất cả nhà cung cấp
--CREATE PROCEDURE getallsup
--as
--begin
--	select *
--	from NhaCungCap
--end


----Thêm nhà cung cấp mới
--Create Procedure AddSup
--	@hoten Nvarchar(300),
--	@diachi nvarchar(300),
--	@dienthoai nvarchar(10),
--	@email nvarchar(300)
--AS
--BEGIN 
--	INSERT INTO NhaCungCap(HoTen,DiaChi,DienThoai,Email) Values(@hoten,@diachi,@dienthoai,@email);
--END

----Sửa thông tin nhà cung cấp
--Create Procedure suanhacungcap
--	@Ma int, 
--	@hoten Nvarchar(300),
--	@diachi nvarchar(300),
--	@dienthoai nvarchar(10),
--	@email nvarchar(300)
	
--AS 
--	BEGIN
--		UPDATE NhaCungCap
--		SET 
--			HoTen = @hoten,
--			DiaChi = @diachi,
--			DienThoai = @dienthoai,
--			Email = @email
--		Where MaNhaCungCap = @Ma 
--END

----Xóa nhà cung cấp
--CREATE Procedure xoanhacungcap
--	@Id int
--AS
--BEGIN
--	DELETE NhaCungCap
--	where MaNhaCungCap = @Id
--END

------------Bảng hóa đơn nhập
----Lấy thông tin hóa đơn nhập theo mã
--create Procedure GetInputBillId
--	@Id int
--AS
--BEGIN
--	Select * from HoaDonNhap 
--	Where MaHoaDonNhap = @Id;
--END


----Lấy tất cả hóa đơn nhập
--CREATE PROCEDURE getallinputbill
--as
--begin
--	select *
--	from HoaDonNhap hd inner join NguoiDung nd on hd.MaNguoiDung = nd.MaNguoiDung
--	inner join NhaCungCap nc on hd.MaNhaCungCap = nc.MaNhaCungCap
--end

--exec getallinputbill

----Lấy tất cả thông tin chi tiết hóa đơn nhập theo id
--CREATE PROCEDURE get_all_detail_input_bill_id
--	@id int
--as
--begin
--	select *
--	from ChiTietHoaDonNhap 
--	where MaHoaDonNhap = @id 
--end

----Thêm hóa đơn nhập mới
--Create Procedure AddInputBill
--	@mancc int,
--	@manguoidung int,
--	@ngaynhap datetime
--AS
--BEGIN 
--	INSERT INTO HoaDonNhap(MaNhaCungCap,MaNguoiDung,NgayNhap) Values(@mancc,@manguoidung,@ngaynhap);
--END

----Thêm chi tiết hóa đơn nhập
--Create Procedure AddDetailInputBill
--	@mahdn int,
--	@masp int,
--	@sl int,
--	@gia float
--AS
--BEGIN 
--	INSERT INTO ChiTietHoaDonNhap(MaHoaDonNhap,MaSanPham,SoLuong,GiaNhap) 
--	Values(@mahdn,@masp,@sl,@gia);
--END

----Sửa thông tin hóa đơn nhập
--Create Procedure suahoadonnhap
--	@Ma int, 
--	@mancc int,
--	@manguoidung int,
--	@ngaynhap datetime
	
--AS 
--	BEGIN
--		UPDATE HoaDonNhap
--		SET 
--			MaNhaCungCap = @mancc,
--			MaNguoiDung = @manguoidung,
--			NgayNhap = @ngaynhap
--		Where MaHoaDonNhap = @Ma 
--END

----Xóa hóa đơn nhập
--CREATE Procedure xoahoadonnhap
--	@Id int
--AS
--BEGIN
--	DELETE HoaDonNhap
--	where MaHoaDonNhap = @Id
--END

----------Bảng khách hàng
--create proc themkhachhang
--	@username nvarchar(500),
--	@password nvarchar(500),
--	@hoten nvarchar(500),
--	@diachi nvarchar(500),
--	@sdt nvarchar(10),
--	@email nvarchar(300)
--as
--begin 
--	INSERT INTO KhachHang(UserName,PassWord,HoVaTen,DiaChi,SoDienThoai,Email) 
--	Values(@username,@password,@hoten,@diachi,@sdt,@email)
--end

--create proc getdatacusid
--	@id int
--as
--begin
--	Select *
--	from KhachHang
--	where MaKhachHang = @id
--end

--create proc checklogin
--	@tk nvarchar(200),
--	@mk nvarchar(300)
--as
--	begin
--		select *
--		from KhachHang 
--		where UserName = @tk and PassWord = @mk
--	end

--	exec checklogin @tk = 'hoang211', @mk = '123'

--	--Bảng hóa đơn bán
--CREATE PROCEDURE getallbill
--as
--begin
--	select *
--	from HoaDonBan hd inner join KhachHang kh on hd.MaKhachHang = kh.MaKhachHang
--end
----Lấy tất cả thông tin chi tiết sản phẩm theo mã hóa đơn bán 
--CREATE PROCEDURE get_all_detail_output_bill_id
--	@id int
--as
--begin
--	select *
--	from ChiTietHoaDonBan ct inner join SanPham sp on ct.MaSanPham = sp.MaSanPham
--	where ct.MaHoaDon = @id 
--end

--exec get_all_detail_output_bill_id @id = 14

----Xóa hóa đơn nhập
--CREATE Procedure xoahoadonban
--	@Id int
--AS
--BEGIN
--	DELETE HoaDonBan
--	where MaHoaDon = @Id
--END

----Sửa hóa đơn bán--
--Create Procedure suahoadonban
--	@MaHoaDon int, 
--	@MaKhachHang int,
--	@NgayTao datetime,
--	@DiaChiNhan nvarchar(50),
--	@TrangThai int,
--	@MoTa nvarchar(300),
--	@TongTien float
	
--AS 
--	BEGIN
--		UPDATE HoaDonBan
--		SET 
--			MaKhachHang = @MaKhachHang,
--			NgayTao = @NgayTao,
--			DiaChiNhan = @DiaChiNhan,
--			TrangThai = @TrangThai,
--			MoTa = @MoTa,
--			TongTien =@TongTien
--		Where MaHoaDon = @MaHoaDon 
--END
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