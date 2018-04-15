<?php

namespace App\Http\Controllers;

use App\Department;
use App\HighStatus;
use App\Schat;
use App\Service\SchatService;
use App\Status;
use App\Student;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SchatController extends Controller
{
    private $smessageService;

    public function __construct()
    {
        $this->schatService = new SchatService();
    }

    public function index()
    {
        $departments = Department::all();
        return view("schat/sindex", compact(
            'departments'
        ));
    }

    public function save(Request $request)
    {
        $message = Schat::create($request->all());
        return $message;
    }

    public function getMessages(Request $request)
    {
        $sender = Student::find($request->sender_id);
        $createTime = $request->createTime;

        $messages = $this->schatService
            ->getMessagesByGroupAndTime($sender->group_id, $createTime);

        return $messages;
    }
}
