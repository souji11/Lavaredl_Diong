<?php

namespace App\Http\Controllers;

use App\Models\LoaiSanPham;
use App\Models\SanPham;
// use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreLoaiSanPhamRequest;
use App\Http\Requests\UpdateLoaiSanPhamRequest;

class LoaiSanPhamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $loaiSanPham= LoaiSanPham::all();
        return view('Admin.LoaiSanPham_index',['listLoai'=>$loaiSanPham]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreLoaiSanPhamRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreLoaiSanPhamRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\LoaiSanPham  $loaiSanPham
     * @return \Illuminate\Http\Response
     */

    public function show2()
    {
        $listSanPham=SanPham::all();
        return view('Admin.LoaiSanPham',['listSanPham'=>$listSanPham]);
    }

    public function show(LoaiSanPham $loaiSanPham)
    {
        $listSanPham = SanPham::where('IdLoaiSanPham','=',$loaiSanPham->id)->get();

      return view('Admin.LoaiSanPham',[
            'loaiSanPham'=>$loaiSanPham,
            'listSanPham'=>$listSanPham,
        ]);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\LoaiSanPham  $loaiSanPham
     * @return \Illuminate\Http\Response
     */
    public function edit(LoaiSanPham $loaiSanPham)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateLoaiSanPhamRequest  $request
     * @param  \App\Models\LoaiSanPham  $loaiSanPham
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateLoaiSanPhamRequest $request, LoaiSanPham $loaiSanPham)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\LoaiSanPham  $loaiSanPham
     * @return \Illuminate\Http\Response
     */
    public function destroy(LoaiSanPham $loaiSanPham)
    {
        //
    }
}
