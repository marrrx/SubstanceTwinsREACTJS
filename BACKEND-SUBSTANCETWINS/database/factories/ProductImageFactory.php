<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductImage>
 */
class ProductImageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Array de rutas de imagen por categoría
        $categoryImages = [
            'http://172.20.10.10:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg',
            'http://172.20.10.10:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg',
            'http://172.20.10.10:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg',
        ];

        // Elegir una ruta de imagen aleatoria de la lista
        $imageUrl = $categoryImages[array_rand($categoryImages)];

        // Obtener el nombre de la categoría basado en la ruta de imagen
        $categoryName = $this->getCategoryName($imageUrl);

        return [
            'product_id' => function () use ($categoryName) {
                // Encuentra la categoría por nombre
                $category = Category::where('name', $categoryName)->first();

                if ($category) {
                    // Crea un nuevo producto dentro de la categoría
                    $product = $category->products()->create();

                    return $product->id;
                }

                return null;
            },
            'image_path' => $imageUrl,
        ];
    }

    /**
     * Obtener el nombre de la categoría basado en la ruta de imagen.
     *
     * @param string $imageUrl
     * @return string
     */
    private function getCategoryName(string $imageUrl): string
    {
        // Mapear la ruta de imagen a los nombres de categoría correspondientes
        $imageToCategory = [
            'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg' => 'Protein',
            'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/cratine.jpeg' => 'Creatine',
            'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg' => 'PreWorkout',
        ];
    
        // Buscar y devolver el nombre de la categoría correspondiente a la ruta de imagen
        return $imageToCategory[$imageUrl] ?? '';
    }
    
}
