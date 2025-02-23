import 'package:credit_hub_new/src/shared/app_export.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    @Default(0) final int page_no,
    @Default(0) final int page_size,
    @Default('') String lot_no,
    @Default([]) List<RequestHistory> data,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}
