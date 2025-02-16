import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'history_state.dart';

final logger = getLogger("HistoryCubit");

class HistoryCubit extends Cubit<HistoryState> {
  final MainRepository repo;
  final AppManager appManager;

  HistoryCubit(this.repo, this.appManager) : super(const HistoryState());

  Future<void> postHistory({required int page_no, required int page_size}) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));
      HistoryModel postHistory = HistoryModel(page_no: page_no, page_size: page_size);
      final response = await repo.postHistory(param: postHistory);
      final historyModel = HistoryModel.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: HistoryStatus.success, data: historyModel.data));
    } catch (e) {
      emit(state.copyWith(status: HistoryStatus.failure, message: e.toString()));
    }
  }

  Future<void> getHistoryDetail({required int id}) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));

      final response = await repo.getHistoryDetail(id: id);
      final historyDetail = RequestHistory.fromJson(response.data as Map<String, dynamic>);

      emit(state.copyWith(status: HistoryStatus.success, data_received: historyDetail));
    } catch (e) {
      emit(state.copyWith(status: HistoryStatus.failure, message: e.toString()));
    }
  }

  Future<void> resendHistory({required int id}) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));
      RequestHistory requestHistory = RequestHistory(id: id);
      final response = await repo.resendHistory(param: requestHistory);
    } catch (e) {
      emit(state.copyWith(status: HistoryStatus.failure, message: e.toString()));
    }
  }
}
