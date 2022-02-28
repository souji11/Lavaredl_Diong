<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(
            LoaiSanPhamSeeder::class,          
        );
        $this->call(            
            NhaCungCapSeeder::class,            
        );
        $this->call(            
            SanPhamSeeder::class,           
        );
        $this->call(            
            TrangThaiSeeder::class,
        );
        $this->call(            
            TaiKhoanSeeder::class,
        );
        
    }
}
