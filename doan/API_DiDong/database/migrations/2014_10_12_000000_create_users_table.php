<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->unique();
            $table->string('password');          
            $table->integer('GioiTinh')->nullable();
            $table->date('NgaySinh')->nullable();
            $table->string('DiaChi1')->nullable();
            $table->string('DiaChi2')->nullable();
            $table->string('SDT');
            $table->integer('Quyen')->nullable();
            $table->integer('TrangThai')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
