<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ForeignKeySize extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ct_san_phams', function (Blueprint $table) {
            $table->foreign('IdSize')->references('id')->on('sizes');
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
