import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/features/home/domain/entities/note_input.dart';

part 'add_note_state.freezed.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState.initial(NoteInput noteInput) = _InitialState;
  const factory AddNoteState.saving(NoteInput noteInput) = _SavingState;
  const factory AddNoteState.success(NoteInput noteInput) = _SuccessState;
  const factory AddNoteState.failure({
    required String failureMessage,
    required NoteInput noteInput,
  }) = _FailureState;

  const AddNoteState._();
}
