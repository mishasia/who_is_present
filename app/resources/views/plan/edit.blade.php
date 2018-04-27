@extends('layouts.app')

@section('content')
    <h3>Редагувати оголошення:</h3>
    {!! Form::open(['route' => ['plan.update', $plans->id,'method' => 'PUT']] ) !!}
    <input type="hidden" name="_method" value="PUT">
    <div class="form-group">
        {!! Form::label('comment', 'Коментарій:') !!}
        {!! Form::textarea('comment', value($plans->comment),
         ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('comment', 'Дата початку:') !!}
        {!! Form::text('date_start', value($plans->date_start), [
            'class' => 'form-control js-date-picker', 'required'
        ]) !!}
    </div>

    <div class="form-group">
        {!! Form::label('comment', 'Дата завершення:') !!}
        {!! Form::text('date_end', value($plans->date_end), [
            'class' => 'form-control js-date-picker' , 'required'
        ]) !!}
    </div>

    <div class="form-group">
        {!! Form::submit('Зберегти зміни', [
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