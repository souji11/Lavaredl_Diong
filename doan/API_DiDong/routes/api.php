<?php

use App\Http\Controllers\APIcthoadon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\APIsanphamController;
use App\Http\Controllers\SanPhamYeuThichController; 
use App\Http\Controllers\APIuserController;
use App\Http\Controllers\APIhoadonController;
use App\Http\Controllers\APIcthoadonController;
use App\Http\Controllers\GioHangController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
route::get('SanPham', [APIsanphamController::class,'index']);
route::get('SanPham/giay', [APIsanphamController::class,'chonGiay']);
route::get('SanPham/ao', [APIsanphamController::class,'chonAo']);
route::get('SanPham/trangsuc', [APIsanphamController::class,'chonTrangSuc']);
route::get('SanPham/tui', [APIsanphamController::class,'chonTui']);
route::get('SanPham/moi', [APIsanphamController::class,'chonsanphammoi']);
route::get('SanPham/banchay', [APIsanphamController::class,'chonsanphambanchay']);
route::get('SanPham/noibat', [APIsanphamController::class,'chonsanphamnoibat']);

route::post('SanPhamYeuThich/ThemMoi', [SanPhamYeuThichController::class,'create']);
route::get('SanPhamYeuThich', [SanPhamYeuThichController::class,'index']);

// route::delete('SanPhamYeuThich/Xoa/{IdTaiKhoan}/{IdSanPham}', [SanPhamYeuThichController::class,'xoa']);

route::post('SanPhamYeuThich/Xoa', [SanPhamYeuThichController::class,'destroy']);

//route::delete('SanPhamYeuThich/Xoa/{IdSanPham}', [SanPhamYeuThichController::class,'xoa']);
route::get('User', [APIuserController::class,'index']);
route::post('User/register',[APIuserController::class,'register']);
route::post('User/login',[APIuserController::class,'login']);
route::get('User/user',[APIuserController::class,'user']);
route::post('User/logout',[APIuserController::class,'logout']);
route::post('User/update/{User}',[APIuserController::class,'update']);
route::post('User/changepass/{User}',[APIuserController::class,'changepass']);
route::post('User/forgotpass',[APIuserController::class,'forgotpass']);
route::get('User/{User}/HoaDon/all', [APIhoadonController::class,'index']);
route::post('HoaDon/updateHoaDon/{HoaDon}',[APIhoadonController::class,'updateHoaDon']);
route::get('User/{User}/HoaDon', [APIhoadonController::class,'TrangThai']);
route::get('GioHang', [GioHangController::class,'index']);
route::post('GioHang/cong', [GioHangController::class,'cong']);
route::post('GioHang/tru', [GioHangController::class,'tru']);
route::post('GioHang/them', [GioHangController::class,'create']);
route::post('GioHang/xoa', [GioHangController::class,'destroy']);
route::post('GioHang/thanhtoan', [GioHangController::class,'thanhtoan']);

route::post('BinhLuan/them', [APIsanphamController::class,'binhluan']);
route::get('BinhLuan/{id}', [APIsanphamController::class,'hienbinhluan']);

route::get('SanPham/xepAO/{loai}', [APIsanphamController::class,'xepAO']);
route::get('SanPham/xepTRANGSUC/{loai}', [APIsanphamController::class,'xepTRANGSUC']);
route::get('SanPham/xepGIAY/{loai}', [APIsanphamController::class,'xepGIAY']);
route::get('SanPham/xepTUI/{loai}', [APIsanphamController::class,'xepTUI']);

route::get('SanPham/chitiet/mausize', [APIsanphamController::class,'LayMauSize']);
