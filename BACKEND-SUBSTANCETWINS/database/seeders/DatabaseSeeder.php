<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(CategorySeeder::class);
        $this->call(ProductSeeder::class);
        $this->call(OrderStatusSeeder::class);

        $admin = User::factory()->create([
            'admin' => true,
            'email' => 'admin@example.com',
            'password' => bcrypt('admin123'),
        ]);

        $client = User::factory()->create([
            'admin' => false,
            'email' => 'client@example.com',
            'password' => bcrypt('client123'),
        ]);
    }
}
