@extends('layouts.front.app')

@section('og')
    <meta property="og:type" content="home"/>
    <meta property="og:title" content="{{ config('app.name') }}"/>
    <meta property="og:description" content="{{ config('app.name') }}"/>
@endsection

@section('content') 
    @include('layouts.front.home-slider')
    <hr>
    @if(!$featured->products->isEmpty())
        <div class="container">
            <div class="section-title b100">
                <h2>produtos em destaque</h2>
            </div>
            @include('front.products.product-list', ['products' => $featured->products])
            <div id="browse-all-btn"> <a class="btn btn-default browse-all-btn" href="{{ route('front.category.slug', $featured->slug) }}" role="button">Buscar todos itens</a></div>
        </div>
    @endif
    <hr/> 
    <hr>
    @if(!$newArrivals->products->isEmpty())
        <div class="container">
            <div class="section-title b100">
                <h2>Novidades - Lançamentos</h2>
            </div>
            @include('front.products.product-list', ['products' => $newArrivals->products])
            <div id="browse-all-btn"> <a class="btn btn-default browse-all-btn" href="{{ route('front.category.slug', $newArrivals->slug) }}" role="button">Buscar todos itens</a></div>
        </div>
    @endif
    </hr>
    @include('mailchimp::mailchimp')
@endsection