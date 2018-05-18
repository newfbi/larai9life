@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Painel de controle</h3>
                <!--
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i></button>
                </div>
                -->
            </div>
            <div class="box-body">
                <p>Nesta Area Ficara os paineis adiministrativos de pedidos e entregas!</p>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
        </div>
        <!-- /.box -->
        <div class="box">
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                    <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                    <i class="fa fa-times"></i></button>
            </div>            
            <div class="divider-profile"></div>
               <h4 class="mb text-center">Link de indicação</h4>
                <center>Envie para seus amigos e clientes, seu link de afiliado, divulgue nas redes sociai e ganhe muitos brindes por sua indicação.<hr> 
                <strong>"Atenção, Este link tambem sera utilizado para os clientes reservarem produtos com você! Eles se cadastrando com esse link todos os pedidos de reservas que eles emitirem serão vinculados ao seu perfil."</strong>
                <a href="{{URL::to('/')}}/ref/{{ $adm }}" target="blanck"><h3>{{URL::to('/')}}/ref/{{ $adm }}</h3></a>
                </center><br>
            <div class="divider-profile"></div>
        </div>
    </section>
    <!-- /.content -->
@endsection
