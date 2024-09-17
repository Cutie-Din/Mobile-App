import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc/cart_bloc.dart';
import '../bloc/shop_bloc/shop_bloc.dart';
import '../models/shop_item.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        // Get the current product from the state or fallback to the initial product
        final currentProduct = state is ShopUpdated
            ? state.products.firstWhere(
                (p) => p.id == product.id,
                orElse: () => product,
              )
            : product;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  currentProduct.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  currentProduct.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${currentProduct.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Category: ${currentProduct.category}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  currentProduct.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        context.read<ShopBloc>().add(
                              DecreQuantity(currentProduct),
                            );
                      },
                    ),
                    Text(
                      'Quantity: ${currentProduct.quantity}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context.read<ShopBloc>().add(
                              IncreQuantity(currentProduct),
                            );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddCart(
                          id: currentProduct.id,
                          title: currentProduct.title,
                          price: currentProduct.price,
                          category: currentProduct.category,
                          description: currentProduct.description,
                          image: currentProduct.image,
                          quantity: currentProduct.quantity,
                        ));
                  },
                  child: const Text('Add Cart'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
