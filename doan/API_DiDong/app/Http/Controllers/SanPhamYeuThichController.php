<?php

namespace App\Http\Controllers;

use App\Models\SanPhamYeuThich;
use App\Models\SanPham;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;



class SanPhamYeuThichController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()    
    {
        // $dsSanPhamYT=SanPhamYeuThich::where('IdTaiKhoan',$request->IdTaiKhoan)->get();
       $dsSanPhamYT=DB::select('select * from san_pham_yeu_thiches,san_phams where san_pham_yeu_thiches.IdSanPham = san_phams.id');
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPhamYT,
            
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $kt = SanPhamYeuThich::where('IdSanPham',$request->IdSanPham)->count();
        if($kt > 0)
        {
            return json_encode([
                'ThanhCong'=>false,
                'message'=>'Chua nhap dc',
            ]);
        }
        else
        {
        $SanPhamYT=new SanPhamYeuThich();
        $SanPhamYT->IdSanPham=$request->IdSanPham;
        $SanPhamYT->IdTaiKhoan=$request->IdTaiKhoan;
        $SanPhamYT->save();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$SanPhamYT,
        ]);}
    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreSanPhamYeuThichRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SanPhamYeuThich  $sanPhamYeuThich
     * @return \Illuminate\Http\Response
     */
    public function show(SanPhamYeuThich $sanPhamYeuThich)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SanPhamYeuThich  $sanPhamYeuThich
     * @return \Illuminate\Http\Response
     */
    public function edit(SanPhamYeuThich $sanPhamYeuThich)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSanPhamYeuThichRequest  $request
     * @param  \App\Models\SanPhamYeuThich  $sanPhamYeuThich
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SanPhamYeuThich $sanPhamYeuThich)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SanPhamYeuThich  $sanPhamYeuThich
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $SanPhamYT=SanPhamYeuThich::where('IdTaiKhoan',$request->IdTaiKhoan)->where('IdSanPham',$request->IdSanPham)->delete();
       
        $dsSanPhamYT=DB::select('select * from san_pham_yeu_thiches,san_phams where san_pham_yeu_thiches.IdSanPham = san_phams.id');
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsSanPhamYT,
        ]);
    }
    // public function xoa($idtk,$idsp)
        // {
        //     $SanPhamYT=SanPhamYeuThich::where('IdTaiKhoan',$idtk)->where('IdSanPham',$idsp)->delete();
        //     print($idsp);print("hahahahahah");print($idtk);
        //     // foreach($SanPhamYT as $SanPhamYT){
        //     //     $SanPhamYT->delete();
        //     // }
        //     $dsSanPhamYT=DB::select('select * from san_pham_yeu_thiches,san_phams where san_pham_yeu_thiches.IdSanPham = san_phams.id');
        //     return json_encode([
        //         'ThanhCong'=>true,
        //         'data'=>$dsSanPhamYT,
                
        //     ]);
            
            
    // }
    
}
