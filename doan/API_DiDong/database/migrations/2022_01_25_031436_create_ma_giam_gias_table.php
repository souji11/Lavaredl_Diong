<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMaGiamGiasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ma_giam_gias', function (Blueprint $table) {
            $table->id();
            $table->longText('Code');
            $table->date('NgayBatDau');
            $table->date('NgayKetThuc');
            $table->integer('Giam');
            $table->integer('TrangThai');
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
        Schema::dropIfExists('ma_giam_gias');
    }
}
