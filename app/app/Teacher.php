<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Teacher extends Model
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function highStatus()
    {
        return $this->belongsTo(HighStatus::class);
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function plans()
    {
        return $this->hasMany(Plan::class);
    }
}
