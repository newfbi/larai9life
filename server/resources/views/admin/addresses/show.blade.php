@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
    @include('layouts.errors-and-messages')
    <!-- Default box -->
        <div class="box">
            <div class="box-body">
                <h2>Endereços</h2>
                <table class="table">
                    <tbody>
                    <tr>
                        <td class="col-md-1">Endereço</td>
                        <td class="col-md-2">Numero</td>
                        <td class="col-md-2">Complemento</td>
                        <td class="col-md-2">Cidade</td>
                        <td class="col-md-2">Pais</td>
                        <td class="col-md-2">CEP</td>
                        <td class="col-md-1">Status</td>
                    </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td>{{ $address->alias }}</td>
                        <td>{{ $address->address_1 }}</td>
                        <td>{{ $address->address_2 }}</td>
                        <td>
                            @if(isset($address->city))
                                {{ $address->city->name }}
                            @endif
                        </td>
                        <td>{{ $address->country->name }}</td>
                        <td>{{ $address->zip }}</td>
                        <td>@include('layouts.status', ['status' => $address->status])</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <div class="btn-group">
                    <a href="{{ route('admin.addresses.index') }}" class="btn btn-default btn-sm">Voltar</a>
                </div>
            </div>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection