@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>Trang chủ</H5>
@endsection

@section('content')
{{-- Xuất tất cả các model mỗi cái xuất 5 item --}}
    <div class="row">
      {{-- Loại sản phẩm --}}
      <div class="col-lg-6 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <h4 class="card-title">Loại Sản phẩm </h4>
            {{-- <p class="card-description"> Add class <code>.table</code>
            </p> --}}
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>Tên</th>
                    <th>Trạng thái</th>
                    
                  </tr>
                </thead>
                <tbody> @for ($i=1;$i<=5;$i++)  
                  
                  {{-- @foreach ($listLoai as $loai) --}}
                  
                    <tr> 
                      <td> 
                       <a href="{{ route('LoaiSanPham.show',['LoaiSanPham'=>$listLoai[$i-1]]) }}">
                        {{ $listLoai[$i-1]->TenLoaiSanPham }}
                      </a>
                     </td>
                     <td>
                      
                      @if ($listLoai[$i-1]->TrangThai == 1)
                        <a>Còn Hàng</a>
                      @endif 
                        
                     </td>  
                    </tr>
                    
                    
                    {{-- @endforeach --}}
                    
                    @endfor
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      {{-- Sản phẩm --}}
    <div class="col-lg-6 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title">Sản phẩm </h4>
          {{-- <p class="card-description"> Add class <code>.table</code>
          </p> --}}
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>Tên</th>
                  <th>Trạng thái</th>
                  
                </tr>
              </thead>
              <tbody> @for ($i=1;$i<=5;$i++)  
                
                {{-- @foreach ($listLoai as $loai) --}}
                
                  <tr> 
                    <td> 
                     <a href="{{ route('LoaiSanPham.show',['LoaiSanPham'=>$listSP[$i-1]]) }}">
                      {{ $listSP[$i-1]->TenSanPham }}
                    </a>
                   </td>
                   <td>
                    
                    @if ($listSP[$i-1]->TrangThai == 1)
                      <a>Còn Hàng</a>
                    @endif 
                      
                   </td>  
                  </tr>
                  
                  
                  {{-- @endforeach --}}
                  
                  @endfor
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
   
  </div>
@endsection


