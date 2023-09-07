import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_note_state.freezed.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState.loading() = _LoadingState;
  const factory AddNoteState.success() = _SuccessState;
  const factory AddNoteState.failure(String failureMessage) = _FailureState;

  const AddNoteState._();
}
