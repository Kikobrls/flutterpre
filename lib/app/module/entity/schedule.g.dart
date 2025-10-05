// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleEntityImpl _$$ScheduleEntityImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleEntityImpl(
      isWfa: json['is_wfa'] as bool,
      office: OfficeEntity.fromJson(json['office'] as Map<String, dynamic>),
      shift: ShiftEntity.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleEntityImplToJson(
        _$ScheduleEntityImpl instance) =>
    <String, dynamic>{
      'is_wfa': instance.isWfa,
      'office': instance.office,
      'shift': instance.shift,
    };

_$OfficeEntityImpl _$$OfficeEntityImplFromJson(Map<String, dynamic> json) =>
    _$OfficeEntityImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
    );

Map<String, dynamic> _$$OfficeEntityImplToJson(_$OfficeEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };

_$ShiftEntityImpl _$$ShiftEntityImplFromJson(Map<String, dynamic> json) =>
    _$ShiftEntityImpl(
      name: json['name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );

Map<String, dynamic> _$$ShiftEntityImplToJson(_$ShiftEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
