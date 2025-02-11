import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(S initialState) : super(initialState);

  Future<void> handleState<T, P>({
    Future<T> Function()? apiCallNoParam,
    Future<T> Function(P param)? apiCallParam,
    Future<T> Function([P params])? apiCallParams,
    P? param,
    required void Function(dynamic response) onSuccess,
    String? Function(dynamic error)? errorMessageExtractor,
  }) async {
    try {
      emit(state.copyWith(status: BaseStatus.loading) as S);

      dynamic response;

      if (param is List? && (param?.isNotEmpty ?? false)) {
        assert(apiCallParams != null);
        response = await apiCallParams!(param!);
      } else if (param != null) {
        assert(apiCallParam != null);
        response = await apiCallParam!(param);
      } else {
        assert(apiCallNoParam != null);
        response = await apiCallNoParam!();
      }

      onSuccess(response);
      emit(state.copyWith(status: BaseStatus.success) as S);
    } catch (e) {
      final errorMessage = errorMessageExtractor?.call(e) ?? e.toString();
      emit(state.copyWith(
        status: BaseStatus.failure,
        message: errorMessage,
      ) as S);
    }
  }
}
