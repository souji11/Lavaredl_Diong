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
                <th style="text-align: center">Mã giảm giá</th>                
                <th style="text-align: center">Ngày bắt đầu</th>
                <th style="text-align: center">Ngày kết thúc</th>
                {{-- <th style="text-align: center">Mô tả</th> --}}
                <th style="text-align: center">Trạng thái</th>
                <th style="text-align: center">Sửa</th>
                {{-- <th style="text-align: center">ID loại sản phẩm</th> --}}
                {{-- <th style="text-align: center">ID nhà cung cấp</th> --}}
                {{-- <th style="text-align: center">Hình ảnh</th> --}}
              </tr>
            </thead>
            <tbody> 
              
                @foreach ($listMaGiamGia as $mgg)
              
                <tr > 
                  <td> 
                    <div  style="color: rgb(8, 255, 8);text-align: center">{{ $mgg->id }}</div>
                  </td>
                  <td style="text-align: center" >
                    <div  style="color: rgb(245, 134, 139);text-align: center">{{ $mgg->Code }}</div>
                  </td>
                  <td >
                    <div style="text-align: center;color: rgb(255, 0, 191)">{{ $mgg->NgayBatDau }}</div>
                  </td>
                  {{-- <td>
                    <div style="text-align: center;color: rgb(0, 183, 255)">{{ $mgg->MoTa }}</div>
                  </td> --}}
                  <td>
                    <div style="text-align: center;color: rgb(0, 183, 255)">{{ $mgg->NgayKetThuc }}</div>
                  </td>
                  {{-- <td>
                    <div style="text-align: center;color: rgb(241, 250, 121)">{{ $mgg->TrangThai }}</div>
                  </td> --}}
                  <td style="text-align: center">                  
                    @if ($mgg->TrangThai == 1)
                    <div style="text-align: center;color: rgb(241, 250, 121)">Còn hạn sử dụng</div>
                    @elseif ($mgg->TrangThai == 2)
                    <div style="text-align: center;color: rgb(241, 250, 121)">Hết hạn sử dụng</div>
                    @endif                    
                </td>  
                  <td>
                    <a href="{{ route('MaGiamGia.edit',['MaGiamGia'=>$mgg]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
                  </td>
                  {{-- <td>
                    <a href="{{ route('HoaDon.edit',['HoaDon'=>$hd]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
                  </td> --}}
                  {{-- <td>
                    <div style="text-align: center;color: rgb(255, 255, 255)">{{ $mgg->IdMaGiamGia }}</div>
                  </td>
                  <td>
                    <div style="text-align: center; color: rgb(0, 255, 213)" >{{ $mgg->TongTien }}</div>
                  </td> --}}
                  {{-- <td>
                    <div style="text-align: center;color: rgb(134, 119, 221)">{{ $mgg->IdNhaCung }}</div>
                  </td> --}}
                  {{-- <td>
                    <div style="text-align: center;color: rgb(87, 252, 128)">{{ $mgg->HinhAnh }}</div>
                  </td> --}}
                  {{-- <td style="text-align: center">                  
                      @if ($mgg->TrangThai == 1)
                        <a >Đang xử lý</a>
                      @elseif ($mgg->TrangThai == 2)
                      <a >Đang giao hàng</a>
                      @elseif ($mgg->TrangThai == 3)
                      <a >Đã giao hàng</a>
                      @elseif ($mgg->TrangThai == 4)
                      <a >Đã hủy</a>
                      @endif                    
                  </td>  
                  <td>
                    <a href="{{ route('HoaDon.edit',['HoaDon'=>$mgg]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
                  </td> --}}
                </tr>
                @endforeach
          </table>
        </div>
      </div>
    {{-- </div> --}}


@endsection


