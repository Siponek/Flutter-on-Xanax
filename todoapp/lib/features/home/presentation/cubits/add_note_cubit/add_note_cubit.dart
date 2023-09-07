import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:todoapp/services/repository_firestore.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.repositoryFirestore) : super(const AddNoteState.loading());

  final RepositoryFirestore repositoryFirestore;

  Future<void> addNote(NoteEntity note) async {
    emit(const AddNoteState.loading());
    final bool success = await repositoryFirestore.addNote(note);

    if (success) {
      emit(const AddNoteState.success());
    } else {
      emit(const AddNoteState.failure("Couldn't add note! Sad face"));
    }
  }
}
