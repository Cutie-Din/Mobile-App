import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'error')
  String? error;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'data')
  T? data;

  BaseResponse({
    this.code,
    this.error,
    this.token,
    this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
