import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'history_state.dart';

final logger = getLogger("DashboardCubit");

class HistoryCubit extends Cubit<HistoryState> {
  final MainRepository repo;
  final AppManager appManager;

  HistoryCubit(this.repo, this.appManager) : super(const HistoryState());

  Future<void> postHistory({required int page_no, required int page_size}) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));
      HistoryModel postHistory = HistoryModel(page_no: page_no, page_size: page_size);
      final response = await repo.postHistory(param: postHistory);

      // ✅ Convert response.data từ Map -> DashboardModel
      final historyModel = HistoryModel.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: HistoryStatus.success, data: historyModel));
    } catch (e) {
      emit(state.copyWith(status: HistoryStatus.failure, message: e.toString()));
    }
  }
}
