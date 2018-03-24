<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('layouts.master');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/plan/add', 'PlanController@add')->name('plan.add');
Route::get('/plan/history', 'PlanController@history')->name('plan.history');
Route::get('/plan/{id}/edit', 'PlanController@edit')->name('plan.edit');
Route::put('/plan/{id}/update', 'PlanController@update')->name('plan.update');
Route::delete('/plan/{id}/remove', 'PlanController@remove')->name('plan.remove');
Route::post('/plan/save', 'PlanController@save')->name('plan.save');
Route::get('/main', 'MainController@main')->name('layouts.main');
Route::get('main/{id}/teacher', 'MainController@teacher')->name('main.teacher');
Route::get('/teacher/edit', 'TeacherController@edit')->name('teacher.edit');
Route::put('/teacher/{id}update', 'TeacherController@update')->name('teacher.update');
Route::post('/teacher/{id}change-status', 'TeacherController@changeStatus')->name('teacher.changeStatus');
Route::post('/plans-by-teacher/{id}', 'PlanController@plansByTeacher');
Route::get('/chat', 'ChatController@index');
Route::post('/chat/message/save', 'ChatController@save');
Route::get('/chat/message/all', 'ChatController@getMessages');
Route::get('/teacher', 'TeacherController@getTeacher');
