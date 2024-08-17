<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Keranjang;

class KeranjangController extends Controller
{
    
    public function index()
    {
        $keranjang = Keranjang::where('user_id', auth()->id())->get();
        return response()->json(['data' => $keranjang], 200);
    }

    
    public function store(Request $request)
    {
        $request->validate([
            'barang_id' => 'required|exists:barang,id',
            'quantity' => 'required|integer|min:1',
            'size' => 'required|string', // Menambahkan validasi size
        ]);

        $keranjang = Keranjang::create([
            'barang_id' => $request->barang_id,
            'user_id' => auth()->id(),
            'quantity' => $request->quantity,
            'size' => $request->size, // Menyimpan size
        ]);

        return response()->json(['message' => 'Item added to cart', 'data' => $keranjang], 201);
    }
}
