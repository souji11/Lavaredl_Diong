@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>SIDEBAR CON</H5>
@endsection

@section('content')

    <h1>Cập nhật mã giảm giá</h1>
    @foreach ($suaMaGiamGia as $mgg)
        <form method="post" action="" enctype="multipart/form-data">
            @csrf
            @method('PATCH')
            <input type="hidden" name="id" value="{{ $mgg->id }}">
            <label for="">Mã giảm giá: </label><input class="form-control" name="code" value="{{ $mgg->Code }}"> <br>


    <label for="">Ngày bắt đầu: </label><input type="date" class="form-control" name="ngaybatdau" value="{{ $mgg->NgayBatDau }}"> <br>
    <label for="">Ngày kết thúc: </label><input type="date" name="ngayketthuc" class="form-control"value="{{ $mgg->NgayKetThuc }}"> <br>
    <label for="">Trạng thái: </label><input type="date" name="TrangThai" class="form-control"value="{{ $mgg->TrangThai }}"> <br>
    <input type="submit" value="Xác nhận">
    </form>
    @endforeach

@endsection
