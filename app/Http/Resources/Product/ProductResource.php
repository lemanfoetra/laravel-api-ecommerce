<?php

namespace App\Http\Resources\Product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'name'  => $this->name,
            'discount' => $this->discount,
            'totalPrice'     => round($this->price - (($this->discount / 100) * $this->price)),
            'rating'         => $this->reviews->count() ? round($this->reviews->sum('star') / $this->reviews->count(), 2) : '0',
            'href' => [
                'review' => route('product.show',$this->id),
            ],
        ];
    }
}
