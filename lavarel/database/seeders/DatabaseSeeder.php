<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Database\Seeders\LoaiSanPhamSeeder;
use Database\Seeders\SanPhamSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        $this->call([
            LoaiSanPhamSeeder::class,
            SanPhamSeeder::class,
            
        ]);
        

    }
}
