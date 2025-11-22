<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Magazijn extends Model
{
    public function getAllMagazijn()
    {
        return DB::select('CALL sp_GetAllMagazijn()');
    }

}
