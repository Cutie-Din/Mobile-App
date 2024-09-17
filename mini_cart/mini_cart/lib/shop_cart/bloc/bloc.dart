import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_cart/shop_cart/models/shop_item.dart';

part 'event.dart';
part 'state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCart>(_onAddCart);
    on<RemoveCart>(_onRemoveCart);
    on<IncrementCart>(_onIncrementCart);
    on<DecrementCart>(_onDecrementCart);
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

  void _onIncrementCart(IncrementCart event, Emitter<CartState> emit) {
    final currentState = state;

    if (currentState is CartLoaded) {
      final updatedCartProducts = List<Product>.from(currentState.cartProducts);

      // Find and update the quantity of the product
      for (var i = 0; i < updatedCartProducts.length; i++) {
        if (updatedCartProducts[i].title == event.title) {
          updatedCartProducts[i] = Product(
            id: updatedCartProducts[i].id,
            title: updatedCartProducts[i].title,
            price: updatedCartProducts[i].price,
            category: updatedCartProducts[i].category,
            description: updatedCartProducts[i].description,
            image: updatedCartProducts[i].image,
            quantity: updatedCartProducts[i].quantity + 1,
          );
          break;
        }
      }

      emit(CartLoaded(updatedCartProducts));
    }
  }

  void _onDecrementCart(DecrementCart event, Emitter<CartState> emit) {
    final currentState = state;

    if (currentState is CartLoaded) {
      final updatedCartProducts = List<Product>.from(currentState.cartProducts);

      // Find and update the quantity of the product
      for (var i = 0; i < updatedCartProducts.length; i++) {
        if (updatedCartProducts[i].title == event.title &&
            updatedCartProducts[i].quantity > 1) {
          updatedCartProducts[i] = Product(
            id: updatedCartProducts[i].id,
            title: updatedCartProducts[i].title,
            price: updatedCartProducts[i].price,
            category: updatedCartProducts[i].category,
            description: updatedCartProducts[i].description,
            image: updatedCartProducts[i].image,
            quantity: updatedCartProducts[i].quantity - 1,
          );
          break;
        }
      }

      emit(CartLoaded(updatedCartProducts));
    }
  }
}
