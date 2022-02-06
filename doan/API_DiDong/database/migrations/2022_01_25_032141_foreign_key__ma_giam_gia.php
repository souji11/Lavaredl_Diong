<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeyMaGiamGia extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('hoa_dons', function (Blueprint $table) {
            $table->foreign('IdMaGiamGia')->references('id')->on('ma_giam_gias');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('hoa_dons', function (Blueprint $table) {
            //
        });
    }
}
