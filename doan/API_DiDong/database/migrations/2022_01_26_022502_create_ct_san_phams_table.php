<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCtSanPhamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ct_san_phams', function (Blueprint $table) {
            $table->id();
            $table->unsignedBiginteger('IdSanPham');
            $table->unsignedBiginteger('IdMau');
            $table->unsignedBiginteger('IdSize');
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
        Schema::dropIfExists('ct_san_phams');
    }
}
