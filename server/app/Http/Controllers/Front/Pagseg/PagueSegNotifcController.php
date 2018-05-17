<?php

namespace App\Http\Controllers\Front\Pagseg;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProdutosFormRequest;
use laravel\pagseguro\Platform\Laravel5\PagSeguro;
use laravel\pagseguro\Notification\Notification;
use Illuminate\Support\Facades\Input;
use Validator;
use Config;
use Redirect;
use Auth;
use Asset;
use DB;

class PagueSegNotifcController extends Controller
{ 

    public function Postnotification(Request $request)
    {
    	if(!$request->notificationCode){
    	    return response()->json(['error' => 'Este link inspirou favor consultar a staff'], 404);
    	}

        $data = [
            'notificationCode' => $request->notificationCode,
            'notificationType' => 'transaction',
        ];
        $notification = new Notification($data);
       	$credentials = PagSeguro::credentials()->get();
		$transaction = $notification->check($credentials);
		$status = $transaction->getStatus()->getcode();
		$refer = $transaction->getreference();
		$item = $transaction->getitems();
		$id = $item[0]->getid();
		$codigo = $transaction->getcode();

		// holve algum problema de verificação
		if($status < '3'){

			$status = "pendente";
			DB::table('pagseguro')->where('id', $id)->update([
	            'status' => $status,
	            'codigo' => $codigo,
	        ]);
        	return Redirect::to('/accounts')->with('mensagem', 'Sua compra em PagSeguro Não foi Aporvada!');
		}
		// pagamento foi pago ou já foi confirmado o pagamento
		else if($status == '3' || $status == '4'){

			$status = "creditado";
			$valor = '3000';
			DB::table('pagseguro')->where('id', $id)->update([
            'status' => $status,
            'codigo' => $codigo,
            'reference' => $refer,
        	]);
    		return Redirect::to('/accounts')->with('mensagem', 'Sua compra em PagSeguro foi Aporvada com Sucesso!');

		}else if($status >'4'){// o pagamento não foi aprovado ou o cliente recusou

			$status = "cancelado";
			DB::table('pagseguro')->where('id', $id)->update([
	            'status' => $status,
	            'codigo' => $codigo,
	        ]);
	        return Redirect::to('/accounts')->with('mensagem', 'Sua compra em PagSeguro Não foi Aporvada!');
		}
    }
}