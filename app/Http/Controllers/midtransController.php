<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pembayaran;
use App\Models\Pesanan;
use App\Http\Controllers\Midtrans\Config;
use App\Http\Controllers\Midtrans\Snap;

class MidtransController extends Controller
{
    public function getSnapToken(Request $req)
    {
        // Pastikan server key Anda benar
        Config::$serverKey = 'SB-Mid-server-KSIKcMYr-OhqH2h6g1_BQGKe'; // Ganti dengan server key MIDTRANS Anda
        if (!isset(Config::$serverKey)) {
            return response()->json(['message' => 'Please set your payment server key'], 500);
        }
        Config::$isSanitized = true;
        Config::$is3ds = true;

        // Mengambil data pesanan dari request
        $pesananId = $req->input('pesanan_id');
        $pesanan = Pesanan::findOrFail($pesananId);

        $transaction_details = [
            'order_id' => $pesanan->id, // Gunakan ID pesanan sebagai order_id
            'gross_amount' => $pesanan->total, // Total pembayaran dari pesanan
        ];

        // Data pelanggan diambil dari pengguna yang membuat pesanan
        $user = $pesanan->user; // Asumsi bahwa relasi pesanan dengan pengguna sudah ada
        $customer_details = [
            'first_name' => $user->name, // Nama depan pengguna
            'last_name' => '',
            'email' => $user->email, // Email pengguna
            'phone' => $user->no_hp, // Nomor telepon pengguna
        ];

        // Ambil detail item dari pesanan detail
        $item_details = $pesanan->pesananDetails->map(function ($item) {
            return [
                'id' => $item->barang_id,
                'price' => $item->barang->harga,
                'quantity' => $item->quantity,
                'name' => $item->barang->nama_barang,
            ];
        })->toArray();

        $transaction = [
            'transaction_details' => $transaction_details,
            'customer_details' => $customer_details,
            'item_details' => $item_details,
        ];

        try {
            $snapToken = Snap::getSnapToken($transaction);
            return response()->json($snapToken);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to get snap token', 'error' => $e->getMessage()], 500);
        }
    }
}
