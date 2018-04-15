<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Department;
use App\Group;
use App\HighStatus;
use App\Status;
use App\Student;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    public function edit()
    {
      $departments = Department::all();
      $student = Student::find(Auth::user()->student->id);


      return view('student.edit',  compact(
          'student',
          'departments'
      ));
    }

    public function update(Request $request, $id)
    {

        $file = $request->avatar;
        $student = Student::find($id);
        $student->fill($request->all());
        if ($file) {
            $path = $file->store('public/avatars');
            $pathForDb = str_replace('public', 'storage', $path);
            $student->avatar = $pathForDb;
        }

        $student->save();
        return redirect()->route('home');
    }

    public function getStudent()
    {
        $student = Auth::user()->student;

        return $student;
    }
}
