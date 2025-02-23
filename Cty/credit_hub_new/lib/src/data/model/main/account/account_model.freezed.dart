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
  String get lot_no => throw _privateConstructorUsedError;
  String get from_date => throw _privateConstructorUsedError;
  String get to_date => throw _privateConstructorUsedError;
  List<DropdownBank> get dropdownbank => throw _privateConstructorUsedError;
  List<AccountDetail> get data => throw _privateConstructorUsedError;

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
      String lot_no,
      String from_date,
      String to_date,
      List<DropdownBank> dropdownbank,
      List<AccountDetail> data});
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
    Object? lot_no = null,
    Object? from_date = null,
    Object? to_date = null,
    Object? dropdownbank = null,
    Object? data = null,
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
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      from_date: null == from_date
          ? _value.from_date
          : from_date // ignore: cast_nullable_to_non_nullable
              as String,
      to_date: null == to_date
          ? _value.to_date
          : to_date // ignore: cast_nullable_to_non_nullable
              as String,
      dropdownbank: null == dropdownbank
          ? _value.dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
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
      String lot_no,
      String from_date,
      String to_date,
      List<DropdownBank> dropdownbank,
      List<AccountDetail> data});
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
    Object? lot_no = null,
    Object? from_date = null,
    Object? to_date = null,
    Object? dropdownbank = null,
    Object? data = null,
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
      lot_no: null == lot_no
          ? _value.lot_no
          : lot_no // ignore: cast_nullable_to_non_nullable
              as String,
      from_date: null == from_date
          ? _value.from_date
          : from_date // ignore: cast_nullable_to_non_nullable
              as String,
      to_date: null == to_date
          ? _value.to_date
          : to_date // ignore: cast_nullable_to_non_nullable
              as String,
      dropdownbank: null == dropdownbank
          ? _value._dropdownbank
          : dropdownbank // ignore: cast_nullable_to_non_nullable
              as List<DropdownBank>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
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
      this.lot_no = '',
      this.from_date = '',
      this.to_date = '',
      final List<DropdownBank> dropdownbank = const [],
      final List<AccountDetail> data = const []})
      : _dropdownbank = dropdownbank,
        _data = data;

  factory _$AccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountModelImplFromJson(json);

  @override
  @JsonKey()
  final int page_no;
  @override
  @JsonKey()
  final int page_size;
  @override
  @JsonKey()
  final String lot_no;
  @override
  @JsonKey()
  final String from_date;
  @override
  @JsonKey()
  final String to_date;
  final List<DropdownBank> _dropdownbank;
  @override
  @JsonKey()
  List<DropdownBank> get dropdownbank {
    if (_dropdownbank is EqualUnmodifiableListView) return _dropdownbank;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropdownbank);
  }

  final List<AccountDetail> _data;
  @override
  @JsonKey()
  List<AccountDetail> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountModel(page_no: $page_no, page_size: $page_size, lot_no: $lot_no, from_date: $from_date, to_date: $to_date, dropdownbank: $dropdownbank, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountModel'))
      ..add(DiagnosticsProperty('page_no', page_no))
      ..add(DiagnosticsProperty('page_size', page_size))
      ..add(DiagnosticsProperty('lot_no', lot_no))
      ..add(DiagnosticsProperty('from_date', from_date))
      ..add(DiagnosticsProperty('to_date', to_date))
      ..add(DiagnosticsProperty('dropdownbank', dropdownbank))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.page_no, page_no) || other.page_no == page_no) &&
            (identical(other.page_size, page_size) ||
                other.page_size == page_size) &&
            (identical(other.lot_no, lot_no) || other.lot_no == lot_no) &&
            (identical(other.from_date, from_date) ||
                other.from_date == from_date) &&
            (identical(other.to_date, to_date) || other.to_date == to_date) &&
            const DeepCollectionEquality()
                .equals(other._dropdownbank, _dropdownbank) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page_no,
      page_size,
      lot_no,
      from_date,
      to_date,
      const DeepCollectionEquality().hash(_dropdownbank),
      const DeepCollectionEquality().hash(_data));

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
      final String lot_no,
      final String from_date,
      final String to_date,
      final List<DropdownBank> dropdownbank,
      final List<AccountDetail> data}) = _$AccountModelImpl;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$AccountModelImpl.fromJson;

  @override
  int get page_no;
  @override
  int get page_size;
  @override
  String get lot_no;
  @override
  String get from_date;
  @override
  String get to_date;
  @override
  List<DropdownBank> get dropdownbank;
  @override
  List<AccountDetail> get data;
  @override
  @JsonKey(ignore: true)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
