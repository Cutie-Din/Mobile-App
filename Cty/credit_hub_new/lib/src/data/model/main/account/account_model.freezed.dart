// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  int get page_no => throw _privateConstructorUsedError;
  int get page_size => throw _privateConstructorUsedError;
  List<DropdownBank> get dropdownbank => throw _privateConstructorUsedError;
  List<AccountDetail> get accounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call(
      {int page_no,
      int page_size,
      List<DropdownBank> dropdownbank,
      List<AccountDetail> accounts});
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page_no = null,
    Object? page_size = null,
    Object? dropdownbank = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      page_no: null == page_no
          ? _value.page_no
          : page_no // ignore: cast_nullable_to_non_nullable
              as int,
      page_size: null == page_size
          ? _value.page_size
          : page_size // ignore: cast_nullable_to_non_nullable
              as int,
      dropdownbank: null == dropdownbank
          ? _value.dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountModelImplCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$AccountModelImplCopyWith(
          _$AccountModelImpl value, $Res Function(_$AccountModelImpl) then) =
      __$$AccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page_no,
      int page_size,
      List<DropdownBank> dropdownbank,
      List<AccountDetail> accounts});
}

/// @nodoc
class __$$AccountModelImplCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$AccountModelImpl>
    implements _$$AccountModelImplCopyWith<$Res> {
  __$$AccountModelImplCopyWithImpl(
      _$AccountModelImpl _value, $Res Function(_$AccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page_no = null,
    Object? page_size = null,
    Object? dropdownbank = null,
    Object? accounts = null,
  }) {
    return _then(_$AccountModelImpl(
      page_no: null == page_no
          ? _value.page_no
          : page_no // ignore: cast_nullable_to_non_nullable
              as int,
      page_size: null == page_size
          ? _value.page_size
          : page_size // ignore: cast_nullable_to_non_nullable
              as int,
      dropdownbank: null == dropdownbank
          ? _value._dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<AccountDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountModelImpl with DiagnosticableTreeMixin implements _AccountModel {
  const _$AccountModelImpl(
      {this.page_no = 0,
      this.page_size = 0,
      final List<DropdownBank> dropdownbank = const [],
      final List<AccountDetail> accounts = const []})
      : _dropdownbank = dropdownbank,
        _accounts = accounts;

  factory _$AccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountModelImplFromJson(json);

  @override
  @JsonKey()
  final int page_no;
  @override
  @JsonKey()
  final int page_size;
  final List<DropdownBank> _dropdownbank;
  @override
  @JsonKey()
  List<DropdownBank> get dropdownbank {
    if (_dropdownbank is EqualUnmodifiableListView) return _dropdownbank;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropdownbank);
  }

  final List<AccountDetail> _accounts;
  @override
  @JsonKey()
  List<AccountDetail> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountModel(page_no: $page_no, page_size: $page_size, dropdownbank: $dropdownbank, accounts: $accounts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountModel'))
      ..add(DiagnosticsProperty('page_no', page_no))
      ..add(DiagnosticsProperty('page_size', page_size))
      ..add(DiagnosticsProperty('dropdownbank', dropdownbank))
      ..add(DiagnosticsProperty('accounts', accounts));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.page_no, page_no) || other.page_no == page_no) &&
            (identical(other.page_size, page_size) ||
                other.page_size == page_size) &&
            const DeepCollectionEquality()
                .equals(other._dropdownbank, _dropdownbank) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page_no,
      page_size,
      const DeepCollectionEquality().hash(_dropdownbank),
      const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      __$$AccountModelImplCopyWithImpl<_$AccountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountModelImplToJson(
      this,
    );
  }
}

abstract class _AccountModel implements AccountModel {
  const factory _AccountModel(
      {final int page_no,
      final int page_size,
      final List<DropdownBank> dropdownbank,
      final List<AccountDetail> accounts}) = _$AccountModelImpl;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$AccountModelImpl.fromJson;

  @override
  int get page_no;
  @override
  int get page_size;
  @override
  List<DropdownBank> get dropdownbank;
  @override
  List<AccountDetail> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
