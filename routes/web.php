<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LeverancierController;
use App\Http\Controllers\ProductController;

Route::get('/',[LeverancierController::class, 'index'])->name('home');
Route::get('/producten/{id}/create',[ProductController::class, 'create'])->name('producten.create');
Route::get('/producten/{id}',[ProductController::class, 'index'])->name('producten.index');
Route::post('/producten',[ProductController::class, 'store'])->name('producten.store');
