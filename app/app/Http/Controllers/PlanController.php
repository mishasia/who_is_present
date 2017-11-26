<?php

namespace App\Http\Controllers;

use App\Plan;
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

}
