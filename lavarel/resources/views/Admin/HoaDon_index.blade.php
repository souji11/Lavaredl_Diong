@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <form action="" role="form">
        <div class="form-group">
            <label for="">Tìm Kiếm theo ID</label>
            <input type="search" style="color: red" class="form-control" name="timkiemid" id="" placeholder="Nhập ID hóa đơn tại đây ">
        </div>

        <button type="submit" class="btn btn-primary"><i class="fas fa-search">Tìm</i></button>
    </form>
@endsection

@section('content')

  {{-- Loại sản phẩm --}}
  {{-- <div class="col-lg-6 grid-margin stretch-card"> --}}
    <div class="card">
      <div class="card-body">
        <h2 class="card-title"  style="text-align: center">Hóa đơn </h2>
        {{-- Không hiểu tại sao ko gọi route đc nên gọi nguyên cái link
            
          --}}
        {{-- <p class="card-description"> Add class <code>.table</code>
        </p> --}}
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
                <th style="text-align: center">Sửa</th>
              </tr>
            </thead>
            <tbody> 
              
              @foreach ($listHoaDon as $hd)
              
                <tr > 
                  <td> 
                    <div  style="color: rgb(8, 255, 8);text-align: center">{{ $hd->id }}</div>
                  </td>
                  <td style="text-align: center" >
                    <a  href="{{ route('CTHoaDon.show',['CTHoaDon'=>$hd]) }}" style="color: rgb(245, 134, 139)" >
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
                    <div style="text-align: center;color: rgb(0, 183, 255)">{{ $hd->DiaChiGiaoHang }}</div>
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
                  <td>
                    <a href="{{ route('HoaDon.edit',['HoaDon'=>$hd]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
                  </td>
                </tr>
                @endforeach
          </table>
        </div>
      </div>
    {{-- </div> --}}


@endsection


