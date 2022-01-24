<?php

namespace App\Http\Controllers;

use App\Models\SanPham;
use App\Models\LoaiSanPham;

use Illuminate\Http\Requests;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Collection;

use App\Http\Requests\StoreSanPhamRequest;
use App\Http\Requests\UpdateSanPhamRequest;
use App\Http\Controllers\LoaiSanPhamController;

class SanPhamController extends Controller
{
    protected function FixImage(SanPham $SanPham)   
    {
        if (Storage::disk('public')->exists($SanPham->HinhAnh)) {
            $SanPham->HinhAnh= Storage::url($SanPham->HinhAnh);

        }
        else{
            $SanPham->HinhAnh='/assets/images/faces/face26.jpg';

            // $SanPham->HinhAnh=$SanPham->HinhAnh;

        }
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listSanPham=SanPham::all();
        foreach($listSanPham as $sp)
        {
            $this->FixImage($sp);

        }
        $listSanPham=SanPham::all();
        return view('Admin.LoaiSanPham',['listSanPham'=>$listSanPham]);
        // return view('Admin.SanPham_index',['listSanPham'=>$listSanPham]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        $listLoai=LoaiSanPham::all();
        return view('Admin.SanPham_create',['listLoai'=>$listLoai]);
    }

    public function themSanPham()
    {
        $listLoai=LoaiSanPham::all();
        return view('Admin.SanPham_create',['listLoai'=>$listLoai]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreSanPhamRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   
        $SanPham = new SanPham;
        // dd($SanPham);
        if($request->hasFile('hinhanh'))
        {
            $SanPham->HinhAnh=$request->file('hinhanh')->store('images/faces','public');
        }
        $this->FixImage($SanPham);


        // 
        $SanPham->fill([
            'TenSanPham'=>$request->input('tensp'),
            'Gia'=>$request->input('gia'),
            'Size'=>$request->input('size'),
            'Mau'=>$request->input('mau'),
            'SoLuong'=>$request->input('soluong'),
            'IdLoaiSanPham'=>$request->input('idloaisanpham'),
            'IdNhaCung'=>$request->input('idnhacungcap'),
            'Mota'=>$request->input('mota'),
            'TrangThai'=>$request->input('TrangThai'),
           
        ]);
        $SanPham->save();
        return Redirect::route('SanPham.show',['SanPham'=>$SanPham]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SanPham  $sanPham
     * @return \Illuminate\Http\Response
     */
    public function show(SanPham $sanPham)
    {
        $this->FixImage($sanPham);
        // $sanPham = SanPham::all();
        $ctSanPham = SanPham::where('id','=',$sanPham->id)->get();  
        $listLoai=LoaiSanPham::all();  
        
        return view('Admin.SanPham_show',[
            'ctSanPham'=>$ctSanPham,
            'SanPham'=>$sanPham,
            'listLoai'=>$listLoai,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SanPham  $sanPham
     * @return \Illuminate\Http\Response
     */
    public function edit(SanPham $sanPham)
    {
        //
        $this->FixImage($sanPham);
        $listLoai=LoaiSanPham::all();
        $suaSanPham = SanPham::where('id','=',$sanPham->id)->get();

        // $suaSanPham = $sanPham;
        
        return view('Admin.SanPham_edit',[
            'suaSanPham'=>$suaSanPham,
            'listLoai'=>$listLoai]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSanPhamRequest  $request
     * @param  \App\Models\SanPham  $sanPham
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SanPham $SanPham)
    {
        //
        // dd($SanPham);
        
        if($request->hasFile('hinhanh'))
        {
            $SanPham->HinhAnh=$request->file('hinhanh')->store('images/faces','public');
        }
        // $this->FixImage($SanPham);

        if (Storage::disk('public')->exists($SanPham->HinhAnh)) {
            $SanPham->HinhAnh= Storage::url($SanPham->HinhAnh);

        }
        else{

            $SanPham->HinhAnh=$SanPham->HinhAnh;
        }

        // $SanPham = SanPham::find($request->id);
        $SanPham->fill([
            'TenSanPham'=>$request->input('tensp'),
            'Gia'=>$request->input('gia'),
            'Size'=>$request->input('size'),
            'Mau'=>$request->input('mau'),
            'SoLuong'=>$request->input('soluong'),
            'IdLoaiSanPham'=>$request->input('idloaisanpham'),
            'IdNhaCung'=>$request->input('idnhacungcap'),
            'Mota'=>$request->input('mota'),
            'TrangThai'=>$request->input('TrangThai'),
            // 'HinhAnh'=>"",

            // 'HinhAnh'=>$request->input('hinhanh'),
        ]);
        $SanPham->save();
        return Redirect::route('SanPham.show',['SanPham'=>$SanPham]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SanPham  $sanPham
     * @return \Illuminate\Http\Response
     */
    public function destroy(SanPham $SanPham)
    {
        // dd($SanPham);
        $SanPham->delete();
         return Redirect::route('SanPham.index');
    }
}
