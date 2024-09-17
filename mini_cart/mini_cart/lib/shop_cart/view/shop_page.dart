import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc/cart_bloc.dart';
import '../models/shop_item.dart';
import '../repository/product_repository.dart';
import 'cart_page.dart';
import 'product_card.dart'; // Import the CartPage

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  final ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Cart: ${state is CartLoaded ? state.cartProducts.length : 0}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: productRepository.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
              );
            },
          );
        },
      ),
    );
  }
}
