<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Leverancier extends Model
{
    public function getAllLeveranciers()
    {
        return DB::select('CALL sp_GetAllLeveranciers()');
    }

}
