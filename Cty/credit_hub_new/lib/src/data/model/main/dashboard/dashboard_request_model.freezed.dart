// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestDashboard _$RequestDashboardFromJson(Map<String, dynamic> json) {
  return _RequestDashboard.fromJson(json);
}

/// @nodoc
mixin _$RequestDashboard {
  int? get id => throw _privateConstructorUsedError;
  String get date_request => throw _privateConstructorUsedError;
  String get lot_no => throw _privateConstructorUsedError;
  double get money_request => throw _privateConstructorUsedError;
  String get status_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestDashboardCopyWith<RequestDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestDashboardCopyWith<$Res> {
  factory $RequestDashboardCopyWith(
          RequestDashboard value, $Res Function(RequestDashboard) then) =
      _$RequestDashboardCopyWithImpl<$Res, RequestDashboard>;
  @useResult
  $Res call(
      {int? id,
      String date_request,
      String lot_no,
      double money_request,
      String status_name});
}

/// @nodoc
class _$RequestDashboardCopyWithImpl<$Res, $Val extends RequestDashboard>
    implements $RequestDashboardCopyWith<$Res> {
  _$RequestDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date_request = null,
    Object? lot_no = null,
    Object? money_request = null,
    Object? status_name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date_request: null == date_request
          ? _value.date_request
          : date_request // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RequestDashboardImplCopyWith<$Res>
    implements $RequestDashboardCopyWith<$Res> {
  factory _$$RequestDashboardImplCopyWith(_$RequestDashboardImpl value,
          $Res Function(_$RequestDashboardImpl) then) =
      __$$RequestDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String date_request,
      String lot_no,
      double money_request,
      String status_name});
}

/// @nodoc
class __$$RequestDashboardImplCopyWithImpl<$Res>
    extends _$RequestDashboardCopyWithImpl<$Res, _$RequestDashboardImpl>
    implements _$$RequestDashboardImplCopyWith<$Res> {
  __$$RequestDashboardImplCopyWithImpl(_$RequestDashboardImpl _value,
      $Res Function(_$RequestDashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date_request = null,
    Object? lot_no = null,
    Object? money_request = null,
    Object? status_name = null,
  }) {
    return _then(_$RequestDashboardImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date_request: null == date_request
          ? _value.date_request
          : date_request // ignore: cast_nullable_to_non_nullable
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
class _$RequestDashboardImpl implements _RequestDashboard {
  const _$RequestDashboardImpl(
      {this.id,
      this.date_request = '',
      this.lot_no = '',
      this.money_request = 0.0,
      this.status_name = ''});

  factory _$RequestDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDashboardImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String date_request;
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
    return 'RequestDashboard(id: $id, date_request: $date_request, lot_no: $lot_no, money_request: $money_request, status_name: $status_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDashboardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date_request, date_request) ||
                other.date_request == date_request) &&
            (identical(other.lot_no, lot_no) || other.lot_no == lot_no) &&
            (identical(other.money_request, money_request) ||
                other.money_request == money_request) &&
            (identical(other.status_name, status_name) ||
                other.status_name == status_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date_request, lot_no, money_request, status_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDashboardImplCopyWith<_$RequestDashboardImpl> get copyWith =>
      __$$RequestDashboardImplCopyWithImpl<_$RequestDashboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDashboardImplToJson(
      this,
    );
  }
}

abstract class _RequestDashboard implements RequestDashboard {
  const factory _RequestDashboard(
      {final int? id,
      final String date_request,
      final String lot_no,
      final double money_request,
      final String status_name}) = _$RequestDashboardImpl;

  factory _RequestDashboard.fromJson(Map<String, dynamic> json) =
      _$RequestDashboardImpl.fromJson;

  @override
  int? get id;
  @override
  String get date_request;
  @override
  String get lot_no;
  @override
  double get money_request;
  @override
  String get status_name;
  @override
  @JsonKey(ignore: true)
  _$$RequestDashboardImplCopyWith<_$RequestDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
