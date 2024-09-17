part of 'bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddCart extends CartEvent {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final int quantity;

  const AddCart({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.quantity,
  });

  @override
  List<Object?> get props =>
      [id, title, price, category, description, image, quantity];
}

class RemoveCart extends CartEvent {
  const RemoveCart();

  @override
  List<Object?> get props => [];
}

class IncrementCart extends CartEvent {
  final int id;
  final String title;
  final int quantity;

  const IncrementCart(this.id, this.title, this.quantity);

  @override
  List<Object?> get props => [id, title, quantity];
}

class DecrementCart extends CartEvent {
  final int id;
  final String title;
  final int quantity;

  const DecrementCart(this.id, this.title, this.quantity);

  @override
  List<Object?> get props => [id, title, quantity];
}
