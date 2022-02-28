<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class LoaiSanPhamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('loai_san_phams')->insert([
            'TenLoaiSanPham' => 'Quần áo',            
            'TrangThai' => '1',
        ]);
        DB::table('loai_san_phams')->insert([
            'TenLoaiSanPham' => 'Giày dép',            
            'TrangThai' => '1',
        ]);
        DB::table('loai_san_phams')->insert([
            'TenLoaiSanPham' => 'Túi xách',            
            'TrangThai' => '1',
        ]);  
        DB::table('loai_san_phams')->insert([
            'TenLoaiSanPham' => 'Trang sức',            
            'TrangThai' => '1',
        ]);   
    }
}