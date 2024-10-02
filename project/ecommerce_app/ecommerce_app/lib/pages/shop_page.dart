// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Shop Page'),
        actions: [
          // Chuyển đến trang thanh toán
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          // Phụ đề Shop
          Center(
            child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // Danh sách sản phẩm
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, index) {
                // Lấy từng sản phẩm một
                final product = products[index];
                // Trả về giao diện người dùng
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
