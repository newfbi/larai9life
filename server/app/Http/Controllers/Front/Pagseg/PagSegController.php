<?php

namespace App\Http\Controllers\Front\Pagseg;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProdutosFormRequest;
use laravel\pagseguro\Platform\Laravel5\PagSeguro;
use Illuminate\Support\Facades\Input;
use App\Providers\Util;
use App\Models\BlockIoTest;
use App\Models\PagueSeguro;
use LaraBlockIo;
use Validator;
use QrCode;
use Config;
use Redirect;
use Auth;
use Asset;
use DB;

class PagSegController extends Controller
{
    private $login;

    public function __construct(BlockIoTest $login)
    {
        $this->login = $login;

        $this->middleware('auth');
    }

    public function PostComprar()
    {
        //tras as informações da pagina pendente e acrescenta nos input
        $id_user = Auth::user()->id;
        $valor = Input::get('valor');
        $quantidade = Input::get('quantidade');
        $refer = Input::get('refer');
        $status = "pendente";
        $tipo = "Cash";
        $data = date("Y-m-d H:i:s");
        //acrescenta as informações no banco de dados
        DB::table('pagseguro')->insert([
            'user_id' => $id_user,
            'data_compra' => $data,
            'valor' => $valor,
            'tipo' => $tipo,
            'status' => $status,
            'quantidade' => $quantidade,
            'reference' => $refer,
        ]);
        
        return Redirect::to('/dash/pagseguro')->with('mensagem', 'Sua compra em PagSeguro foi Iniciada com sucesso!');
    }
}