<?php

namespace App\Http\Controllers;

use App\Department;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function main()
    {
        $departments = Department::all();
        return view('layouts.main',compact('departments'));
    }

    public function teacher($id)
    {
       $teachers = Teacher::with('status', 'highStatus', 'department')
           ->where('department_id',$id)
           ->get();
        $departments = Department::all();
        $get_department=Department::find($id);

        //dd($teachers);
        return view('main/teacher', compact(
            'teachers',
            'departments',
            'get_department'

        ));
    }
}
