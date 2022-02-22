<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGioHangsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gio_hangs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBiginteger('IdSanPham');
            $table->unsignedBiginteger('IdTaiKhoan');
            $table->integer('so_luong');
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
        Schema::dropIfExists('gio_hangs');
    }
}
