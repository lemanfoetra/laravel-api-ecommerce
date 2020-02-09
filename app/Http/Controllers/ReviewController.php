<?php

namespace App\Http\Controllers;

use App\Model\Review;
use App\Model\Product;
use Illuminate\Http\Request;
use App\Http\Resources\Review\ReviewResource;
use App\Http\Requests\ReviewStore;

class ReviewController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api')->except('index', 'show');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Product $product)
    {
        return ReviewResource::collection($product->reviews);
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
    public function store(Product $product, ReviewStore $request)
    {

        if($this->isEqualProduct($product->id) > 0){

            $review = new Review();
            $review->product_id = $product->id;
            $review->customer   = $request->customer;
            $review->review     = $request->review;
            $review->star       = $request->star;
            $result = $review->save();
    
            if($result){
                return response()->json(
                    [
                        'status'    =>  'success',
                        'message'   =>  'Produk disimpan',
                        'result'    =>  $request->all(),
                    ], 
                    200
                );
            }
        }
       
        return response()->json(
            [
                'status'    =>  'error'
            ], 
            404
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product, Review $review)
    {
        $result = $review->update($request->all());
        if($result){
            return response()->json(
                [
                    'status'    =>  'success',
                    'message'   =>  'Produk disimpan',
                    'result'    =>  $request->all(),
                ], 
                200
            );
        }
        return response()->json(
            [
                'status'    =>  'error',
            ], 
            404
        );

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product, Review $review)
    {
        $result = $review->delete($review->id);
        if($result){
            return response()->json(
                [
                    'status'    =>  'success',
                    'message'   =>  'Review dihapus',
                ], 
                200
            );
        }
        return response()->json(
            [
                'status'    =>  'error',
            ], 
            404
        );
    }



    protected function isEqualProduct($product_id = ''){
        $product = new Product();
        return $product->where('id', $product_id)->count();
    }
}
