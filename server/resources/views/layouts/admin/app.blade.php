<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{ config('app.name') }}</title>

    <link rel="stylesheet" href="{{ asset('css/admin.min.css') }}">
    @yield('css')
    <link rel="manifest" href="{{ asset('favicons/manifest.json')}}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{ asset('favicons/ms-icon-144x144.png')}}">
    <meta name="theme-color" content="#ffffff">
</head>
<body class="hold-transition skin-purple sidebar-mini">
<noscript>
    <p class="alert alert-danger">
        Você precisa ativar o seu javascript. Algumas funcionalidades não funcionarão se isso estiver desativado.
        <a href="https://www.enable-javascript.com/" target="_blank">Saiba mais</a>
    </p>
</noscript>
<!-- Site wrapper -->
<div class="wrapper">
    @include('layouts.admin.header', ['user' => $user])

    @include('layouts.admin.sidebar', ['user' => $user])

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        @yield('content')
    </div>
    <!-- /.content-wrapper -->

    @include('layouts.admin.footer')

    @include('layouts.admin.control-sidebar')
</div>
<!-- ./wrapper -->

<script src="{{ asset('js/admin.min.js') }}"></script>
<script src="{{ asset('//cdn.ckeditor.com/4.8.0/standard/ckeditor.js') }}"></script>
<script src="{{ asset('js/scripts.js?v=0.2') }}"></script>
@yield('js')
</body>
</html>
