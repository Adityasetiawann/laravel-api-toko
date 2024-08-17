<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    use HasFactory;

    protected $table = 'pembayaran';

    protected $fillable = [
        'user_id',
        'pesanan_id',
        'username',
        'alamat',
        'no_hp',
        'total',
        'status',
    ];

    /**
     * Relasi dengan model User.
     * Menunjukkan bahwa pembayaran dimiliki oleh seorang user.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Relasi dengan model Pesanan.
     * Menunjukkan bahwa pembayaran terkait dengan pesanan tertentu.
     */
    public function pesanan()
    {
        return $this->belongsTo(Pesanan::class, 'pesanan_id');
    }


}
