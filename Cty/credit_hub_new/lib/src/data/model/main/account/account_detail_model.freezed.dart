// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountDetail _$AccountDetailFromJson(Map<String, dynamic> json) {
  return _AccountDetail.fromJson(json);
}

/// @nodoc
mixin _$AccountDetail {
  int? get id => throw _privateConstructorUsedError;
  String get icons => throw _privateConstructorUsedError;
  int get bank_id => throw _privateConstructorUsedError;
  String get bank_name => throw _privateConstructorUsedError;
  String get bank_account => throw _privateConstructorUsedError;
  String get bank_owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDetailCopyWith<AccountDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDetailCopyWith<$Res> {
  factory $AccountDetailCopyWith(
          AccountDetail value, $Res Function(AccountDetail) then) =
      _$AccountDetailCopyWithImpl<$Res, AccountDetail>;
  @useResult
  $Res call(
      {int? id,
      String icons,
      int bank_id,
      String bank_name,
      String bank_account,
      String bank_owner});
}

/// @nodoc
class _$AccountDetailCopyWithImpl<$Res, $Val extends AccountDetail>
    implements $AccountDetailCopyWith<$Res> {
  _$AccountDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? icons = null,
    Object? bank_id = null,
    Object? bank_name = null,
    Object? bank_account = null,
    Object? bank_owner = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      icons: null == icons
          ? _value.icons
          : icons // ignore: cast_nullable_to_non_nullable
              as String,
      bank_id: null == bank_id
          ? _value.bank_id
          : bank_id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_name: null == bank_name
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
      bank_account: null == bank_account
          ? _value.bank_account
          : bank_account // ignore: cast_nullable_to_non_nullable
              as String,
      bank_owner: null == bank_owner
          ? _value.bank_owner
          : bank_owner // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountDetailImplCopyWith<$Res>
    implements $AccountDetailCopyWith<$Res> {
  factory _$$AccountDetailImplCopyWith(
          _$AccountDetailImpl value, $Res Function(_$AccountDetailImpl) then) =
      __$$AccountDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String icons,
      int bank_id,
      String bank_name,
      String bank_account,
      String bank_owner});
}

/// @nodoc
class __$$AccountDetailImplCopyWithImpl<$Res>
    extends _$AccountDetailCopyWithImpl<$Res, _$AccountDetailImpl>
    implements _$$AccountDetailImplCopyWith<$Res> {
  __$$AccountDetailImplCopyWithImpl(
      _$AccountDetailImpl _value, $Res Function(_$AccountDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? icons = null,
    Object? bank_id = null,
    Object? bank_name = null,
    Object? bank_account = null,
    Object? bank_owner = null,
  }) {
    return _then(_$AccountDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      icons: null == icons
          ? _value.icons
          : icons // ignore: cast_nullable_to_non_nullable
              as String,
      bank_id: null == bank_id
          ? _value.bank_id
          : bank_id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_name: null == bank_name
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
      bank_account: null == bank_account
          ? _value.bank_account
          : bank_account // ignore: cast_nullable_to_non_nullable
              as String,
      bank_owner: null == bank_owner
          ? _value.bank_owner
          : bank_owner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountDetailImpl implements _AccountDetail {
  const _$AccountDetailImpl(
      {this.id,
      this.icons = '',
      this.bank_id = 0,
      this.bank_name = '',
      this.bank_account = '',
      this.bank_owner = ''});

  factory _$AccountDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDetailImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String icons;
  @override
  @JsonKey()
  final int bank_id;
  @override
  @JsonKey()
  final String bank_name;
  @override
  @JsonKey()
  final String bank_account;
  @override
  @JsonKey()
  final String bank_owner;

  @override
  String toString() {
    return 'AccountDetail(id: $id, icons: $icons, bank_id: $bank_id, bank_name: $bank_name, bank_account: $bank_account, bank_owner: $bank_owner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.icons, icons) || other.icons == icons) &&
            (identical(other.bank_id, bank_id) || other.bank_id == bank_id) &&
            (identical(other.bank_name, bank_name) ||
                other.bank_name == bank_name) &&
            (identical(other.bank_account, bank_account) ||
                other.bank_account == bank_account) &&
            (identical(other.bank_owner, bank_owner) ||
                other.bank_owner == bank_owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, icons, bank_id, bank_name, bank_account, bank_owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDetailImplCopyWith<_$AccountDetailImpl> get copyWith =>
      __$$AccountDetailImplCopyWithImpl<_$AccountDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountDetailImplToJson(
      this,
    );
  }
}

abstract class _AccountDetail implements AccountDetail {
  const factory _AccountDetail(
      {final int? id,
      final String icons,
      final int bank_id,
      final String bank_name,
      final String bank_account,
      final String bank_owner}) = _$AccountDetailImpl;

  factory _AccountDetail.fromJson(Map<String, dynamic> json) =
      _$AccountDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String get icons;
  @override
  int get bank_id;
  @override
  String get bank_name;
  @override
  String get bank_account;
  @override
  String get bank_owner;
  @override
  @JsonKey(ignore: true)
  _$$AccountDetailImplCopyWith<_$AccountDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
