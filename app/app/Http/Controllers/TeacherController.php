<?php

namespace App\Http\Controllers;

use App\Department;
use App\HighStatus;
use App\Status;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TeacherController extends Controller
{
    public function edit()
    {
      $teacher = Teacher::find(Auth::user()->teacher->id);
      $statuses = Status::pluck('name', 'id');
      $highStatuses = HighStatus::pluck('name', 'id');
      $departments = Department::pluck('name', 'id');

      return view('teacher.edit',  compact(
          'teacher',
          'statuses',
          'highStatuses',
          'departments'
      ));
    }

    public function update(Request $request, $id)
    {
        $file = $request->avatar;
        $teacher = Teacher::find($id);
        $teacher->fill($request->all());

        if ($file) {
            $path = $file->store('public/avatars');
            $pathForDb = str_replace('public', 'storage', $path);
            $teacher->avatar = $pathForDb;
        }

        $teacher->save();
        return redirect()->route('home');
    }

    public function changeStatus()
    {
        $user = auth()->user();
        $teacherId = $user->teacher_id;
        $teacher = Teacher::find($teacherId);
        $teacher->fill(['is_present' => !$teacher->is_present ]);
        $teacher->save();

        return [
            'isPresent' => $teacher->is_present,
        ];
    }

    public function getTeacher()
    {
        $teacher = Auth::user()->teacher;

        return $teacher;
    }
}
