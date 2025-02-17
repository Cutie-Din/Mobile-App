// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      page_no: (json['page_no'] as num?)?.toInt() ?? 0,
      page_size: (json['page_size'] as num?)?.toInt() ?? 0,
      dropdownbank: (json['dropdownbank'] as List<dynamic>?)
              ?.map((e) => DropdownBank.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      accounts: (json['accounts'] as List<dynamic>?)
              ?.map((e) => AccountDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'page_no': instance.page_no,
      'page_size': instance.page_size,
      'dropdownbank': instance.dropdownbank,
      'accounts': instance.accounts,
    };
