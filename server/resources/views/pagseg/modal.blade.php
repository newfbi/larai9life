<!-- 1 Modal -->
<div class="modal fade" id="Modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra página com mais detalhes.</p>
        <p>Após a compra ser preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
		<input type="text" class="form-control" name="valor" value="{{$item1}}">
		<input type="text" class="form-control" name="refer" value="{{$refer1}}">
		<input type="text" class="form-control" name="quantidade" value="{{$quantidade1}}">
		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>
<!-- 2 Modal -->
<div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra página com mais detalhes.</p>
        <p>Após a compra será preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
		<input type="text" class="form-control" name="valor" value="{{$item2}}">
		<input type="text" class="form-control" name="refer" value="{{$refer2}}">
		<input type="text" class="form-control" name="quantidade" value="{{$quantidade2}}">
		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>
<!-- 3 Modal -->
<div class="modal fade" id="Modal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra página com mais detalhes.</p>
        <p>Após a compra será preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
      		<input type="text" class="form-control" name="valor" value="{{$item3}}">
      		<input type="text" class="form-control" name="refer" value="{{$refer3}}">
      		<input type="text" class="form-control" name="quantidade" value="{{$quantidade3}}">
    		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>
<!-- 4 Modal -->
<div class="modal fade" id="Modal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra página com mais detalhes.</p>
        <p>Após a compra será preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
		<input type="text" class="form-control" name="valor" value="{{$item4}}">
		<input type="text" class="form-control" name="refer" value="{{$refer4}}">
		<input type="text" class="form-control" name="quantidade" value="{{$quantidade4}}">
		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>
<!-- 5 Modal -->
<div class="modal fade" id="Modal5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra pagina com mais detalhes.</p>
        <p>Após a compra será preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
		<input type="text" class="form-control" name="valor" value="{{$item5}}">
		<input type="text" class="form-control" name="refer" value="{{$refer5}}">
		<input type="text" class="form-control" name="quantidade" value="{{$quantidade5}}">
		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>
<!-- 6 Modal -->
<div class="modal fade" id="Modal6" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Comfirmar Compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Deseja Realmente efetuar essa Compra?</p>
        <p>Ao clicar em continuar você será direcionado para outra pagina com mais detalhes.</p>
        <p>Após a compra será preciso efetuar a confirmação, você terá que aguarda o prazo de até 24hs.</p>
      </div>
      <div class="modal-footer">
        {{ Form::open(array('route' => 'pagseguro.comprar', 'role' => 'form', 'method' => 'POST')) }}
        <span class="success" id="success" style="display: none;">
		<input type="text" class="form-control" name="valor" value="{{$item6}}">
		<input type="text" class="form-control" name="refer" value="{{$refer6}}">
		<input type="text" class="form-control" name="quantidade" value="{{$quantidade6}}">
		</span>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Continuar</button>
        {{ Form::close() }}
      </div>
    </div>
  </div>
</div>