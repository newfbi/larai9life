@extends('layouts.front.app')

@section('content')
    <!-- Main content -->
    <section class="container content">
        @include('layouts.errors-and-messages')
        <div class="box">
            <form action="{{ route('address.update', $address->id) }}" method="post" class="form" enctype="multipart/form-data">
                <div class="box-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="_method" value="put">
                    <div class="form-group">
                        <label for="alias">Endereço<span class="text-danger">*</span></label>
                        <input type="text" name="alias" id="alias" placeholder="Home or Office" class="form-control" value="{{ $address->alias ?: old('alias') }}">
                    </div>
                    <div class="form-group">
                        <label for="address_1">Numero<span class="text-danger">*</span></label>
                        <input type="text" name="address_1" id="address_1" placeholder="Address 1" class="form-control" value="{{ $address->address_1 ?: old('address_1') }}">
                    </div>
                    <div class="form-group">
                        <label for="address_2">Complemento </label>
                        <input type="text" name="address_2" id="address_2" placeholder="Address 2" class="form-control" value="{{ $address->address_2 ?: old('address_2') }}">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="country_id" value="1">
                        <input type="hidden" name="province_id" value="1">
                        <input type="hidden" name="city_id" value="1">

                    </div>
                    <div class="form-group">
                        <label for="zip">CEP </label>
                        <input type="text" name="zip" id="zip" placeholder="Zip code" class="form-control" value="{{ $address->zip ?: old('zip') }}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Telefone</label>
                        <input type="text" name="phone" id="phone" placeholder="Numero de Telefone" class="form-control" value="{{ old('phone') }}">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="status" value="1">
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('accounts') }}" class="btn btn-default">Voltar</a>
                        <button type="submit" class="btn btn-primary">Atualizar</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
@endsection
@section('js')
    <script type="text/javascript">
        $(document).ready(function () {
            $('#province_id').change(function () {
                var provinceId = $(this).val();
                $.ajax({
                    url: '/api/v1/country/169/province/' + provinceId + '/city',
                    contentType: 'json',
                    success: function (data) {
                        var html = '<label for="city_id">City </label>';
                            html += '<select name="city_id" id="city_id" class="form-control">';
                            $(data.data).each(function (idx, v) {
                                html += '<option value="'+ v.id+'">'+ v.name +'</option>';
                            });
                            html += '</select>';
                        $('#cities').html(html).show();
                    },
                    errors: function (data) {
                        console.log(data);
                    }
                });
            });
        });
    </script>
@endsection