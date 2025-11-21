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
        return view('producten.create', [
            'title' => 'Product Toevoegen',
            'message' => 'Voer de gegevens van het nieuwe product in.',
        ]);
    }

   
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|min:3|max:255',
            'salary' => 'required|min:0',
            'location' => 'required|string|min:1|max:255',
        ]);

        $job = Product::create([
            'title' => $request->input('title'),
            'salary' => $request->input('salary'),
            'location' => $request->input('location'),
            'employer_id' => 1,
        ]);

        return redirect('/jobs')->with('success', 'Job created successfully!');
    }
    
}
