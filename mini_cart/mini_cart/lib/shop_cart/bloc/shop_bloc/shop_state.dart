part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object?> get props => [];
}

// Initial state
class ShopInitial extends ShopState {}

// State that holds the list of products
class ShopLoaded extends ShopState {
  final List<Product> products;

  const ShopLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

// State that handles updates to the list of products
class ShopUpdated extends ShopState {
  final List<Product> products;

  const ShopUpdated({required this.products});

  @override
  List<Object?> get props => [products];
}
