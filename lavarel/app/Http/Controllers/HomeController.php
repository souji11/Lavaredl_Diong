<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\LoaiSanPham;
use App\Models\SanPham;


class HomeController extends Controller
{
    public function index()
    {
        $listLoaiSanPham=LoaiSanPham::all();
        $listSanPham=SanPham::all();
        return view('Admin.HomeAdmin',['listLoai'=>$listLoaiSanPham,'listSP'=>$listSanPham]);
    }
}
