<?php 

namespace App\Exceptions;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;


trait ApiTrait {

    public function apiException($request, $exception)
    {
        if($exception instanceof ModelNotFoundException ){
            return response()->json([
                'status'    => 'error',
                'message'   => 'produk tidak ada',
            ], 404);
        }
        if($exception instanceof NotFoundHttpException){
            return response()->json([
                'status'    => 'error',
                'message'   => 'Incorrect route/link',
            ], 404);
        }

    }
}