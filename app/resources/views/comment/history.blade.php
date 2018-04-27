@extends('layouts.app')

@section('content')

    <div>
        <h3>Коментарі за планом:</h3>
        <h4> <span class="">"{{ $plan->comment }} </span> з  {{ $plan->date_start }} по {{ $plan->date_end }}"</h4>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>Автор</th>
            <th>Коментар</th>
            <th>Дата створення</th>
            <th>Дія</th>
        </tr>
        </thead>
        <tbody>
        @foreach($comments as $comment)
            <tr>
                <td>{{ $comment->student->last_name }}  {{ $comment->student->first_name  }}</td>
                <td>{{ $comment->text }}</td>
                <td>{{ $comment->created_at }}</td>
                <td>
                    {!! Form::open(['method'=>'DELETE',
                    'route' => ['comment.remove', $comment->id]])  !!}
                    <button onclick=" return confirm('Ви точно хочете видалити?')"
                            style="
                            background: transparent;
                            border: none;
                            padding: 0px;
                                  ">
                        <i class="glyphicon glyphicon-remove" style="color: #337ab7"></i>
                    </button>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
