<?php

namespace App\Http\Controllers\Front\Orders;

use App\Shop\OrderStatuses\Requests\CreateOrderStatusRequest;
use App\Shop\OrderStatuses\Requests\UpdateOrderStatusRequest;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\Shop\Addresses\Repositories\Interfaces\AddressRepositoryInterface;
use App\Shop\Addresses\Transformations\AddressTransformable;
use App\Shop\Couriers\Courier;
use App\Shop\Couriers\Repositories\CourierRepository;
use App\Shop\Couriers\Repositories\Interfaces\CourierRepositoryInterface;
use App\Shop\Customers\Customer;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Shop\Orders\Order;
use App\Shop\Orders\Repositories\Interfaces\OrderRepositoryInterface;
use App\Shop\OrderStatuses\OrderStatus;
use App\Shop\OrderStatuses\Repositories\Interfaces\OrderStatusRepositoryInterface;
use App\Shop\OrderStatuses\Repositories\OrderStatusRepository;
use laravel\pagseguro\Platform\Laravel5\PagSeguro;
use App\Http\Controllers\Controller;
use Illuminate\Support\Collection;
use Auth;
use DB;
 
class FrontOrderController extends Controller
{
    use AddressTransformable;

    private $orderRepo;
    private $courierRepo;
    private $addressRepo;
    private $customerRepo;
    private $orderStatusRepo;
    private $orderStatuses;

    public function __construct(
        OrderRepositoryInterface $orderRepository,
        CourierRepositoryInterface $courierRepository,
        AddressRepositoryInterface $addressRepository,
        CustomerRepositoryInterface $customerRepository,
        OrderStatusRepositoryInterface $orderStatusRepository
    ) {
        $this->orderRepo = $orderRepository;
        $this->courierRepo = $courierRepository;
        $this->addressRepo = $addressRepository;
        $this->customerRepo = $customerRepository;
        $this->orderStatusRepo = $orderStatusRepository;
        $this->orderStatuses = $orderStatusRepository;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $order = $this->orderRepo->findOrderById($id);
        $order->courier = $this->courierRepo->findCourierById($order->courier_id);
        $order->address = $this->addressRepo->findAddressById($order->address_id);
        $frete = DB::table('couriers')->select('cost')->where('id', 2)->first();


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
                    'description' => 'Pagamento de Reserva de produtos',

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

        return view('front.orders.show', [
            'order' => $order,
            'items' => $this->orderRepo->findProducts($order),
            'customer' => $this->customerRepo->findCustomerById($order->customer_id),
            'currentStatus' => $this->orderStatusRepo->findOrderStatusById($order->order_status_id),
            'payment' => $order->payment,
            'frete' => $frete,
            'link' => $link,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function DeletOrder(int $id)
    {
        DB::table('orders')->where('id', $id)->delete();
        DB::table('pagseguro')->where('id', $id)->delete();

        return redirect()->route('checkout.cancel');
    }
}
