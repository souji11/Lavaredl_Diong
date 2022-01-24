<?php

namespace App\Http\Controllers;

use App\Models\CTHoaDon;
use App\Http\Requests\StoreCTHoaDonRequest;
use App\Http\Requests\UpdateCTHoaDonRequest;
use App\Models\HoaDon;
use App\Models\SanPham;
use App\Models\TrangThai;
use Illuminate\Http\Requests;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Collection;
class CTHoaDonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $CTHoaDon = CTHoaDon::all();
        $hoaDon= HoaDon::all();
        $sanpham = SanPham::all();
        return view('Admin.CTHoaDon_index',['listHoaDon'=>$hoaDon,
        'CTHoaDon'=>$CTHoaDon, 'sanPham'=>$sanpham
    ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $cTHoaDon=CTHoaDon::all();
        return view('Admin.CTHoaDon_index',['listCTHoaDon'=>$cTHoaDon]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCTHoaDonRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCTHoaDonRequest $request)
    {
        $ctHoaDon=CTHoaDon::all();
        $ctHoaDon->fill([
            'IdHoaDon'=>$request->input('mahoadon'),
            'IdSanPham'=>$request->input('masanpham'),
            'SoLuong'=>$request->input('soluong'),
            'DonGia'=>$request->input('dongia'),
           
        ]);
        $ctHoaDon->save();
        return Redirect::route('CTHoaDon.show',['CTHoaDon'=>$ctHoaDon]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CTHoaDon  $cTHoaDon
     * @return \Illuminate\Http\Response
     */
    public function show(CTHoaDon $CTHoaDon)
    {
 
        // $hoaDon = HoaDon::all();
        $listHoaDon = CTHoaDon::where('IdHoaDon','=',$CTHoaDon->id)->get();  

        // $listSanPham = SanPham::where('IdLoaiSanPham','=',$loaiSanPham->id)->get();
        // $listTrangThai=TrangThai::all();
        // $cTHoaDon = CTHoaDon::all();
        // dd($CTHoaDon);
        return view('Admin.CTHoaDon_show',[
            // 'HoaDon'=>$hoaDon,
            // 'listTrangThai'=>$listTrangThai,
            'CTHoaDon'=>$listHoaDon,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CTHoaDon  $cTHoaDon
     * @return \Illuminate\Http\Response
     */
    public function edit(CTHoaDon $cTHoaDon)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCTHoaDonRequest  $request
     * @param  \App\Models\CTHoaDon  $cTHoaDon
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCTHoaDonRequest $request, CTHoaDon $cTHoaDon)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CTHoaDon  $cTHoaDon
     * @return \Illuminate\Http\Response
     */
    public function destroy(CTHoaDon $cTHoaDon)
    {
        //
    }
}
