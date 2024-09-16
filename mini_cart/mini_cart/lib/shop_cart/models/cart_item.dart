import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final int quantity;

  CartItem(this.title, this.price, this.description, this.category, this.image,
      this.quantity);

  @override
  List<Object?> get props =>
      [title, price, description, category, image, quantity];
}
