@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        <div class="box">
            <div class="box-header">
                <div class="row">
                    <div class="col-md-6">
                        <h2>
                            <a href="{{ route('admin.customers.show', $customer->id) }}">Nome: {{$customer->name}}</a> <br />
                            <small>Email: {{$customer->email}}</small> <br />
                            <small>Referencia do pedido: <strong>{{$order->reference}}</strong></small>
                        </h2>
                    </div>
                    <div class="col-md-3 col-md-offset-3">
                        <a href="{{route('admin.orders.invoice.generate', $order['id'])}}" class="btn btn-primary btn-block">Download de Pedido</a>
                    </div>
                </div>                
                <div class="col-md-2">
                    <h2><a href="{{route('admin.orderupdate', $order['id'])}}" class="btn btn-primary btn-block">Editar pedido</a></h2>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">
                <h3> <i class="fa fa-shopping-bag"></i> Informações do Pedido</h3>
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
                        <td>{{ date('M d, Y h:i a', strtotime($order['created_at'])) }}</td>
                        <td><a href="{{ route('admin.customers.show', $customer->id) }}">{{ $customer->name }}</a></td>
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
                    <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="bg-warning">Subtotal</td>
                        <td class="bg-warning">{{ $order['total_products'] }}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="bg-warning">Taxa</td>
                        <td class="bg-warning">{{ $order['tax'] }}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="bg-warning">Disconto</td>
                        <td class="bg-warning">{{ $order['discounts'] }}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="bg-success text-bold">Total do Pedido</td>
                        <td class="bg-success text-bold">{{ $order['total'] }}</td>
                    </tr>
                    @if($order['total_paid'] != $order['total'])
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="bg-danger text-bold">Total paid</td>
                            <td class="bg-danger text-bold">{{ $order['total_paid'] }}</td>
                        </tr>
                    @endif
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        @if($order)
            @if($order->total != $order->total_paid)
                <p class="alert alert-danger">
                    Ooops, há discrepância no valor total do pedido e no valor pago. <br />
                    Valor total do pedito: <strong>{{ config('cart.currency') }} {{ $order->total }}</strong> <br>
                    Valor total pago <strong>{{ config('cart.currency') }} {{ $order->total_paid }}</strong>
                </p>

            @endif
            <div class="box">
                @if(!$items->isEmpty())
                    <div class="box-body">
                        <h3> <i class="fa fa-gift"></i> Items</h3>
                        <table class="table">
                            <thead>
                            <th class="col-md-2">Referencia</th>
                            <th class="col-md-2">Nome</th>
                            <th class="col-md-2">Descrição</th>
                            <th class="col-md-2">Quantidade</th>
                            <th class="col-md-2">Preço</th>
                            <th class="col-md-2">Status</th>
                            </thead>
                            <tbody>
                            @foreach($items as $item)
                                <tr>
                                    <td>{{ $item->sku }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{!! $item->description !!}</td>
                                    <td>{{ $item->pivot->quantity }}</td>
                                    <td>{{ $item->price }}</td>
                                    <td>@include('layouts.status', ['status' => $item->status])</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h3> <i class="fa fa-truck"></i> Entrega</h3>
                            <table class="table">
                                <thead>
                                    <th class="col-md-3">Tipo de Entrega</th>
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
                            <h4> <i class="fa fa-map-marker"></i> Endereço</h4>
                            <table class="table">
                                <thead>
                                    <th>Endereço</th>
                                    <th>Numero</th>
                                    <th>Cidade</th>
                                    <th>Telefone</th>
                                    <th>CEP</th>
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
                <a href="{{ route('admin.orders.index') }}" class="btn btn-default">Voltar</a>
            </div>
        @endif

    </section>
    <!-- /.content -->
@endsection