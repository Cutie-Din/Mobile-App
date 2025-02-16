import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'dashboard_state.dart';

final logger = getLogger("DashboardCubit");

class DashboardCubit extends Cubit<DashboardState> {
  final MainRepository repo;
  final AppManager appManager;

  DashboardCubit(this.repo, this.appManager) : super(const DashboardState());

  Future<void> getDashboard() async {
    try {
      emit(state.copyWith(status: DashboardStatus.loading));
      final response = await repo.getDashboard();

      final dashboardModel = DashboardModel.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: DashboardStatus.success, data: dashboardModel));
    } catch (e) {
      emit(state.copyWith(status: DashboardStatus.failure, message: e.toString()));
    }
  }
}
