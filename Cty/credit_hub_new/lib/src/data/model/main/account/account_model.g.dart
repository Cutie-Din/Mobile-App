// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      page_no: (json['page_no'] as num?)?.toInt() ?? 0,
      page_size: (json['page_size'] as num?)?.toInt() ?? 0,
      lot_no: json['lot_no'] as String? ?? '',
      from_date: json['from_date'] as String? ?? '',
      to_date: json['to_date'] as String? ?? '',
      dropdownbank: (json['dropdownbank'] as List<dynamic>?)
              ?.map((e) => DropdownBank.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AccountDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'page_no': instance.page_no,
      'page_size': instance.page_size,
      'lot_no': instance.lot_no,
      'from_date': instance.from_date,
      'to_date': instance.to_date,
      'dropdownbank': instance.dropdownbank,
      'data': instance.data,
    };
