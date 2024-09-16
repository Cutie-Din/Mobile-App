part of 'bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class AddCart extends CartEvent {
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final int quantity;

  const AddCart(this.title, this.price, this.category, this.description,
      this.image, this.quantity);

  @override
  List<Object?> get props =>
      [title, price, category, description, image, quantity];
} // Event thêm giỏ hàng

final class RemoveCart extends CartEvent {
  const RemoveCart();

  @override
  List<Object?> get props => [];
} // Event xoá giỏ hàng
