@extends('layouts.app')

@section('content')

    <div>

    </div>
    <table class="table">
        <thead>
        <tr>
            <th>Автор</th>
            <th>Коментар</th>
            <th>Дата створення</th>
        </tr>
        </thead>
        <tbody>
        @foreach($comments as $comment)
            <tr>
                <td>{{ $comment->student->last_name }}  {{ $comment->student->first_name  }}</td>
                <td>{{ $comment->text }}</td>
                <td>{{ $comment->created_at }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
