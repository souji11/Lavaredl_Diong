<?php

namespace App\Http\Controllers;

use App\Models\GioHang;

use App\Models\HoaDon;

use App\Models\CtHoaDon;
use App\Models\User;
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
    public function index(User $User)
    {
        $gh=DB::select('select * 
                        from gio_hangs, san_phams ,ct_san_phams,maus,sizes
                        where gio_hangs.IdSanPham=san_phams.id
                        and san_phams.id=ct_san_phams.IdSanPham
                        and ct_san_phams.IdSize=sizes.id
                        and ct_san_phams.IdMau=maus.id
                        ');
        //$gh=GioHang::all();
        //$gh=GioHang::where('IdTaiKhoan',$User->id)->with("SanPham")->with("SanPham.CtSanPham")->get();
        $total = 0;
       foreach($gh as $sp)
       {
           $total += $sp->so_luong * $sp->Gia;
       }
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$gh,
            'total' => $total
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
    
    public function cong(Request $request)
    {
        $cartitem = GioHang::where('IdSanPham',$request->IdSanPham)->where('IdTaiKhoan',$request->IdTaiKhoan)->first();
        $cartitem->so_luong+=1;
        $cartitem->save();
    }
    public function tru(Request $request)
    {
        $cartitem = GioHang::where('IdSanPham',$request->IdSanPham)->where('IdTaiKhoan',$request->IdTaiKhoan)->first();
        if($cartitem->so_luong>1)
        {
            $cartitem->so_luong-=1;
        }       
        $cartitem->save();
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
        $gh=DB::select('select * 
        from gio_hangs, san_phams ,ct_san_phams,maus,sizes
        where gio_hangs.IdSanPham=san_phams.id
        and san_phams.id=ct_san_phams.IdSanPham
        and ct_san_phams.IdSize=sizes.id
        and ct_san_phams.IdMau=maus.id
        ');
        //$gh=GioHang::all();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$gh,
        ]);
    }

    public function thanhtoan(Request $request)
    {
        $cartitem=DB::select('select * from gio_hangs, san_phams where gio_hangs.IdSanPham=san_phams.id');
        $year = date('Yy');
        $month = date('m');
        $day = date('d');
        $hour = date('h');
        $minute = date('i');
        $second = date('s');
        $orderId = $year + $month + $day + $hour + $minute + $second;
        $newHD=new HoaDon();
        $newHD->fill([
            $newHD->Code=$orderId,
            $newHD->IdTaiKhoan=$request->IdTaiKhoan,
            $newHD->NgayLap=date('Y-m-d'),
            $newHD->DiaChiGiaoHang=$request->DiaChiGiaoHang,
            $newHD->SDTGiaoHang=$request->SDTGiaoHang,
          //  $newHD->IdMaGiamGia=$request->IdMaGiamGia,
            $newHD->TongTien=$request->TongTien,
            $newHD->IdTrangThai=$request->IDTrangThai,
        ]);
        $newHD->save();
        foreach($cartitem as $c)
        {
            $newCTHD = new CtHoaDon();
            $newCTHD->fill([
                $newCTHD->IdHoaDon=$newHD->id,
                $newCTHD->IdSanPham=$c->IdSanPham,
                $newCTHD->SoLuong=$c->so_luong,
                $newCTHD->DonGia=$c->Gia,            
            ]);
            $newCTHD->save();
        }
       
    }
}