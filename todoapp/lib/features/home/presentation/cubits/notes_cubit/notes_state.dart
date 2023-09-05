import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.loading() = _LoadingState;
  const factory NotesState.loaded(List<NoteEntity> notes) = _LoadedState;
  const factory NotesState.failure(String failureMessage) = _FailureState;

  const NotesState._();
}
