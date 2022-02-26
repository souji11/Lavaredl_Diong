<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SanPham;
use App\Models\binhluan;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
class APIsanphamController extends Controller
{
    public function index()
    {
        $dsSanPham=SanPham::all();
        // foreach($dsSanPham as $sp)
        // {
        //     $this->FixImage($sp);

        // }
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }
    public function chonAo()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',1)->get();

        return json_encode([
            'ThanhCong'=>true,
            'dataao'=>$dsSanPham,
        ]);
    }
    public function chonTrangSuc()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',4)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }
    public function chonGiay()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',2)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }
    public function chonTui()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',3)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }

    public function chonsanphammoi()
    {   
        // $dsSanPham=SanPham::all();
        $dsSanPhamMoi=SanPham::orderBy('created_at','desc')->take(10)->get();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPhamMoi,
        ]);
    }
    public function chonsanphamnoibat()
    {
        $dsSanPhamNoiBat=SanPham::orderBy('Gia','desc')->take(10)->get();
        // $dsSanPhamNoiBat=DB::table('san_phams')->orderBy('Gia','asc')->get();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPhamNoiBat,
        ]);
    }
    public function chonsanphambanchay()
    {
        $dsSanPhamBanChay=SanPham::orderBy('Gia','asc')->take(10)->get();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPhamBanChay,
        ]);
    }

    public function binhluan(Request $request)
    {
       $binhluan = new binhluan();
       $binhluan->IdTaiKhoan=$request->IdTaiKhoan;
       $binhluan->IdSanPham=$request->IdSanPham;
       $binhluan->NoiDung=$request->NoiDung;
       $binhluan->save();
       return json_encode([
        'ThanhCong'=>true,
        'data'=>$binhluan,
    ]);     
    }
    public function hienbinhluan(int $id)    
    {
        // $dsbinhluan=binhluan::where('IdSanPham',$request->id)->get();
        // $dsbinhluan=binhluan::all();
        $dsbinhluan=DB::select('select * from binh_luans where IdSanPham = ?',[$id]);
        // $dsbinhluan=binhluan::where('IdSanPham',$request->IdSanPham)->get();
        // $dsbinhluan= DB::table('binh_luans')->where('IdSanPham',$request->id)->get();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsbinhluan,
        ]);
    }   
}
