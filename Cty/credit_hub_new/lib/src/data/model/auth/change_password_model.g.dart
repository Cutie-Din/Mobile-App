// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePasswordModelImpl _$$ChangePasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordModelImpl(
      current_password: json['current_password'] as String? ?? '',
      new_password: json['new_password'] as String? ?? '',
    );

Map<String, dynamic> _$$ChangePasswordModelImplToJson(
        _$ChangePasswordModelImpl instance) =>
    <String, dynamic>{
      'current_password': instance.current_password,
      'new_password': instance.new_password,
    };
