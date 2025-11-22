<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Magazijn extends Model
{
    protected $table = 'Magazijn';

    protected $primaryKey = 'Id';

    protected $fillable = [
        'ProductId',
        'Verpakkingseenheid',
        'AantalAanwezig',
        'IsActief',
        'Opmerkingen',
        'DatumAangemaakt',
        'DatumGewijzigd',
    ];

    public $timestamps = false;
    
    public function getAllMagazijn()
    {
        return DB::select('CALL sp_GetAllMagazijn()');
    }

}
