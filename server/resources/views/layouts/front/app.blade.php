<!DOCTYPE html>
<html lang="pt_br">
<head>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-9325492-23"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', '{{ env('GOOGLE_ANALYTICS') }}');
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }}</title>
    <title>Infinit Sense</title>
    
    <meta property="og:locale" content="pt_br">
    <meta property="og:url" content="http://i9infinity.com.br">
    <meta property="og:title" content="Intinity">
    <meta property="og:site_name" content="I9Infinity">
    <meta property="og:description" content="I9-Infinity - Inovando o Sentido, Infinito da vida...">
    <meta property="og:image" content="http://i9infinity.com.br/images/slider1.jpg">
    <meta property="og:image:type" content="image/jpeg">
    <meta property="og:image:width" content="1024">
    <meta property="og:image:height" content="576">
    <meta property="og:type" content="website">

    <meta name="description" content="Infinity - Inovando o Sentido, Infinito da vida...">
    <meta name="tags" content="I9life, Cosmeticos, Sense, Infinit, Inove, Life, Perfumes, Exencias, I9Infinity, Bem-Estar, shop, shopping, fast, Compras, cart">
    <meta name="author" content="NewDevelopper">
    <meta name="author" content="NewDevelopper">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="{{ asset('https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js')}}"></script>
    <script src="{{ asset('https://oss.maxcdn.com/respond/1.4.2/respond.min.js')}}"></script>
    <![endif]-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <link href="{{ asset('bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.min.css') }}" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<noscript>
    <p class="alert alert-danger">
        Você precisa ativar o seu javascript. Algumas funcionalidades não funcionarão se isso estiver desativado.
        <a href="https://www.enable-javascript.com/" target="_blank">Saiba mais</a>
    </p>
</noscript>
<section>
    <div class="row hidden-xs">
        <div class="container">
            <div class="clearfix"></div>
            <div class="pull-right">                
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <!-- search form -->
                        <form action="{{route('search.product')}}" method="GET" class="form-inline" style="margin: 15px 0 0;">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control" placeholder="Pesquisar..." value="{!! request()->input('q') !!}">
                                <span class="input-group-btn">
                                    <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> Buscar</button>
                                </span>
                            </div>
                        </form>
                        <!-- /.search form -->
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <header id="header-section">
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header col-md-2">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Espandir</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="{{ route('home') }}"><img class="logo" src="/img/logo.png" width="40px" height="40px" align="left"/>INFINITY</a>
                </div>
                <div class="col-md-10">
                    @include('layouts.front.header-cart')
                </div>
            </div>
        </nav>
    </header>
</section>
@yield('content')

@include('layouts.front.footer')
<script type="text/javascript">
    $(document).ready(function(){
        $("#myModal").modal('show');
    });
</script>
@yield('js')
</body>
</html>