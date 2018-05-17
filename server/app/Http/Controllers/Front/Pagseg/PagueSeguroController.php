<?php 

namespace App\Http\Controllers\Front\Pagseg;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProdutosFormRequest;
use Illuminate\Support\Facades\Input;
use laravel\pagseguro\Platform\Laravel5\PagSeguro;
use App\Providers\Util;
use App\Models\BlockIoTest;
use App\Models\PagueSeguro;
use App\User;
use LaraBlockIo;
use Validator;
use QrCode;
use Config;
use Redirect;
use Auth;
use Asset;
use DB;

class PagueSeguroController extends Controller
{
    private $login;

    public function __construct(BlockIoTest $login)
    {
        $this->login = $login;

        $this->middleware('auth');
    }

    public function GetPague($id) 
    {   
        $id_user = Auth::user()->id;
        $page = DB::table('pagseguro')->where('id', $id)->first();
        //pega os dados vindo do banco de dados pagseguro
        $tipo = $page->tipo;
        $valor = $page->valor;
        $quantidade = $page->quantidade;
        $code = $page->codigo;
        $data = $page->data_compra;
        $status = $page->status;
        $refer = $page->reference;
        // cria o item que sera acrescentado junto com as informações do pagseguro
        $item = [
            'items' => [
                [
                    'id' => $id,
                    'description' => 'Pacote com: '.$quantidade.' '.$tipo,

                    'quantity' => '1',
                    'amount' => $valor,
                ]
            ],
            'reference' => $refer,
        ];
        //utiliza a api para juntar as informações e criar o checkout
        $checkout = PagSeguro::checkout()->createFromArray($item);
        $credentials = PagSeguro::credentials()->get();
        // Retorna um objeto de laravel\pagseguro\Checkout\Information\Information
        $information = $checkout->send($credentials); 
        $link =  $information->getlink();
        
        return view('pagseg.pendente', compact('link', 'tipo', 'valor', 'quantidade', 'id', 'data', 'status', 'refer', 'online'));
    }

    public function Cancelar($id) {   
        //cliente pediu para cancelar o produto.
         DB::table('pagseguro')->where('id', $id)->update(['status' => "cancelado"]);

        return Redirect::to('/dash/pagseguro')->with('mensagem', 'Seu pedido de Compra foi Cancelado com sucesso!');
    }

    public function Retorno() {
        $code = '393DC52A-C966-4842-A4F9-C5A29B3C909B';
        $credentials = PagSeguro::credentials()->get();
        $transaction = PagSeguro::transaction()->get($code, $credentials);
        $information = $transaction->getInformation();
        dd($information);
        return view('pagseg.retornops');
    }

}