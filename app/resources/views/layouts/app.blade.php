<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">
    <style>
    form
     {
       display: inline;
     }
    </style>
    @yield('styles')
</head>
<body>
    <div id="app">
        @include('header')
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {{ menu('left menu', 'menus/left_menu') }}
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <center><h3>Ви на роботі?</h3></center>
                            @if (Auth::user())
                                @include('widget/status-button')
                            @endif
                        </div>
                    </div>

                </div>


                <div class="col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h3>Управління</h3></div>

                        <div class="panel-body">
                            @yield('content')
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
