import 'package:bloc/bloc.dart';

class TimerObserver extends BlocObserver {
  const TimerObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
