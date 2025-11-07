<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    public function getAllProducts()
    {
        return DB::select('CALL sp_GetAllProducts()');
    }

}
