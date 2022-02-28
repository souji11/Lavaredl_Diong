<?php

namespace App\Http\Controllers;

use App\Models\CtHoaDon;
use Illuminate\Http\Request;
use App\Models\HoaDon;
use App\Models\User;
use App\Models\SanPham;
use Hamcrest\Core\HasToString;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class APIhoadonController extends Controller
{
    public function updateHoaDon(HoaDon $HoaDon){
        //  dd($HoaDon);
        $HoaDon->fill([
            'IDTrangThai' => 5,
        ]);
        $HoaDon->save();
        
        $data = $HoaDon;
        if (!empty($data))
            return response()->json($data, 200);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(User $User)
    // public function index(Request $request)
    {
        $dsHoaDon = HoaDon::where('IdTaikhoan', $User->id)->with("CtHoaDon")->with("CtHoaDon.SanPham")->get();
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsHoaDon,
        ]);
    }

    public function TrangThai(Request $request,User $User)
    {   
        $dsHoaDon = HoaDon::where('IdTaikhoan', $User->id)->with("CtHoaDon")->with("CtHoaDon.SanPham")->where('IdTrangThai','=',$request['IdTrangThai'])->get();
        // dd($dsHoaDon);
            return json_encode([
                'ThanhCong'=>true,
                'data'=>$dsHoaDon,
            ]);

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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
