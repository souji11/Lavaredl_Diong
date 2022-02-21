<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use phpDocumentor\Reflection\PseudoTypes\True_;

class APIuserController extends Controller
{
    public function register(Request $request){
        
        $validate = Validator::make($request->all(), [
            'email' => ["required", "unique:users,email","Email"],
            'SDT' => ['required',"unique:users,SDT" ,'numeric'],
            'password'=>["required"],
        ]);
        if ($validate->fails())
        return response()->json($validate->errors(), 400);

        $user = User::firstOrCreate([
            'SDT'       => strip_tags($request->SDT),
            'email'       => strip_tags($request->email),
        ], [
            'password'         => strip_tags($request->password),
            'name' => '',
            'NgaySinh' => date('Y-m-d H:i:s'),
            'GioiTinh' => 0,
            "DiaChi1" => "",
            "DiaChi2" => "",
            "Quyen" => 1,
            "TrangThai" => 1,
        ]);

        $data = $user;
        if (!empty($data))
            return response()->json($data, 200);
    }


    public function login(Request $request)
    {
        $user = User::where('password', $request->password)
            ->Where(function ($query) use ($request) {
                $query->orwhere('email', $request->email)
                    ->orwhere('SDT', $request->SDT);
            })
            ->first();
        if (!empty($user))
            return response()->json($user, 200);
        return response()->json([], 404);
    }

    public function update(Request $request, User $User){
        // dd($User);
        $validate = Validator::make($request->all(), [
            'email' => ["required", "Email"],
            'SDT' => ['required', 'numeric'],
            'name' => [],
            'NgaySinh' => ["date"],
            'GioiTinh' => ["boolean"],
            'DiaChi1' => [],
            'DiaChi2' => [],
        ]);
        if ($validate->fails())
            return response()->json($validate->errors(), 400);
        $User->fill([
            'email' => $request->email,
            'SDT' => $request->SDT,
            'name' => $request->name,
            'NgaySinh' => $request->NgaySinh,
            'GioiTinh' => $request->GioiTinh,
            'DiaChi1' => $request->DiaChi1,
            'DiaChi2' => $request->DiaChi2,
        ]);
        $User->save();

        $data = $User;
        if (!empty($data))
            return response()->json($data, 200);
    }

    public function changepass (Request $request, User $User){
        $validate = Validator::make($request->all(), [
            'oldPass'=>'required',
            'newPass'=>'required',
            'newPassConfirm'=>'required|same:newPass',
        ]);

        
        if($validate->fails())
            return response()->json($validate->errors(),400);

        if ($User->password != $request->oldPass)
            return response()->json(['oldPass' => "Mật khẩu cũ không trùng khớp"], 400);

        else if ($User->password == $request->newPass)
            return response()->json(['newPass'=>"Mật khẩu cũ trùng với mật khẩu mới"], 400);

        $User->fill(["password" => $request->newPass]);

        $User->save();

        if(!empty($User))
            return response()->json($User,200);
    }

    public function forgotpass(Request $request){
        $validate = Validator::make($request->all(), [
            'email'=>'required',
            'SDT'=>'required',
            'oldPass'=>'required',
            'newPass'=>'required',
            'newPassConfirm'=>'required|same:newPass',
        ]);
        if($validate->fails())
        return response()->json($validate->errors(),400);

        $user = User::where('password', $request->oldPass)
        ->Where(function ($query) use ($request) {
            $query->orwhere('email', $request->email)
                ->orwhere('SDT', $request->SDT);
        })
        ->first();

        if ($user->SDT != $request->SDT)
        return response()->json(['oldPass' => "Số điện thoại không tồn tại"], 400);
        else if ($user->SDT != $request->SDT)
        return response()->json(['oldPass' => "Email không tồn tại"], 400);
        else if ($user->password != $request->oldPass)
        return response()->json(['oldPass' => "Mật khẩu cũ không trùng khớp"], 400);
        else if ($user->password == $request->newPass)
        return response()->json(['newPass'=>"Mật khẩu cũ trùng với mật khẩu mới"], 400);

        $user->fill(["password" => $request->newPass]);
        $user->save();
        if(!empty($user))
        return response()->json($user,200);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    // public function update(Request $request, User $user)
    // {
    //     //
    // }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
