// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) {
  return _ChangePasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordModel {
  String get current_password => throw _privateConstructorUsedError;
  String get new_password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordModelCopyWith<ChangePasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordModelCopyWith<$Res> {
  factory $ChangePasswordModelCopyWith(
          ChangePasswordModel value, $Res Function(ChangePasswordModel) then) =
      _$ChangePasswordModelCopyWithImpl<$Res, ChangePasswordModel>;
  @useResult
  $Res call({String current_password, String new_password});
}

/// @nodoc
class _$ChangePasswordModelCopyWithImpl<$Res, $Val extends ChangePasswordModel>
    implements $ChangePasswordModelCopyWith<$Res> {
  _$ChangePasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_password = null,
    Object? new_password = null,
  }) {
    return _then(_value.copyWith(
      current_password: null == current_password
          ? _value.current_password
          : current_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: null == new_password
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordModelImplCopyWith<$Res>
    implements $ChangePasswordModelCopyWith<$Res> {
  factory _$$ChangePasswordModelImplCopyWith(_$ChangePasswordModelImpl value,
          $Res Function(_$ChangePasswordModelImpl) then) =
      __$$ChangePasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String current_password, String new_password});
}

/// @nodoc
class __$$ChangePasswordModelImplCopyWithImpl<$Res>
    extends _$ChangePasswordModelCopyWithImpl<$Res, _$ChangePasswordModelImpl>
    implements _$$ChangePasswordModelImplCopyWith<$Res> {
  __$$ChangePasswordModelImplCopyWithImpl(_$ChangePasswordModelImpl _value,
      $Res Function(_$ChangePasswordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_password = null,
    Object? new_password = null,
  }) {
    return _then(_$ChangePasswordModelImpl(
      current_password: null == current_password
          ? _value.current_password
          : current_password // ignore: cast_nullable_to_non_nullable
              as String,
      new_password: null == new_password
          ? _value.new_password
          : new_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordModelImpl implements _ChangePasswordModel {
  const _$ChangePasswordModelImpl(
      {this.current_password = '', this.new_password = ''});

  factory _$ChangePasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordModelImplFromJson(json);

  @override
  @JsonKey()
  final String current_password;
  @override
  @JsonKey()
  final String new_password;

  @override
  String toString() {
    return 'ChangePasswordModel(current_password: $current_password, new_password: $new_password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordModelImpl &&
            (identical(other.current_password, current_password) ||
                other.current_password == current_password) &&
            (identical(other.new_password, new_password) ||
                other.new_password == new_password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current_password, new_password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordModelImplCopyWith<_$ChangePasswordModelImpl> get copyWith =>
      __$$ChangePasswordModelImplCopyWithImpl<_$ChangePasswordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordModel implements ChangePasswordModel {
  const factory _ChangePasswordModel(
      {final String current_password,
      final String new_password}) = _$ChangePasswordModelImpl;

  factory _ChangePasswordModel.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordModelImpl.fromJson;

  @override
  String get current_password;
  @override
  String get new_password;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordModelImplCopyWith<_$ChangePasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
