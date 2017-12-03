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
    {{--<link href="{{ asset('css/app.css') }}" rel="stylesheet">--}}
    {{--<link href="{{ asset('css/styles.css') }}" rel="stylesheet">--}}

    <link href="{{ asset('vendor/landing/bootstrap/css/bootstrap.min.css') }} " rel="stylesheet">
    <link href="{{ asset('vendor/landing/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <link href="{{ asset("vendor/landing/magnific-popup/magnific-popup.css") }}" rel="stylesheet">
    <link href="{{ asset("css/creative.css") }}" rel="stylesheet">

    @yield('styles')
</head>
<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">{{ config('app.name') }}</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#about">Про нас</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#services">Послуги</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#portfolio">Галерея</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#contact">Контакти</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="masthead text-center text-white d-flex">
    <div class="container my-auto">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h1 class="text-uppercase">
                    <strong>Ми пропонуємо зручний спосіб керувати Вашою активністю</strong>
                </h1>
                <hr>
            </div>
            <div class="col-lg-8 mx-auto">
                <p class="text-faded mb-5">
                    Викладачі заходять на особисту сторінку та керують своєю активністю в університеті.
                    Студенти отримують інформацію наявність чи відсутність викладача в данний момент!
                </p>
                <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Дізнатись більше</a>
            </div>
        </div>
    </div>
</header>

<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <h2 class="section-heading text-white">Ми даємо доступ до інформації</h2>
                <hr class="light my-4">
                <p class="text-faded mb-4">
                    Зручний спосіб користування, дружній інтерфейс для корисувача. Проста навігація по сайту
                </p>
                <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Наші послуги!</a>
            </div>
        </div>
    </div>
</section>

<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Основні можливості</h2>
                <hr class="my-4">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                    <i class="fa fa-4x fa-home text-primary mb-3 sr-icons"></i>
                    <h4 class="mb-3">Особистий кабінет</h4>
                    <p class="text-muted mb-0">Our templates are updated regularly so they don't break.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                    <i class="fa fa-4x fa-check-square-o text-primary mb-3 sr-icons"></i>
                    <h4 class="mb-3">Керування статусом</h4>
                    <p class="text-muted mb-0">You can use this theme as is, or you can make changes!</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                    <i class="fa fa-4x fa-pencil-square-o text-primary mb-3 sr-icons"></i>
                    <h4 class="mb-3">Створення подій</h4>
                    <p class="text-muted mb-0">We update dependencies to keep things fresh.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box mt-5 mx-auto">
                    <i class="fa fa-4x fa-eye text-primary mb-3 sr-icons"></i>
                    <h4 class="mb-3">Перегляд подій</h4>
                    <p class="text-muted mb-0">You have to make your websites with love these days!</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="p-0" id="portfolio">
    <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/1.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/1.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/2.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/2.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/3.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/3.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/4.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/4.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/5.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/5.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-sm-6">
                <a class="portfolio-box" href="img/portfolio/fullsize/6.jpg">
                    <img class="img-fluid" src="img/portfolio/thumbnails/6.jpg" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                Category
                            </div>
                            <div class="project-name">
                                Project Name
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="bg-dark text-white">
    <div class="container text-center">
        <h2 class="mb-4">Хочу розпочати роботу вже зараз!</h2>
        <a class="btn btn-light btn-xl sr-button" href="main">Розпочати роботу!</a>
    </div>
</section>

<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <h2 class="section-heading">Для зв'язку!</h2>
                <hr class="my-4">
                <p class="mb-5">Якщо у Вас є будь-які запитання чи побажання по покращенні роботи сайту, зв'яжіться з нами!</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 ml-auto text-center">
                <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
                <p>123-456-6789</p>
            </div>
            <div class="col-lg-4 mr-auto text-center">
                <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
                <p>
                    <a href="mailto:your-email@your-domain.com">feedback@whoispresent.com</a>
                </p>
            </div>
        </div>
    </div>
</section>

{{--<script src="{{ asset('js/app.js') }}"></script>--}}

<script src="{{ asset('vendor/landing/jquery/jquery.min.js') }} "></script>
<script src="{{ asset('vendor/landing/bootstrap/js/bootstrap.bundle.min.js') }} "></script>

<!-- Plugin JavaScript -->
<script src="{{ asset('vendor/landing/jquery-easing/jquery.easing.min.js') }}"></script>
<script src="{{ asset('vendor/landing/scrollreveal/scrollreveal.min.js') }} "></script>
<script src="{{ asset('vendor/landing/magnific-popup/jquery.magnific-popup.min.js') }} "></script>

<!-- Custom scripts for this template -->
<script src="{{ asset('js/creative.min.js') }}"></script>
<!-- Scripts -->
@yield('scripts')
</body>
</html>
