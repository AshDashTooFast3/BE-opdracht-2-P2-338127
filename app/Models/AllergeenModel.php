<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class AllergeenModel extends Model
{

   public function getAllergeenInfo($productId)
    {
        return DB::select('CALL sp_GetAllergeenByProductId(?)', [$productId]);
    }
    
    public function getProductInfo($productId)
    {
        return DB::select('CALL sp_GetProductById(?)', [$productId]);
    }
}
