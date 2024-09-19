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
      final updatedproducts = List<Product>.from(currentState.products);

      // Kiểm tra xem đã có sản phẩm tồn tại trong giỏ chưa
      final index =
          updatedproducts.indexWhere((item) => item.title == event.title);
      if (index != -1) {
        // Nếu đã có chỉ thay đổi số lượng
        updatedproducts[index] = Product(
          id: updatedproducts[index].id,
          title: updatedproducts[index].title,
          price: updatedproducts[index].price,
          category: updatedproducts[index].category,
          description: updatedproducts[index].description,
          image: updatedproducts[index].image,
          quantity: updatedproducts[index].quantity + event.quantity,
        );
      } else {
        // Thêm sản phẩm mới
        updatedproducts.add(Product(
          id: event.id,
          title: event.title,
          price: event.price,
          category: event.category,
          description: event.description,
          image: event.image,
          quantity: event.quantity,
        ));
      }

      emit(CartLoaded(updatedproducts));
    } else {
      // Khởi tạo sản phẩm mới
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
    emit(CartLoaded([])); // Xoá giỏ hàng
  }
}
