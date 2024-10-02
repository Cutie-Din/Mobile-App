import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  // Sản phẩm bán
  final List<Product> _shop = [
    Product(
      name: '#1',
      price: 444,
      description: 'Description #1',
      imagePath: 'assets/1.png',
    ),
    Product(
      name: '#2',
      price: 444,
      description: 'Description #2',
      imagePath: 'assets/2.png',
    ),
    Product(
      name: '#3',
      price: 444,
      description: 'Description #3',
      imagePath: 'assets/3.png',
    ),
    Product(
      name: '#4',
      price: 444,
      description: 'Description #4',
      imagePath: 'assets/4.png',
    ),
  ];
  // Giỏ hàng người dùng
  List<Product> _cart = [];

  // Lấy danh sách sản phẩm
  List<Product> get shop => _shop;

  // Lấy danh sách giỏ hàng
  List<Product> get cart => _cart;

  // Thêm sản phẩm vào giỏ hàng
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Xoá sản phẩm khỏi giỏ hàng
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
