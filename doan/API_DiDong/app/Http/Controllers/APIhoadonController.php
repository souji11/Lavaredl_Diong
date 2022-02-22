<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HoaDon;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class APIhoadonController extends Controller
{
    public function updateHoaDon(Request $request, HoaDon $HoaDon, User $User){

        $validate = Validator::make($request->all(), [
            'IDTrangThai' => ["required"],
        ]);
        if ($validate->fails())
            return response()->json($validate->errors(), 400);
        $HoaDon->fill([
            'IDTrangThai' => $request->IDTrangThai,
        ]);
        $HoaDon->save();
        dd($HoaDon);
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
    {
        $dsHoaDon = HoaDon::where('IdTaikhoan', $User->id)->get();
        
        return json_encode([
            'ThanhCong'=>true,
            'data'=>$dsHoaDon,
        ]);
    }

    public function TrangThai(Request $request,User $User)
    {   
        $dsHoaDon = HoaDon::where('IdTaikhoan', $User->id)->where('IdTrangThai','=',$request['IdTrangThai'])->get();
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
