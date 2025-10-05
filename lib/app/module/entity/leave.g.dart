// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveParamEntityImpl _$$LeaveParamEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveParamEntityImpl(
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$$LeaveParamEntityImplToJson(
        _$LeaveParamEntityImpl instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'reason': instance.reason,
    };
