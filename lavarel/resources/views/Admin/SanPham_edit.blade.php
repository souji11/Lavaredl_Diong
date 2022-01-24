@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>SIDEBAR CON</H5>
@endsection

@section('content')

    <h1>Cập nhật sản phẩm</h1>
    @foreach ($suaSanPham as $sp)
        <form method="post" action="{{ route('SanPham.update', ['SanPham' => $sp]) }} " enctype="multipart/form-data">
            @csrf
            @method('PATCH')
            <input type="hidden" name="idsanpham" value="{{ $sp->id }}">
            <input type="hidden" name="idnhacungcap" value="{{ $sp->IdNhaCung }}">
            {{-- <input type="hidden" name="idloaisanpham" value="{{ $sp->IdLoaiSanPham  }}"> --}}
            <input type="hidden" name="TrangThai" value="{{ $sp->TrangThai }}">
            <label for="">Tên sản phẩm: </label><input class="form-control" name="tensp" value="{{ $sp->TenSanPham }}"> <br>
            
            <label for="">Loại sản phẩm: </label>
    @foreach ($HoaDon as $hd)
            <select class="form-control" name="idloaisanpham" >
                <option value="{{ $sp->IdLoaiSanPham }}">----Chọn loại----</option>

                @foreach ($listLoai as $loai)
                    <option value="{{ $loai->id }}" @if ($loai->id == $sp->IdLoaiSanPham)

                @endif>{{ $loai->TenLoaiSanPham }}</option>
    @endforeach
    </select><br>


    <label for="">Giá: </label><input class="form-control" name="gia" value="{{ $sp->Gia }}"> <br>
    <label for="">Size: </label><input name="size" class="form-control"value="{{ $sp->Size }}"> <br>
    <label for="">Màu: </label><input name="mau"class="form-control" value="{{ $sp->Mau }}"> <br>
    <label for="">Số lượng: </label><input name="soluong"class="form-control" value="{{ $sp->SoLuong }}"> <br>
    <label for="">Mô tả</label>
    <textarea name="mota" id=""class="form-control" cols="25" rows="5">{{ $sp->MoTa }}</textarea> <br>

    <label for="">Hình</label>
    <img style="width: 100px;max-height: 100px;object-fit: contain" src="{{ $sp->HinhAnh }}"><br>
    <input type="file" class="form-control"  name="hinhanh" value="{{ $sp->HinhAnh }}"><br>

    <input type="submit" value="Xác nhận">
    </form>
    @endforeach

@endsection
