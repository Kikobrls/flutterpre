import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.g.dart';
part 'leave.freezed.dart';

@freezed
sealed class Leave with _$Leave {
  const factory Leave.paramEntity(
      {@JsonKey(name: 'start_date') required String startDate,
      @JsonKey(name: 'end_date') required String endDate,
      required String reason}) = LeaveParamEntity;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}
