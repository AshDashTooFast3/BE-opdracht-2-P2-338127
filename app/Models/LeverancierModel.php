<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class LeverancierModel extends Model
{

    public function getLeverancierInfo($productId)
    {
        return DB::select('CALL sp_GetLeverancierInfo(?)', [$productId]);
    }

    public function getLeverantieInfo($productId)
    {
        return DB::select('CALL sp_GetLeverantieInfo(?)', [$productId]);
    }
    
    
}
