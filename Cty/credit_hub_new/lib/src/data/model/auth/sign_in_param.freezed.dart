// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInParam _$SignInParamFromJson(Map<String, dynamic> json) {
  return _SignInParam.fromJson(json);
}

/// @nodoc
mixin _$SignInParam {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get device_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInParamCopyWith<SignInParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInParamCopyWith<$Res> {
  factory $SignInParamCopyWith(
          SignInParam value, $Res Function(SignInParam) then) =
      _$SignInParamCopyWithImpl<$Res, SignInParam>;
  @useResult
  $Res call({String username, String password, String device_id});
}

/// @nodoc
class _$SignInParamCopyWithImpl<$Res, $Val extends SignInParam>
    implements $SignInParamCopyWith<$Res> {
  _$SignInParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? device_id = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: null == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInParamImplCopyWith<$Res>
    implements $SignInParamCopyWith<$Res> {
  factory _$$SignInParamImplCopyWith(
          _$SignInParamImpl value, $Res Function(_$SignInParamImpl) then) =
      __$$SignInParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String device_id});
}

/// @nodoc
class __$$SignInParamImplCopyWithImpl<$Res>
    extends _$SignInParamCopyWithImpl<$Res, _$SignInParamImpl>
    implements _$$SignInParamImplCopyWith<$Res> {
  __$$SignInParamImplCopyWithImpl(
      _$SignInParamImpl _value, $Res Function(_$SignInParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? device_id = null,
  }) {
    return _then(_$SignInParamImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: null == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInParamImpl implements _SignInParam {
  const _$SignInParamImpl(
      {this.username = '', this.password = '', this.device_id = ''});

  factory _$SignInParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInParamImplFromJson(json);

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String device_id;

  @override
  String toString() {
    return 'SignInParam(username: $username, password: $password, device_id: $device_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInParamImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.device_id, device_id) ||
                other.device_id == device_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password, device_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInParamImplCopyWith<_$SignInParamImpl> get copyWith =>
      __$$SignInParamImplCopyWithImpl<_$SignInParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInParamImplToJson(
      this,
    );
  }
}

abstract class _SignInParam implements SignInParam {
  const factory _SignInParam(
      {final String username,
      final String password,
      final String device_id}) = _$SignInParamImpl;

  factory _SignInParam.fromJson(Map<String, dynamic> json) =
      _$SignInParamImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  String get device_id;
  @override
  @JsonKey(ignore: true)
  _$$SignInParamImplCopyWith<_$SignInParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
