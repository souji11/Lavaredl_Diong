<?php

namespace App\Http\Controllers;

use App\Models\MaGiamGia;
use App\Http\Requests\StoreMaGiamGiaRequest;
use App\Http\Requests\UpdateMaGiamGiaRequest;
use Illuminate\Http\Requests;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Collection;
class MaGiamGiaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listMaGiamGia= MaGiamGia::all();

        if($mgg=request()->timkiemid)
        {
            $listMaGiamGia=MaGiamGia::where('id','=',$mgg)->paginate(15);
        }

        // if($hd=request()->timkiemten)
        // {
        //     $listHoaDon=SanPham::where('TenSanPham','like','%'.$hd.'%')->paginate(15);
        // }
        // dd($listHoaDon);
        return view('Admin.MaGiamGia_index',[compact('listMaGiamGia'),'listMaGiamGia'=>$listMaGiamGia
    ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $maGiamGia=MaGiamGia::all();
        return view('Admin.MaGiamGia_index',['listMaGiamGia'=>$maGiamGia]);
    }

    public function them(){
        $maGiamGia=MaGiamGia::all();
        return view('Admin.MaGiamGia_index',['listMaGiamGia'=>$maGiamGia]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreMaGiamGiaRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMaGiamGiaRequest $request)
    {
        $MaGiamGia=MaGiamGia::all();
        $MaGiamGia->fill([
            'Code'=>$request->input('code'),
            'NgayBatDau'=>$request->input('ngaybatdau'),
            'NgayKetThuc'=>$request->input('ngayketthuc'),
            'TrangThai'=>$request->input('TrangThai'),
           
        ]);
        $MaGiamGia->save();
        return Redirect::route('MaGiamGia.show',['MaGiamGia'=>$MaGiamGia]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\MaGiamGia  $maGiamGia
     * @return \Illuminate\Http\Response
     */
    public function show(MaGiamGia $MaGiamGia)
    {
        $MaGiamGia = MaGiamGia::where('id','=',$MaGiamGia->id)->get();  
        
        return view('Admin.MaGiamGia_show',[
            'MaGiamGia'=>$MaGiamGia,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\MaGiamGia  $maGiamGia
     * @return \Illuminate\Http\Response
     */
    public function edit(MaGiamGia  $MaGiamGia)
    {
        $suaMaGiamGia = MaGiamGia::where('Id','=',$MaGiamGia->Id)->get();
        // $suaSanPham = $sanPham;
        
        return view('Admin.MaGiamGia_edit',[
            'suaMaGiamGia'=>$suaMaGiamGia,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMaGiamGiaRequest  $request
     * @param  \App\Models\MaGiamGia  $maGiamGia
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, MaGiamGia $MaGiamGia)
    {
        $MaGiamGia->fill([
            'Code'=>$request->input('code'),
            'NgayBatDau'=>$request->input('ngaybatdau'),
            'NgayKetThuc'=>$request->input('ngayketthuc'),
            'TrangThai'=>$request->input('TrangThai'),
        ]);
        $MaGiamGia->save();
        return Redirect::route('MaGiamGia.show',['MaGiamGia'=>$MaGiamGia]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\MaGiamGia  $maGiamGia
     * @return \Illuminate\Http\Response
     */
    public function destroy(MaGiamGia $maGiamGia)
    {
        //
    }
}
