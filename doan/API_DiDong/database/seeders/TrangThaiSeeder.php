<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class TrangThaiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('trang_thais')->insert([            
            'TrangThai' => 'Đơn mới đặt',
        ]);
        DB::table('trang_thais')->insert([            
            'TrangThai' => 'Đơn đã xử lý',
        ]);
        DB::table('trang_thais')->insert([            
            'TrangThai' => 'Đơn đang vận chuyển',
        ]);
        DB::table('trang_thais')->insert([            
            'TrangThai' => 'Đơn đã hoàn',
        ]);
        DB::table('trang_thais')->insert([            
            'TrangThai' => 'Đơn đã hủy',
        ]);
    }
}
