import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/location_entity.dart';
import 'package:todoapp/features/home/domain/entities/note_input.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:todoapp/services/repository_firestore.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.repositoryFirestore)
      : super(const AddNoteState.initial(NoteInput()));

  final RepositoryFirestore repositoryFirestore;

  Future<void> addNote() async {
    emit(AddNoteState.saving(state.noteInput));
    if (!state.noteInput.isReadyToAdd()) {
      emit(AddNoteState.failure(
        failureMessage: "Please fill in all fields!",
        noteInput: state.noteInput,
      ));
      return;
    }

    final bool success = await repositoryFirestore.addNote(state.noteInput);

    if (success) {
      emit(AddNoteState.success(state.noteInput));
    } else {
      emit(AddNoteState.failure(
        failureMessage: "Couldn't add note! Sad face",
        noteInput: state.noteInput,
      ));
    }
  }

  void updateNoteInput({
    String? title,
    String? description,
    String? pathToImage,
    LocationEntity? location,
    DateTime? date,
  }) {
    NoteInput updatedNoteInput = state.noteInput.copyWith(
      title: title ?? state.noteInput.title,
      description: description ?? state.noteInput.description,
      pathToImage: pathToImage ?? state.noteInput.pathToImage,
      // location: location ?? state.noteInput.location,
      // date: date ?? state.noteInput.date,
    );
    emit(state.copyWith(noteInput: updatedNoteInput));
  }

  void titleChanged(String title) => updateNoteInput(title: title);

  void descriptionChanged(String description) =>
      updateNoteInput(description: description);

  void imageChanged(String pathToImage) =>
      updateNoteInput(pathToImage: pathToImage);

  void locationChanged(LocationEntity location) =>
      updateNoteInput(location: location);

  void dateChanged(DateTime date) => updateNoteInput(date: date);

  void reset() => emit(const AddNoteState.initial(NoteInput()));
}
