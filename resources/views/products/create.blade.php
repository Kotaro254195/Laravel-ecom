@extends('layouts.app')
@section("content")

<div class="card">
        <div class="card-header">New Product</div>

        <div class="card-body">

            <form action="{{isset($product)? route("products.update",['id'=>$product->id]) : route("products.store")}}" method="POST" enctype="multipart/form-data">
                @csrf
                @if(isset($product))
                    @method("PUT")
                @endif
                <div calss="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" class="form-control" value="{{isset($product)? $product->name: old("name")}}">
                </div>
                <div calss="form-group">
                    <label for="name">Price</label>
                    <input type="number" name="price" class="form-control" value="{{isset($product)? $product->price: old("price")}}">
                </div>
                <div calss="form-group">
                    <label for="name">Image</label>
                    <input type="file" name="image" class="form-control">
                </div>
                <div calss="form-group">
                    <label for="name">Description</label>
                    <textarea name="description" cols="30" rows="10" class="form-control">{{isset($product)? $product->description:old("description")}}
                    </textarea>
                </div>
                <div class="form-group">
                    <button type="submit" class="form-control btn btn-success">{{isset($product)?"Update Product":"Save Product"}}</button>
                </div>
            </form> 
        </div>
    </div>


@endsection