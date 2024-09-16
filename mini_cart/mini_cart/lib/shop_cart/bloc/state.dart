part of 'bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {} // Đây là State khởi tạo

final class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  const CartLoaded(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}// State khi đã được load bao gồm cả item
