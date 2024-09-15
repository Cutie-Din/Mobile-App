import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); //Khởi tạo initial state với giá trị = 0

  void increment() {
    addError(Exception('increment error'), StackTrace.current);
    emit(state + 1);
  } //Định nghĩa phương thức và emit ra một state mới

  void decrement() =>
      emit(state - 1); //Định nghĩa phương thức và emit ra một state mới

  @override
  void onChange(Change<int> change) {
    //Khi một Cubit emit ra một state mới, một thay đổi sẽ xuất hiện. Có thể quan sát tất cả sự thay đổi của một Cubit đó bằng onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}

class RoleCubit extends Cubit<String> {
  RoleCubit() : super('newbie');

  Future<void> fetchJunior() async {
    emit(state + '-> Junior' + ' ');
    await Future.delayed(Duration(seconds: 1));
  }

  Future<void> fetchSenior() async {
    emit(state + '-> Senior' + ' ');
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    print(change);
  }
}

class SimpleCubit extends BlocObserver {
  //BlocObserver với mục đích quan sát tất cả sự thay đổi của toàn bộ Cubit
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
