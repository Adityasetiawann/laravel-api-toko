<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory;

    protected $table = 'barang';

    protected $fillable = [
        'nama_barang',
        'stok',
        'harga',
        'kategori',
        'keterangan',
        'gambar',
    ];

    public function pesananDetails()
    {
        return $this->hasMany(PesananDetail::class, 'barang_id');
    }

}
