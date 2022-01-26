<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SanPham;

class APIsanphamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dsSanPham=SanPham::all();

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
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',2)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }
    public function chonGiay()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',3)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }
    public function chonTui()
    {
        $dsSanPham=SanPham::where('IdLoaiSanPham','=',4)->get();

        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPham,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}