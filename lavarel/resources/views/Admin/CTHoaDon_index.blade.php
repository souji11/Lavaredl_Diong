@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    
@endsection

@section('content')

  {{-- Loại sản phẩm --}}
  {{-- <div class="col-lg-6 grid-margin stretch-card"> --}}
    <div class="card">
      <div class="card-body">
        <h2 class="card-title"  style="text-align: center">Chi tiết hóa đơn </h2>
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
                <th style="text-align: center">Mã sản phẩm</th>
                <th style="text-align: center">Số lượng</th>
                {{-- <th style="text-align: center">Mô tả</th> --}}
                <th style="text-align: center">Đơn giá</th>
                {{-- <th style="text-align: center">ID loại sản phẩm</th> --}}
                {{-- <th style="text-align: center">ID nhà cung cấp</th> --}}
                {{-- <th style="text-align: center">Hình ảnh</th> --}}
              </tr>
            </thead>
            <tbody> 
              
              @foreach ($CTHoaDon as $cthd)
              
                <tr > 
                  <td> 
                    <div  style="color: rgb(8, 255, 8);text-align: center">{{ $cthd->id }}</div>
                  </td>
                  <td style="text-align: center" >
                    <div  style="color: rgb(245, 134, 139);text-align: center">{{ $cthd->IdHoaDon }}</div>
                  </td>
                  <td >
                    <div style="text-align: center;color: rgb(255, 0, 191)">{{ $cthd->IdSanPham }}</div>
                  </td>
                  {{-- <td>
                    <div style="text-align: center;color: rgb(0, 183, 255)">{{ $cthd->MoTa }}</div>
                  </td> --}}
                  <td>
                    <div style="text-align: center;color: rgb(0, 183, 255)">{{ $cthd->SoLuong }}</div>
                  </td>
                  <td>
                    <div style="text-align: center;color: rgb(241, 250, 121)">{{ $cthd->DonGia }}</div>
                  </td>
                  {{-- <td>
                    <div style="text-align: center;color: rgb(255, 255, 255)">{{ $cthd->IdMaGiamGia }}</div>
                  </td>
                  <td>
                    <div style="text-align: center; color: rgb(0, 255, 213)" >{{ $cthd->TongTien }}</div>
                  </td> --}}
                  {{-- <td>
                    <div style="text-align: center;color: rgb(134, 119, 221)">{{ $cthd->IdNhaCung }}</div>
                  </td> --}}
                  {{-- <td>
                    <div style="text-align: center;color: rgb(87, 252, 128)">{{ $cthd->HinhAnh }}</div>
                  </td> --}}
                  {{-- <td style="text-align: center">                  
                      @if ($cthd->TrangThai == 1)
                        <a >Đang xử lý</a>
                      @elseif ($cthd->TrangThai == 2)
                      <a >Đang giao hàng</a>
                      @elseif ($cthd->TrangThai == 3)
                      <a >Đã giao hàng</a>
                      @elseif ($cthd->TrangThai == 4)
                      <a >Đã hủy</a>
                      @endif                    
                  </td>  
                  <td>
                    <a href="{{ route('HoaDon.edit',['HoaDon'=>$cthd]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
                  </td> --}}
                </tr>
                @endforeach
          </table>
        </div>
      </div>
    {{-- </div> --}}


@endsection


