<?php

namespace App\Shop\PaymentMethods\Stripe;

use App\Shop\Checkout\CheckoutRepository;
use App\Shop\Couriers\Courier;
use App\Shop\Couriers\Repositories\CourierRepository;
use App\Shop\Customers\Customer;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\PaymentMethods\Stripe\Exceptions\StripeChargingErrorException;
use Gloudemans\Shoppingcart\Facades\Cart;
use Ramsey\Uuid\Uuid;
use Stripe\Charge;
use DB;

class StripeRepository
{
    /**
     * @var Customer
     */
    private $customer;

    /**
     * StripeRepository constructor.
     * @param Customer $customer
     */
    public function __construct(Customer $customer)
    {
        $this->customer = $customer;
    }

    /**
     * @param array $data Cart data
     * @param $total float Total items in the cart
     * @param $tax float The tax applied to the cart
     * @return Charge Stripe charge object
     * @throws StripeChargingErrorException
     */
    public function execute(array $data, $total, $tax)
    {
            $courierRepo = new CourierRepository(new Courier);
            $courierId = $data['courier'];
            $courier = $courierRepo->findCourierById($courierId);

            $totalComputed = $total + $courier->cost;

            $customerRepo = new CustomerRepository($this->customer);

            $checkoutRepo = new CheckoutRepository;
            $checkoutRepo->buildCheckoutItems([
                'reference' => Uuid::uuid4()->toString(),
                'courier_id' => $courierId,
                'customer_id' => $this->customer->id,
                'adm_id' => '1',
                'address_id' => $data['billing_address'],
                'order_status_id' => 2,
                'payment' => strtolower(config('stripe.name')),
                'discounts' => 0,
                'total_products' => $total,
                'total' => $totalComputed,
                'total_paid' => $totalComputed,
                'tax' => $tax
            ]);

            //tras as informações da pagina pendente e acrescenta nos input
            $id_user = $this->customer->id;
            $valor = $totalComputed;
            $quantidade = 1;
            $refer = Uuid::uuid4()->toString();
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

                Cart::destroy();
            return redirect()->route('checkout.execute');
    }
}
