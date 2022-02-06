<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeyTrangThai extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('hoa_dons', function (Blueprint $table) {
            $table->foreign('IDTrangThai')->references('id')->on('trang_thais');
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
