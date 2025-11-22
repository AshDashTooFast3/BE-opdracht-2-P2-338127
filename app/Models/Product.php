<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Product extends Model
{
    protected $table = 'Product';
    public function getProductById($id)
    {
        return DB::select('CALL sp_GetProductById(?)', [$id]);
    }

    public function getLeverancierById($id)
    {
        return DB::select('CALL sp_GetLeverancierById(?)', [$id]);
    }

}