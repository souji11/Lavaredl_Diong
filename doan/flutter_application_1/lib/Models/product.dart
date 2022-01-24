// ignore_for_file: file_names, non_constant_identifier_names

class Product {
  final int ID;
  final String TenSanPham;
  final int Gia;
  final String Mota;
  final String Size;
  final String Mau;
  final int SoLuong;
  final int IdLoaiSanPham;
  final int IDBinhLuan;
  final int IdNhaCungCap;
  final String ImgUrl;
  final bool TrangThai;

  Product({
    required this.ID,
    required this.TenSanPham,
    required this.Gia,
    required this.Mota,
    required this.Size,
    required this.Mau,
    required this.SoLuong,
    required this.IDBinhLuan,
    required this.IdLoaiSanPham,
    required this.IdNhaCungCap,
    required this.ImgUrl,
    required this.TrangThai,
  });
}

final List<Product> products = [
  Product(
    ID: 1,
    TenSanPham: 'So1',
    Gia: 50000,
    Mota: 'dep',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 1,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo0.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 2,
    TenSanPham: 'So2',
    Gia: 50000,
    Mota: 'dep',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 2,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo1.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 3,
    TenSanPham: 'So3',
    Gia: 50000,
    Mota: 'dep3',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 3,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo5.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 4,
    TenSanPham: 'So4',
    Gia: 50000,
    Mota: 'dep3',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 4,
    IdNhaCungCap: 1,
    ImgUrl: 'anime.jpg',
    TrangThai: true,
  ),
];
final List<Product> products2 = [
  Product(
    ID: 1,
    TenSanPham: 'So1',
    Gia: 50000,
    Mota: 'dep',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 1,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo0.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 2,
    TenSanPham: 'So2',
    Gia: 50000,
    Mota: 'dep',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 2,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo1.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 3,
    TenSanPham: 'So3',
    Gia: 50000,
    Mota: 'dep3',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 3,
    IdNhaCungCap: 1,
    ImgUrl: 'Jisoo5.jpg',
    TrangThai: true,
  ),
  Product(
    ID: 4,
    TenSanPham: 'So4',
    Gia: 50000,
    Mota: 'dep3',
    Size: 'XXL',
    Mau: 'den',
    SoLuong: 100,
    IDBinhLuan: 1,
    IdLoaiSanPham: 4,
    IdNhaCungCap: 1,
    ImgUrl: 'anime.jpg',
    TrangThai: true,
  ),
];
