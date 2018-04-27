@extends('layouts.main')

@section('teacher')


    <div class="table-responsive">
        <h3>Список викладачів на кафедрі {{$get_department->name}}:</h3>
    <table class="table">
        <thead>
        <tr>
            <th>Прізвище</th>
            <th>Ім'я</th>
            <th>По-батькові</th>
            <th>Статус</th>
            <th>Докторат</th>
            <th>Присутність</th>
            <th>Плани</th>
        </tr>
        </thead>
        <tbody>
        @foreach($teachers as $teacher)
            <tr>
                <td>{{ $teacher->last_name }}</td>
                <td>{{ $teacher->first_name }}</td>
                <td>{{ $teacher->middle_name }}</td>
                <td>{{ $teacher->status->name }}</td>
                <td>{{ $teacher->highStatus->name }}</td>
                <td>@include('partials.teacher_present', [
                    'present' => $teacher->is_present
                ])</td>
                <td>
                    <button type="button"
                            class="btn btn-info btn-sm js-button-modal"
                            data-id="{{ $teacher->id }}"
                            data-toggle="modal"
                            data-target="#myModal">
                        Перегляд
                    </button>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
    </div>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Інформація про оголошення викладача
                        <span class="js-teacher-name"></span>
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Номер</th>
                                <th>Подія</th>
                                <th>Початок</th>
                                <th>Кінець</th>
                                <th>Коментарі</th>
                            </tr>
                            </thead>
                            <tbody class="js-plan-content">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

@endsection