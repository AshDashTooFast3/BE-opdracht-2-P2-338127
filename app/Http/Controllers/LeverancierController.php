<?php

namespace App\Http\Controllers;

use App\Models\LeverancierModel;
use Illuminate\Http\Request;



class LeverancierController extends Controller
{
    private $leverantie;
    public function __construct()
    {
        $this->leverantie = new LeverancierModel();
    }


    public function index()
    {
        
        return view('home');
    }

}
