part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopLoaded extends ShopState {
  final Map<int, int> productQuantities;

  const ShopLoaded({required this.productQuantities});

  @override
  List<Object> get props => [productQuantities];
}
