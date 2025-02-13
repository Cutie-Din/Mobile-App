// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddImageModel _$AddImageModelFromJson(Map<String, dynamic> json) {
  return _AddImageModel.fromJson(json);
}

/// @nodoc
mixin _$AddImageModel {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddImageModelCopyWith<AddImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddImageModelCopyWith<$Res> {
  factory $AddImageModelCopyWith(
          AddImageModel value, $Res Function(AddImageModel) then) =
      _$AddImageModelCopyWithImpl<$Res, AddImageModel>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$AddImageModelCopyWithImpl<$Res, $Val extends AddImageModel>
    implements $AddImageModelCopyWith<$Res> {
  _$AddImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddImageModelImplCopyWith<$Res>
    implements $AddImageModelCopyWith<$Res> {
  factory _$$AddImageModelImplCopyWith(
          _$AddImageModelImpl value, $Res Function(_$AddImageModelImpl) then) =
      __$$AddImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$AddImageModelImplCopyWithImpl<$Res>
    extends _$AddImageModelCopyWithImpl<$Res, _$AddImageModelImpl>
    implements _$$AddImageModelImplCopyWith<$Res> {
  __$$AddImageModelImplCopyWithImpl(
      _$AddImageModelImpl _value, $Res Function(_$AddImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$AddImageModelImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddImageModelImpl
    with DiagnosticableTreeMixin
    implements _AddImageModel {
  const _$AddImageModelImpl({this.url = ''});

  factory _$AddImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddImageModelImplFromJson(json);

  @override
  @JsonKey()
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddImageModel(url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddImageModel'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImageModelImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImageModelImplCopyWith<_$AddImageModelImpl> get copyWith =>
      __$$AddImageModelImplCopyWithImpl<_$AddImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddImageModelImplToJson(
      this,
    );
  }
}

abstract class _AddImageModel implements AddImageModel {
  const factory _AddImageModel({final String url}) = _$AddImageModelImpl;

  factory _AddImageModel.fromJson(Map<String, dynamic> json) =
      _$AddImageModelImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$AddImageModelImplCopyWith<_$AddImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
