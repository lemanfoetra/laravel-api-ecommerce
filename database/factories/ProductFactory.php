<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    return [
        'name' => $faker->word,
        'price' => $faker->numberBetween('1000', '100000'),
        'stock'	=> $faker->numberBetween('1', '100'),
        'detail' => $faker->paragraph,
        'discount' => $faker->numberBetween('0', '99'),
    ];
});
