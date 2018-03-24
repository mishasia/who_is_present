<?php

namespace App\Http\Controllers;

use App\Department;
use App\HighStatus;
use App\Message;
use App\Service\MessageService;
use App\Status;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    private $messageService;

    public function __construct()
    {
        $this->messageService = new MessageService();
    }

    public function index()
    {
        return view("chat/index");
    }

    public function save(Request $request)
    {
        $message = Message::create($request->all());
        return $message;
    }

    public function getMessages(Request $request)
    {
        $sender = Teacher::find($request->sender_id);
        $createTime = $request->createTime;

        $messages = $this->messageService
            ->getMessagesByDepartmentAndTime($sender->department_id, $createTime);

        return $messages;
    }
}
