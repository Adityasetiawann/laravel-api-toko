<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\PesananDetailController;
use App\Http\Controllers\PesananController;
use App\Http\Controllers\PembayaranController;
use App\Http\Controllers\midtransController;
use App\Http\Controllers\KeranjangController;




Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', [AuthController::class, 'register']);
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    Route::get('/admin', function () {
        return response()->json(['message' => 'Welcome Admin'], 200);
    });
});

Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// barangg

Route::get('/barang', [BarangController::class, 'index']);
Route::get('/barang/kategori/{kategori}', [BarangController::class, 'getByKategori']);
Route::post('/barang', [BarangController::class, 'store']);
Route::get('/barang/{id}', [BarangController::class, 'show']);
Route::get('/barang/nama/{nama_barang}', [BarangController::class, 'showByNamaBarang']);

Route::delete('/barang/{id}', [BarangController::class, 'destroy']);
Route::put('/barang/{id}', [BarangController::class, 'update']);

Route::post('/pesanan-details', [PesananDetailController::class, 'store']);

// PESANAN DETAIL
// Route::get('/pesanan-details', [PesananDetailController::class, 'index']);
// Route::middleware('auth:sanctum')->group(function () {
//     // Route untuk Pesanan Detail
//     Route::post('/pesanan-details', [PesananDetailController::class, 'store']);
// });


// Route::post('/pesanan-detail', [PesananDetailController::class, 'store']);


// Keranjang
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/Keranjang', [PesananDetailController::class, 'addToCart']);
    Route::get('/pesananDetail', [PesananDetailController::class, 'getCartItems']);
    Route::post('/store-pesanan', [PesananDetailController::class, 'storePesanan']);
   
});

Route::get('/pesanan', [PesananController::class, 'index']);
Route::get('/pesanan-details', [PesananDetailController::class, 'index']);

Route::get('/pembayaran/{pesananId}', [PembayaranController::class, 'showPaymentPage'])->name('pembayaran.show');
Route::post('/midtrans/notification', [PembayaranController::class, 'handleNotification']);
// Route::post('/getSnapToken', [PembayaranController::class, 'getSnapToken']);


Route::post('/get-snap-token', [midtransController::class, 'getSnapToken']);
Route::post('/create-transaction', [PembayaranController::class, 'createTransaction']);
// Route::middleware('auth:sanctum')->group(function () {
//     // Route untuk Keranjang
//     Route::post('/keranjang', [KeranjangController::class, 'store']);
//     Route::get('/keranjang', [KeranjangController::class, 'index']); // Tambahkan route untuk index keranjang
// });
