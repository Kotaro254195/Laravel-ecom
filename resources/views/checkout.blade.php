@extends("layouts.frontend")
@section("page")

<div class="container-fluid">
	<div class="row medium-padding120 bg-border-color">
		<div class="container">

			<div class="row">

				<div class="col-lg-12">
			<div class="order">
				<h2 class="h1 order-title text-center">Your Order</h2>
				@if(Cart::content()->count() !=0)
				<form action="#" method="post" class="cart-main">
						
						<table class="shop_table cart">
							<thead class="cart-product-wrap-title-main">
							<tr>
								<th class="product-thumbnail">Product</th>
								<th class="product-quantity">Quantity</th>
								<th class="product-subtotal">Total</th>
							</tr>
							</thead>
							<tbody>
						
							@foreach (Cart::content() as $item)
							<tr class="cart_item">

								<td class="product-thumbnail">

									<div class="cart-product__item">
										<div class="cart-product-content">
											<h5 class="cart-product-title">{{$item->name}}</h5>
										</div>
									</div>
								</td>

								<td class="product-quantity">

									<div class="quantity">
										x {{$item->qty}}
									</div>

								</td>

								<td class="product-subtotal">
									<h5 class="total amount">${{$item->total}}</h5>
								</td>

							</tr>  
							@endforeach
									
							<tr class="cart_item subtotal">

								<td class="product-thumbnail">


									<div class="cart-product-content">
										<h5 class="cart-product-title">	SubTotal:</h5>
									</div>


								</td>

								<td class="product-quantity">

								</td>

								<td class="product-subtotal">
									<h5 class="total amount">${{number_format(Cart::total())}}</h5>
								</td>
							</tr>
						
							{{-- <tr class="cart_item total">

								<td class="product-thumbnail">


									<div class="cart-product-content">
										<h5 class="cart-product-title">Total:</h5>
									</div>


								</td>

								<td class="product-quantity">

								</td>

								<td class="product-subtotal">
									<h5 class="total amount">${{number_format(Cart::total())}}</h5>
								</td>
							</tr> --}}

							</tbody>
						</table>
						
				

					<div class="cheque">

						<div class="logos">
							<a href="#" class="logos-item">
								<img src="{{asset('app/img/visa.png')}}" alt="Visa">
							</a>
							<a href="#" class="logos-item">
								<img src="{{asset('app/img/mastercard.png')}}" alt="MasterCard">
							</a>
							<a href="#" class="logos-item">
								<img src="{{asset('app/img/discover.png')}}" alt="DISCOVER">
							</a>
							<a href="#" class="logos-item">
								<img src="{{asset('app/img/amex.png')}}" alt="Amex">
							</a>
							
							<span style="float: right;">
								<form action="{{ route("cart.checkout") }}" method="POST">
									@csrf
									  <script
									    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
									    data-key="pk_test_wUmWF0ZDpwamge8dG95pSDqp00lEsfbJnD"
									    data-amount="{{Cart::total()*100}}" {{--これが＄だから掛けている--}}
									    data-name="Laravel_Stripe.com"
									    data-description="LaravelEcommerceProducts"
									    data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
									    data-locale="auto"
									    data-zip-code="true">
									  </script>
								</form>
							</span>
						</div>
					</div>

				</form>
				@else
							<table class="shop_table cart">
								<thead class="cart-product-wrap-title-main">
								<tr>
								<th class="text-center">No product added to Cart. Cart is empty! </th>
								</tr>
								</thead>
							</table>
				@endif
			</div>
		</div>

			</div>
		</div>
	</div>
</div>



@endsection