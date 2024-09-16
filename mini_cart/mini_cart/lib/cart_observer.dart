import 'package:bloc/bloc.dart';

class CartObserver extends BlocObserver {
  const CartObserver();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
      'Bloc: ${bloc.runtimeType}\n'
      'State hiện tại: ${transition.currentState}\n'
      'State kế tiếp: ${transition.nextState}\n'
      'Sự kiện: ${transition.event}\n'
      '--------------------------------------------------',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(
      'Lỗi trong Bloc: ${bloc.runtimeType}\n'
      'Lỗi: $error\n'
      'Lỗi ở stack nào:\n$stackTrace\n'
      '--------------------------------------------------',
    );
  }
}
