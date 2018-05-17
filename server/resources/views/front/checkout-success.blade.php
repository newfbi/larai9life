@extends('layouts.front.app')

@section('content')
    <div class="container product-in-cart-list">
        <div class="row">
            <div class="col-md-12">
                <hr>
                <p class="alert alert-success">Sua reserva foi efetuada com sucesoo! <a href="{{ route('accounts') }}">Voltar!</a></p>
            </div>
        </div>
    </div>
@endsection