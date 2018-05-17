<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BlockIoTest extends Model
{
   public function Block()
    {
        return LaraBlockIo::getBalanceInfo();
    }
}
