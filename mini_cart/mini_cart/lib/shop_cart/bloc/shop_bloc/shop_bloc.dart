import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<UpdateQuantity>(_onUpdateQuantity);
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<ShopState> emit) {
    if (state is ShopLoaded) {
      final currentState = state as ShopLoaded;
      final updatedQuantities =
          Map<int, int>.from(currentState.productQuantities);
      updatedQuantities[event.productId] = event.quantity;
      emit(ShopLoaded(productQuantities: updatedQuantities));
    } else {
      emit(ShopLoaded(productQuantities: {event.productId: event.quantity}));
    }
  }
}
