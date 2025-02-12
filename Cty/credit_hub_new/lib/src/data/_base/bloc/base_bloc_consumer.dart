import 'package:credit_hub_new/src/shared/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

class BaseBlocConsumer<C extends Cubit<S>, S> extends StatelessWidget {
  final C bloc;
  final Widget Function(BuildContext context, S state) builder;
  final void Function(BuildContext context, S state)? listener;

  const BaseBlocConsumer({
    required this.bloc,
    required this.builder,
    this.listener,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      bloc: bloc,
      listener: (context, state) {
        if (state is BaseState && state.status == BaseStatus.loading) {
          AppLoading.show();
        } else {
          AppLoading.dismiss();
        }

        if (state is BaseState && state.status == BaseStatus.failure) {
          AppDialog.show(context, msg: state.message);
        }

        listener?.call(context, state);
      },
      builder: builder,
    );
  }
}
