<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
    	$adm = Auth::guard('admin')->user()->id;

        return view('admin.dashboard', compact('adm'));
    }
}
