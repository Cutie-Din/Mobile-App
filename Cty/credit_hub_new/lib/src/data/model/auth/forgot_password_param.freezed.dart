// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPasswordParam _$ForgotPasswordParamFromJson(Map<String, dynamic> json) {
  return _ForgotPasswordParam.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordParam {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordParamCopyWith<ForgotPasswordParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordParamCopyWith<$Res> {
  factory $ForgotPasswordParamCopyWith(
          ForgotPasswordParam value, $Res Function(ForgotPasswordParam) then) =
      _$ForgotPasswordParamCopyWithImpl<$Res, ForgotPasswordParam>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordParamCopyWithImpl<$Res, $Val extends ForgotPasswordParam>
    implements $ForgotPasswordParamCopyWith<$Res> {
  _$ForgotPasswordParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordParamImplCopyWith<$Res>
    implements $ForgotPasswordParamCopyWith<$Res> {
  factory _$$ForgotPasswordParamImplCopyWith(_$ForgotPasswordParamImpl value,
          $Res Function(_$ForgotPasswordParamImpl) then) =
      __$$ForgotPasswordParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordParamImplCopyWithImpl<$Res>
    extends _$ForgotPasswordParamCopyWithImpl<$Res, _$ForgotPasswordParamImpl>
    implements _$$ForgotPasswordParamImplCopyWith<$Res> {
  __$$ForgotPasswordParamImplCopyWithImpl(_$ForgotPasswordParamImpl _value,
      $Res Function(_$ForgotPasswordParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordParamImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordParamImpl implements _ForgotPasswordParam {
  const _$ForgotPasswordParamImpl({this.email = ''});

  factory _$ForgotPasswordParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordParamImplFromJson(json);

  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordParam(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordParamImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordParamImplCopyWith<_$ForgotPasswordParamImpl> get copyWith =>
      __$$ForgotPasswordParamImplCopyWithImpl<_$ForgotPasswordParamImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordParamImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordParam implements ForgotPasswordParam {
  const factory _ForgotPasswordParam({final String email}) =
      _$ForgotPasswordParamImpl;

  factory _ForgotPasswordParam.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordParamImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordParamImplCopyWith<_$ForgotPasswordParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
