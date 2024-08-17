<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PesananDetail;
use App\Models\Barang;
use App\Models\Pesanan;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class PesananDetailController extends Controller
{
     
    public function index()
    {
        
        $pesananDetails = PesananDetail::all();
        return response()->json(['pesanan_details' => $pesananDetails], 200);
    }


    public function addToCart(Request $request)
    {
        $validatedData = $request->validate([
            'barang_id' => 'required|exists:barang,id',
            'quantity' => 'required|integer|min:1',
            'ukuran' => 'required|string|max:10',
        ]);

        $user = Auth::user();
        $barang = Barang::findOrFail($validatedData['barang_id']);
        $total = $barang->harga * $validatedData['quantity'];

        $pesananDetail = PesananDetail::where('user_id', $user->id)
                            ->where('barang_id', $barang->id)
                            ->where('ukuran', $validatedData['ukuran'])
                            ->first();

        if ($pesananDetail) {
            $pesananDetail->quantity += $validatedData['quantity'];
            $pesananDetail->total += $total;
        } else {
            $pesananDetail = new PesananDetail();
            $pesananDetail->user_id = $user->id;
            $pesananDetail->username = $user->username; 
            $pesananDetail->barang_id = $barang->id;
            $pesananDetail->barang = $barang->nama_barang; 
            $pesananDetail->quantity = $validatedData['quantity'];
            $pesananDetail->ukuran = $validatedData['ukuran'];
            $pesananDetail->total = $total;
        }

        $pesananDetail->save();

        return response()->json(['message' => 'Barang berhasil ditambahkan ke keranjang', 'pesananDetail' => $pesananDetail], 201);
    }

 public function getCartItems()
    {
        $user = Auth::user();
        $pesananDetails = PesananDetail::where('user_id', $user->id)->with('barang')->get();

        return response()->json(['cart_items' => $pesananDetails], 200);
    }
    
    public function storePesanan(Request $request)
    {
        $user = Auth::user();
        $cartItems = PesananDetail::where('user_id', $user->id)->get();

        if ($cartItems->isEmpty()) {
            return response()->json(['message' => 'Keranjang belanja kosong'], 400);
        }

        $total = $cartItems->sum('total');

        $pesanan = Pesanan::create([
            'user_id' => $user->id,
            'username' => $user->username, 
            'tanggal' => Carbon::now(),
            'status' => 'belum dibayar',
            'total' => $total,
        ]);

        // Update pesanan_id di PesananDetail
        foreach ($cartItems as $item) {
            $item->update(['pesanan_id' => $pesanan->id]);
        }

        return response()->json(['message' => 'Pesanan berhasil disimpan', 'pesanan' => $pesanan], 201);
    }
































    // public function addToCart(Request $request)
    // {
    //     $validatedData = $request->validate([
    //         'barang_id' => 'required|exists:barang,id',
    //         'quantity' => 'required|integer|min:1',
    //         'ukuran' => 'required|string|max:10',
    //     ]);

    //     $user = Auth::user();
    //     $barang = Barang::findOrFail($validatedData['barang_id']);
    //     $total = $barang->harga * $validatedData['quantity'];

    //     $pesananDetail = PesananDetail::where('user_id', $user->id)
    //                         ->where('barang_id', $barang->id)
    //                         ->where('ukuran', $validatedData['ukuran'])
    //                         ->first();

    //     if ($pesananDetail) {
    //         $pesananDetail->quantity += $validatedData['quantity'];
    //         $pesananDetail->total += $total;
    //     } else {
    //         $pesananDetail = new PesananDetail();
    //         $pesananDetail->user_id = $user->id;
    //         $pesananDetail->barang_id = $barang->id;
    //         $pesananDetail->quantity = $validatedData['quantity'];
    //         $pesananDetail->ukuran = $validatedData['ukuran'];
    //         $pesananDetail->total = $total;
    //     }

    //     $pesananDetail->save();

    //     return response()->json(['message' => 'Barang berhasil ditambahkan ke keranjang', 'pesananDetail' => $pesananDetail], 201);
    // }

    // public function getCartItems()
    // {
    //     $user = Auth::user();
    //     $pesananDetail = PesananDetail::where('user_id', $user->id)->with('barang')->get();

    //     return response()->json(['cart_items' => $pesananDetail], 200);
    // }

    // public function storePesanan(Request $request)
    // {
    //     $user = Auth::user();
    //     $cartItems = PesananDetail::where('user_id', $user->id)->get();

    //     if ($cartItems->isEmpty()) {
    //         return response()->json(['message' => 'Keranjang belanja kosong'], 400);
    //     }

    //     $total = $cartItems->sum('total');

    //     $pesanan = Pesanan::create([
    //         'user_id' => $user->id,
    //         'username' => $user->username, // Tambahkan username di sini
    //         'tanggal' => Carbon::now(),
    //         'status' => 'belum dibayar',
    //         'total' => $total,
    //     ]);

    //     // Update pesanan_id di PesananDetail
    //     foreach ($cartItems as $item) {
    //         $item->update(['pesanan_id' => $pesanan->id]);
    //     }

    //     return response()->json(['message' => 'Pesanan berhasil disimpan', 'pesanan' => $pesanan], 201);
    // }


}
