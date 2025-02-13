// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestHistory _$RequestHistoryFromJson(Map<String, dynamic> json) {
  return _RequestHistory.fromJson(json);
}

/// @nodoc
mixin _$RequestHistory {
  int? get id => throw _privateConstructorUsedError;
  String get image_link => throw _privateConstructorUsedError;
  String get date_request => throw _privateConstructorUsedError;
  String get date_finish => throw _privateConstructorUsedError;
  String get lot_no => throw _privateConstructorUsedError;
  double get money_request => throw _privateConstructorUsedError;
  String get status_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestHistoryCopyWith<RequestHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestHistoryCopyWith<$Res> {
  factory $RequestHistoryCopyWith(
          RequestHistory value, $Res Function(RequestHistory) then) =
      _$RequestHistoryCopyWithImpl<$Res, RequestHistory>;
  @useResult
  $Res call(
      {int? id,
      String image_link,
      String date_request,
      String date_finish,
      String lot_no,
      double money_request,
      String status_name});
}

/// @nodoc
class _$RequestHistoryCopyWithImpl<$Res, $Val extends RequestHistory>
    implements $RequestHistoryCopyWith<$Res> {
  _$RequestHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image_link = null,
    Object? date_request = null,
    Object? date_finish = null,
    Object? lot_no = null,
    Object? money_request = null,
    Object? status_name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image_link: null == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String,
      date_request: null == date_request
          ? _value.date_request
          : date_request // ignore: cast_nullable_to_non_nullable
              as String,
      date_finish: null == date_finish
          ? _value.date_finish
          : date_finish // ignore: cast_nullable_to_non_nullable
              as String,
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      status_name: null == status_name
          ? _value.status_name
          : status_name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestHistoryImplCopyWith<$Res>
    implements $RequestHistoryCopyWith<$Res> {
  factory _$$RequestHistoryImplCopyWith(_$RequestHistoryImpl value,
          $Res Function(_$RequestHistoryImpl) then) =
      __$$RequestHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String image_link,
      String date_request,
      String date_finish,
      String lot_no,
      double money_request,
      String status_name});
}

/// @nodoc
class __$$RequestHistoryImplCopyWithImpl<$Res>
    extends _$RequestHistoryCopyWithImpl<$Res, _$RequestHistoryImpl>
    implements _$$RequestHistoryImplCopyWith<$Res> {
  __$$RequestHistoryImplCopyWithImpl(
      _$RequestHistoryImpl _value, $Res Function(_$RequestHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image_link = null,
    Object? date_request = null,
    Object? date_finish = null,
    Object? lot_no = null,
    Object? money_request = null,
    Object? status_name = null,
  }) {
    return _then(_$RequestHistoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image_link: null == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String,
      date_request: null == date_request
          ? _value.date_request
          : date_request // ignore: cast_nullable_to_non_nullable
              as String,
      date_finish: null == date_finish
          ? _value.date_finish
          : date_finish // ignore: cast_nullable_to_non_nullable
              as String,
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      status_name: null == status_name
          ? _value.status_name
          : status_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestHistoryImpl implements _RequestHistory {
  const _$RequestHistoryImpl(
      {this.id,
      this.image_link = '',
      this.date_request = '',
      this.date_finish = '',
      this.lot_no = '',
      this.money_request = 0.0,
      this.status_name = ''});

  factory _$RequestHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestHistoryImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String image_link;
  @override
  @JsonKey()
  final String date_request;
  @override
  @JsonKey()
  final String date_finish;
  @override
  @JsonKey()
  final String lot_no;
  @override
  @JsonKey()
  final double money_request;
  @override
  @JsonKey()
  final String status_name;

  @override
  String toString() {
    return 'RequestHistory(id: $id, image_link: $image_link, date_request: $date_request, date_finish: $date_finish, lot_no: $lot_no, money_request: $money_request, status_name: $status_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image_link, image_link) ||
                other.image_link == image_link) &&
            (identical(other.date_request, date_request) ||
                other.date_request == date_request) &&
            (identical(other.date_finish, date_finish) ||
                other.date_finish == date_finish) &&
            (identical(other.lot_no, lot_no) || other.lot_no == lot_no) &&
            (identical(other.money_request, money_request) ||
                other.money_request == money_request) &&
            (identical(other.status_name, status_name) ||
                other.status_name == status_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image_link, date_request,
      date_finish, lot_no, money_request, status_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestHistoryImplCopyWith<_$RequestHistoryImpl> get copyWith =>
      __$$RequestHistoryImplCopyWithImpl<_$RequestHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestHistoryImplToJson(
      this,
    );
  }
}

abstract class _RequestHistory implements RequestHistory {
  const factory _RequestHistory(
      {final int? id,
      final String image_link,
      final String date_request,
      final String date_finish,
      final String lot_no,
      final double money_request,
      final String status_name}) = _$RequestHistoryImpl;

  factory _RequestHistory.fromJson(Map<String, dynamic> json) =
      _$RequestHistoryImpl.fromJson;

  @override
  int? get id;
  @override
  String get image_link;
  @override
  String get date_request;
  @override
  String get date_finish;
  @override
  String get lot_no;
  @override
  double get money_request;
  @override
  String get status_name;
  @override
  @JsonKey(ignore: true)
  _$$RequestHistoryImplCopyWith<_$RequestHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
