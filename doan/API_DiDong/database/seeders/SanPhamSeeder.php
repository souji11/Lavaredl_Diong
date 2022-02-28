<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
class SanPhamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('san_phams')->insert([
            'TenSanPham' => 'Quần HAHA',
            'Gia' => '100000',
            'MoTa' => 'Mô tả sản phẩm 1',
            'SoLuong' => 10,
            'IdLoaiSanPham' => 1,
            'IdNhaCung' => 1,            
            'TrangThai' => 1,
            'HinhAnh' => '/asset/face21.jpg',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'deleted_at' => Carbon::now(),
        ]);
        DB::table('san_phams')->insert([
            'TenSanPham' => 'Giày KIKI',
            'Gia' => '99000',
            'MoTa' => 'Mô tả sản phẩm ',
            'SoLuong' => '10',
            'IdLoaiSanPham' => '2',
            'IdNhaCung' => '1',            
            'TrangThai' => '1',
            'HinhAnh' => '/asset/face25.jpg',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'deleted_at' => Carbon::now(),
        ]);
        DB::table('san_phams')->insert([
            'TenSanPham' => 'Vòng LULU',
            'Gia' => '50000',
            'MoTa' => 'Mô tả sản phẩm ',
            'SoLuong' => '10',
            'IdLoaiSanPham' => '4',
            'IdNhaCung' => '1',            
            'TrangThai' => '1',
            'HinhAnh' => '/asset/face13.jpg',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'deleted_at' => Carbon::now(),
        ]);
        DB::table('san_phams')->insert([
            'TenSanPham' => 'Túi LULU',
            'Gia' => '1000000',
            'MoTa' => 'Mô tả sản phẩm ',
            'SoLuong' => '10',
            'IdLoaiSanPham' => '3',
            'IdNhaCung' => '1',            
            'TrangThai' => '1',
            'HinhAnh' => '/asset/face3.jpg',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'deleted_at' => Carbon::now(),
        ]);
    }
}
