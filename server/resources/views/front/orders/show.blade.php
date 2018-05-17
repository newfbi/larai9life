@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        <div class="box">
            <div class="box-header">
                <div class="row">
                    <div class="col-md-12">
                        <hr>
                        <h2>
                            <small>Email: {{$customer->email}}</small> <br />
                            <small>Referencia do Pedido: <strong>{{$order->reference}}</strong></small>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">                
                <div class="row">
                    <div class="col-md-6">
                        <hr>
                        <h3> <i class="fa fa-shopping-bag"></i> Informações do pedido</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <td class="col-md-3">Data</td>
                                    <td class="col-md-3">Cliente</td>
                                    <td class="col-md-3">Pagamento</td>
                                    <td class="col-md-3">Status</td>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>{{ date('m-d-y', strtotime($order['created_at'])) }}</td>
                                <td><a>{{ $customer->name }}</a></td>
                                <td><strong>{{ $order['payment'] }}</strong></td>
                                @if($order->order_status_id == 1)
                                <td><button type="button" class="btn btn-primary btn-block">{{ $currentStatus->name }}</button></td>
                                @endif
                                @if($order->order_status_id == 2)
                                <td><button type="button" class="btn btn-info btn-block">{{ $currentStatus->name }}</button></td>
                                @endif
                                @if($order->order_status_id == 3)
                                <td><button type="button" class="btn btn-danger btn-block">{{ $currentStatus->name }}</button></td>
                                @endif
                                @if($order->order_status_id == 4)
                                <td><button type="button" class="btn btn-success btn-block">{{ $currentStatus->name }}</button></td>
                                @endif
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <hr>
                        <h3> <i class="fa fa-money"></i> Informações de Pagamento</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <td class="col-md-3">Tipos</td>
                                    <td class="col-md-3">Totais</td>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="bg-warning">Subtotal:</td>
                                <td class="bg-warning">{{ $order['total_products'] }}</td>
                            </tr>
                            <tr>
                                <td class="bg-warning">Frete:</td>
                                <td class="bg-warning">{{ $frete->cost }}</td>
                            </tr>
                            <tr>
                                <td class="bg-warning">Disconto:</td>
                                <td class="bg-warning">{{ $order['discounts'] }}</td>
                            </tr>
                            <tr>
                                <td class="bg-success text-bold">Total do Pedido:</td>
                                <td class="bg-success text-bold">{{ $order['total'] }}</td>
                            </tr>
                            @if($order['total_paid'] != $order['total'])
                                <tr>
                                    <td class="bg-danger text-bold">Total pago:</td>
                                    <td class="bg-danger text-bold">{{ $order['total_paid'] }}</td>
                                </tr>
                            @endif
                            </tbody>
                        </table>
                    <!-- /.box-body -->
                    </div>
                </div>
            </div>
        </div>
        @if($order)
            @if($order->total != $order->total_paid)
                <p class="alert alert-danger">
                    O vendedor lhe concedeu um desconto no valor total do pedido.<br />
                    Valor Total do Pedido: <strong>{{ config('cart.currency') }} {{ $order->total }}</strong> <br>
                    Valor total pago: <strong>{{ config('cart.currency') }} {{ $order->total_paid }}</strong>
                </p>

            @endif
            <div class="box">
                @if(!$items->isEmpty())
                    <div class="box-body">
                        <hr>
                        <h3> <i class="fa fa-gift"></i> Lista de Produtos</h3>
                        <table class="table">
                            <thead>
                            <th class="col-md-2">Referencia</th>
                            <th class="col-md-2">Nome</th>
                            <th class="col-md-2">Quantidade</th>
                            <th class="col-md-2">Preço</th>
                            </thead>
                            <tbody>
                            @foreach($items as $item)
                                <tr>
                                    <td>{{ $item->sku }}</td>
                                    <td>{{ $item->name }}</td> 
                                    <td>{{ $item->pivot->quantity }}</td>
                                    <td>{{ $item->price }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <hr>
                            <h3> <i class="fa fa-truck"></i> Entrega</h3>
                            <table class="table">
                                <thead>
                                    <th class="col-md-3">Tipe de Entrega</th>
                                    <th class="col-md-4">Descrição</th>
                                    <th class="col-md-5">Taxa</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>{{ $order->courier->name }}</td>
                                    <td>{{ $order->courier->description }}</td>
                                    <td>{{ $order->courier->cost }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <hr>
                            <h3> <i class="fa fa-map-marker"></i> Endereço</h3>
                            <table class="table">
                                <thead>
                                    <th>Endereço</th>
                                    <th>Numero</th>
                                    <th>Cidade</th>
                                    <th>Telefone</th>
                                    <th>Cep</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>{{ $order->address->alias }}</td>
                                    <td>{{ $order->address->address_1 }}</td>
                                    <td>{{ $order->address->city->name }}</td>
                                    <td>{{ $order->address->phone }}</td>
                                    <td>{{ $order->address->zip }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box -->
            <div class="box-footer">
                <hr>
                <table>
                    <tbody>
                        <td>
                            <a href="{{ route('accounts') }}" class="btn btn-default">Voltar</a>                            
                        </td>
                        <td>
                            <a class="btn btn-primary" href="{{$link}}">Pagar via PagSeguro</a>
                        </td>
                        <td>                            
                            <form action="{{ route('deletOrder', $order->id) }}" method="post" class="form-horizontal">
                                {{ csrf_field() }}
                                <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i> Cancelar</button>
                            </form>
                        </td>
                    </tbody>
                </table>
            </div>
        @endif
    </section>
    <!-- /.content -->
@endsection