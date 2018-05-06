<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Schat extends Model
{
    protected $table = 'schat';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'sender_id', 'message', 'group_id'
    ];

    public function sender()
    {
        return $this->belongsTo(Student::class);
    }
}
