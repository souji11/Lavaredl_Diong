<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCtHoaDonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ct_hoa_dons', function (Blueprint $table) {
            $table->id();
            $table->unsignedBiginteger('IdHoaDon');
            $table->unsignedBiginteger('IdSanPham');
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
        Schema::dropIfExists('ct_hoa_dons');
    }
}
