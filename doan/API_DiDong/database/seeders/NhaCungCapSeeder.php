<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class NhaCungCapSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('nha_cung_caps')->insert([
            'TenNhaCungCap' => 'Nhà cung cấp 1',
            'DiaChi' => 'Địa chỉ 1',
            'SDT' => '0123456789',
            'TrangThai' => '1',]);
    }
}
