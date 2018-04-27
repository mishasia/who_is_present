<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Styles -->


    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">

    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('Education meetings', 'Education meetings') }}</title>

</head>
<body>
<div id="main">

    @include('header')

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-default">


                    <div class="panel-body">
                        <div class="panel-body">
                            {{ menu('left menu student', 'menus/left_menu_student') }}
                        </div>


                    </div>
                </div>
                <div class="panel panel-default">


                    <div class="panel-body"><h4>Кафедри:</h4>

                        @foreach($departments as $department)
                            <li><a href="{{route('main.teacher',$department->id )}}">{{ $department->name }}</a></li>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="panel panel-default">


                    <div class="panel-body">
                        @yield('teacher')
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
@yield('scripts')
</body>
</html>
