import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // Danh sách các mặt hàng bán
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Product #1',
      price: '444',
      description: 'New Modal #1',
      imagePath: 'lib/images/1.png',
    ),
    Shoe(
      name: 'Product #2',
      price: '444',
      description: 'New Modal #2',
      imagePath: 'lib/images/2.png',
    ),
    Shoe(
      name: 'Product #3',
      price: '444',
      description: 'New Modal #3',
      imagePath: 'lib/images/3.png',
    ),
    Shoe(
      name: 'Product #4',
      price: '444',
      description: 'New Modal #1',
      imagePath: 'lib/images/4.png',
    ),
  ];

  // Danh sách sản phẩm có trong giỏ hàng
  List<Shoe> userCart = [];

  // Lấy dữ liệu của mặt hàng bán
  List<Shoe> getshoeList() {
    return shoeShop;
  }

  // Lấy dữ liệu giỏ hàng
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Thêm sản phẩm vào giỏ hàng
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Xoá sản phẩm trong giỏ hàng
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
