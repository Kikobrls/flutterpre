// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Leave _$LeaveFromJson(Map<String, dynamic> json) {
  return LeaveParamEntity.fromJson(json);
}

/// @nodoc
mixin _$Leave {
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)
        paramEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)?
        paramEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)?
        paramEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeaveParamEntity value) paramEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeaveParamEntity value)? paramEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeaveParamEntity value)? paramEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveCopyWith<Leave> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveCopyWith<$Res> {
  factory $LeaveCopyWith(Leave value, $Res Function(Leave) then) =
      _$LeaveCopyWithImpl<$Res, Leave>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason});
}

/// @nodoc
class _$LeaveCopyWithImpl<$Res, $Val extends Leave>
    implements $LeaveCopyWith<$Res> {
  _$LeaveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveParamEntityImplCopyWith<$Res>
    implements $LeaveCopyWith<$Res> {
  factory _$$LeaveParamEntityImplCopyWith(_$LeaveParamEntityImpl value,
          $Res Function(_$LeaveParamEntityImpl) then) =
      __$$LeaveParamEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason});
}

/// @nodoc
class __$$LeaveParamEntityImplCopyWithImpl<$Res>
    extends _$LeaveCopyWithImpl<$Res, _$LeaveParamEntityImpl>
    implements _$$LeaveParamEntityImplCopyWith<$Res> {
  __$$LeaveParamEntityImplCopyWithImpl(_$LeaveParamEntityImpl _value,
      $Res Function(_$LeaveParamEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
  }) {
    return _then(_$LeaveParamEntityImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveParamEntityImpl implements LeaveParamEntity {
  const _$LeaveParamEntityImpl(
      {@JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      required this.reason});

  factory _$LeaveParamEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveParamEntityImplFromJson(json);

  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  final String reason;

  @override
  String toString() {
    return 'Leave.paramEntity(startDate: $startDate, endDate: $endDate, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveParamEntityImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveParamEntityImplCopyWith<_$LeaveParamEntityImpl> get copyWith =>
      __$$LeaveParamEntityImplCopyWithImpl<_$LeaveParamEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)
        paramEntity,
  }) {
    return paramEntity(startDate, endDate, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)?
        paramEntity,
  }) {
    return paramEntity?.call(startDate, endDate, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate, String reason)?
        paramEntity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(startDate, endDate, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeaveParamEntity value) paramEntity,
  }) {
    return paramEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeaveParamEntity value)? paramEntity,
  }) {
    return paramEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeaveParamEntity value)? paramEntity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveParamEntityImplToJson(
      this,
    );
  }
}

abstract class LeaveParamEntity implements Leave {
  const factory LeaveParamEntity(
      {@JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'end_date') required final String endDate,
      required final String reason}) = _$LeaveParamEntityImpl;

  factory LeaveParamEntity.fromJson(Map<String, dynamic> json) =
      _$LeaveParamEntityImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$LeaveParamEntityImplCopyWith<_$LeaveParamEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
