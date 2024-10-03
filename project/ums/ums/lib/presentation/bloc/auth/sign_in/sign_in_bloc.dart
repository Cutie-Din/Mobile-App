import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoading();
      try {
        // Logic đăng nhập tại đây (giả sử việc xác thực thành công)
        await Future.delayed(Duration(seconds: 2)); // Giả lập quá trình đăng nhập
        yield SignInSuccess();
      } catch (error) {
        yield SignInFailure(error: error.toString());
      }
    }
  }
}
