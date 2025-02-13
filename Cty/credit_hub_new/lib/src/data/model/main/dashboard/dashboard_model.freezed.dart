// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return _DashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardModel {
  int get total_request => throw _privateConstructorUsedError;
  double get total_money => throw _privateConstructorUsedError;
  List<RequestDashboard> get lstRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardModelCopyWith<DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardModelCopyWith<$Res> {
  factory $DashboardModelCopyWith(
          DashboardModel value, $Res Function(DashboardModel) then) =
      _$DashboardModelCopyWithImpl<$Res, DashboardModel>;
  @useResult
  $Res call(
      {int total_request,
      double total_money,
      List<RequestDashboard> lstRequests});
}

/// @nodoc
class _$DashboardModelCopyWithImpl<$Res, $Val extends DashboardModel>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_request = null,
    Object? total_money = null,
    Object? lstRequests = null,
  }) {
    return _then(_value.copyWith(
      total_request: null == total_request
          ? _value.total_request
          : total_request // ignore: cast_nullable_to_non_nullable
              as int,
      total_money: null == total_money
          ? _value.total_money
          : total_money // ignore: cast_nullable_to_non_nullable
              as double,
      lstRequests: null == lstRequests
          ? _value.lstRequests
          : lstRequests // ignore: cast_nullable_to_non_nullable
              as List<RequestDashboard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardModelImplCopyWith<$Res>
    implements $DashboardModelCopyWith<$Res> {
  factory _$$DashboardModelImplCopyWith(_$DashboardModelImpl value,
          $Res Function(_$DashboardModelImpl) then) =
      __$$DashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total_request,
      double total_money,
      List<RequestDashboard> lstRequests});
}

/// @nodoc
class __$$DashboardModelImplCopyWithImpl<$Res>
    extends _$DashboardModelCopyWithImpl<$Res, _$DashboardModelImpl>
    implements _$$DashboardModelImplCopyWith<$Res> {
  __$$DashboardModelImplCopyWithImpl(
      _$DashboardModelImpl _value, $Res Function(_$DashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_request = null,
    Object? total_money = null,
    Object? lstRequests = null,
  }) {
    return _then(_$DashboardModelImpl(
      total_request: null == total_request
          ? _value.total_request
          : total_request // ignore: cast_nullable_to_non_nullable
              as int,
      total_money: null == total_money
          ? _value.total_money
          : total_money // ignore: cast_nullable_to_non_nullable
              as double,
      lstRequests: null == lstRequests
          ? _value._lstRequests
          : lstRequests // ignore: cast_nullable_to_non_nullable
              as List<RequestDashboard>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardModelImpl
    with DiagnosticableTreeMixin
    implements _DashboardModel {
  const _$DashboardModelImpl(
      {this.total_request = 0,
      this.total_money = 0.0,
      final List<RequestDashboard> lstRequests = const []})
      : _lstRequests = lstRequests;

  factory _$DashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardModelImplFromJson(json);

  @override
  @JsonKey()
  final int total_request;
  @override
  @JsonKey()
  final double total_money;
  final List<RequestDashboard> _lstRequests;
  @override
  @JsonKey()
  List<RequestDashboard> get lstRequests {
    if (_lstRequests is EqualUnmodifiableListView) return _lstRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lstRequests);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DashboardModel(total_request: $total_request, total_money: $total_money, lstRequests: $lstRequests)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DashboardModel'))
      ..add(DiagnosticsProperty('total_request', total_request))
      ..add(DiagnosticsProperty('total_money', total_money))
      ..add(DiagnosticsProperty('lstRequests', lstRequests));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardModelImpl &&
            (identical(other.total_request, total_request) ||
                other.total_request == total_request) &&
            (identical(other.total_money, total_money) ||
                other.total_money == total_money) &&
            const DeepCollectionEquality()
                .equals(other._lstRequests, _lstRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total_request, total_money,
      const DeepCollectionEquality().hash(_lstRequests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      __$$DashboardModelImplCopyWithImpl<_$DashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardModel implements DashboardModel {
  const factory _DashboardModel(
      {final int total_request,
      final double total_money,
      final List<RequestDashboard> lstRequests}) = _$DashboardModelImpl;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$DashboardModelImpl.fromJson;

  @override
  int get total_request;
  @override
  double get total_money;
  @override
  List<RequestDashboard> get lstRequests;
  @override
  @JsonKey(ignore: true)
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
