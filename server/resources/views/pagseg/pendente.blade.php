@extends('adminlte::page')

@section('title', 'AdminLTE')

@section('content')
<div class="box">
    <div class="boxbody">
    <!-- Section: about -->
    <div class="row">
    <!-- page start-->
    <div class="col-sm-12 mt detailed content-panel">
        <div class="col-lg-4 mt">
          <div id="contact">
            <div class="panel" style="padding: 15PX;">
            <h4>Compra de Cash, via PagSeguro</h4>
            <a class="btn btn-primary" href="/dash/pagseguro">Voltar</a></br></br>
             <p><b>N° da Compra: {{$id}}</b></p>
             <p><b>N° de Referencia: {{$refer}}</b></p> 
            @if($status == 'resgatatado')
            <div class="btn btn-success btn-xs">Creditado</div>
            @endif
            @if($status == 'pendente')
            <div class="btn btn-warning btn-xs">Aguardando Liberação</div>
            @endif
            @if($status == 'cancelado')
            <div class="btn btn-danger btn-xs">Cancelado</div>
            @endif
            <p>Email: {{Auth::user()->email}}</p>
            <p>Data da Compra: {{$data}}</p>
            <span id="invoice">
                @if($status == 'pendente')
                <p class="align-center">Por favor envie o <span><span id="amount">valor $</span>{{$valor}}</span> Via PagSeguro</p>
                @endif
                @if($status=='resgatado')
                <p class="address" id="address">Creditado</p>
                <span>
                    <i class="fa fa-check margin-right-05em"></i> Obrigado! Sua compra foi efetuada com sucesso e seus Créditos já está disponivel.
                </span>
                @endif
                @if($status=='cancelado')
                <p class="address" id="address">Cancelado</p>
                @endif
            </span>
            @if($status=='pendente')
                  <div class="panel-heading">Confirmar pagamento*:</br></br>
                      <a class="btn btn-primary btn-large"  data-toggle="modal" data-target="#Modal1" >Confirmar!</a>
                      <a class="btn btn-danger" data-toggle="modal" data-target="#Modal2">Cancelar</a>
                  </div>
                  <!-- Modal -->
                <div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      @if($online > 0)
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Aviso Inportante</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <p>O sistema identificou que você tem personagens conectados</p>
                        <p>Por favor, para efetudar pagamentos disconecte todos seus personagens.</p>
                        <p>A staff não irá se responsabilizar por futura perdas, devido a irregularidades cometidas pelos Usúarios.</p>
                        <p>Ao deslogar os personagens atualize a página e tente novamente.</p>
                      </div>
                      @else                      
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <p>Deseja Realmente efetuar a Compra?</p>
                        <p>Ao clicar em continuar você será redirecionado para a pagina de Compra.</p>
                        <p>Assim que o pagamento for confirmado, basta entrar no jogo e verificar seus pontos no shopping.</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-primary" href="{{$link}}">Continuar</a>
                      </div>
                      @endif
                    </div>
                  </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">     
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirmar Cancelamento de Compra</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <p>Deseja Realmente efetuar o Cancelamento da Compra?</p>
                        <p>Ao clicar em continuar você cancelara seu pedido de Compra.</p>
                        <p>Para efetuar uma nova Compra será necessário efetuar uma nova solicitação.</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-primary" href="/dash/pagseguro/cancelar/{{$id}}">Continuar</a>
                      </div>
                    </div>
                  </div>
                </div>
            @endif
            </div> 
          </div>
        </div>
        @if($status=='pendente')
        <div class="col-lg-6 mt">
          <div id="contact">
            <section class="panel"  style="padding: 15PX;">
            <h4 >Instruções para efetuar Compra</h4><br>
            <li><b>1) Click em confirmar, logo após você será direcionado para a pagina do PagSeguro.</b></li><br>
            <li><b>2) Efetue o login com os seus dados ou efetue um novo cadastro</b></li><br>
            <li><b>3) Após a confirmação do pagamento, você terá que esperar o prazo de até 24hs para a liberação do seu crédito</b></li><br>
            <li><b>4) A equipe de adiministração irá efetuar uma verificação e logo após liberarar seus créditos.</b></li><br>
            <li><b>5) Aviso, qualquer tentativa de compras falsas ou duplicados, terá a conta desativada "PERMANENTEMENTE".</b></li><br>
            </section>
          </div>
        </div>
        @endif
    </div>
<!-- page end-->
    </div>
  </div>
</div>
@stop