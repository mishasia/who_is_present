@extends('layouts.main')

@section('teacher')

    <h3>Редагувати особиті дані:</h3>
    {!! Form::open(['files'=>'true', 'route' => ['student.update', $student->id,'method' => 'PUT']] ) !!}
    <input type="hidden" name="_method" value="PUT">


    <div class="form-group">
        {!! Form::label('last_name', 'Прізвище:') !!}
        {!! Form::text('last_name', value($student->last_name),
         ['class' => 'form-control', 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('first_name', 'Ім\'я:') !!}
        {!! Form::text('first_name', value($student->first_name),
        ['class' => 'form-control', 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('middle_name', 'По-батькові:') !!}
        {!! Form::text('middle_name', value($student->middle_name),
         ['class' => 'form-control', 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('born_date', 'Дата народження:') !!}
        {!! Form::text('born_date', value($student->born_date),
        ['class' => 'form-control js-date-picker' , 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('avatar', 'Аватар:') !!}
        {!! Form::file('avatar', null,
         ['class' => 'form-control']) !!}
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