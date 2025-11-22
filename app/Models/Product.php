<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Product extends Model


{
    protected $table = 'Product';

    protected $primaryKey = 'Id';

    protected $fillable = [
        'ProductNaam',
        'Barcode',
        'IsActief',
        'Opmerkingen',
        'DatumAangemaakt',
        'DatumGewijzigd',
    ];

    public $timestamps = false;

    public function getProductById($id)
    {
        return DB::select('CALL sp_GetProductById(?)', [$id]);
    }

    public function getLeverancierById($id)
    {
        return DB::select('CALL sp_GetLeverancierById(?)', [$id]);
    }

    public function UpdateProductPerLeverancier($id, $Aantal, $DatumLevering)
    {
        $row = DB::selectOne(
            'CALL sp_UpdateProductPerLeverancier(?, ?, ?)',
            [$id, $Aantal, $DatumLevering]
        );
        return $row->affected ?? 0;
    }

}