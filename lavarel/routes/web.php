<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Controller;
use App\Http\Controllers\HoaDonController;
use \App\Http\Controllers\HomeController;
use \App\Http\Controllers\LoaiSanPhamController;
use \App\Http\Controllers\SanPhamController;
use \App\Http\Controllers\CTHoaDonController;
use \App\Http\Controllers\MaGiamGiaController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/', [HomeController::class,'index']);

route::get('danhsachSanPham',[LoaiSanPhamController::class,'show2']);

route::get('danhsachLoaiSanPham',[LoaiSanPhamController::class,'index']);

route::get('danhsachHoaDon',[HoaDonController::class,'index']);

route::get('LoaiSanPham/{loaiSanPham}',[LoaiSanPhamController::class,'show']);

route::get('SanPham/{sanPham}',[SanPhamController::class,'show']);

route::get('SanPham/{sanPham}/edit',[SanPhamController::class,'edit']);

route::get('SanPham/create',[SanPhamController::class,'create']);

route::get('ThemSanPham',[SanPhamController::class,'themSanPham']);

route::get('HoaDon/{hoaDon}/edit',[HoaDonController::class,'edit']);

route::get('HoaDon/{hoaDon}',[HoaDonController::class,'show']);

route::get('danhsachCTHoaDon',[CTHoaDonController::class,'index']);

route::get('CTHoaDon/{CTHoaDon}',[CTHoaDonController::class,'show']);

route::get('MaGiamGia/{maGiamGia}/edit',[MaGiamGiaController::class,'edit']);

route::get('danhsachMaGiamGia123',[MaGiamGiaController::class,'index']);

route::get('MaGiamGia/{maGiamGia}',[MaGiamGiaController::class,'show']);

route::get('MaGiamGia/create',[MaGiamGiaController::class,'create']);

route::get('MaGiamGia',[MaGiamGiaController::class,'themMaGiamGia']);

Route::resource('LoaiSanPham', LoaiSanPhamController::class);
Route::resource('SanPham', SanPhamController::class);
Route::resource('HoaDon', HoaDonController::class);
Route::resource('CTHoaDon', CTHoaDonController::class);
Route::resource('MaGiamGia', MaGiamGiaController::class);