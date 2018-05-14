@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <form action="{{ route('admin.attributes.values.store', $attribute->id) }}" method="post" class="form">
                <div class="box-body">
                    <div class="row">
                        {{ csrf_field() }}
                        <div class="col-md-12">
                            <h2>Definir valor para: <strong>{{ $attribute->name }}</strong></h2>
                            <div class="form-group">
                                <label for="value">Valor do atributo <span class="text-danger">*</span></label>
                                <input type="text" name="value" id="value" placeholder="Attribute value" class="form-control" value="{!! old('value')  !!}">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.attributes.show', $attribute->id) }}" class="btn btn-default btn-sm">Voltar</a>
                        <button type="submit" class="btn btn-primary btn-sm">Criar</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection
