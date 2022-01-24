@extends('app')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <H5>Loại sản phảm</H5>
@endsection

@section('content')

{{-- <div class="col-lg-6 grid-margin stretch-card"> --}}
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
                  <a>Còn tác dụng</a>
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
{{-- </div> --}}

 
@endsection


