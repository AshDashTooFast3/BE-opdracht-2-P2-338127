<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ProductPerLeverancier extends Model
{
    public function getAllProductPerLeveranciers()
    {
        return DB::select('CALL sp_GetAllProductPerLeveranciers()');
    }

}
