<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    private $product;
    public function __construct()
    {
        $this->product = new Product();
    }
  
    public function index($Id)
    {
        $producten = $this->product->getProductById($Id);
        $leveranciers = $this->product->getLeverancierById($Id);
        
        return view('producten.index', [
            'title' => 'Leveranciers Overzicht',
            'producten' => $producten,
            'leveranciers' => $leveranciers,
        ]);
    }

  
    public function create()
    {
        
    }

   
    public function store(Request $request)
    {

    }
    
}
