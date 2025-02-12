import 'package:credit_hub_new/src/shared/app_export.dart';

part 'base_state.g.dart';

enum BaseStatus { initial, loading, success, failure }

@JsonSerializable(genericArgumentFactories: true)
class BaseState<T> {
  @JsonKey(name: 'status')
  BaseStatus status;

  @JsonKey(name: 'message')
  String message;

  BaseState({this.status = BaseStatus.initial, this.message = ''});

  BaseState copyWith({BaseStatus? status, String? message}) {
    return BaseState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory BaseState.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseStateFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseStateToJson(this, toJsonT);
}
