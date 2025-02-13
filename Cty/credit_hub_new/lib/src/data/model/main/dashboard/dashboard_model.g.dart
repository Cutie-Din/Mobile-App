// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      total_request: (json['total_request'] as num?)?.toInt() ?? 0,
      total_money: (json['total_money'] as num?)?.toDouble() ?? 0.0,
      lstRequests: (json['lstRequests'] as List<dynamic>?)
              ?.map((e) => RequestDashboard.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'total_request': instance.total_request,
      'total_money': instance.total_money,
      'lstRequests': instance.lstRequests,
    };
