<?php

namespace App\Service;
use App\Schat;
use Carbon\Carbon;

class SchatService
{
    public function getMessagesByGroupAndTime($groupId, $createTime)
    {
        if ($createTime) {
            return Schat::where('group_id', $groupId)
                ->where('created_at', '>=', $createTime)
                ->with('sender')
                ->get();
        }
        return Schat::where('group_id', $groupId)
            ->with('sender')
            ->get();
    }
}