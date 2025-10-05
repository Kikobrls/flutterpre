import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.g.dart';
part 'schedule.freezed.dart';

@freezed
sealed class Schedule with _$Schedule {
  factory Schedule.entity(
      {@JsonKey(name: 'is_wfa') required bool isWfa,
      required OfficeEntity office,
      required ShiftEntity shift}) = ScheduleEntity;

  factory Schedule.fromJson(Map<String, Object> json) =>
      _$ScheduleFromJson(json);
}

@freezed
sealed class Office with _$Office {
  factory Office.entity(
      {required String name,
      required double latitude,
      required double longitude,
      required double radius}) = OfficeEntity;

  factory Office.fromJson(Map<String, Object> json) => _$OfficeFromJson(json);
}

@freezed
sealed class Shift with _$Shift {
  factory Shift.entity(
      {required String name,
      @JsonKey(name: 'start_time') required String startTime,
      @JsonKey(name: 'end_time') required String endTime}) = ShiftEntity;

  factory Shift.fromJson(Map<String, Object> json) => _$ShiftFromJson(json);
}
