@extends('layouts.app')

@section('content')

    <h3>Додати оголошення:</h3>
    {!! Form::open(['route' => 'plan.save']) !!}

    <div class="form-group">
        {!! Form::label('comment', 'Оголошення:') !!}
        {!! Form::textarea('comment', null, ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('comment', 'Дата початку:') !!}
        {!! Form::text('date_start', null, [
            'class' => 'form-control js-date-picker', 'required'
        ]) !!}
    </div>

    <div class="form-group">
        {!! Form::label('comment', 'Дата завершення:') !!}
        {!! Form::text('date_end', null, [
            'class' => 'form-control js-date-picker', 'required'
        ]) !!}
    </div>

    <div class="form-group">
        {!! Form::submit('Додати', [
            'class' => 'btn btn-success col-md-3'
        ]) !!}
    </div>

    {!! Form::close() !!}
@endsection

@section('styles')
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
@endsection

@section('scripts')
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script>
        $(function() {
            $( ".js-date-picker" ).datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
    </script>
@endsection