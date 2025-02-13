// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddImageState {
  AddImageStatus get status => throw _privateConstructorUsedError;
  AddImageModel get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddImageStateCopyWith<AddImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddImageStateCopyWith<$Res> {
  factory $AddImageStateCopyWith(
          AddImageState value, $Res Function(AddImageState) then) =
      _$AddImageStateCopyWithImpl<$Res, AddImageState>;
  @useResult
  $Res call(
      {AddImageStatus status,
      AddImageModel data,
      String message,
      File? imageFile});

  $AddImageModelCopyWith<$Res> get data;
}

/// @nodoc
class _$AddImageStateCopyWithImpl<$Res, $Val extends AddImageState>
    implements $AddImageStateCopyWith<$Res> {
  _$AddImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? message = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddImageStatus,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddImageModel,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddImageModelCopyWith<$Res> get data {
    return $AddImageModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddImageStateImplCopyWith<$Res>
    implements $AddImageStateCopyWith<$Res> {
  factory _$$AddImageStateImplCopyWith(
          _$AddImageStateImpl value, $Res Function(_$AddImageStateImpl) then) =
      __$$AddImageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddImageStatus status,
      AddImageModel data,
      String message,
      File? imageFile});

  @override
  $AddImageModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$AddImageStateImplCopyWithImpl<$Res>
    extends _$AddImageStateCopyWithImpl<$Res, _$AddImageStateImpl>
    implements _$$AddImageStateImplCopyWith<$Res> {
  __$$AddImageStateImplCopyWithImpl(
      _$AddImageStateImpl _value, $Res Function(_$AddImageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? message = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$AddImageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddImageStatus,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddImageModel,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$AddImageStateImpl
    with DiagnosticableTreeMixin
    implements _AddImageState {
  const _$AddImageStateImpl(
      {this.status = AddImageStatus.initial,
      this.data = const AddImageModel(),
      this.message = '',
      this.imageFile});

  @override
  @JsonKey()
  final AddImageStatus status;
  @override
  @JsonKey()
  final AddImageModel data;
  @override
  @JsonKey()
  final String message;
  @override
  final File? imageFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddImageState(status: $status, data: $data, message: $message, imageFile: $imageFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddImageState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('imageFile', imageFile));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, data, message, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImageStateImplCopyWith<_$AddImageStateImpl> get copyWith =>
      __$$AddImageStateImplCopyWithImpl<_$AddImageStateImpl>(this, _$identity);
}

abstract class _AddImageState implements AddImageState {
  const factory _AddImageState(
      {final AddImageStatus status,
      final AddImageModel data,
      final String message,
      final File? imageFile}) = _$AddImageStateImpl;

  @override
  AddImageStatus get status;
  @override
  AddImageModel get data;
  @override
  String get message;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$AddImageStateImplCopyWith<_$AddImageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
