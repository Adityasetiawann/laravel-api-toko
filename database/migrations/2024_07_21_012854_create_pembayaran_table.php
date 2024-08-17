<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pembayaran', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('pesanan_id');
            $table->string('username');
            $table->string('alamat');
            $table->string('no_hp');
            $table->decimal('total', 10, 2);
            $table->string('status')->default('pending');
            $table->timestamps();

            // Add foreign keys if necessary
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('pesanan_id')->references('id')->on('pesanan')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('pembayaran');
    }
};
