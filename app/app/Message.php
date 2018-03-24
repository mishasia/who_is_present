<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $table = 'message';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'sender_id', 'message', 'department_id'
    ];

    public function sender()
    {
        return $this->belongsTo(Teacher::class);
    }
}
