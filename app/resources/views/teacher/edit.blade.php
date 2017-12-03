@extends('layouts.app')

@section('content')
    {!! Form::open(['route' => ['teacher.update', $teacher->id,'method' => 'PUT']] ) !!}
    <input type="hidden" name="_method" value="PUT">

    <div class="form-group">
        {!! Form::label('first_name', 'Ім\'я:') !!}
        {!! Form::text('first_name', value($teacher->first_name), ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('last_name', 'Прізвище:') !!}
        {!! Form::text('last_name', value($teacher->last_name), ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('status_id', 'Статус:') !!}
        {!! Form::text('status_id', value($teacher->status_id), ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('high_status_id', 'Докторат:') !!}
        {!! Form::text('high_status_id', value($teacher->high_status_id), ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('is_present', 'Наявність:') !!}
        {!! Form::text('is_present', value($teacher->is_present), ['class' => 'form-control', 'rows' => 5, 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('born_date', 'Дата народження:') !!}
        {!! Form::text('born_date', value($teacher->born_date), [
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