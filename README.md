# BÀI THỰC HÀNH LINUX

## 1. Thông tin sinh viên

- **Họ và tên:** Lê Phú Khang
- **Mã sinh viên:** 2400081
- **Lớp:** K4828-CNTT1
- **Môn học:** Linux và phần mềm mã nguồn mở

## 2. Giới thiệu

Bài thực hành nhằm củng cố kiến thức về hệ điều hành Linux, sử dụng lệnh Terminal, quản lý tệp và thư mục, phân quyền, lập trình Shell Script và quản lý mã nguồn bằng Git.

## 3. Cấu trúc thư mục_Linux/
├── README.md
├── backup/
├── data/
│   └── sinhvien.txt
├── logs/
│   ├── backup.log
│   └── hethong.log
└── scripts/
    ├── hethong.sh
    ├── quanlysv.sh
    └── saoluu.sh

## 4. Chức năng các chương trình

### 4.1. hethong.sh

- Hiển thị tên người dùng hiện tại.
- Hiển thị tên máy và thời gian hệ thống.
- Kiểm tra phiên bản Kernel.
- Hiển thị thông tin RAM và ổ đĩa.
- Kiểm tra kết nối mạng.
- Ghi kết quả vào file `logs/hethong.log`.

### 4.2. quanlysv.sh

- Quản lý danh sách sinh viên.
- Đọc dữ liệu từ `data/sinhvien.txt`.
- Hiển thị thông tin sinh viên.
- Thống kê kết quả học tập.
- Tính điểm trung bình và tìm sinh viên có điểm cao nhất.

### 4.3. saoluu.sh

- Kiểm tra thư mục dữ liệu.
- Nén thư mục `data` thành file `.tar.gz`.
- Kiểm tra tính hợp lệ của file sao lưu.
- Hiển thị dung lượng file sao lưu.
- Ghi nhật ký vào `logs/backup.log`.

## 5. Hướng dẫn sử dụng

### 5.1. Cấp quyền thực thi

```bash
chmod +x scripts/*.sh
```

### 5.2. Chạy chương trình kiểm tra hệ thống

```bash
./scripts/hethong.sh
```

### 5.3. Chạy chương trình quản lý sinh viên

```bash
./scripts/quanlysv.sh
```

### 5.4. Chạy chương trình sao lưu dữ liệu

```bash
./scripts/saoluu.sh
```

## 6. Kết quả thực hiện

- Các chương trình Shell Script chạy trên môi trường Ubuntu.
- Thông tin hệ thống được ghi vào file nhật ký.
- Chương trình quản lý sinh viên thực hiện các chức năng thống kê.
- Dữ liệu được nén và lưu trong thư mục `backup/`.
- Lịch sử thay đổi mã nguồn được quản lý bằng Git.

## 7. Công nghệ sử dụng

- Hệ điều hành: Ubuntu.
- Ngôn ngữ: Bash Shell Script.
- Công cụ quản lý phiên bản: Git.
- Nền tảng lưu trữ mã nguồn: GitHub.
