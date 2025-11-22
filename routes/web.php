<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LeverancierController;
use App\Http\Controllers\ProductController;

Route::get('/', [LeverancierController::class, 'index'])->name('home');

// Producten routes
Route::get('/producten/{id}', [ProductController::class, 'index'])->name('producten.index');
Route::put('/producten/{id}', [ProductController::class, 'update'])->name('producten.update');
Route::get('/producten/{id}/edit', [ProductController::class, 'edit'])->name('producten.edit');