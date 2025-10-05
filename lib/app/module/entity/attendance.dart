import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.g.dart';
part 'attendance.freezed.dart';

@freezed
sealed class Attendance with _$Attendance {
  factory Attendance.entity(
      {@JsonKey(name: 'start_time') required String startTime,
      @JsonKey(name: 'end_time') required String endTime,
      String? date}) = AttendanceEntity;

  factory Attendance.paramEntity(
      {required double latitude,
      required double longitude}) = AttendanceParamEntity;

  factory Attendance.paramGetEntity({required int month, required int year}) =
      AttendanceParamGetEntity;

  factory Attendance.fromJson(Map<String, Object> json) =>
      _$AttendanceFromJson(json);
}
