<?php

namespace App\Http\Controllers;

use App\Models\Magazijn;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    private $product;

    public function __construct()
    {
        $this->product = new Product;
    }

    public function index($Id)
    {
        $producten = $this->product->GetProductenByLeverancierId($Id);
        $leveranciers = $this->product->getLeverancierById($Id);


        return view('producten.index', [
            'title' => 'Geleverde producten',
            'producten' => $producten,
            'leveranciers' => $leveranciers,
        ]);

    }

    public function edit($id)
    {
        $productenlevering = $this->product->getProductById($id);
        $leveranciers = $this->product->getLeverancierById($id);

        
        return view('producten.edit', [
            'title' => 'Levering product',
            'productenlevering' => $productenlevering,
            'leveranciers' => $leveranciers,
            'productId' => $id
        ]);
    }

    public function update(Request $request, $id)
    {
        $productenlevering = $this->product->getProductById($id);

        $IsActief = $request->input('IsActief');

        $validated = $request->validate([
            'Aantal' => 'required|integer',
            'DatumLevering' => 'required|date',
        ]);

        $leverancierId = $productenlevering[0]->LeverancierId ?? $id;

        if ($IsActief == 0) {
            return back()
            ->with('error', 'Het product: ' .
                $productenlevering[0]->ProductNaam . ' van de leverancier: ' .
                $productenlevering[0]->LeverancierNaam . ' wordt niet meer geproduceerd')
            ->with('redirect_after', route('producten.index', ['id' => $leverancierId]));
        }

        $affected = $this->product->UpdateProductPerLeverancier(
            $id,
            $validated['Aantal'],
            $validated['DatumLevering']
        );

        if ($affected === 0){
            return back()->with('error', 'Er is niets gewijzigd, probeer het later opnieuw.');
        }

        // Haal de juiste leverancier_id op voor redirect

        return redirect()->route('producten.index', ['id' => $leverancierId])
                 ->with('success', 'Product succesvol bijgewerkt');
        }
}
