## 3. Phân tích bài toán

### 3.1. Phân tích các đối tượng

Hệ thống quản lý phòng trọ gồm các đối tượng chính sau:

#### Phòng
Dùng để lưu thông tin các phòng trọ.

Các thuộc tính chính:

- `maPhong`: Mã phòng
- `tenPhong`: Tên phòng
- `giaPhong`: Giá thuê phòng
- `dienTich`: Diện tích phòng
- `trangThai`: Trạng thái phòng

#### Người thuê
Dùng để lưu thông tin của người đang thuê phòng.

Các thuộc tính chính:

- `maNguoiThue`: Mã người thuê
- `hoTen`: Họ và tên
- `soDienThoai`: Số điện thoại
- `cccd`: Căn cước công dân
- `diaChi`: Địa chỉ

#### Hợp đồng
Dùng để lưu thông tin việc thuê phòng giữa người thuê và phòng.

Các thuộc tính chính:

- `maHopDong`: Mã hợp đồng
- `maNguoiThue`: Mã người thuê
- `maPhong`: Mã phòng
- `ngayBatDau`: Ngày bắt đầu thuê
- `ngayKetThuc`: Ngày kết thúc hợp đồng
- `tienCoc`: Tiền đặt cọc
- `trangThai`: Trạng thái hợp đồng

#### Dịch vụ
Dùng để quản lý các dịch vụ phát sinh trong quá trình thuê phòng như điện, nước, Internet.

Các thuộc tính chính:

- `maDichVu`: Mã dịch vụ
- `tenDichVu`: Tên dịch vụ
- `donGia`: Đơn giá
- `donViTinh`: Đơn vị tính

#### Hóa đơn
Dùng để quản lý các khoản tiền người thuê cần thanh toán theo tháng.

Các thuộc tính chính:

- `maHoaDon`: Mã hóa đơn
- `maHopDong`: Mã hợp đồng
- `thang`: Tháng lập hóa đơn
- `nam`: Năm lập hóa đơn
- `tienPhong`: Tiền phòng
- `tienDichVu`: Tiền dịch vụ
- `tongTien`: Tổng tiền
- `trangThai`: Trạng thái thanh toán

Ngoài các đối tượng chính, hệ thống sử dụng thêm `ChiTietHoaDon` để lưu các dịch vụ xuất hiện trong từng hóa đơn.

---

### 3.2. Phân tích mối quan hệ giữa các đối tượng

#### Người thuê - Hợp đồng
Một người thuê có thể có nhiều hợp đồng ở các thời điểm khác nhau.

Mỗi hợp đồng chỉ thuộc về một người thuê.

**Quan hệ: 1 - N**

```text
NguoiThue 1 -------- N HopDong
```

#### Phòng - Hợp đồng
Một phòng có thể có nhiều hợp đồng theo thời gian.

Mỗi hợp đồng chỉ thuộc về một phòng.

**Quan hệ: 1 - N**

```text
Phong 1 -------- N HopDong
```

#### Hợp đồng - Hóa đơn
Một hợp đồng có thể phát sinh nhiều hóa đơn theo từng tháng.

Mỗi hóa đơn chỉ thuộc về một hợp đồng.

**Quan hệ: 1 - N**

```text
HopDong 1 -------- N HoaDon
```

#### Hóa đơn - Dịch vụ
Một hóa đơn có thể gồm nhiều dịch vụ.

Một dịch vụ cũng có thể xuất hiện trong nhiều hóa đơn khác nhau.

Đây là quan hệ **N - N**, do đó sử dụng bảng trung gian `ChiTietHoaDon`.

```text
HoaDon 1 ---- N ChiTietHoaDon N ---- 1 DichVu
```

---

### 3.3. UML Class Diagram

Sơ đồ UML Class Diagram mô tả các đối tượng chính và mối quan hệ giữa các đối tượng trong hệ thống quản lý phòng trọ.

Các lớp chính gồm:

- `Phong`
- `NguoiThue`
- `HopDong`
- `DichVu`
- `HoaDon`
- `ChiTietHoaDon`

Sơ đồ UML được lưu tại:

```text
docs/class_diagram.png
```

<img width="665" height="779" alt="image" src="https://github.com/user-attachments/assets/68d03d0c-f81c-4366-82fa-794d416c6c90" />


---

## 4. Xây dựng cơ sở dữ liệu

Cơ sở dữ liệu được xây dựng dựa trên các đối tượng và mối quan hệ đã phân tích ở câu 3.

Các bảng trong cơ sở dữ liệu gồm:

- `Phong`
- `NguoiThue`
- `HopDong`
- `DichVu`
- `HoaDon`
- `ChiTietHoaDon`

Trong đó:

- `HopDong.maNguoiThue` là khóa ngoại tham chiếu đến `NguoiThue.maNguoiThue`.
- `HopDong.maPhong` là khóa ngoại tham chiếu đến `Phong.maPhong`.
- `HoaDon.maHopDong` là khóa ngoại tham chiếu đến `HopDong.maHopDong`.
- `ChiTietHoaDon.maHoaDon` là khóa ngoại tham chiếu đến `HoaDon.maHoaDon`.
- `ChiTietHoaDon.maDichVu` là khóa ngoại tham chiếu đến `DichVu.maDichVu`.

File cơ sở dữ liệu SQL được lưu tại:

```text
database/quan_ly_phong_tro.sql
```

Cấu trúc thư mục:

```text
QuanLiPhongTro/
├── README.md
├── database/
│   └── quan_ly_phong_tro.sql
└── docs/
    └── class_diagram.png
```
