<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SanPham extends Model
{
    use HasFactory;

    public function CtSanPham()
    {
        return $this->hasMany(CtSanPham::class, 'IdSanPham');
    }

    public function CtHoaDon()
    {
        return $this->hasMany(CtHoaDon::class, 'IdSanPham');
    }
}
