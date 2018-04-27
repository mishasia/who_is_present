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
        'name', 'email', 'password','first_name','last_name', 'middle_name',
        'born_date','status_id','high_status_id','department_id',
        'is_present','avatar',
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

    public function messages()
    {
        return $this->hasMany(Message::class);
    }
}
