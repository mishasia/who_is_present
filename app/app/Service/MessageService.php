<?php

namespace App\Service;

use App\Message;
use Carbon\Carbon;

class MessageService
{
    public function getMessagesByDepartmentAndTime($departmentId, $createTime)
    {
        if ($createTime) {
            return Message::where('department_id', $departmentId)
                ->where('created_at', '>=', $createTime)
                ->with('sender')
                ->get();
        }
        return Message::where('department_id', $departmentId)
            ->with('sender')
            ->get();
    }
}
