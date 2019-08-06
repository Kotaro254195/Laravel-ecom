@extends("layouts.app")
@section("content") 

<table class="table table-hover">
    <thead>
        <th>Name</th>
        <th>price</th>
        <th colspan=3 class="text-center">Action</th>
    </thead>
    <tbody>
        @foreach ($products as $product)
            <tr>
                <td>{{$product->name}}</td>
                <td>{{$product->price}}</td>
                <td>
                    <a href="/products/{{$product->id}}">Show</a>
                </td>
                <td>
                    <a href="/products/{{$product->id}}/edit">Edit</a>
                </td>
                <td>
                <form action="{{ route("products.destroy", $product->id) }}" method="POST">
                
                    @csrf
                    @method("DELETE")
                    <button type="submit" class="btn btn-link">Delete</button>                
                </form>
            </td>
            </tr>            
        @endforeach
    </tbody>
</table>


@endsection