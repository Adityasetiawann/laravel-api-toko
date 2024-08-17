<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'username', // Tambahkan username di sini
        'pesanan_id',
        'tanggal',
        'status',
        'total',
    ];
    protected $table = 'pesanan';
    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function pesananDetails()
    {
        return $this->hasMany(PesananDetail::class, 'pesanan_id');
    }

    public function pembayarans()
    {
        return $this->hasMany(Pembayaran::class, 'pesanan_id');
    }
}