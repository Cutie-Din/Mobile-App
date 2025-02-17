// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDetailImpl _$$AccountDetailImplFromJson(Map<String, dynamic> json) =>
    _$AccountDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      icons: json['icons'] as String? ?? '',
      bank_id: (json['bank_id'] as num?)?.toInt() ?? 0,
      bank_name: json['bank_name'] as String? ?? '',
      bank_account: json['bank_account'] as String? ?? '',
      bank_owner: json['bank_owner'] as String? ?? '',
    );

Map<String, dynamic> _$$AccountDetailImplToJson(_$AccountDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icons': instance.icons,
      'bank_id': instance.bank_id,
      'bank_name': instance.bank_name,
      'bank_account': instance.bank_account,
      'bank_owner': instance.bank_owner,
    };
