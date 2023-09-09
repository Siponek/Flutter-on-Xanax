// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddNoteState {
  NoteInput get noteInput => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteInput noteInput) initial,
    required TResult Function(NoteInput noteInput) saving,
    required TResult Function(NoteInput noteInput) success,
    required TResult Function(String failureMessage, NoteInput noteInput)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteInput noteInput)? initial,
    TResult? Function(NoteInput noteInput)? saving,
    TResult? Function(NoteInput noteInput)? success,
    TResult? Function(String failureMessage, NoteInput noteInput)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteInput noteInput)? initial,
    TResult Function(NoteInput noteInput)? saving,
    TResult Function(NoteInput noteInput)? success,
    TResult Function(String failureMessage, NoteInput noteInput)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_SavingState value) saving,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_SavingState value)? saving,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_SavingState value)? saving,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNoteStateCopyWith<AddNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNoteStateCopyWith<$Res> {
  factory $AddNoteStateCopyWith(
          AddNoteState value, $Res Function(AddNoteState) then) =
      _$AddNoteStateCopyWithImpl<$Res, AddNoteState>;
  @useResult
  $Res call({NoteInput noteInput});
}

/// @nodoc
class _$AddNoteStateCopyWithImpl<$Res, $Val extends AddNoteState>
    implements $AddNoteStateCopyWith<$Res> {
  _$AddNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteInput = null,
  }) {
    return _then(_value.copyWith(
      noteInput: null == noteInput
          ? _value.noteInput
          : noteInput // ignore: cast_nullable_to_non_nullable
              as NoteInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialStateCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$$_InitialStateCopyWith(
          _$_InitialState value, $Res Function(_$_InitialState) then) =
      __$$_InitialStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteInput noteInput});
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_InitialState>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteInput = null,
  }) {
    return _then(_$_InitialState(
      null == noteInput
          ? _value.noteInput
          : noteInput // ignore: cast_nullable_to_non_nullable
              as NoteInput,
    ));
  }
}

/// @nodoc

class _$_InitialState extends _InitialState {
  const _$_InitialState(this.noteInput) : super._();

  @override
  final NoteInput noteInput;

  @override
  String toString() {
    return 'AddNoteState.initial(noteInput: $noteInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialState &&
            (identical(other.noteInput, noteInput) ||
                other.noteInput == noteInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialStateCopyWith<_$_InitialState> get copyWith =>
      __$$_InitialStateCopyWithImpl<_$_InitialState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteInput noteInput) initial,
    required TResult Function(NoteInput noteInput) saving,
    required TResult Function(NoteInput noteInput) success,
    required TResult Function(String failureMessage, NoteInput noteInput)
        failure,
  }) {
    return initial(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteInput noteInput)? initial,
    TResult? Function(NoteInput noteInput)? saving,
    TResult? Function(NoteInput noteInput)? success,
    TResult? Function(String failureMessage, NoteInput noteInput)? failure,
  }) {
    return initial?.call(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteInput noteInput)? initial,
    TResult Function(NoteInput noteInput)? saving,
    TResult Function(NoteInput noteInput)? success,
    TResult Function(String failureMessage, NoteInput noteInput)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(noteInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_SavingState value) saving,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_SavingState value)? saving,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_SavingState value)? saving,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends AddNoteState {
  const factory _InitialState(final NoteInput noteInput) = _$_InitialState;
  const _InitialState._() : super._();

  @override
  NoteInput get noteInput;
  @override
  @JsonKey(ignore: true)
  _$$_InitialStateCopyWith<_$_InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavingStateCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$$_SavingStateCopyWith(
          _$_SavingState value, $Res Function(_$_SavingState) then) =
      __$$_SavingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteInput noteInput});
}

/// @nodoc
class __$$_SavingStateCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_SavingState>
    implements _$$_SavingStateCopyWith<$Res> {
  __$$_SavingStateCopyWithImpl(
      _$_SavingState _value, $Res Function(_$_SavingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteInput = null,
  }) {
    return _then(_$_SavingState(
      null == noteInput
          ? _value.noteInput
          : noteInput // ignore: cast_nullable_to_non_nullable
              as NoteInput,
    ));
  }
}

/// @nodoc

class _$_SavingState extends _SavingState {
  const _$_SavingState(this.noteInput) : super._();

  @override
  final NoteInput noteInput;

  @override
  String toString() {
    return 'AddNoteState.saving(noteInput: $noteInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavingState &&
            (identical(other.noteInput, noteInput) ||
                other.noteInput == noteInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavingStateCopyWith<_$_SavingState> get copyWith =>
      __$$_SavingStateCopyWithImpl<_$_SavingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteInput noteInput) initial,
    required TResult Function(NoteInput noteInput) saving,
    required TResult Function(NoteInput noteInput) success,
    required TResult Function(String failureMessage, NoteInput noteInput)
        failure,
  }) {
    return saving(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteInput noteInput)? initial,
    TResult? Function(NoteInput noteInput)? saving,
    TResult? Function(NoteInput noteInput)? success,
    TResult? Function(String failureMessage, NoteInput noteInput)? failure,
  }) {
    return saving?.call(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteInput noteInput)? initial,
    TResult Function(NoteInput noteInput)? saving,
    TResult Function(NoteInput noteInput)? success,
    TResult Function(String failureMessage, NoteInput noteInput)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(noteInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_SavingState value) saving,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_SavingState value)? saving,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_SavingState value)? saving,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _SavingState extends AddNoteState {
  const factory _SavingState(final NoteInput noteInput) = _$_SavingState;
  const _SavingState._() : super._();

  @override
  NoteInput get noteInput;
  @override
  @JsonKey(ignore: true)
  _$$_SavingStateCopyWith<_$_SavingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessStateCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$$_SuccessStateCopyWith(
          _$_SuccessState value, $Res Function(_$_SuccessState) then) =
      __$$_SuccessStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteInput noteInput});
}

/// @nodoc
class __$$_SuccessStateCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_SuccessState>
    implements _$$_SuccessStateCopyWith<$Res> {
  __$$_SuccessStateCopyWithImpl(
      _$_SuccessState _value, $Res Function(_$_SuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteInput = null,
  }) {
    return _then(_$_SuccessState(
      null == noteInput
          ? _value.noteInput
          : noteInput // ignore: cast_nullable_to_non_nullable
              as NoteInput,
    ));
  }
}

/// @nodoc

class _$_SuccessState extends _SuccessState {
  const _$_SuccessState(this.noteInput) : super._();

  @override
  final NoteInput noteInput;

  @override
  String toString() {
    return 'AddNoteState.success(noteInput: $noteInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessState &&
            (identical(other.noteInput, noteInput) ||
                other.noteInput == noteInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessStateCopyWith<_$_SuccessState> get copyWith =>
      __$$_SuccessStateCopyWithImpl<_$_SuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteInput noteInput) initial,
    required TResult Function(NoteInput noteInput) saving,
    required TResult Function(NoteInput noteInput) success,
    required TResult Function(String failureMessage, NoteInput noteInput)
        failure,
  }) {
    return success(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteInput noteInput)? initial,
    TResult? Function(NoteInput noteInput)? saving,
    TResult? Function(NoteInput noteInput)? success,
    TResult? Function(String failureMessage, NoteInput noteInput)? failure,
  }) {
    return success?.call(noteInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteInput noteInput)? initial,
    TResult Function(NoteInput noteInput)? saving,
    TResult Function(NoteInput noteInput)? success,
    TResult Function(String failureMessage, NoteInput noteInput)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(noteInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_SavingState value) saving,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_SavingState value)? saving,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_SavingState value)? saving,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessState extends AddNoteState {
  const factory _SuccessState(final NoteInput noteInput) = _$_SuccessState;
  const _SuccessState._() : super._();

  @override
  NoteInput get noteInput;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessStateCopyWith<_$_SuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureStateCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$$_FailureStateCopyWith(
          _$_FailureState value, $Res Function(_$_FailureState) then) =
      __$$_FailureStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String failureMessage, NoteInput noteInput});
}

/// @nodoc
class __$$_FailureStateCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_FailureState>
    implements _$$_FailureStateCopyWith<$Res> {
  __$$_FailureStateCopyWithImpl(
      _$_FailureState _value, $Res Function(_$_FailureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
    Object? noteInput = null,
  }) {
    return _then(_$_FailureState(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
      noteInput: null == noteInput
          ? _value.noteInput
          : noteInput // ignore: cast_nullable_to_non_nullable
              as NoteInput,
    ));
  }
}

/// @nodoc

class _$_FailureState extends _FailureState {
  const _$_FailureState({required this.failureMessage, required this.noteInput})
      : super._();

  @override
  final String failureMessage;
  @override
  final NoteInput noteInput;

  @override
  String toString() {
    return 'AddNoteState.failure(failureMessage: $failureMessage, noteInput: $noteInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailureState &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage) &&
            (identical(other.noteInput, noteInput) ||
                other.noteInput == noteInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage, noteInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureStateCopyWith<_$_FailureState> get copyWith =>
      __$$_FailureStateCopyWithImpl<_$_FailureState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NoteInput noteInput) initial,
    required TResult Function(NoteInput noteInput) saving,
    required TResult Function(NoteInput noteInput) success,
    required TResult Function(String failureMessage, NoteInput noteInput)
        failure,
  }) {
    return failure(failureMessage, noteInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NoteInput noteInput)? initial,
    TResult? Function(NoteInput noteInput)? saving,
    TResult? Function(NoteInput noteInput)? success,
    TResult? Function(String failureMessage, NoteInput noteInput)? failure,
  }) {
    return failure?.call(failureMessage, noteInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NoteInput noteInput)? initial,
    TResult Function(NoteInput noteInput)? saving,
    TResult Function(NoteInput noteInput)? success,
    TResult Function(String failureMessage, NoteInput noteInput)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(failureMessage, noteInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_SavingState value) saving,
    required TResult Function(_SuccessState value) success,
    required TResult Function(_FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_SavingState value)? saving,
    TResult? Function(_SuccessState value)? success,
    TResult? Function(_FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_SavingState value)? saving,
    TResult Function(_SuccessState value)? success,
    TResult Function(_FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureState extends AddNoteState {
  const factory _FailureState(
      {required final String failureMessage,
      required final NoteInput noteInput}) = _$_FailureState;
  const _FailureState._() : super._();

  String get failureMessage;
  @override
  NoteInput get noteInput;
  @override
  @JsonKey(ignore: true)
  _$$_FailureStateCopyWith<_$_FailureState> get copyWith =>
      throw _privateConstructorUsedError;
}
