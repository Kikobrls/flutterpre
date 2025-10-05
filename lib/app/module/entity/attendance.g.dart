// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceEntityImpl _$$AttendanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceEntityImpl(
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      date: json['date'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceEntityImplToJson(
        _$AttendanceEntityImpl instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'date': instance.date,
      'runtimeType': instance.$type,
    };

_$AttendanceParamEntityImpl _$$AttendanceParamEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceParamEntityImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceParamEntityImplToJson(
        _$AttendanceParamEntityImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'runtimeType': instance.$type,
    };

_$AttendanceParamGetEntityImpl _$$AttendanceParamGetEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceParamGetEntityImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AttendanceParamGetEntityImplToJson(
        _$AttendanceParamGetEntityImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'runtimeType': instance.$type,
    };
