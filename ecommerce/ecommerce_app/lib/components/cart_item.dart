// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Xoá sản phẩm ra khỏi giỏ hàng
  void removeShoe() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
    // Thông báo xoá sản phẩm thành công
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Removed'),
        content: Text('The product has been removed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          onPressed: removeShoe,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
