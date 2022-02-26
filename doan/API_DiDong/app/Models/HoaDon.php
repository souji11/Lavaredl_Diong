<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\HoaDon as Authenticatable;

class HoaDon extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'Code',
        'IdTaiKhoan',
        'NgayLap',
        'DiaChiGiaoHang',
        'SDTGiaoHang',
        'IdMaGiamGia',
        'TongTien',
        'IDTrangThai',
    ];
    public function CtHoaDon()
    {
        return $this->hasMany(CtHoaDon::class, 'IdHoaDon');
    }
    public function User()
    {
        return $this->belongsTo(User::class, 'IdTaiKhoan');
    }
}
