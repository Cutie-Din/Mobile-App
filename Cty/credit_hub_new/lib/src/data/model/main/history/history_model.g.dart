// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      page_no: (json['page_no'] as num?)?.toInt() ?? 0,
      page_size: (json['page_size'] as num?)?.toInt() ?? 0,
      lot_no: json['lot_no'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => RequestHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'page_no': instance.page_no,
      'page_size': instance.page_size,
      'lot_no': instance.lot_no,
      'data': instance.data,
    };
