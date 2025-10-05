// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return ScheduleEntity.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  OfficeEntity get office => throw _privateConstructorUsedError;
  ShiftEntity get shift => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'is_wfa') bool isWfa,
            OfficeEntity office, ShiftEntity shift)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'is_wfa') bool isWfa, OfficeEntity office,
            ShiftEntity shift)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'is_wfa') bool isWfa, OfficeEntity office,
            ShiftEntity shift)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_wfa') bool isWfa,
      OfficeEntity office,
      ShiftEntity shift});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWfa = null,
    Object? office = freezed,
    Object? shift = freezed,
  }) {
    return _then(_value.copyWith(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeEntity,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleEntityImplCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$$ScheduleEntityImplCopyWith(_$ScheduleEntityImpl value,
          $Res Function(_$ScheduleEntityImpl) then) =
      __$$ScheduleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_wfa') bool isWfa,
      OfficeEntity office,
      ShiftEntity shift});
}

/// @nodoc
class __$$ScheduleEntityImplCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$ScheduleEntityImpl>
    implements _$$ScheduleEntityImplCopyWith<$Res> {
  __$$ScheduleEntityImplCopyWithImpl(
      _$ScheduleEntityImpl _value, $Res Function(_$ScheduleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWfa = null,
    Object? office = freezed,
    Object? shift = freezed,
  }) {
    return _then(_$ScheduleEntityImpl(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeEntity,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleEntityImpl implements ScheduleEntity {
  _$ScheduleEntityImpl(
      {@JsonKey(name: 'is_wfa') required this.isWfa,
      required this.office,
      required this.shift});

  factory _$ScheduleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleEntityImplFromJson(json);

  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  final OfficeEntity office;
  @override
  final ShiftEntity shift;

  @override
  String toString() {
    return 'Schedule.entity(isWfa: $isWfa, office: $office, shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleEntityImpl &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            const DeepCollectionEquality().equals(other.office, office) &&
            const DeepCollectionEquality().equals(other.shift, shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isWfa,
      const DeepCollectionEquality().hash(office),
      const DeepCollectionEquality().hash(shift));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      __$$ScheduleEntityImplCopyWithImpl<_$ScheduleEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'is_wfa') bool isWfa,
            OfficeEntity office, ShiftEntity shift)
        entity,
  }) {
    return entity(isWfa, office, shift);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'is_wfa') bool isWfa, OfficeEntity office,
            ShiftEntity shift)?
        entity,
  }) {
    return entity?.call(isWfa, office, shift);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'is_wfa') bool isWfa, OfficeEntity office,
            ShiftEntity shift)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(isWfa, office, shift);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScheduleEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScheduleEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScheduleEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleEntityImplToJson(
      this,
    );
  }
}

abstract class ScheduleEntity implements Schedule {
  factory ScheduleEntity(
      {@JsonKey(name: 'is_wfa') required final bool isWfa,
      required final OfficeEntity office,
      required final ShiftEntity shift}) = _$ScheduleEntityImpl;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =
      _$ScheduleEntityImpl.fromJson;

  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  OfficeEntity get office;
  @override
  ShiftEntity get shift;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return OfficeEntity.fromJson(json);
}

/// @nodoc
mixin _$Office {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, double latitude, double longitude, double radius)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, double latitude, double longitude, double radius)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, double latitude, double longitude, double radius)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfficeEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfficeEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfficeEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeCopyWith<Office> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeCopyWith<$Res> {
  factory $OfficeCopyWith(Office value, $Res Function(Office) then) =
      _$OfficeCopyWithImpl<$Res, Office>;
  @useResult
  $Res call({String name, double latitude, double longitude, double radius});
}

/// @nodoc
class _$OfficeCopyWithImpl<$Res, $Val extends Office>
    implements $OfficeCopyWith<$Res> {
  _$OfficeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeEntityImplCopyWith<$Res>
    implements $OfficeCopyWith<$Res> {
  factory _$$OfficeEntityImplCopyWith(
          _$OfficeEntityImpl value, $Res Function(_$OfficeEntityImpl) then) =
      __$$OfficeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double latitude, double longitude, double radius});
}

/// @nodoc
class __$$OfficeEntityImplCopyWithImpl<$Res>
    extends _$OfficeCopyWithImpl<$Res, _$OfficeEntityImpl>
    implements _$$OfficeEntityImplCopyWith<$Res> {
  __$$OfficeEntityImplCopyWithImpl(
      _$OfficeEntityImpl _value, $Res Function(_$OfficeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_$OfficeEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeEntityImpl implements OfficeEntity {
  _$OfficeEntityImpl(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.radius});

  factory _$OfficeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeEntityImplFromJson(json);

  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double radius;

  @override
  String toString() {
    return 'Office.entity(name: $name, latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, latitude, longitude, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeEntityImplCopyWith<_$OfficeEntityImpl> get copyWith =>
      __$$OfficeEntityImplCopyWithImpl<_$OfficeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, double latitude, double longitude, double radius)
        entity,
  }) {
    return entity(name, latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, double latitude, double longitude, double radius)?
        entity,
  }) {
    return entity?.call(name, latitude, longitude, radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, double latitude, double longitude, double radius)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(name, latitude, longitude, radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OfficeEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OfficeEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OfficeEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeEntityImplToJson(
      this,
    );
  }
}

abstract class OfficeEntity implements Office {
  factory OfficeEntity(
      {required final String name,
      required final double latitude,
      required final double longitude,
      required final double radius}) = _$OfficeEntityImpl;

  factory OfficeEntity.fromJson(Map<String, dynamic> json) =
      _$OfficeEntityImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get radius;
  @override
  @JsonKey(ignore: true)
  _$$OfficeEntityImplCopyWith<_$OfficeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return ShiftEntity.fromJson(json);
}

/// @nodoc
mixin _$Shift {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShiftEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShiftEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShiftEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftCopyWith<Shift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res, Shift>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res, $Val extends Shift>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftEntityImplCopyWith<$Res>
    implements $ShiftCopyWith<$Res> {
  factory _$$ShiftEntityImplCopyWith(
          _$ShiftEntityImpl value, $Res Function(_$ShiftEntityImpl) then) =
      __$$ShiftEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class __$$ShiftEntityImplCopyWithImpl<$Res>
    extends _$ShiftCopyWithImpl<$Res, _$ShiftEntityImpl>
    implements _$$ShiftEntityImplCopyWith<$Res> {
  __$$ShiftEntityImplCopyWithImpl(
      _$ShiftEntityImpl _value, $Res Function(_$ShiftEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$ShiftEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftEntityImpl implements ShiftEntity {
  _$ShiftEntityImpl(
      {required this.name,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime});

  factory _$ShiftEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEntityImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;

  @override
  String toString() {
    return 'Shift.entity(name: $name, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      __$$ShiftEntityImplCopyWithImpl<_$ShiftEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)
        entity,
  }) {
    return entity(name, startTime, endTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)?
        entity,
  }) {
    return entity?.call(name, startTime, endTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, @JsonKey(name: 'start_time') String startTime,
            @JsonKey(name: 'end_time') String endTime)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(name, startTime, endTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShiftEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShiftEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShiftEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftEntityImplToJson(
      this,
    );
  }
}

abstract class ShiftEntity implements Shift {
  factory ShiftEntity(
          {required final String name,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime}) =
      _$ShiftEntityImpl;

  factory ShiftEntity.fromJson(Map<String, dynamic> json) =
      _$ShiftEntityImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(ignore: true)
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
