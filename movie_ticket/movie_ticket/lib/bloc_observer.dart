import 'package:bloc/bloc.dart';

class MovieObserver extends BlocObserver {
  const MovieObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(
      'Bloc: ${bloc.runtimeType}\n'
      'Thay đổi trạng thái: ${change}\n',
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(
      'Bloc: ${bloc.runtimeType}\n'
      'Sự kiện: ${bloc.runtimeType}\n',
    );
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Bloc được tạo: ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
      'Bloc: ${bloc.runtimeType}\n'
      'State hiện tại: ${transition.currentState}\n'
      'State kế tiếp: ${transition.nextState}\n'
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

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('Bloc đã đóng: ${bloc.runtimeType}\n');
  }
}
