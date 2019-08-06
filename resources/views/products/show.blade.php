@extends("layouts.app")
@section('content')

<div class="card">
    <div class="card-header">Product Details: {{$product->name}}</div>
    <img src="{{asset($product->image)}}" alt="{{$product->name}}" width="100%" height="150px">
    <div class="card-body">
        <div><b>Price:</b>{{$product->price}}</div>
        <div><b>Description:</b>{{$product->description}}</div>
    </div>
</div>


    
@endsection