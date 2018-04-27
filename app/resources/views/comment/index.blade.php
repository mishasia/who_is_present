@extends('layouts.main')

@section('teacher')

    <div>
        <h3>Коментарі за планом <span class="">"{{ $plan->comment }}"</span> автора "{{ $plan->teacher->first_name }} {{ $plan->teacher->last_name }}"</h3>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>Автор</th>
            <th>Коментар</th>
            <th>Дата створення</th>
            <th>Дія створення</th>
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

    <div>
        {!! Form::open(['route' => 'comment.save']) !!}

        {!! Form::hidden('plan_id', $plan->id) !!}

        <div class="form-group">
            {!! Form::label('text', 'Коментарій:') !!}
            {!! Form::textarea('text', null, ['class' => 'form-control', 'rows' => 5, 'required']) !!}
        </div>

        <div class="form-group">
            {!! Form::submit('Додати', [
                'class' => 'btn btn-success col-md-3'
            ]) !!}
        </div>

        {!! Form::close() !!}
    </div>
@endsection
