// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  AttendanceEntity? get today => throw _privateConstructorUsedError;
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)?
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)?
        model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceModel value) model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceModel value)? model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceModel value)? model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {AttendanceEntity? today,
      @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = freezed,
    Object? thisMonth = null,
  }) {
    return _then(_value.copyWith(
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity?,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceModelImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceModelImplCopyWith(_$AttendanceModelImpl value,
          $Res Function(_$AttendanceModelImpl) then) =
      __$$AttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AttendanceEntity? today,
      @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth});
}

/// @nodoc
class __$$AttendanceModelImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceModelImpl>
    implements _$$AttendanceModelImplCopyWith<$Res> {
  __$$AttendanceModelImplCopyWithImpl(
      _$AttendanceModelImpl _value, $Res Function(_$AttendanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = freezed,
    Object? thisMonth = null,
  }) {
    return _then(_$AttendanceModelImpl(
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity?,
      thisMonth: null == thisMonth
          ? _value._thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceModelImpl implements AttendanceModel {
  _$AttendanceModelImpl(
      {this.today,
      @JsonKey(name: 'this_month')
      required final List<AttendanceEntity> thisMonth})
      : _thisMonth = thisMonth;

  factory _$AttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceModelImplFromJson(json);

  @override
  final AttendanceEntity? today;
  final List<AttendanceEntity> _thisMonth;
  @override
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth {
    if (_thisMonth is EqualUnmodifiableListView) return _thisMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisMonth);
  }

  @override
  String toString() {
    return 'Attendance.model(today: $today, thisMonth: $thisMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceModelImpl &&
            const DeepCollectionEquality().equals(other.today, today) &&
            const DeepCollectionEquality()
                .equals(other._thisMonth, _thisMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(today),
      const DeepCollectionEquality().hash(_thisMonth));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      __$$AttendanceModelImplCopyWithImpl<_$AttendanceModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)
        model,
  }) {
    return model(today, thisMonth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)?
        model,
  }) {
    return model?.call(today, thisMonth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttendanceEntity? today,
            @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth)?
        model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(today, thisMonth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceModel value) model,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceModel value)? model,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceModel value)? model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceModelImplToJson(
      this,
    );
  }
}

abstract class AttendanceModel implements Attendance {
  factory AttendanceModel(
      {final AttendanceEntity? today,
      @JsonKey(name: 'this_month')
      required final List<AttendanceEntity> thisMonth}) = _$AttendanceModelImpl;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceModelImpl.fromJson;

  @override
  AttendanceEntity? get today;
  @override
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
