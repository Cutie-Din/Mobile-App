// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInParamImpl _$$SignInParamImplFromJson(Map<String, dynamic> json) =>
    _$SignInParamImpl(
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      device_id: json['device_id'] as String? ?? '',
    );

Map<String, dynamic> _$$SignInParamImplToJson(_$SignInParamImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'device_id': instance.device_id,
    };
