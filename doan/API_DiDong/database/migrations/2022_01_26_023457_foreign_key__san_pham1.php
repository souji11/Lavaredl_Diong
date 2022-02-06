<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeySanPham1 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ct_san_phams', function (Blueprint $table) {
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
        Schema::table('ct_san_phams', function (Blueprint $table) {
            //
        });
    }
}
