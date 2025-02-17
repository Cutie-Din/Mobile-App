// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  AccountStatus get status => throw _privateConstructorUsedError;
  List<DropdownBank> get dropdownbank => throw _privateConstructorUsedError;
  DropdownBank? get bank => throw _privateConstructorUsedError;
  List<AccountDetail> get accounts => throw _privateConstructorUsedError;
  AccountDetail? get accountdetail => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {AccountStatus status,
      List<DropdownBank> dropdownbank,
      DropdownBank? bank,
      List<AccountDetail> accounts,
      AccountDetail? accountdetail,
      String message});

  $DropdownBankCopyWith<$Res>? get bank;
  $AccountDetailCopyWith<$Res>? get accountdetail;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dropdownbank = null,
    Object? bank = freezed,
    Object? accounts = null,
    Object? accountdetail = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccountStatus,
      dropdownbank: null == dropdownbank
          ? _value.dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as DropdownBank?,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountDetail>,
      accountdetail: freezed == accountdetail
          ? _value.accountdetail
          : accountdetail // ignore: cast_nullable_to_non_nullable
              as AccountDetail?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DropdownBankCopyWith<$Res>? get bank {
    if (_value.bank == null) {
      return null;
    }

    return $DropdownBankCopyWith<$Res>(_value.bank!, (value) {
      return _then(_value.copyWith(bank: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountDetailCopyWith<$Res>? get accountdetail {
    if (_value.accountdetail == null) {
      return null;
    }

    return $AccountDetailCopyWith<$Res>(_value.accountdetail!, (value) {
      return _then(_value.copyWith(accountdetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountStatus status,
      List<DropdownBank> dropdownbank,
      DropdownBank? bank,
      List<AccountDetail> accounts,
      AccountDetail? accountdetail,
      String message});

  @override
  $DropdownBankCopyWith<$Res>? get bank;
  @override
  $AccountDetailCopyWith<$Res>? get accountdetail;
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dropdownbank = null,
    Object? bank = freezed,
    Object? accounts = null,
    Object? accountdetail = freezed,
    Object? message = null,
  }) {
    return _then(_$AccountStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AccountStatus,
      dropdownbank: null == dropdownbank
          ? _value._dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as DropdownBank?,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountDetail>,
      accountdetail: freezed == accountdetail
          ? _value.accountdetail
          : accountdetail // ignore: cast_nullable_to_non_nullable
              as AccountDetail?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountStateImpl with DiagnosticableTreeMixin implements _AccountState {
  const _$AccountStateImpl(
      {this.status = AccountStatus.initial,
      final List<DropdownBank> dropdownbank = const [],
      this.bank,
      final List<AccountDetail> accounts = const [],
      this.accountdetail,
      this.message = ''})
      : _dropdownbank = dropdownbank,
        _accounts = accounts;

  @override
  @JsonKey()
  final AccountStatus status;
  final List<DropdownBank> _dropdownbank;
  @override
  @JsonKey()
  List<DropdownBank> get dropdownbank {
    if (_dropdownbank is EqualUnmodifiableListView) return _dropdownbank;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropdownbank);
  }

  @override
  final DropdownBank? bank;
  final List<AccountDetail> _accounts;
  @override
  @JsonKey()
  List<AccountDetail> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final AccountDetail? accountdetail;
  @override
  @JsonKey()
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState(status: $status, dropdownbank: $dropdownbank, bank: $bank, accounts: $accounts, accountdetail: $accountdetail, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('dropdownbank', dropdownbank))
      ..add(DiagnosticsProperty('bank', bank))
      ..add(DiagnosticsProperty('accounts', accounts))
      ..add(DiagnosticsProperty('accountdetail', accountdetail))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._dropdownbank, _dropdownbank) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.accountdetail, accountdetail) ||
                other.accountdetail == accountdetail) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_dropdownbank),
      bank,
      const DeepCollectionEquality().hash(_accounts),
      accountdetail,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {final AccountStatus status,
      final List<DropdownBank> dropdownbank,
      final DropdownBank? bank,
      final List<AccountDetail> accounts,
      final AccountDetail? accountdetail,
      final String message}) = _$AccountStateImpl;

  @override
  AccountStatus get status;
  @override
  List<DropdownBank> get dropdownbank;
  @override
  DropdownBank? get bank;
  @override
  List<AccountDetail> get accounts;
  @override
  AccountDetail? get accountdetail;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
