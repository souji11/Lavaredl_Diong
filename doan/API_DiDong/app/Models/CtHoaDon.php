<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CtHoaDon extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'IdHoaDon',
        'IdSanPham',
        'SoLuong',
        'DonGia',
    ];
    public function HoaDon()
    {
        return $this->belongsTo(HoaDon::class, 'IdHoaDon');
    }
    public function SanPham()
    {
        return $this->belongsTo(SanPham::class, 'IdSanPham');
    }
}
