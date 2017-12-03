@extends('layouts.main')

@section('teacher')

    <table class="table">
        <thead>
        <tr>
            <th>Прізвище</th>
            <th>Ім'я</th>
            <th>Статус</th>
            <th>Докторат</th>
        </tr>
        </thead>
        <tbody>
        @foreach($teachers as $teacher)
            <tr>
                <td>{{ $teacher->first_name }}</td>
                <td>{{ $teacher->last_name }}</td>
                <td>{{ $teacher->status->name }}</td>
                <td>{{ $teacher->highStatus->name }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>

@endsection