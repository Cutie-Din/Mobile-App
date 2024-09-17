import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_cart/shop_cart/models/shop_item.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  List<Product> products = []; // List of products

  ShopBloc() : super(ShopInitial()) {
    on<IncreQuantity>((event, emit) {
      final updatedProducts = products.map((product) {
        if (product.id == event.product.id) {
          // Increment quantity directly
          return Product(
            id: product.id,
            title: product.title,
            price: product.price,
            category: product.category,
            description: product.description,
            image: product.image,
            quantity: product.quantity + 1,
          );
        }
        return product;
      }).toList();

      emit(ShopUpdated(products: updatedProducts));
    });

    on<DecreQuantity>((event, emit) {
      final updatedProducts = products.map((product) {
        if (product.id == event.product.id && product.quantity > 1) {
          // Decrement quantity directly
          return Product(
            id: product.id,
            title: product.title,
            price: product.price,
            category: product.category,
            description: product.description,
            image: product.image,
            quantity: product.quantity - 1,
          );
        }
        return product;
      }).toList();

      emit(ShopUpdated(products: updatedProducts));
    });
  }
}
