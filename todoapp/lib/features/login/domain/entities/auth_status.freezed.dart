// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(UserEntity user) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(UserEntity user)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(UserEntity user)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedStatus value) unauthorized,
    required TResult Function(AuthorizedStatus value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedStatus value)? unauthorized,
    TResult? Function(AuthorizedStatus value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedStatus value)? unauthorized,
    TResult Function(AuthorizedStatus value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusCopyWith<$Res> {
  factory $AuthStatusCopyWith(
          AuthStatus value, $Res Function(AuthStatus) then) =
      _$AuthStatusCopyWithImpl<$Res, AuthStatus>;
}

/// @nodoc
class _$AuthStatusCopyWithImpl<$Res, $Val extends AuthStatus>
    implements $AuthStatusCopyWith<$Res> {
  _$AuthStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthorizedStatusCopyWith<$Res> {
  factory _$$UnauthorizedStatusCopyWith(_$UnauthorizedStatus value,
          $Res Function(_$UnauthorizedStatus) then) =
      __$$UnauthorizedStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedStatusCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$UnauthorizedStatus>
    implements _$$UnauthorizedStatusCopyWith<$Res> {
  __$$UnauthorizedStatusCopyWithImpl(
      _$UnauthorizedStatus _value, $Res Function(_$UnauthorizedStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedStatus extends UnauthorizedStatus {
  const _$UnauthorizedStatus() : super._();

  @override
  String toString() {
    return 'AuthStatus.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(UserEntity user) authorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(UserEntity user)? authorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(UserEntity user)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedStatus value) unauthorized,
    required TResult Function(AuthorizedStatus value) authorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedStatus value)? unauthorized,
    TResult? Function(AuthorizedStatus value)? authorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedStatus value)? unauthorized,
    TResult Function(AuthorizedStatus value)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedStatus extends AuthStatus {
  const factory UnauthorizedStatus() = _$UnauthorizedStatus;
  const UnauthorizedStatus._() : super._();
}

/// @nodoc
abstract class _$$AuthorizedStatusCopyWith<$Res> {
  factory _$$AuthorizedStatusCopyWith(
          _$AuthorizedStatus value, $Res Function(_$AuthorizedStatus) then) =
      __$$AuthorizedStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$AuthorizedStatusCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$AuthorizedStatus>
    implements _$$AuthorizedStatusCopyWith<$Res> {
  __$$AuthorizedStatusCopyWithImpl(
      _$AuthorizedStatus _value, $Res Function(_$AuthorizedStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthorizedStatus(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$AuthorizedStatus extends AuthorizedStatus {
  const _$AuthorizedStatus(this.user) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthStatus.authorized(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedStatus &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedStatusCopyWith<_$AuthorizedStatus> get copyWith =>
      __$$AuthorizedStatusCopyWithImpl<_$AuthorizedStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function(UserEntity user) authorized,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function(UserEntity user)? authorized,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function(UserEntity user)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedStatus value) unauthorized,
    required TResult Function(AuthorizedStatus value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedStatus value)? unauthorized,
    TResult? Function(AuthorizedStatus value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedStatus value)? unauthorized,
    TResult Function(AuthorizedStatus value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class AuthorizedStatus extends AuthStatus {
  const factory AuthorizedStatus(final UserEntity user) = _$AuthorizedStatus;
  const AuthorizedStatus._() : super._();

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$AuthorizedStatusCopyWith<_$AuthorizedStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
