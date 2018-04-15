<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Department;
use App\Plan;

class CommentController extends Controller
{
    public function index()
    {
        $departments = Department::all();
        $planId = request('plan_id');
        $plan = Plan::with('teacher')->where('id', $planId)->first();
        $comments = Comment::with('student')->where('plan_id', $planId)->get();

        return view("comment/index",
            compact('comments', 'plan', 'departments'));
    }

    public function save()
    {
        $student_id = auth()->user()->student_id;
        $data = request()->all();
        $data['student_id'] = $student_id;

        Comment::create($data);

        return back();
    }

    public function history($id)
    {
        $comments = Comment::with('student')->where('plan_id', $id)->get();
        return view("comment.history",
            compact('comments'));
    }


}
