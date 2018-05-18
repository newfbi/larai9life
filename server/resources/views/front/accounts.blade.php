@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
        <div class="row">
            <div class="col-md-12">
                <h2> <i class="fa fa-home"></i>Minha Conta</h2>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation"><a href="#orders" aria-controls="orders" role="tab" data-toggle="tab">Pedidos</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Perfil</a></li>
                        <li role="presentation"><a href="#address" aria-controls="address" role="tab" data-toggle="tab">Endereços</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content customer-order-list">
                        <div role="tabpanel" class="tab-pane" id="profile">
                            {{$customer->name}} <br /><small>{{$customer->email}}</small>
                        </div>
                        <div role="tabpanel" class="tab-pane  active" id="orders">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td class="col-md-3">Data</td>
                                    <td class="col-md-2">Correio</td>
                                    <td class="col-md-2">Total</td>
                                    <td class="col-md-2">Status</td>
                                </tr>
                                </tbody>
                                <tbody>
                                @foreach ($orders as $order)
                                    <tr>
                                        <td>
<<<<<<< HEAD
                                            {{ date('m-d-y', strtotime($order['created_at'])) }}
=======
                                            <a href="{{route('orders.show', $order['id'])}}">{{ date('m-d-y', strtotime($order['created_at'])) }}</a>
>>>>>>> 187c8dbad9f00c15f3605b530b1974e5ac6a7657
                                            <!-- Button trigger modal -->
                                        </td>
                                        <td>{{ $order['courier']->name }}</td>
                                        <td><span class="label @if($order['total'] != $order['total_paid']) label-danger @else label-success @endif">{{ config('cart.currency') }} {{ $order['total'] }}</span></td>
                                        @if($order['order_status_id'] == 1)
<<<<<<< HEAD
                                        <td><a href="{{route('orders.show', $order['id'])}}" class="btn btn-primary btn-block">{{ $order['status']->name }}</a></td>
                                        @endif
                                        @if($order['order_status_id'] == 2)
                                        <td><a href="{{route('orders.show', $order['id'])}}" class="btn btn-info btn-block">{{ $order['status']->name }}</a></td>
                                        @endif
                                        @if($order['order_status_id'] == 3)
                                        <td><a href="{{route('orders.show', $order['id'])}}" class="btn btn-danger btn-block">{{ $order['status']->name }}</a></td>
                                        @endif
                                        @if($order['order_status_id'] == 4)
                                        <td><a href="{{route('orders.show', $order['id'])}}" class="btn btn-success btn-block">{{ $order['status']->name }}</a></td>
=======
                                        <td><button type="button" class="btn btn-primary btn-block">{{ $order['status']->name }}</button></td>
                                        @endif
                                        @if($order['order_status_id'] == 2)
                                        <td><button type="button" class="btn btn-info btn-block">{{ $order['status']->name }}</button></td>
                                        @endif
                                        @if($order['order_status_id'] == 3)
                                        <td><button type="button" class="btn btn-danger btn-block">{{ $order['status']->name }}</button></td>
                                        @endif
                                        @if($order['order_status_id'] == 4)
                                        <td><button type="button" class="btn btn-success btn-block">{{ $order['status']->name }}</button></td>
>>>>>>> 187c8dbad9f00c15f3605b530b1974e5ac6a7657
                                        @endif
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        {{ $orders->links() }}
                        </div>
                        <div role="tabpanel" class="tab-pane" id="address">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="{{route('address.create')}}" class="btn btn-primary">Criar novo Endereço</a>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                    <th>Rua</th>
                                    <th>Numero</th>
                                    <th>Complemento</th>
                                    <th>Cidade</th>
                                    <th>CEP</th>
                                    <th>Telefone</th>
                                    <th>Status</th>
                                </thead>
                                <tbody>                                
                                @if($addresses == null)
                                @else
                                @foreach($addresses as $address)
                                    <tr>
                                        <td>{{$address->alias}}</td>
                                        <td>{{$address->address_1}}</td>
                                        <td>{{$address->address_2}}</td>
                                        <td>{{$city}}</td>
                                        <td>{{$address->zip}}</td>
                                        <td>{{$address->phone}}</td>
                                        <td>
                                            <form action="{{ route('address.destroy', $address->id) }}" method="post" class="form-horizontal">
                                                {{ csrf_field() }}
                                                <input type="hidden" name="_method" value="delete">
                                                <div class="btn-group">
                                                    <a href="{{ route('address.edit', $address->id) }}" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> Editar</a>
                                                    <button onclick="return confirm('Are you sure?')" type="submit" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Deletar</button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                @endif
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
@endsection
