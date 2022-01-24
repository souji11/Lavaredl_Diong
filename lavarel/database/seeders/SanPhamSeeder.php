<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SanPham;
use Illuminate\Support\Facades\DB;

class SanPhamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
            // Thêm dữ liệu
            for ($i=1; $i <= 50; $i++) { 

                $sp = new SanPham;
                $sp->fill([
                    'TenSanPham'=>'Tên Sản Phẩm '.$i,
                    'Gia'=>$i*50000,
                    'MoTa'=>'Đây là mô tả của sản phẩm thứ '.$i,
                    'Size'=>'XL',
                    'Mau'=>'Xanh',                
                    'SoLuong'=>$i*8,
    
                    'IdLoaiSanPham'=>($i-1)%5+1,
    
                    'IdNhaCung'=>($i-1)%5+1,
                    
                    'HinhAnh'=>$i.'.jpg',
                    'TrangThai'=>1,
                ]);
    
               $sp->save();
            }
    }
}
