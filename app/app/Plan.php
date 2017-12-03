<?php

namespace App;

use Carbon\Carbon;
use Doctrine\DBAL\Query\QueryBuilder;
use Faker\Provider\DateTime;
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

    /**
     * @param QueryBuilder $query
     */
    public function scopeActual($query)
    {
        $query->where('date_end', '>', Carbon::now());
    }




}
