<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\charge;
use Illuminate\Support\Facades\Session;
use Cart;
use App\Mail\PurchaseSuccessful;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    public function index(){
        return view("checkout");
    }

    public function payment(){
        
        //set the stripe secret api key
        Stripe::setApiKey("sk_test_LbwkiRua0n71MNbUj5pmU0Qb00rAUWLDCW");
        // dd(request()->all());        

        //get the token and make charge
        $token=request()->stripeToken;
        // dd($token);

        $charge=Charge::create([
            'amount'=>Cart::total()*100,
            'currency'=>'usd',
            'description'=>'laravel stripe demo',
            'source'=>$token
        ]);

        // dd($charge);

        //Session
        Session::flash("success","Purchased successfully");

        //destroy the cart
        Cart::destroy();

        Mail::to(request()->stripeEmail)->send(new PurchaseSuccessful);
        return redirect('/');
    }
}
