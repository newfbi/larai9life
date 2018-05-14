@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <form action="{{ route('admin.attributes.store') }}" method="post" class="form">
                <div class="box-body">
                    <div class="row">
                        {{ csrf_field() }}
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name">Valor do atributo <span class="text-danger">*</span></label>
                                <input type="text" name="name" id="name" placeholder="Nome do atributo" class="form-control" value="{!! old('name')  !!}">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.attributes.index') }}" class="btn btn-default">Voltar</a>
                        <button type="submit" class="btn btn-primary">Criar</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection
