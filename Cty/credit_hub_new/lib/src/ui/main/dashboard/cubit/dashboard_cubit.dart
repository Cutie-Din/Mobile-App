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
      DashboardModel dashboardModel = DashboardModel();

      // log('📡 Fetching dashboard...');
      final response = await repo.getDashboard(param: dashboardModel);

      if (response.data == null) {
        // log('❌ Error: ${response.error}');
        emit(state.copyWith(
          status: DashboardStatus.failure,
          message: response.error ?? "Unknown",
        ));
        return;
      }

      logger.d('✅ Response: ${jsonEncode(response.toJson((data) => data ?? {}))}');
      emit(state.copyWith(status: DashboardStatus.success, data: response.data!));
    } catch (e) {
      // log('❌ API Call Error: $e');
      emit(state.copyWith(status: DashboardStatus.failure, message: e.toString()));
    }
  }
}
