<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LeverancierController;

Route::get('/',[LeverancierController::class, 'index'])->name('home');

