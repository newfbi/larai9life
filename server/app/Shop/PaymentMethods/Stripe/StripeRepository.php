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
            $options['source'] = 'tok_1CSFSZG75191S4Hd8fRdSOYN';
            $options['currency'] = 'usd';

                $checkoutRepo = new CheckoutRepository;
                $checkoutRepo->buildCheckoutItems([
                    'reference' => Uuid::uuid4()->toString(),
                    'courier_id' => $courierId,
                    'customer_id' => $this->customer->id,
                    'address_id' => $data['billing_address'],
                    'order_status_id' => 2,
                    'payment' => strtolower(config('stripe.name')),
                    'discounts' => 0,
                    'total_products' => $total,
                    'total' => $totalComputed,
                    'total_paid' => $totalComputed,
                    'tax' => $tax
                ]);

                Cart::destroy();
            return redirect()->route('checkout.execute');
    }
}
