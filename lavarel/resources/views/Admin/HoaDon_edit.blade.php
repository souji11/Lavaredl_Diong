@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>SIDEBAR CON</H5>
@endsection

@section('content')

    <h1>Cập nhật hóa đơn</h1>

    <div class="table-responsive " >
        <table class="table table-hover"  >
          <thead>
            <tr>
              <th style="text-align: center">ID</th>    
              <th style="text-align: center">Mã hóa đơn</th>                
              <th style="text-align: center">Ngày lập</th>
              <th style="text-align: center">Địa chỉ giao hàng</th>
              {{-- <th style="text-align: center">Mô tả</th> --}}
              <th style="text-align: center">Sdt giao hàng</th>
              <th style="text-align: center">Mã giảm giá</th>
              <th style="text-align: center">Tổng tiền</th>
              {{-- <th style="text-align: center">ID loại sản phẩm</th> --}}
              {{-- <th style="text-align: center">ID nhà cung cấp</th> --}}
              {{-- <th style="text-align: center">Hình ảnh</th> --}}
              <th style="text-align: center">Trạng thái</th>
            </tr>
          </thead>
          <tbody> 
            
            @foreach ($suaHoaDon as $hd)
            
              <tr > 
                <td> 
                  <div  style="color: rgb(8, 255, 8);text-align: center">{{ $hd->id }}</div>
                </td>
                <td style="text-align: center" >
                  <a  href="{{ route('HoaDon.show',['HoaDon'=>$hd]) }}" style="color: rgb(245, 134, 139)" >
                    {{ $hd->Code }}
                  </a>
                </td>
                <td >
                  <div style="text-align: center;color: rgb(255, 0, 191)">{{ $hd->NgayLap }}</div>
                </td>
                {{-- <td>
                  <div style="text-align: center;color: rgb(0, 183, 255)">{{ $hd->MoTa }}</div>
                </td> --}}
                <td>
                  <div style="text-align: center;color: rgb(151, 132, 255)">{{ $hd->DiaChiGiaoHang }}</div>
                </td>
                <td>
                  <div style="text-align: center;color: rgb(241, 250, 121)">{{ $hd->SDTGiaoHang }}</div>
                </td>
                <td>
                  <div style="text-align: center;color: rgb(255, 255, 255)">{{ $hd->IdMaGiamGia }}</div>
                </td>
                <td>
                  <div style="text-align: center; color: rgb(0, 255, 213)" >{{ $hd->TongTien }}</div>
                </td>
                {{-- <td>
                  <div style="text-align: center;color: rgb(134, 119, 221)">{{ $hd->IdNhaCung }}</div>
                </td> --}}
                {{-- <td>
                  <div style="text-align: center;color: rgb(87, 252, 128)">{{ $hd->HinhAnh }}</div>
                </td> --}}
                <td style="text-align: center">                  
                    @if ($hd->TrangThai == 1)
                      <a >Đang xử lý</a>
                    @elseif ($hd->TrangThai == 2)
                    <a >Đang giao hàng</a>
                    @elseif ($hd->TrangThai == 3)
                    <a >Đã giao hàng</a>
                    @elseif ($hd->TrangThai == 4)
                    <a >Đã hủy</a>
                    @endif                    
                </td>  
              </tr>
              @endforeach
        </table>
      </div>

    @foreach ($suaHoaDon as $hd)
        <form method="post" action="{{ route('HoaDon.update', ['HoaDon' => $hd]) }} " enctype="multipart/form-data">
            @csrf
            @method('PATCH')
            <input type="hidden" name="code" value="{{ $hd->Code }}">
            <input type="hidden" name="ngaylap" value="{{ $hd->NgayLap }}">
            <input type="hidden" name="diachigiaohang" value="{{ $hd->DiaChiGiaoHang }}">
            <input type="hidden" name="sdt" value="{{ $hd->SDTGiaoHang }}">
            <input type="hidden" name="magiamgia" value="{{ $hd->IdMaGiamGia }}">
            <input type="hidden" name="tongtien" value="{{ $hd->TongTien }}">
            {{-- <input type="hidden" name="idloaisanpham" value="{{ $hd->IdLoaiSanPham  }}"> --}}
            <input type="hidden" name="TrangThai" value="{{ $hd->TrangThai }}">
            <label for="">Loại sản phẩm: </label>
            <select class="form-control" name="TrangThai" >
                <option value="{{ $hd->HoaDon }}">----Chọn trạng thái----</option>
                {{-- <div class="col-md-6">
                    <div class="form-group">
                      <div class="form-check">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="{{ $tt->ID }}" 
                          @if ($hd->TrangThai == $tt->id) checked @endif>
                           {{ $tt->TrangThai }} 
                        </label>
                      </div>
                    </div>
                  </div> --}}
                @foreach ($listTrangThai as $tt)
                    <option value="{{ $tt->id }}" @if ($tt->id == $hd->TrangThai)
                @endif>{{ $tt->TrangThai }}</option>
    @endforeach
    </select><br>

{{-- 

    <label for="">Giá: </label><p class="form-control" name="gia" value="{{ $hd->Gia }}"><p> <br>
    <label for="">Size: </label><input name="size" class="form-control"value="{{ $hd->Size }}"> <br>
    <label for="">Màu: </label><input name="mau"class="form-control" value="{{ $hd->Mau }}"> <br>
    <label for="">Số lượng: </label><input name="soluong"class="form-control" value="{{ $hd->SoLuong }}"> <br>
    <label for="">Mô tả</label>
    <textarea name="mota" id=""class="form-control" cols="25" rows="5">{{ $hd->MoTa }}</textarea> <br> --}}

    <input type="submit" value="Xác nhận">
    </form>
    @endforeach

@endsection
