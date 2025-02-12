// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestImpl _$$RequestImplFromJson(Map<String, dynamic> json) =>
    _$RequestImpl(
      id: json['id'] as String? ?? '',
      date_request: json['date_request'] as String? ?? '',
      lot_no: json['lot_no'] as String? ?? '',
      money_request: (json['money_request'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestImplToJson(_$RequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_request': instance.date_request,
      'lot_no': instance.lot_no,
      'money_request': instance.money_request,
      'status': instance.status,
    };
