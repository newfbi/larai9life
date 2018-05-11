@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
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
        <!-- /.box -->
        <div class="box-footer">
            <a href="{{ route('admin.orders.index') }}" class="btn btn-default">Voltar</a>
        </div>
    </section>
    <!-- /.content -->
@endsection