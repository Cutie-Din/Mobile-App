// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DropdownBank _$DropdownBankFromJson(Map<String, dynamic> json) {
  return _DropdownBank.fromJson(json);
}

/// @nodoc
mixin _$DropdownBank {
  int? get id => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DropdownBankCopyWith<DropdownBank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropdownBankCopyWith<$Res> {
  factory $DropdownBankCopyWith(
          DropdownBank value, $Res Function(DropdownBank) then) =
      _$DropdownBankCopyWithImpl<$Res, DropdownBank>;
  @useResult
  $Res call({int? id, String avatar, String name, String description});
}

/// @nodoc
class _$DropdownBankCopyWithImpl<$Res, $Val extends DropdownBank>
    implements $DropdownBankCopyWith<$Res> {
  _$DropdownBankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DropdownBankImplCopyWith<$Res>
    implements $DropdownBankCopyWith<$Res> {
  factory _$$DropdownBankImplCopyWith(
          _$DropdownBankImpl value, $Res Function(_$DropdownBankImpl) then) =
      __$$DropdownBankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String avatar, String name, String description});
}

/// @nodoc
class __$$DropdownBankImplCopyWithImpl<$Res>
    extends _$DropdownBankCopyWithImpl<$Res, _$DropdownBankImpl>
    implements _$$DropdownBankImplCopyWith<$Res> {
  __$$DropdownBankImplCopyWithImpl(
      _$DropdownBankImpl _value, $Res Function(_$DropdownBankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$DropdownBankImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DropdownBankImpl implements _DropdownBank {
  const _$DropdownBankImpl(
      {this.id, this.avatar = '', this.name = '', this.description = ''});

  factory _$DropdownBankImpl.fromJson(Map<String, dynamic> json) =>
      _$$DropdownBankImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String avatar;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'DropdownBank(id: $id, avatar: $avatar, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropdownBankImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropdownBankImplCopyWith<_$DropdownBankImpl> get copyWith =>
      __$$DropdownBankImplCopyWithImpl<_$DropdownBankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DropdownBankImplToJson(
      this,
    );
  }
}

abstract class _DropdownBank implements DropdownBank {
  const factory _DropdownBank(
      {final int? id,
      final String avatar,
      final String name,
      final String description}) = _$DropdownBankImpl;

  factory _DropdownBank.fromJson(Map<String, dynamic> json) =
      _$DropdownBankImpl.fromJson;

  @override
  int? get id;
  @override
  String get avatar;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$DropdownBankImplCopyWith<_$DropdownBankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
