<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSanPhamYeuThichesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('san_pham_yeu_thiches', function (Blueprint $table) {
            $table->id();
            $table->unsignedBiginteger('IdSanPham');
            $table->unsignedBiginteger('IdTaiKhoan');
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
        Schema::dropIfExists('san_pham_yeu_thiches');
    }
}
