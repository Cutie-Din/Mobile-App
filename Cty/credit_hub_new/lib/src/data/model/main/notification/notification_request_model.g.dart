// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestNotificationImpl _$$RequestNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestNotificationImpl(
      id: (json['id'] as num?)?.toInt(),
      image_link: json['image_link'] as String? ?? '',
      date_request: json['date_request'] as String? ?? '',
      date_finish: json['date_finish'] as String? ?? '',
      lot_no: json['lot_no'] as String? ?? '',
      money_request: (json['money_request'] as num?)?.toDouble() ?? 0.0,
      status_name: json['status_name'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestNotificationImplToJson(
        _$RequestNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_link': instance.image_link,
      'date_request': instance.date_request,
      'date_finish': instance.date_finish,
      'lot_no': instance.lot_no,
      'money_request': instance.money_request,
      'status_name': instance.status_name,
    };
