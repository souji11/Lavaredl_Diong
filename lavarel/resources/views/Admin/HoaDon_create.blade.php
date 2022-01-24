@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>SIDEBAR CON</H5>
@endsection

@section('content')

    <h1>Điền thông tin hóa đơn</h1>
    
        <form method="post" action="{{ route('HoaDon.store') }} " enctype="multipart/form-data">
            @csrf        
            <label for="">Mã hóa đơn: </label><input class="form-control" name="code" value=""> <br>

    <label for="">Ngày lập</label>
    <input type="" class="form-control" name="ngaylap" value=""><br>
      
    

    <label for="">Địa chỉ giao hàng: </label>
    <input class="form-control" name="diachigiaohang" value=""> <br>
    
    <label for="">Sdt giao hàng: </label>
    <input name="sdt" class="form-control"value=""> <br>
    
    <label for="">Mã giảm giá: </label>
    <input name="magiamgia"class="form-control" value=""> <br>
    
    <label for="">Tổng tiền: </label>
    <input name="tongtien"class="form-control" value=""> <br>

    <label for="">Trạng thái</label>
    <input type="" class="form-control" name="TrangThai" value=""><br>

    <input type="submit" value="Xác nhận">
    </form>
    

@endsection
