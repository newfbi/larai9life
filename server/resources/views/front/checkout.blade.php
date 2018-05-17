@extends('layouts.front.app')

@section('content')
    <div class="container product-in-cart-list">
        @if(!$products->isEmpty())
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="{{ route('home') }}"> <i class="fa fa-home"></i> Inicio</a></li>
                        <li class="active">Carrinho</li>
                    </ol>
                </div>
                <div class="col-md-12 content">
                    <div class="box-body">
                        @include('layouts.errors-and-messages')
                    </div>
                    @if(count($addresses) > 0)
                        <div class="row">
                            <div class="col-md-12">
                                @include('front.products.product-list-table', compact('products'))
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-striped">
                                    <thead>
                                        <th>Endereço</th>
                                        <th>Número</th>
                                        <th>Seu endereço</th>
                                        <th>Endereço de Entrega</th>
                                    </thead>
                                    <tbody>
                                        @foreach($addresses as $key => $address)
                                            <tr>
                                                <td>{{ $address->alias }}</td>
                                                <td>
                                                    {{ $address->address_1 }} {{ $address->address_2 }} <br />
                                                    @if(!is_null($address->province) || !is_null($address->city))
                                                        {{ $address->city->name }} {{ $address->province->name }} <br />
                                                    @endif
                                                    {{ $address->country->name }} {{ $address->zip }}
                                                </td>
                                                <td>
                                                    <label class="col-md-6 col-md-offset-3">
                                                    <input
                                                        type="radio"
                                                        value="{{ $address->id }}"
                                                        name="billing_address"
                                                        @if(old('') == $address->id) checked="checked"  @endif>
                                                    </label>
                                                </td>
                                                <td>
                                                    @if($key === 0)
                                                        <label for="sameDeliveryAddress">
                                                            <input type="checkbox" id="sameDeliveryAddress" checked="checked"> O mesmo que Faturamento
                                                        </label>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                    <tbody style="display: none" id="sameDeliveryAddressRow">
                                        @foreach($addresses as $key => $address)
                                            <tr>
                                                <td>{{ $address->alias }}</td>
                                                <td>
                                                    {{ $address->address_1 }} {{ $address->address_2 }} <br />
                                                    @if(!is_null($address->province) || !is_null($address->city))
                                                        {{ $address->city->name }} {{ $address->province->name }} <br />
                                                    @endif
                                                    {{ $address->country->name }} {{ $address->zip }}
                                                </td>
                                                <td></td>
                                                <td>
                                                    <label class="col-md-6 col-md-offset-3">
                                                        <input
                                                            type="radio"
                                                            value="{{ $address->id }}"
                                                            name="delivery_address"
                                                            @if(old('') == $address->id) checked="checked"  @endif>
                                                    </label>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                @if(!$couriers->isEmpty())
                                    <table class="table table-striped">
                                        <thead>
                                        <th>Nome</th>
                                        <th>Valor</th>
                                        <th>Tipo de Entrega</th>
                                        </thead>
                                        <tbody>
                                        @foreach($couriers as $courier)
                                            <tr>
                                                <td>{{ $courier->name }}</td>
                                                <td>{{config('cart.currency')}} {{ $courier->cost }}</td>
                                                <td>
                                                    <label class="col-md-6 col-md-offset-3">
                                                        <input
                                                            data-cost="{{ $courier->cost }}"
                                                            type="radio"
                                                            name="courier"
                                                            value="{{ $courier->id }}"
                                                            @if(old('courier') == $courier->id) checked="checked"  @endif>
                                                    </label>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                @else
                                    <p class="alert alert-danger">Sem encomendas</p>
                                @endif
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                @if(isset($payments) && !empty($payments))
                                    <table class="table table-striped">
                                        <thead>
                                        <th class="col-md-4">Nome</th>
                                        <th class="col-md-4">Descrição</th>
                                        <th class="col-md-4 text-right">Tipo de Pagamento</th>
                                        </thead>
                                        <tbody>
                                        @foreach($payments as $payment)
                                            @include('layouts.front.payment-options', compact('payment', 'total'))
                                        @endforeach
                                        </tbody>
                                    </table>
                                @else
                                    <p class="alert alert-danger">Nenhum metodo de pagamento</p>
                                @endif
                            </div>
                        </div>
                    @else
                        <p class="alert alert-danger"><a href="{{ route('customer.address.create', [$customer->id]) }}">Nenhum endereço encontrado. Você precisa criar um endereço primeiro aqui.</a></p>
                    @endif
                </div>
            </div>
        @else
            <div class="row">
                <div class="col-md-12">
                    <p class="alert alert-warning">Nenhum produto no carrinho ainda. <a href="{{ route('home') }}">Compre agora!</a></p>
                </div>
            </div>
        @endif
    </div>
@endsection