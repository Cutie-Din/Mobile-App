part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object?> get props => [];
}

// Event for increasing the quantity of a product
class IncreQuantity extends ShopEvent {
  final Product product;

  const IncreQuantity(this.product);

  @override
  List<Object?> get props => [product];
}

// Event for decreasing the quantity of a product
class DecreQuantity extends ShopEvent {
  final Product product;

  const DecreQuantity(this.product);

  @override
  List<Object?> get props => [product];
}
