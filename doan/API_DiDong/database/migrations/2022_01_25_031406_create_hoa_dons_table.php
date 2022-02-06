<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHoaDonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hoa_dons', function (Blueprint $table) {
            $table->id();
            $table->string('Code');
            $table->unsignedBiginteger('IdTaiKhoan');
            $table->date('NgayLap');
            $table->longText('DiaChiGiaoHang');
            $table->longText('SDTGiaoHang');
            $table->unsignedBiginteger('IdMaGiamGia');
            $table->double('TongTien');
            $table->unsignedBiginteger('IDTrangThai');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hoa_dons');
    }
}
