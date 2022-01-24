<?php

namespace App\Http\Controllers;

use App\Models\HoaDon;
use App\Http\Requests\StoreHoaDonRequest;
use App\Http\Requests\UpdateHoaDonRequest;
use App\Models\CTHoaDon;
use App\Models\SanPham;
use App\Models\TrangThai;
use Illuminate\Http\Requests;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Collection;

class HoaDonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cTHoaDon = CTHoaDon::all();
        $listHoaDon= HoaDon::all();

        if($hd=request()->timkiemid)
        {
            $listHoaDon=HoaDon::where('id','=',$hd)->paginate(15);
        }

        // if($hd=request()->timkiemten)
        // {
        //     $listHoaDon=SanPham::where('TenSanPham','like','%'.$hd.'%')->paginate(15);
        // }
        // dd($listHoaDon);
        return view('Admin.HoaDon_index',[compact('listHoaDon'),'listHoaDon'=>$listHoaDon,'cTHoaDon'=>$cTHoaDon
    ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $hoaDon=HoaDon::all();
        return view('Admin.HoaDon_index',['listHoaDon'=>$hoaDon]);
    }

    public function them(){
        $hoaDon=HoaDon::all();
        return view('Admin.HoaDon_index',['listHoaDon'=>$hoaDon]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreHoaDonRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreHoaDonRequest $request)
    {
        $hoaDon=HoaDon::all();
        $hoaDon->fill([
            'Code'=>$request->input('code'),
            'NgayLap'=>$request->input('ngaylap'),
            'DiaChiGiaoHang'=>$request->input('diachigiaohang'),
            'SDTGiaoHang'=>$request->input('sdt'),
            'IdMaGiamGia'=>$request->input('magiamgia'),
            'TongTien'=>$request->input('tongtien'),
            'TrangThai'=>$request->input('TrangThai'),
           
        ]);
        $hoaDon->save();
        return Redirect::route('HoaDon.show',['HoaDon'=>$hoaDon]);
    }





    /**
     * Display the specified resource.
     *
     * @param  \App\Models\HoaDon  $hoaDon
     * @return \Illuminate\Http\Response
     */
    public function show(HoaDon $hoaDon)
    {
        $hoaDon = HoaDon::where('id','=',$hoaDon->id)->get();  
        $listTrangThai=TrangThai::all();
        $cTHoaDon = CTHoaDon::all();
        
        return view('Admin.HoaDon_show',[
            'HoaDon'=>$hoaDon,
            'listTrangThai'=>$listTrangThai,
            'cTHoaDon'=>$cTHoaDon,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\HoaDon  $hoaDon
     * @return \Illuminate\Http\Response
     */
    public function edit(HoaDon $hoaDon)
    {
        $suaHoaDon = HoaDon::where('id','=',$hoaDon->id)->get();
        $listTrangThai = TrangThai::all();
        // $suaSanPham = $sanPham;
        
        return view('Admin.HoaDon_edit',[
            'suaHoaDon'=>$suaHoaDon,
            'listTrangThai'=>$listTrangThai
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateHoaDonRequest  $request
     * @param  \App\Models\HoaDon  $hoaDon
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, HoaDon $HoaDon)
    {
        // dd($HoaDon);
        $HoaDon->fill([
            'Code'=>$request->input('code'),
            'NgayLap'=>$request->input('ngaylap'),
            'DiaChiGiaoHang'=>$request->input('diachigiaohang'),
            'SDTGiaoHang'=>$request->input('sdt'),
            'IdMaGiamGia'=>$request->input('magiamgia'),
            'TongTien'=>$request->input('tongtien'),
            'TrangThai'=>$request->input('TrangThai'),
        ]);
        $HoaDon->save();
        return Redirect::route('HoaDon.show',['HoaDon'=>$HoaDon]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\HoaDon  $hoaDon
     * @return \Illuminate\Http\Response
     */
    public function destroy(HoaDon $hoaDon)
    {
        $hoaDon->delete();
        return Redirect::route('HoaDon.index');
    }
}
