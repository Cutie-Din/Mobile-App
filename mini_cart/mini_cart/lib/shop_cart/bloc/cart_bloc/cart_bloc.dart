import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_cart/shop_cart/models/shop_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCart>(_onAddCart);
    on<RemoveCart>(_onRemoveCart);
  }

  void _onAddCart(AddCart event, Emitter<CartState> emit) {
    final currentState = state;

    if (currentState is CartLoaded) {
      final updatedCartProducts = List<Product>.from(currentState.cartProducts);

      // Check if the item already exists in the cart
      final index =
          updatedCartProducts.indexWhere((item) => item.title == event.title);
      if (index != -1) {
        // If the item exists, increment the quantity directly
        updatedCartProducts[index] = Product(
          id: updatedCartProducts[index].id,
          title: updatedCartProducts[index].title,
          price: updatedCartProducts[index].price,
          category: updatedCartProducts[index].category,
          description: updatedCartProducts[index].description,
          image: updatedCartProducts[index].image,
          quantity: updatedCartProducts[index].quantity + event.quantity,
        );
      } else {
        // Otherwise, add the new item to the cart
        updatedCartProducts.add(Product(
          id: event.id,
          title: event.title,
          price: event.price,
          category: event.category,
          description: event.description,
          image: event.image,
          quantity: event.quantity,
        ));
      }

      emit(CartLoaded(updatedCartProducts));
    } else {
      // Initialize with the first item
      emit(CartLoaded([
        Product(
          id: event.id,
          title: event.title,
          price: event.price,
          category: event.category,
          description: event.description,
          image: event.image,
          quantity: event.quantity,
        ),
      ]));
    }
  }

  void _onRemoveCart(RemoveCart event, Emitter<CartState> emit) {
    emit(CartLoaded([])); // Clears the cart
  }
}
