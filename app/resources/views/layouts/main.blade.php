<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">

</head>
<body>
<div class="navbar-header">
    @if (Route::has('login'))
        <div class="top-right links">
            @auth
                <a href="{{ url('/home') }}">Home</a>
                <a href="{{ route('login') }}">Login</a>
                @else

                    @endauth
        </div>
    @endif

</div>



<div id="main">

    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    &nbsp;
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                        <li><a href="{{ route('login') }}">Login</a></li>

                </ul>
            </div>
        </div>
    </nav>


    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body">
                        @foreach($departments as $department)
                            <li><a href="{{route('main.teacher',$department->id )}}">{{ $department->name }}</a></li>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3>Управління</h3></div>

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
