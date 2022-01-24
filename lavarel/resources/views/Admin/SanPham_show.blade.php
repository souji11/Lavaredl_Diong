@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    
@endsection

@section('content')



    {{-- <div class="col-lg-12 grid-margin stretch-card"> --}}
        <div class="card">
          <div class="card-body">
            <h2 class="card-title" style="text-align: center">Chi Tiết sản phẩm</h2>
           
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th style="text-align: center">ID</th>                
                <th style="text-align: center">Tên</th>
                <th style="text-align: center">Giá</th>
                <th style="text-align: center">Mô tả</th>
                <th style="text-align: center">Size</th>
                <th style="text-align: center">Màu</th>
                <th style="text-align: center">Số lượng</th>
                <th style="text-align: center">ID loại sản phẩm</th>
                <th style="text-align: center">ID nhà cung cấp</th>
                <th style="text-align: center">Hình ảnh</th>
                <th style="text-align: center">Trạng thái</th>
                
                  </tr>
                </thead>
                <tbody>
                    @foreach ($ctSanPham as $ct)
              
                    <tr> 
                      <td> 
                        <div style="color: rgb(8, 255, 8);text-align: center">{{ $ct->id }}</div>
                      </td>
                      <td style="text-align: center">
                        <a href="{{ route('SanPham.show',['SanPham'=>$ct]) }} " style="color: rgb(245, 134, 139)" >
                          {{ $ct->TenSanPham }}
                        </a>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(255, 0, 191)">{{ $ct->Gia }}</div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(0, 183, 255)">{{ $ct->MoTa }}</div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(151, 132, 255)">{{ $ct->Size }}</div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(241, 250, 121)">{{ $ct->Mau }}</div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(255, 255, 255)">{{ $ct->SoLuong }}</div>
                      </td>
                      <td>
                        <div style="text-align: center; color: rgb(0, 255, 213)" >
                            @if ($listLoai[$ct->IdLoaiSanPham-1]->id==$ct->IdLoaiSanPham)
                                
                            @endif{{ $listLoai[$ct->IdLoaiSanPham-1]->TenLoaiSanPham }}
                            
                        </div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(134, 119, 221)">{{ $ct->IdNhaCung }}</div>
                      </td>
                      <td>
                        <div style="text-align: center;color: rgb(87, 252, 128)">
                          
                          <img src="{{ $ct->HinhAnh }}" style="width: 100px;max-height: 100px;object-fit: contain" alt="">
                        </div>
                      </td>
                      <td style="text-align: center">                  
                          @if ($ct->TrangThai == 1)
                            <a >Còn Hàng</a>
                          @endif                    
                      </td>  
                      
                    </tr>
                    @endforeach
                    
              </table>
            </div>
   <br>
            <a href="{{ route('SanPham.edit',['SanPham'=>$SanPham]) }}" type="button" class="btn btn-light btn-fw">Sửa</a><br><br>
        
            <form method="POST" action="{{ route('SanPham.destroy',['SanPham'=>$SanPham]) }}">
                @csrf
                @method('DELETE')
                <button class="btn btn-light btn-fw" type="submit">Xóa</button>
            </form>
          </div>
          
        </div>
      {{-- </div> --}} 
@endsection


