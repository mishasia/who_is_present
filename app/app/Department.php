<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    public function teachers()
    {
        return $this->hasMany(Teacher::class);
    }
}
