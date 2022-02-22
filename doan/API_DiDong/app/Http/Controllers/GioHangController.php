<?php

namespace App\Http\Controllers;

use App\Models\GioHang;
use App\Http\Requests\StoreGioHangRequest;
use App\Http\Requests\UpdateGioHangRequest;
// use GuzzleHttp\Psr7\Request;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GioHangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gh=DB::select('select * from gio_hangs, san_phams where gio_hangs.IdSanPham=san_phams.id');
        //$gh=GioHang::all();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$gh,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        // $them=GioHang::where('IdSanPham',$request->IdSanPham)->count();
        // if($them>0)
        // {
        //     return json_encode([
        //         'ThanhCong'=>false,
        //         'message'=>'chua nhap duoc',
        //     ]);
        // }
        // else
        // {
        //     $gio=new GioHang();
        //     $gio->IdSanPham=$request->IdSanPham;
        //     $gio->IdTaiKhoan=$request->IdTaiKhoan;
        //     $gio->so_luong=$request->so_luong;
        //     $gio->save();
        //     return json_encode([
        //         'ThanhCong'=>true,
        //         'data'=>$gio,
        //     ]);
        // }       
        $cartitem = GioHang::where('IdSanPham',$request->IdSanPham)->where('IdTaiKhoan',$request->IdTaiKhoan)->first();
        if($cartitem != null)
        {
            echo "đã có sản phẩm trong giỏ";
            $cartitem->so_luong += $request->so_luong;
            $cartitem->save();
        }
        else{
            $newcart = new GioHang();
            $newcart->fill([
                $newcart->IdSanPham=$request->IdSanPham,
                $newcart->IdTaiKhoan=$request->IdTaiKhoan,
                $newcart->so_luong=$request->so_luong,
            ]);
            $newcart->save();
            echo "thêm mới thành công";
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreGioHangRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreGioHangRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GioHang  $gioHang
     * @return \Illuminate\Http\Response
     */
    public function show(GioHang $gioHang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GioHang  $gioHang
     * @return \Illuminate\Http\Response
     */
    public function edit(GioHang $gioHang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateGioHangRequest  $request
     * @param  \App\Models\GioHang  $gioHang
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateGioHangRequest $request, GioHang $gioHang)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GioHang  $gioHang
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
        $cartitem = GioHang::where('IdTaiKhoan',$request->IdTaiKhoan)->where('IdSanPham',$request->IdSanPham)->delete();
        $gh=DB::select('select * from gio_hangs, san_phams where gio_hangs.IdSanPham=san_phams.id');
        //$gh=GioHang::all();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$gh,
        ]);
    }
}
