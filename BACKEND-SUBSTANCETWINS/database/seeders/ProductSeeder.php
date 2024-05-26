<?php

namespace Database\Seeders;

use App\Models\ProductImage;
use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = Category::all();

        foreach ($categories as $category) {
            $imageUrl = $this->getImageUrl($category->name);
        
            Product::factory(20)->create(['categories_id' => $category->id])->each(function ($product) use ($imageUrl, $category) {
                $product->name = $category->name . ' ' . $product->name;
                $product->save();
        
                ProductImage::factory()
                    ->count(2)
                    ->create([
                        'product_id' => $product->id,
                        'image_path' => $imageUrl,
                    ]);
            });
        }
        
    }

    /**
     * Obtener la URL de la imagen para la categoría dada.
     *
     * @param string $categoryName
     * @return string
     */
    private function getImageUrl(string $categoryName): string
    {
        // Mapear el nombre de la categoría a las URLs de las imágenes correspondientes
        $categoryImages = [
            'Protein' => 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg',
            'Creatine' => 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg',
            'PreWorkout' => 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg',
        ];

        return $categoryImages[$categoryName] ?? '';
    }
}
