<?php
/**
 * Created by PhpStorm.
 * User: mishasia
 * Date: 31.03.18
 * Time: 18:05
 */

namespace App\Http\Controllers;


use App\Department;
use Illuminate\Support\Facades\DB;

class DepartmentController extends Controller
{
    public function index($id)
    {
        return count(Department::with('teachers')
            ->where('id', $id)
            ->get()
            ->toArray()[0]['teachers']);
    }
}