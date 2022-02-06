<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeyNhaCungCap extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('san_phams', function (Blueprint $table) {
            $table->foreign('IdNhaCung')->references('id')->on('nha_cung_caps');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('san_phams', function (Blueprint $table) {
            //
        });
    }
}
