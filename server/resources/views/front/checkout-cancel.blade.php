@extends('layouts.front.app')

@section('content')
    <div class="container product-in-cart-list">
        <div class="row">
            <div class="col-md-12">
                <hr>
                <p class="alert alert-warning">Seu Pedido foi removido com sucesso <a href="{{ route('accounts') }}">Voltar!</a></p>
            </div>
        </div>
    </div>
@endsection