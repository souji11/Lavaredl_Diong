<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBinhluan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('binh_luans', function (Blueprint $table) {
            $table->id();           
            $table->unsignedBiginteger('IdTaiKhoan');
            $table->unsignedBiginteger('IdSanPham');
            $table->longText('NoiDung');
            $table->timestamps();
            $table->softDeletes();
           
        });
        Schema::table('binh_luans', function (Blueprint $table) {
            $table->foreign('IdSanPham')->references('id')->on('san_phams');
        });
        Schema::table('binh_luans', function (Blueprint $table) {
            $table->foreign('IdTaiKhoan')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('binh_luans', function (Blueprint $table) {
            //
        });
        Schema::dropIfExists('binh_luans');
    }
}
