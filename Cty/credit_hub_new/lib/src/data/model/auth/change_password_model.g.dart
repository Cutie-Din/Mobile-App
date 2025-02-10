// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePasswordModelImpl _$$ChangePasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordModelImpl(
      old_password: json['old_password'] as String? ?? '',
      new_password: json['new_password'] as String? ?? '',
    );

Map<String, dynamic> _$$ChangePasswordModelImplToJson(
        _$ChangePasswordModelImpl instance) =>
    <String, dynamic>{
      'old_password': instance.old_password,
      'new_password': instance.new_password,
    };
