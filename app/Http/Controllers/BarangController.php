<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class BarangController extends Controller
{
     
     public function index()
     {
         $barang = Barang::all();
         return response()->json(['barang' => $barang], 200);
     }



     public function getByKategori($kategori)
     {
         $barang = Barang::where('kategori', $kategori)->get();
     
         if ($barang->isEmpty()) {
             return response()->json(['message' => 'Barang tidak ditemukan'], 404);
         }
     
         return response()->json(['barang' => $barang], 200);
     }

 
    public function store(Request $request)
    {
        
        $validatedData = $request->validate([
            'nama_barang' => 'required|string|max:25',
            'kategori' => 'required|string|max:25',
            'stok' => 'required|integer',
            'harga' => 'required|integer',
            'keterangan' => 'nullable|string',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', 
        ]);

        
         if ($request->hasFile('gambar')) {
            $gambar = $request->file('gambar');
            $nama_file = time() . '_' . $gambar->getClientOriginalName();
            $gambar->storeAs('public/gambar', $nama_file); 
        } else {
            $nama_file = null;
        }

   
        $barang = new Barang();
        $barang->nama_barang = $validatedData['nama_barang'];
        $barang->kategori = $validatedData['kategori'];
        $barang->stok = $validatedData['stok'];
        $barang->harga = $validatedData['harga'];
        $barang->keterangan = $validatedData['keterangan'];
        $barang->gambar = $nama_file;
        $barang->save();

        return response()->json(['message' => 'Barang berhasil disimpan', 'barang' => $barang], 201);
    }

// function SHOW
    public function show($id)
    {
        $barang = Barang::find($id);

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan'], 404);
        }

        return response()->json(['barang' => $barang], 200);
    }

    
    public function showByNamaBarang($nama_barang)
    {
        // Cari barang berdasarkan nama_barang
        $barang = Barang::where('nama_barang', $nama_barang)->first();

        // Jika barang tidak ditemukan, kembalikan response dengan pesan kesalahan
        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan'], 404);
        }

        // Jika barang ditemukan, kembalikan data barang
        return response()->json(['barang' => $barang], 200);
    }





    public function update(Request $request, $id)
    {
        $barang = Barang::find($id);

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan'], 404);
        }

       
        $validatedData = $request->validate([
            'nama_barang' => 'nullable|string|max:25',
            'kategori' => 'nullable|string|max:25',
            'stok' => 'nullable|integer',
            'harga' => 'nullable|integer',
            'keterangan' => 'nullable|string',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', 
        ]);

        
        if ($request->hasFile('gambar')) {
            $gambar = $request->file('gambar');
            $nama_file = time() . '_' . $gambar->getClientOriginalName();
            $gambar->storeAs('public/gambar', $nama_file); 
            $barang->gambar = $nama_file; 
        }

       
        $barang->nama_barang = $validatedData['nama_barang'] ?? $barang->nama_barang;
        $barang->kategori = $validatedData['kategori'] ?? $barang->kategori;
        $barang->stok = $validatedData['stok'] ?? $barang->stok;
        $barang->harga = $validatedData['harga'] ?? $barang->harga;
        $barang->keterangan = $validatedData['keterangan'] ?? $barang->keterangan;
        $barang->save();

        return response()->json(['message' => 'Barang berhasil diperbarui', 'barang' => $barang], 200);
    }

    // FUNCTION UNTUK DELETE

    public function destroy($id)
    {
        $barang = Barang::find($id);

        if (!$barang) {
            return response()->json(['message' => 'Barang tidak ditemukan'], 404);
        }

        // Hapus file gambar dari storage jika ada
        if ($barang->gambar) {
            Storage::delete('public/gambar/' . $barang->gambar);
        }

        $barang->delete();

        return response()->json(['message' => 'Barang berhasil dihapus'], 200);
    }
}
