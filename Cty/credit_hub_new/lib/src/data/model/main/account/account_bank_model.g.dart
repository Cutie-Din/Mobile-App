// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DropdownBankImpl _$$DropdownBankImplFromJson(Map<String, dynamic> json) =>
    _$DropdownBankImpl(
      id: (json['id'] as num?)?.toInt(),
      avatar: json['avatar'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$DropdownBankImplToJson(_$DropdownBankImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'description': instance.description,
    };
