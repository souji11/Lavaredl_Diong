<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeySanPhamYeuthich extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('san_pham_yeu_thiches', function (Blueprint $table) {
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
        Schema::table('san_pham_yeu_thiches', function (Blueprint $table) {
            //
        });
    }
}
