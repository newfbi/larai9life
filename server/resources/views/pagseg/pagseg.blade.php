@extends('adminlte::page')

@section('title', 'AdminLTE')

@section('content') 
<div class="box">
    <div class="boxbody">
	<!-- Section: about -->
	<div class="row">
		@if($login == null)
		 <div class="col-lg-9">
			  <h4>Volte quando criar uma conta no Jogo</h4>
			  <ul class="nav nav-pills">
			  <center><li>
			  <a href="/dash" class="glyphicon glyphicon-arrow-left"> Voltar</a>
			  </li>
			  </center>
			  </ul>
		 </div>
	 	@else
		<div class="col-lg-12" style="padding: 20PX;">
			<h3 class="mb">Venda de pacotes de Cash, via PagSeguro</h3>
			@if(Session::has('mensagem'))
	        <div class="alert alert-success">{{ Session::get('mensagem') }}</div>
	        @endif	        
			<!-- Button trigger modal -->
			<div class="col-lg-2 mt">
				<h3>Vale: 3k Cash</h3>
				<img width="150px" height="150px" src="/assets/img/rops1.png"/><br>
				<h5>Valor:${{$item1}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal1">
				  Adquirir
				</button>
			</div>
			<div class="col-lg-2 mt">
				<h3>Vale: 5k Cash</h3>
				<img width="150px" height="150px" src="/assets/img/rops2.png"/><br>
				<h5>Valor:${{$item2}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal2">
				  Adquirir
				</button>
			</div>
			<div class="col-lg-2 mt">
				<h3>Vale: 12k Cash</h3>
				<img width="150px" height="150px" src="/assets/img/rops3.png"/><br>
				<h5>Valor:${{$item3}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal3">
				  Adquirir
				</button>
			</div>		
			<div class="col-lg-2 mt">
				<h3>Vale: 25k Cash</h3>
				<img width="150px" height="150px" src="/assets/img/rops4.png"/><br>
				<h5>Valor:${{$item4}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal4">
				  Adquirir
				</button>
			</div>		
			<div class="col-lg-2 mt">
				<h3>Vale: 45k Cash / Ganhe: 15 dias Vip</h3>
				<img width="150px" height="150px" src="/assets/img/rops5.png"/><br>
				<h5>Valor:${{$item5}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal5">
				  Adquirir
				</button>
			</div>					
			<div class="col-lg-2 mt">
				<h3>Vale: 30 dias Vip</h3>
				<h3></h3>
				<img width="150px" height="150px" src="/assets/img/vip30.png"/><br>
				<h5>Valor:${{$item6}} Reais</h5>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal">
				  Adquirir
				</button>
			</div>
			<!--Modal-->
			@include('pagseg.modal')
			<!--Modal-->
		</div>
		<div class="col-lg-12">
	        <section id="panel">
	            <header class="panel-heading">
	                Minhas Compras
	                <span class="tools pull-right">
	                    <a href="javascript:;" class="fa fa-chevron-down"></a>
	                 </span>
	            </header>
	            <div class="panel-body">
					<div id="contact">
	                <div class="adv-table">
	                    <table id="pagseguro" class="table table-striped table-hover">
	                        <thead>
		                        <tr>
		                            <th class="col-md-2">Data Compra</th>
		                            <th class="col-md-2">Tipo</th>
		                            <th class="col-md-2">Quantidade</th>
		                            <th class="col-md-2">Valor</th>
		                            <th class="col-md-2">Status</th>
		                            <th class="col-md-2">Ações</th>
		                        </tr>
	                        </thead>
	                    </table>
	                	</div>
	                </div>
	            </div>
	        </section>
	        <center><p>Imagens meramente ilustrativas, os valores correspondetes são apenas os descritos nos itens.</p></center>
	        </div>
		</div>
	</div>
		@endif
	</div>
</div>
@stop