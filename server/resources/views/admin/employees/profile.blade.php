@extends('layouts.admin.app')

@section('content')
    <!-- Main content -->
    <section class="content">
        <div class="box">
            <div class="box-body">        
                <div class="row">
                    <div class="col-md-6 profile-text">
                      <div id="contact">
                        <div class="profile-pic text-center">
                          <h4>Alterar Foto</h4>
                          @if(empty(Auth::guard('admin')->user()->foto))
                          <img src="/img/avatar5.png">
                          <br>
                          <br> 
                          @else
                          <img src="/img/{{ Auth::guard('admin')->user()->foto }}">
                          <br>
                          <br>
                          @endif
                        {{Form::open(array('route'=>'admin.employee.profile.foto','method'=>'POST','files'=>true))}}
                              <div class="input-group">
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <span class="btn btn-white btn-file">
                                    <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Selecionar Arquivo</span>
                                    <span class="fileupload-exists"><i class="fa fa-undo"></i> Limpar</span>
                                    <input type="file" name="foto" class="default" />
                                  </span>
                                  <span class="fileupload-preview" style="margin-left:5px;"></span>
                                  <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                  {{Form::submit('Alterar Foto', array('class'=>'btn btn-success'))}}
                                </div>
                              </div>
                        {{Form::close()}}
                        </div>
                      </div>
                    </div> 
                </div>
        @include('layouts.errors-and-messages')
            <form action="{{ route('admin.employee.profile.update', $employee->id) }}" method="post" class="form">
                <input type="hidden" name="_method" value="put">
                {{ csrf_field() }}
            <!-- Default box -->
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="col-md-4">Nome</td>
                            <td class="col-md-4">Email</td>
                            <td class="col-md-4">Password</td>
                        </tr>
                    </tbody>
                    <tbody>
                    <tr>
                        <td>
                            <div class="form-group">
                                <input name="name" type="text" class="form-control" value="{{ $employee->name }}">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <input name="email" type="email" class="form-control" value="{{ $employee->email }}">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <input name="password" type="password" class="form-control" value="" placeholder="xxxxxx">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <!-- /.box-body -->
                <div class="box-footer">
                    <div class="btn-group">
                        <a href="{{ route('admin.dashboard') }}" class="btn btn-default btn-sm">Voltar</a>
                        <button class="btn btn-success btn-sm" type="submit"> <i class="fa fa-save"></i> Salvar</button>
                    </div>
                </div>
                <!-- /.box -->
            </form>
            </div>
        </div>
    </section>
    <!-- /.content -->
@endsection
