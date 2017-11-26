<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    protected $fillable = [
        'date_start', 'date_end', 'comment',
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }
}
