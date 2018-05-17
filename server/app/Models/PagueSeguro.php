<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use PagSeguro;

class PagueSeguro extends Model
{
   protected $table = 'pagseguro';

   protected $fillable = ['data_compra', 'user_id', 'tipo', 'valor', 'quantidade', 'status','codigo'];

}
