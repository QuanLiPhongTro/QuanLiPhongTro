
CREATE DATABASE IF NOT EXISTS quan_ly_phong_tro
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE quan_ly_phong_tro;

CREATE TABLE Phong (
    maPhong INT AUTO_INCREMENT PRIMARY KEY,
    tenPhong VARCHAR(50) NOT NULL,
    giaPhong DECIMAL(12,2) NOT NULL,
    dienTich DECIMAL(6,2),
    trangThai VARCHAR(30) DEFAULT 'Trong'
);

CREATE TABLE NguoiThue (
    maNguoiThue INT AUTO_INCREMENT PRIMARY KEY,
    hoTen VARCHAR(100) NOT NULL,
    soDienThoai VARCHAR(15),
    cccd VARCHAR(20) UNIQUE,
    diaChi VARCHAR(255)
);

CREATE TABLE HopDong (
    maHopDong INT AUTO_INCREMENT PRIMARY KEY,
    maNguoiThue INT NOT NULL,
    maPhong INT NOT NULL,
    ngayBatDau DATE NOT NULL,
    ngayKetThuc DATE,
    tienCoc DECIMAL(12,2) DEFAULT 0,
    trangThai VARCHAR(30) DEFAULT 'Con hieu luc',

    FOREIGN KEY (maNguoiThue)
        REFERENCES NguoiThue(maNguoiThue),

    FOREIGN KEY (maPhong)
        REFERENCES Phong(maPhong)
);

CREATE TABLE DichVu (
    maDichVu INT AUTO_INCREMENT PRIMARY KEY,
    tenDichVu VARCHAR(100) NOT NULL,
    donGia DECIMAL(12,2) NOT NULL,
    donViTinh VARCHAR(30)
);

CREATE TABLE HoaDon (
    maHoaDon INT AUTO_INCREMENT PRIMARY KEY,
    maHopDong INT NOT NULL,
    thang INT NOT NULL,
    nam INT NOT NULL,
    tienPhong DECIMAL(12,2) DEFAULT 0,
    tienDichVu DECIMAL(12,2) DEFAULT 0,
    tongTien DECIMAL(12,2) DEFAULT 0,
    trangThai VARCHAR(30) DEFAULT 'Chua thanh toan',

    FOREIGN KEY (maHopDong)
        REFERENCES HopDong(maHopDong),

    UNIQUE (maHopDong, thang, nam)
);

CREATE TABLE ChiTietHoaDon (
    maHoaDon INT NOT NULL,
    maDichVu INT NOT NULL,
    soLuong DECIMAL(10,2) DEFAULT 1,
    donGia DECIMAL(12,2) NOT NULL,
    thanhTien DECIMAL(12,2) NOT NULL,

    PRIMARY KEY (maHoaDon, maDichVu),

    FOREIGN KEY (maHoaDon)
        REFERENCES HoaDon(maHoaDon),

    FOREIGN KEY (maDichVu)
        REFERENCES DichVu(maDichVu)
);
