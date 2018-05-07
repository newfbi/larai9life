<?php

namespace App\Http\Controllers\Front;

use App\Shop\Couriers\Repositories\Interfaces\CourierRepositoryInterface;
use App\Shop\Customers\Repositories\CustomerRepository;
use App\Shop\Customers\Repositories\Interfaces\CustomerRepositoryInterface;
use App\Http\Controllers\Controller;
use App\Shop\Orders\Order;
use App\Shop\Orders\Transformers\OrderTransformable;
use DB;

class AccountsController extends Controller
{
    use OrderTransformable;

    private $customerRepo;
    private $courierRepo;

    public function __construct(
        CourierRepositoryInterface $courierRepository,
        CustomerRepositoryInterface $customerRepository
    ) {
        $this->customerRepo = $customerRepository;
        $this->courierRepo = $courierRepository;
    }

    public function index()
    {
        $customer = $this->customerRepo->findCustomerById(auth()->user()->id);

        $customerRepo = new CustomerRepository($customer);
        $orders = $customerRepo->findOrders();

        $orders->transform(function (Order $order) {
            return $this->transformOrder($order);
        });

        $addresses = $customerRepo->findAddresses();

        foreach ($addresses as $addres) {
            $province = DB::table('cities')->where('province_id', $addres->province_id)->select('name')->first();
            $city = DB::table('provinces')->where('country_id', $addres->country_id)->select('name')->first();
        }
        $province = $province->name;
        $city = $city->name;
        $orders = $this->customerRepo->paginateArrayResults($orders->toArray(), 3);

        return view('front.accounts', compact('customer', 'orders', 'addresses', 'city', 'province'));
    }
}
