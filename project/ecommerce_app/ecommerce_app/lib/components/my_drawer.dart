// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 100,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              // Shop
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              // Giỏ hàng
              MyListTile(
                text: 'Cart',
                icon: Icons.shopping_cart,
                onTap: () {
                  // Thoát menu trước
                  Navigator.pop(context);

                  // Đến trang giỏ hàng
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          // Thoát
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
