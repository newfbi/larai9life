<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

// rota para pegar o vendedor
$this->get('ref/{user}', function($id)
{
    $results = DB::table('customers')->where('adm_id', $id)->first();
    if($results) {
        $adm = $results->adm_id;
        $user_id = $results->id;
        Session::put('adm_id', $adm);
        Session::put('id', $user_id);
        return Redirect::to('/register');
    }
    else{
        Session::forget('adm_id');
        return Redirect::to('/');
    }
});

/**
 * Admin routes 
 */
Route::namespace('Admin')->group(function () {
    Route::get('admin/login', 'LoginController@showLoginForm')->name('admin.login');
    Route::post('admin/login', 'LoginController@login')->name('admin.login');
    Route::get('admin/logout', 'LoginController@logout')->name('admin.logout');
});
Route::group(['prefix' => 'admin', 'middleware' => ['admin'], 'as' => 'admin.' ], function () {
    Route::namespace('Admin')->group(function () {
        Route::get('/', 'DashboardController@index')->name('dashboard');
        Route::group(['middleware' => ['role:admin,guard:admin']], function () {
            Route::namespace('Products')->group(function () {
                Route::resource('products', 'ProductController');
                Route::get('remove-image-product', 'ProductController@removeImage')->name('product.remove.image');
                Route::get('remove-image-thumb', 'ProductController@removeThumbnail')->name('product.remove.thumb');
            });
            Route::namespace('Customers')->group(function () {
                Route::resource('customers', 'CustomerController');
                Route::resource('customers.addresses', 'CustomerAddressController');
            });
            Route::namespace('Categories')->group(function () {
                Route::resource('categories', 'CategoryController');
                Route::get('remove-image-category', 'CategoryController@removeImage')->name('category.remove.image');
            });
            Route::namespace('Orders')->group(function () {
                Route::resource('orders', 'OrderController');
                Route::resource('order-statuses', 'OrderStatusController');
    		Route::get('update/{id}', 'OrderController@OrderUpdateIndex')->name('orderupdate');
                Route::get('orders/{id}/invoice', 'OrderController@generateInvoice')->name('orders.invoice.generate');
            });
            Route::resource('employees', 'EmployeeController');
            Route::get('employees/{id}/profile', 'EmployeeController@getProfile')->name('employee.profile');
            Route::put('employees/{id}/profile', 'EmployeeController@updateProfile')->name('employee.profile.update');            
            Route::post('employees/profile/edtfoto', 'EmployeeController@postAlterarFoto')->name('employee.profile.foto');
            Route::resource('addresses', 'Addresses\AddressController');
            Route::resource('countries', 'Countries\CountryController');
            Route::resource('countries.provinces', 'Provinces\ProvinceController');
            Route::resource('countries.provinces.cities', 'Cities\CityController');
            Route::resource('couriers', 'Couriers\CourierController');
            Route::resource('attributes', 'Attributes\AttributeController');
            Route::resource('attributes.values', 'Attributes\AttributeValueController');
        });
    });
});

/**
 * Frontend routes
 */
Auth::routes();
$this->group(['middleware' => 'auth'], function() {
    //rotas de entrega
    Route::resource('orders', 'Front\Orders\FrontOrderController');
    $this->post('orders/delete/{id}', 'Front\Orders\FrontOrderController@DeletOrder')->name('deletOrder');

    //rotas pagseguro
    $this->get('/checkout/pagseguro','front\Pagseg\PagueSeguroController@Index')->name('pagseguro.redirect');
    $this->post('/checkout/pagseguro/comprar', 'front\Pagseg\PagSegController@PostComprar')->name('pagseguro.comprar');
    $this->get('/checkout/pagseguro/pendente/{id}', 'front\Pagseg\PagueSeguroController@GetPague')->name('pagseguro');
    $this->get('/checkout/pagseguro/cancelar/{id}', 'front\Pagseg\PagueSeguroController@Cancelar')->name('pagseguro.cancelar');
    $this->get('/checkout/pagseguro/confirme/{id}', 'front\Pagseg\PagueSeguroController@ConfirmPg')->name('pagseguro.confirme');
    $this->post('/checkout/pagseguro/consulta', 'front\Pagseg\PagueSeguroController@Retorno')->name('pagseguro.consulta');
});
Route::namespace('Auth')->group(function () {
    Route::get('cart/login', 'CartLoginController@showLoginForm')->name('cart.login');
    Route::post('cart/login', 'CartLoginController@login')->name('cart.login');
    Route::get('logout', 'LoginController@logout');
});

Route::namespace('Front')->group(function () {
    Route::get('/', 'HomeController@index')->name('home');
    Route::group(['middleware' => ['auth']], function () {
        Route::get('accounts', 'AccountsController@index')->name('accounts');
        Route::get('checkout', 'CheckoutController@index')->name('checkout.index');
        Route::post('checkout', 'CheckoutController@store')->name('checkout.store');
        Route::get('checkout/execute', 'CheckoutController@executePayPalPayment')->name('checkout.execute');
        Route::post('checkout/execute', 'CheckoutController@charge')->name('checkout.execute');
        Route::get('checkout/cancel', 'CheckoutController@cancel')->name('checkout.cancel');
        Route::get('checkout/success', 'CheckoutController@success')->name('checkout.success');
        Route::resource('address', 'CustomerAddressController');
    });
    Route::resource('cart', 'CartController');
    Route::get("category/{slug}", 'CategoryController@getCategory')->name('front.category.slug');
    Route::get("search", 'ProductController@search')->name('search.product');
    Route::get("{product}", 'ProductController@show')->name('front.get.product');
});