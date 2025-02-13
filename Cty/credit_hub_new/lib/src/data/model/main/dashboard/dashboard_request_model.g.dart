// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestDashboardImpl _$$RequestDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestDashboardImpl(
      id: (json['id'] as num?)?.toInt(),
      date_request: json['date_request'] as String? ?? '',
      lot_no: json['lot_no'] as String? ?? '',
      money_request: (json['money_request'] as num?)?.toDouble() ?? 0.0,
      status_name: json['status_name'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestDashboardImplToJson(
        _$RequestDashboardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_request': instance.date_request,
      'lot_no': instance.lot_no,
      'money_request': instance.money_request,
      'status_name': instance.status_name,
    };
