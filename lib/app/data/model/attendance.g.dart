// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      today: json['today'] == null
          ? null
          : AttendanceEntity.fromJson(json['today'] as Map<String, dynamic>),
      thisMonth: (json['this_month'] as List<dynamic>)
          .map((e) => AttendanceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'today': instance.today,
      'this_month': instance.thisMonth,
    };
