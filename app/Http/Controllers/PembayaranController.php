<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Midtrans\Config;
use Midtrans\Snap;
use App\Models\Pembayaran;
use App\Models\Pesanan;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PembayaranController extends Controller
{
    public function __construct()
    {
        // Set konfigurasi MIDTRANS
        Config::$serverKey = config('midtrans.server_key');
        Config::$isProduction = config('midtrans.is_production');
        Config::$isSanitized = config('midtrans.is_sanitized');
        Config::$is3ds = config('midtrans.is_3ds');
    }

    public function createTransaction(Request $request)
    {
        // Pastikan server key Anda benar
        Config::$serverKey = 'SB-Mid-server-KSIKcMYr-OhqH2h6g1_BQGKe'; // Ganti dengan server key MIDTRANS Anda
        Config::$isSanitized = true;
        Config::$is3ds = true;

        $user = Auth::user();
        $pesanan = Pesanan::where('user_id', $user->id)->where('status', 'belum dibayar')->first();

        if (!$pesanan) {
            return response()->json(['message' => 'Tidak ada pesanan yang belum dibayar'], 404);
        }

        // Ambil detail item dari pesanan detail
        $item_details = $pesanan->pesananDetails->map(function ($item) {
            return [
                'id' => $item->barang_id,
                'price' => $item->barang->harga,
                'quantity' => $item->quantity,
                'name' => $item->barang->nama_barang,
            ];
        })->toArray();

        $params = [
            'transaction_details' => [
                'order_id' => $pesanan->id,
                'gross_amount' => $pesanan->total,
            ],
            'customer_details' => [
                'first_name' => $user->name,
                'email' => $user->email,
                'phone' => $request->input('no_hp'),
                'address' => $request->input('alamat')
            ],
            'item_details' => $item_details,
        ];

        try {
            // Mendapatkan Snap Token dari Midtrans
            $snapToken = Snap::getSnapToken($params);

            // Simpan detail pembayaran
            Pembayaran::create([
                'user_id' => $user->id,
                'pesanan_id' => $pesanan->id,
                'username' => $user->username,
                'alamat' => $request->input('alamat'),
                'no_hp' => $request->input('no_hp'),
                'total' => $pesanan->total,
                'status' => 'pending',
            ]);

            return response()->json(['snap_token' => $snapToken], 200);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal membuat transaksi: ' . $e->getMessage()], 500);
        }
    }
        
}
