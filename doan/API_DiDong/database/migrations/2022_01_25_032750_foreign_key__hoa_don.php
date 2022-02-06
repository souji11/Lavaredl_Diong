<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeyHoaDon extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ct_hoa_dons', function (Blueprint $table) {
            $table->foreign('IdHoaDon')->references('id')->on('hoa_dons');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ct_hoa_dons', function (Blueprint $table) {
            //
        });
    }
}
