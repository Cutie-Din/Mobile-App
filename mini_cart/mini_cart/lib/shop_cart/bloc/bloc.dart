import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_cart/shop_cart/models/shop_item.dart';

import '../models/cart_item.dart'; // Ensure this import matches your directory structure

part 'event.dart';
part 'state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCart>(_onAddCart); // Đăng ký sự kiện AddCart
    on<RemoveCart>(_onRemoveCart); // Đăng ký sự kiện RemoveCart
  }

  void _onAddCart(AddCart event, Emitter<CartState> emit) {
    final currentState = state;

    if (currentState is CartLoaded) {
      final updatedCartItems = List<CartItem>.from(currentState.cartItems);
      // Add new item without checking for existing items
      updatedCartItems.add(CartItem(event.title, event.price, event.category,
          event.description, event.image, event.quantity));
      emit(CartLoaded(updatedCartItems));
    } else {
      // Initialize with the first item
      emit(CartLoaded([
        CartItem(event.title, event.price, event.category, event.description,
            event.image, event.quantity),
      ]));
    }
  } // Hàm xử lý logic thêm giỏ hàng

  void _onRemoveCart(RemoveCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  } // Hàm xử lý logic xoá dữ liệu
}
