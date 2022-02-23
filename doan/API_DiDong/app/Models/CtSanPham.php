<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CtSanPham extends Model
{
    use HasFactory;

    public function SanPham()
    {
        return $this->belongsTo(SanPham::class, 'IdSanPham');
    }
    public function Mau()
    {
        return $this->hasMany(Mau::class, 'IdMau');
    }
    public function Size()
    {
        return $this->hasMany(Size::class, 'IdSize');
    }
}
