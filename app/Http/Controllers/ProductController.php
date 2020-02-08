<?php

namespace App\Http\Controllers;

use App\Model\Product;
use Illuminate\Http\Request;
use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\Product\ProductShowResource;
use App\Http\Requests\ProductStore;

class ProductController extends Controller
{


    public function __construct()
    {
        $this->middleware('auth:api')->except('index','show');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return ProductResource::collection(Product::paginate(5));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductStore $request)
    {
        //return new ProductStore($request->all());
        $product = new Product();
        $product->name      = $request->name;
        $product->price     = $request->price;
        $product->stock     = $request->stock;
        $product->detail    = $request->detail;
        $product->discount  = $request->discount;
        $product->save();

        return response()->json(
            [
                'status'    =>  'success',
                'message'   =>  'Produk disimpan',
                'result'    =>  new ProductShowResource($product),
                // 'result' =>  $request->all(),
            ], 
            200
        );
    }



    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return new ProductShowResource($product);
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }








    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {   
        $result = $product->update($request->all());
        if($result){
            return response()->json(
                [
                    'status'    =>  'success',
                    'message'   =>  'Produk Diupdate',
                    'result'    =>  $product,
                    // 'result' =>  $request->all(),
                ], 
                200
            );
        }
        return response()->json(
            [
                'status'    => 'failed',
            ]
        );
    }









    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $result = $product->delete();
        if($result){
            return response()->json(
                [
                    'status'    =>  'success',
                    'message'   =>  'Produk Dihapus'
                ], 
                200
            );
        }

        return response()->json(
            [
                'status'    =>  'failed'
            ], 
            200
        );
    }
}
