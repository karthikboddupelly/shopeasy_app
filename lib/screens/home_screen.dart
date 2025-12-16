import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> products = [
    {"name": "Laptop", "price": 49999, "image": "assets/laptop.webp"},
    {"name": "Smartphone", "price": 19999, "image": "assets/smartphone.webp"},
    {"name": "Headphones", "price": 2999, "image": "assets/headphones.webp"},
    {"name": "Shoes", "price": 3499, "image": "assets/shoes.webp"},
    {"name": "Watch", "price": 7999, "image": "assets/watch.webp"},
    {"name": "Shirt", "price": 599, "image": "assets/shirt.webp"},
    {"name": "Smart TV", "price": 25999, "image": "assets/tv.webp"},
    {"name": "Backpack", "price": 1599, "image": "assets/backpack.webp"},
  ];

  @override
  Widget build(BuildContext context) {
    final CartBloc cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ShopEasy"),
        actions: [
          Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
                if (cartController.totalItemsInCart.value > 0)
                  Positioned(
                    right: 7,
                    top: 7,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartController.totalItemsInCart.value}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    name: product['name'],
                    price: product['price'],
                    imageUrl: product['image'],
                    onAddToCart: () => cartController.addItemToCart(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String imageUrl;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.grey.withAlpha((0.3 * 255).toInt()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Container(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imageUrl, fit: BoxFit.contain),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '₹$price',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size.fromHeight(36),
              ),
              onPressed: onAddToCart,
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
