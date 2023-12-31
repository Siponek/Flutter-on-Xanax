import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:todoapp/services/repository_firestore.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.repositoryFirestore) : super(const NotesState.loading()) {
    streamSubscription = repositoryFirestore.notesStream.listen((event) async {
      log('Stream has a new event', name: 'notes_cubit');
      final List<NoteEntity> notes = event.docs
          .map((json) => NoteEntity.noteEntityFromJson(
              json.data()..addAll({'id': json.id})))
          .toList(growable: false);
      // await Future.delayed(const Duration(seconds: 5));

      emit(NotesState.loaded(notes));
    });

    // _loadNotes();
  }

  late final StreamSubscription streamSubscription;
  final RepositoryFirestore repositoryFirestore;

  Future<void> _loadNotes() async {
    emit(const NotesState.loading());
    await Future.delayed(const Duration(seconds: 5));
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
