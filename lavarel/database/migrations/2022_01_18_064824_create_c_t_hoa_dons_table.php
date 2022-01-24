<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCTHoaDonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_t_hoa_dons', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('IdHoaDon');
            $table->bigInteger('IdSanPham');
            $table->integer('SoLuong');
            $table->double('DonGia');
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
        Schema::dropIfExists('c_t_hoa_dons');
    }
}
