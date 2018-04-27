<?php

namespace App\Http\Controllers;

use App\Plan;
use App\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PlanController extends Controller
{
    public function add()
    {
        return view('plan.add');
    }

    public function history()
    {
        $plans = Plan::where('teacher_id', Auth::user()->teacher->id)->get();

        return view('plan.history', compact('plans'));
    }

    public function save(Request $request)
    {
        /* @var Plan $plan */
        $plan = Plan::create($request->all());
        $plan->teacher()->associate(Auth::user()->teacher);
        $plan->save();

        return redirect()->route('home');
    }

    public function plansByTeacher($id)
    {
        $teacher = Teacher::find($id);
        $plans = Plan::actual()->where('teacher_id', $id)->get();

        return [
            'plans' => $plans,
            'teacher' => $teacher
        ];
    }

    public function edit($id)    {

        $plans=Plan::find($id);

        return view('plan.edit',  compact('plans'));
    }

    public function update(Request $request, $id)
    {
        $plans=Plan::find($id);
        $plans->fill($request->all());
        $plans->save();
        return redirect()->route('plan.history');
    }

    public function remove($id)    {

        $plans=Plan::find($id)->delete();
        return redirect()->route('plan.history');
    }
}
