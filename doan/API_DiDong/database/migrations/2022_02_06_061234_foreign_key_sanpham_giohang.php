<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeySanphamGiohang extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('gio_hangs', function (Blueprint $table) {
            $table->foreign('IdSanPham')->references('id')->on('san_phams');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('giohang', function (Blueprint $table) {
            //
        });
    }
}
