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
Route::post('/plan/save', 'PlanController@save')->name('plan.save');
Route::get('/main', 'MainController@main')->name('layouts.main');
Route::get('main/{id}/teacher', 'MainController@teacher')->name('main.teacher');

Route::post('/plans-by-teacher/{id}', 'PlanController@plansByTeacher');