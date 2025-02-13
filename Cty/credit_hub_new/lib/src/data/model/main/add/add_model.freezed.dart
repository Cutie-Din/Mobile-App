// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddModel _$AddModelFromJson(Map<String, dynamic> json) {
  return _AddModel.fromJson(json);
}

/// @nodoc
mixin _$AddModel {
  String get lot_no => throw _privateConstructorUsedError;
  double get money_request => throw _privateConstructorUsedError;
  String get image_link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddModelCopyWith<AddModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddModelCopyWith<$Res> {
  factory $AddModelCopyWith(AddModel value, $Res Function(AddModel) then) =
      _$AddModelCopyWithImpl<$Res, AddModel>;
  @useResult
  $Res call({String lot_no, double money_request, String image_link});
}

/// @nodoc
class _$AddModelCopyWithImpl<$Res, $Val extends AddModel>
    implements $AddModelCopyWith<$Res> {
  _$AddModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lot_no = null,
    Object? money_request = null,
    Object? image_link = null,
  }) {
    return _then(_value.copyWith(
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      image_link: null == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddModelImplCopyWith<$Res>
    implements $AddModelCopyWith<$Res> {
  factory _$$AddModelImplCopyWith(
          _$AddModelImpl value, $Res Function(_$AddModelImpl) then) =
      __$$AddModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lot_no, double money_request, String image_link});
}

/// @nodoc
class __$$AddModelImplCopyWithImpl<$Res>
    extends _$AddModelCopyWithImpl<$Res, _$AddModelImpl>
    implements _$$AddModelImplCopyWith<$Res> {
  __$$AddModelImplCopyWithImpl(
      _$AddModelImpl _value, $Res Function(_$AddModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lot_no = null,
    Object? money_request = null,
    Object? image_link = null,
  }) {
    return _then(_$AddModelImpl(
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      money_request: null == money_request
          ? _value.money_request
          : money_request // ignore: cast_nullable_to_non_nullable
              as double,
      image_link: null == image_link
          ? _value.image_link
          : image_link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddModelImpl with DiagnosticableTreeMixin implements _AddModel {
  const _$AddModelImpl(
      {this.lot_no = '', this.money_request = 0.0, this.image_link = ''});

  factory _$AddModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddModelImplFromJson(json);

  @override
  @JsonKey()
  final String lot_no;
  @override
  @JsonKey()
  final double money_request;
  @override
  @JsonKey()
  final String image_link;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddModel(lot_no: $lot_no, money_request: $money_request, image_link: $image_link)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddModel'))
      ..add(DiagnosticsProperty('lot_no', lot_no))
      ..add(DiagnosticsProperty('money_request', money_request))
      ..add(DiagnosticsProperty('image_link', image_link));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddModelImpl &&
            (identical(other.lot_no, lot_no) || other.lot_no == lot_no) &&
            (identical(other.money_request, money_request) ||
                other.money_request == money_request) &&
            (identical(other.image_link, image_link) ||
                other.image_link == image_link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lot_no, money_request, image_link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddModelImplCopyWith<_$AddModelImpl> get copyWith =>
      __$$AddModelImplCopyWithImpl<_$AddModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddModelImplToJson(
      this,
    );
  }
}

abstract class _AddModel implements AddModel {
  const factory _AddModel(
      {final String lot_no,
      final double money_request,
      final String image_link}) = _$AddModelImpl;

  factory _AddModel.fromJson(Map<String, dynamic> json) =
      _$AddModelImpl.fromJson;

  @override
  String get lot_no;
  @override
  double get money_request;
  @override
  String get image_link;
  @override
  @JsonKey(ignore: true)
  _$$AddModelImplCopyWith<_$AddModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
