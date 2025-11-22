<?php

namespace App\Http\Controllers;

use App\Models\Magazijn;
use App\Models\Product;
use App\Models\ProductPerLeverancier;
use Illuminate\Http\Request;
use App\Models\Leverancier;

use function Livewire\Volt\title;

class ProductController extends Controller
{
    private $product;

    public function __construct()
    {
        $this->product = new Product;
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
        $id = request()->route('id');

        $productenlevering = $this->product->getProductById($id);
        $leveranciers = Leverancier::all();

        // dd( $productenlevering );

        return view('producten.create', [
            'title' => 'Product aanmaken',
            'message' => 'Voeg hier een nieuw product toe',
            'productenlevering' => $productenlevering,
            'leveranciers' => $leveranciers,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'AantalMagazijn' => 'required|integer|min:1',
            'LaatsteLevering' => 'required|date|after:today',
        ]);

        // Create Product
        $product = Product::create([
            'Naam' => $request->input('Naam'),
        ]);

        // Create Magazijn entry for this product
        Magazijn::create([
            'ProductId' => $product->Id,
            'VerpakkingsEenheid' => $request->input('Verpakkingseenheid'),
            'AantalAanwezig' => $request->input('AantalMagazijn'),
            // Optional: set other fields if needed
        ]);

        // Create ProductPerLeverancier entry if leverancier info is provided
        if ($request->filled('LeverancierId')) {
            ProductPerLeverancier::create([
                'LeverancierId' => $request->input('LeverancierId'),
                'ProductId' => $product->Id,
                'DatumLevering' => $request->input('LaatsteLevering'),
                'DatumEerstVolgendeLevering' => $request->input('DatumEerstVolgendeLevering'),
            ]);
        }

        return redirect('/jobs')->with('success', 'Job created successfully!');
    }
}
