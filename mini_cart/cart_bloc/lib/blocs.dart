import 'package:bloc/bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      addError(Exception('increment error!'), StackTrace.current);
      emit(state + 1);
    });

    on<CounterDecrementPressed>((event, emit) {
      addError(Exception('decrement error!'), StackTrace.current);
      emit(state - 1);
    });
  }
  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    // Một điều mà Cubit không làm được là không thể nắm bắt được thông tin hay nguyên nhân nào dẫn đến thay đổi state
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

sealed class EnrollRole {}

final class EnrollJunior extends EnrollRole {}

final class EnrollSenior extends EnrollRole {}

class RoleBloc extends Bloc<EnrollRole, String> {
  RoleBloc() : super('newbie') {
    on<EnrollJunior>((event, emit) {
      emit(state + '-> Junior');
    });
    on<EnrollSenior>((event, emit) {
      emit(state + '-> Senior');
    });
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onEvent(EnrollRole event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<EnrollRole, String> transition) {
    super.onTransition(transition);
    print(transition);
  }
}

class SimpleBloc extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('${bloc.runtimeType} $stackTrace');
  }
}
