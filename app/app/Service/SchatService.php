<?php

namespace App\Service;
use App\Schat;
use Carbon\Carbon;

class SchatService
{
    public function getMessagesByGroupAndTime($departmentId, $createTime)
    {
        if ($createTime) {
            return Schat::where('group_id', $departmentId)
                ->where('created_at', '>=', $createTime)
                ->with('sender')
                ->get();
        }
        return Schat::where('group_id', $departmentId)
            ->with('sender')
            ->get();
    }
}