<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSanPhamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('san_phams', function (Blueprint $table) {
            $table->id();
            $table->string('TenSanPham');
            $table->integer('Gia');
            $table->longText('MoTa');
            $table->integer('SoLuong');
            $table->unsignedBiginteger('IdLoaiSanPham');
            $table->unsignedBiginteger('IdNhaCung');
            $table->string('HinhAnh');
            $table->integer('TrangThai');
            
            $table->timestamps();
            $table->softDeletes();//trạng thái xóa
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('san_phams');
    }
}
