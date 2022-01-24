<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\LoaiSanPham;

class LoaiSanPhamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Nhập dữ liệu ảo
        for ($i=1; $i <= 5; $i++) { 

            $loaiSanPham = new LoaiSanPham;
            $loaiSanPham-> fill([
                'TenLoaiSanPham'=>'Tên Loại Sản Phẩm '.$i,
                'TrangThai'=>1
            ]);
            $loaiSanPham->save();
        }
    }
}
