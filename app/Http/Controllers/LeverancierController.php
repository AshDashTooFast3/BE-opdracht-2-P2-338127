<?php

namespace App\Http\Controllers;
use App\Models\Leverancier;


class LeverancierController extends Controller
{
    private $leverancier;
    public function __construct()
    {
        $this->leverancier = new Leverancier();
    }


    public function index()
    {
        $leveranciers = $this->leverancier->getAllLeveranciers();
        
        return view('home', [
            'title' => 'Leveranciers Overzicht',
            'leveranciers' => $leveranciers,
        ]);
    }

}
